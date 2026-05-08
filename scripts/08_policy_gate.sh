#!/usr/bin/env bash

set +e
set +u
set +o pipefail 2>/dev/null

VERSION="${1:-vulnerable}"

if [ "$VERSION" = "vulnerable" ]; then
  PHASE="06"
  APP_DIR="app/vulnerable-version"
  IAC_DIR="iac/vulnerable"
  DOCKERFILE="docker/vulnerable.Dockerfile"
  SEMGREP_REPORT="evidence/scan_reports/semgrep/DEVSECOPS_06_REPORT_semgrep_vulnerable.json"
  BANDIT_REPORT="evidence/scan_reports/bandit/DEVSECOPS_06_REPORT_bandit_vulnerable.json"
  PIP_AUDIT_REPORT="evidence/scan_reports/pip-audit/DEVSECOPS_06_REPORT_pip_audit_vulnerable.json"
  GITLEAKS_REPORT="evidence/scan_reports/gitleaks/DEVSECOPS_06_REPORT_gitleaks_vulnerable.json"
  CHECKOV_REPORT="evidence/scan_reports/checkov/DEVSECOPS_06_REPORT_checkov_vulnerable.json"
  TRIVY_FS_REPORT="evidence/scan_reports/trivy/DEVSECOPS_06_REPORT_trivy_fs_vulnerable.json"
  TRIVY_IAC_REPORT="evidence/scan_reports/trivy/DEVSECOPS_06_REPORT_trivy_iac_vulnerable.json"
  TRIVY_DOCKERFILE_REPORT="evidence/scan_reports/trivy/DEVSECOPS_06_REPORT_trivy_dockerfile_vulnerable.json"
  GRYPE_REPORT="evidence/scan_reports/grype/DEVSECOPS_06_REPORT_grype_vulnerable_sbom.json"
elif [ "$VERSION" = "fixed" ]; then
  PHASE="09"
  APP_DIR="app/fixed-version"
  IAC_DIR="iac/fixed"
  DOCKERFILE="docker/fixed.Dockerfile"
  SEMGREP_REPORT="evidence/scan_reports/semgrep/DEVSECOPS_09_REPORT_semgrep_fixed.json"
  BANDIT_REPORT="evidence/scan_reports/bandit/DEVSECOPS_09_REPORT_bandit_fixed.json"
  PIP_AUDIT_REPORT="evidence/scan_reports/pip-audit/DEVSECOPS_09_REPORT_pip_audit_fixed.json"
  GITLEAKS_REPORT="evidence/scan_reports/gitleaks/DEVSECOPS_09_REPORT_gitleaks_fixed.json"
  CHECKOV_REPORT="evidence/scan_reports/checkov/DEVSECOPS_09_REPORT_checkov_fixed.json"
  TRIVY_FS_REPORT="evidence/scan_reports/trivy/DEVSECOPS_09_REPORT_trivy_fs_fixed.json"
  TRIVY_IAC_REPORT="evidence/scan_reports/trivy/DEVSECOPS_09_REPORT_trivy_iac_fixed.json"
  TRIVY_DOCKERFILE_REPORT="evidence/scan_reports/trivy/DEVSECOPS_09_REPORT_trivy_dockerfile_fixed.json"
  GRYPE_REPORT="evidence/scan_reports/grype/DEVSECOPS_09_REPORT_grype_fixed_sbom.json"
else
  echo "[ERROR] Unknown version: $VERSION"
  echo "Usage: scripts/08_policy_gate.sh vulnerable|fixed"
  exit 2
fi

FAIL=0

json_count() {
  local query="$1"
  local file="$2"

  if test -s "$file"; then
    jq "$query" "$file" 2>/dev/null
  else
    echo "0"
  fi
}

echo "Qubes Secure SDLC / DevSecOps Lab"
echo "Policy Gate Evaluation"
echo "Date: $(date -Is)"
echo "Version: $VERSION"
echo

echo "Input reports:"
for file in \
  "$SEMGREP_REPORT" \
  "$BANDIT_REPORT" \
  "$PIP_AUDIT_REPORT" \
  "$GITLEAKS_REPORT" \
  "$CHECKOV_REPORT" \
  "$TRIVY_FS_REPORT" \
  "$TRIVY_IAC_REPORT" \
  "$TRIVY_DOCKERFILE_REPORT" \
  "$GRYPE_REPORT"
do
  if test -s "$file"; then
    echo "[OK] $file"
  else
    echo "[WARN] $file missing or empty"
  fi
done

echo
echo "Policy checks:"
echo

