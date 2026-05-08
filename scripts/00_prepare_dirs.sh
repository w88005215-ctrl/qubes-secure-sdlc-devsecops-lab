#!/usr/bin/env bash
set -euo pipefail

mkdir -p \
  evidence/screenshots \
  evidence/command_outputs \
  evidence/scan_reports/semgrep \
  evidence/scan_reports/bandit \
  evidence/scan_reports/pip-audit \
  evidence/scan_reports/gitleaks \
  evidence/scan_reports/trivy \
  evidence/scan_reports/checkov \
  evidence/scan_reports/grype \
  evidence/sbom \
  evidence/before_after

echo "[OK] Evidence directories prepared."
