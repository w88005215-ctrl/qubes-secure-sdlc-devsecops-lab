# Portfolio Summary / Портфельное описание

## RU

Спроектировал и реализовал лабораторный DevSecOps workflow в Qubes OS для автоматизированного тестирования безопасности ПО. Настроил проверки SAST, SCA, secret scanning, IaC scanning, container/config scanning, генерацию SBOM и policy gates. На демонстрационном Flask-приложении показал полный цикл: vulnerable version -> security findings -> failed gate -> remediation -> fixed version -> repeated scans -> passed gate -> evidence -> report -> presentation.

## EN

Designed and implemented a Qubes OS-based Secure SDLC / DevSecOps lab demonstrating automated SAST, SCA, secret scanning, IaC scanning, container/config scanning, SBOM generation, policy gates and remediation workflow. Built a vulnerable Flask demo application, detected security issues, blocked unsafe builds, remediated findings and documented before/after results.

## Key technologies

| Category | Tools |
|---|---|
| SAST | Semgrep, Bandit |
| SCA | pip-audit, Trivy, Grype |
| Secrets | Gitleaks |
| IaC | Checkov, Trivy config |
| SBOM | Syft, CycloneDX |
| Policy gates | Local Bash policy gate |
| Evidence | command outputs, reports, SBOM, before/after summaries |
| Platform | Qubes OS 4.3 |

## Final demonstration flow

| Stage | Result |
|---|---|
| Vulnerable baseline | Security findings detected |
| Policy gate failed | Unsafe state blocked |
| Remediation | Vulnerabilities and misconfigurations fixed |
| Fixed scans | Gate-blocking findings removed |
| Policy gate passed | Secure baseline accepted |
| Evidence pack | Preserved for defense and portfolio |
| Report and presentation | Ready for diploma defense and GitHub |
