# Сканирование vulnerable-version

## Назначение

Фаза 6 запускает security scans против intentionally vulnerable версии демонстрационного приложения.

На этой фазе выполняется только обнаружение проблем и сбор evidence.

Policy gate выполняется отдельно на Фазе 7.

## Scope

| Category | Tool | Target |
|---|---|---|
| SAST | Semgrep | app/vulnerable-version, docker, iac/vulnerable |
| Python SAST | Bandit | app/vulnerable-version |
| SCA | pip-audit | app/vulnerable-version/requirements.txt |
| Secret scanning | Gitleaks | app/vulnerable-version |
| IaC scanning | Checkov | iac/vulnerable |
| Dependency / IaC / Dockerfile scan | Trivy | app, iac, dockerfile |
| SBOM | Syft | app/vulnerable-version |
| SBOM vulnerability scan | Grype | Syft CycloneDX SBOM |

## Expected Findings

Ожидаемые findings соответствуют demo defect matrix:

- fake hardcoded secret
- vulnerable/outdated dependency
- unsafe subprocess usage
- debug mode enabled
- weak or missing security headers
- insecure Dockerfile
- public ingress 0.0.0.0/0
- dependency without proper pinning
- missing input validation

## Evidence

Ключевые evidence-файлы:

- evidence/scan_reports/semgrep/DEVSECOPS_06_REPORT_semgrep_vulnerable.json
- evidence/scan_reports/bandit/DEVSECOPS_06_REPORT_bandit_vulnerable.json
- evidence/scan_reports/pip-audit/DEVSECOPS_06_REPORT_pip_audit_vulnerable.json
- evidence/scan_reports/gitleaks/DEVSECOPS_06_REPORT_gitleaks_vulnerable.json
- evidence/scan_reports/checkov/DEVSECOPS_06_REPORT_checkov_vulnerable.json
- evidence/scan_reports/trivy/DEVSECOPS_06_REPORT_trivy_fs_vulnerable.json
- evidence/scan_reports/trivy/DEVSECOPS_06_REPORT_trivy_iac_vulnerable.json
- evidence/scan_reports/trivy/DEVSECOPS_06_REPORT_trivy_dockerfile_vulnerable.json
- evidence/sbom/DEVSECOPS_06_SBOM_vulnerable_syft_cyclonedx.json
- evidence/scan_reports/grype/DEVSECOPS_06_REPORT_grype_vulnerable_sbom.json
- evidence/command_outputs/DEVSECOPS_06_OUTPUT_vulnerable_scan_summary.txt