GITLEAKS_FINDINGS="$(json_count 'length' "$GITLEAKS_REPORT")"
SEMGREP_FINDINGS="$(json_count '.results | length' "$SEMGREP_REPORT")"
SEMGREP_ERROR_FINDINGS="$(json_count '[.results[]? | select(.extra.severity == "ERROR")] | length' "$SEMGREP_REPORT")"
BANDIT_HIGH_FINDINGS="$(json_count '[.results[]? | select(.issue_severity == "HIGH")] | length' "$BANDIT_REPORT")"
BANDIT_MEDIUM_FINDINGS="$(json_count '[.results[]? | select(.issue_severity == "MEDIUM")] | length' "$BANDIT_REPORT")"
PIP_AUDIT_VULNS="$(json_count '[.dependencies[]?.vulns[]?] | length' "$PIP_AUDIT_REPORT")"
TRIVY_HIGH_CRITICAL="$(json_count '[.Results[]?.Vulnerabilities[]? | select(.Severity == "HIGH" or .Severity == "CRITICAL")] | length' "$TRIVY_FS_REPORT")"
GRYPE_HIGH_CRITICAL="$(json_count '[.matches[]? | select((.vulnerability.severity | ascii_downcase) == "high" or (.vulnerability.severity | ascii_downcase) == "critical")] | length' "$GRYPE_REPORT")"
CHECKOV_FAILED="$(json_count '.results.failed_checks | length' "$CHECKOV_REPORT")"
TRIVY_IAC_HIGH_CRITICAL="$(json_count '[.Results[]?.Misconfigurations[]? | select(.Severity == "HIGH" or .Severity == "CRITICAL")] | length' "$TRIVY_IAC_REPORT")"
TRIVY_DOCKER_HIGH_CRITICAL="$(json_count '[.Results[]?.Misconfigurations[]? | select(.Severity == "HIGH" or .Severity == "CRITICAL")] | length' "$TRIVY_DOCKERFILE_REPORT")"

PUBLIC_INGRESS_COUNT="0"
if test -d "$IAC_DIR"; then
  PUBLIC_INGRESS_COUNT="$(grep -R '0\.0\.0\.0/0' "$IAC_DIR" 2>/dev/null | wc -l | tr -d ' ')"
fi

echo "Hardcoded secret findings: $GITLEAKS_FINDINGS"
if [ "${GITLEAKS_FINDINGS:-0}" -gt 0 ] 2>/dev/null; then
  echo "[FAIL] hardcoded secret detected"
  FAIL=1
else
  echo "[PASS] no hardcoded secret detected"
fi

echo
echo "SAST findings:"
echo "- Semgrep total: $SEMGREP_FINDINGS"
echo "- Semgrep ERROR severity: $SEMGREP_ERROR_FINDINGS"
echo "- Bandit HIGH severity: $BANDIT_HIGH_FINDINGS"
echo "- Bandit MEDIUM severity: $BANDIT_MEDIUM_FINDINGS"
if [ "${SEMGREP_ERROR_FINDINGS:-0}" -gt 0 ] 2>/dev/null || [ "${BANDIT_HIGH_FINDINGS:-0}" -gt 0 ] 2>/dev/null; then
  echo "[FAIL] high/error SAST finding detected"
  FAIL=1
else
  echo "[PASS] no high/error SAST finding detected"
fi

echo
echo "Dependency vulnerability findings:"
echo "- pip-audit vulnerabilities: $PIP_AUDIT_VULNS"
echo "- Trivy HIGH/CRITICAL vulnerabilities: $TRIVY_HIGH_CRITICAL"
echo "- Grype HIGH/CRITICAL vulnerabilities: $GRYPE_HIGH_CRITICAL"
if [ "${TRIVY_HIGH_CRITICAL:-0}" -gt 0 ] 2>/dev/null || [ "${GRYPE_HIGH_CRITICAL:-0}" -gt 0 ] 2>/dev/null; then
  echo "[FAIL] high/critical dependency vulnerability detected"
  FAIL=1
else
  echo "[PASS] no high/critical dependency vulnerability detected"
fi

echo
echo "IaC findings:"
echo "- Checkov failed checks: $CHECKOV_FAILED"
echo "- Trivy IaC HIGH/CRITICAL misconfigurations: $TRIVY_IAC_HIGH_CRITICAL"
echo "- Public ingress 0.0.0.0/0 occurrences: $PUBLIC_INGRESS_COUNT"
if [ "${PUBLIC_INGRESS_COUNT:-0}" -gt 0 ] 2>/dev/null; then
  echo "[FAIL] public ingress 0.0.0.0/0 detected"
  FAIL=1
else
  echo "[PASS] no public ingress 0.0.0.0/0 detected"
fi

echo
echo "Container/Dockerfile configuration findings:"
echo "- Trivy Dockerfile HIGH/CRITICAL misconfigurations: $TRIVY_DOCKER_HIGH_CRITICAL"
if [ "${TRIVY_DOCKER_HIGH_CRITICAL:-0}" -gt 0 ] 2>/dev/null; then
  echo "[FAIL] high/critical Dockerfile misconfiguration detected"
  FAIL=1
else
  echo "[PASS] no high/critical Dockerfile misconfiguration detected"
fi

echo
echo "Final decision:"
if [ "$FAIL" -eq 1 ]; then
  echo "POLICY_GATE_STATUS=FAILED"
  echo "Unsafe build is blocked."
  exit 1
else
  echo "POLICY_GATE_STATUS=PASSED"
  echo "Build is allowed to proceed."
  exit 0
fi
