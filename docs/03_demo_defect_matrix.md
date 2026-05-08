# Demo Defect Matrix / Матрица учебных defects

## RU

| ID | Defect | Planned Location | Expected Tool |
|---|---|---|---|
| D-01 | fake hardcoded secret | app/vulnerable-version | Gitleaks |
| D-02 | outdated dependency | app/vulnerable-version/requirements.txt | pip-audit / Trivy / Grype |
| D-03 | unsafe subprocess usage | app/vulnerable-version | Semgrep / Bandit |
| D-04 | debug mode enabled | app/vulnerable-version | Semgrep / Bandit |
| D-05 | missing security headers | app/vulnerable-version | manual / Semgrep |
| D-06 | insecure Dockerfile | docker/vulnerable.Dockerfile | Trivy |
| D-07 | public ingress 0.0.0.0/0 | iac/vulnerable | Checkov / Trivy |
| D-08 | unpinned dependency | requirements.txt | pip-audit / review |
| D-09 | missing input validation | app/vulnerable-version | Semgrep / manual |

## EN

| ID | Defect | Planned Location | Expected Tool |
|---|---|---|---|
| D-01 | fake hardcoded secret | app/vulnerable-version | Gitleaks |
| D-02 | outdated dependency | app/vulnerable-version/requirements.txt | pip-audit / Trivy / Grype |
| D-03 | unsafe subprocess usage | app/vulnerable-version | Semgrep / Bandit |
| D-04 | debug mode enabled | app/vulnerable-version | Semgrep / Bandit |
| D-05 | missing security headers | app/vulnerable-version | manual / Semgrep |
| D-06 | insecure Dockerfile | docker/vulnerable.Dockerfile | Trivy |
| D-07 | public ingress 0.0.0.0/0 | iac/vulnerable | Checkov / Trivy |
| D-08 | unpinned dependency | requirements.txt | pip-audit / review |
| D-09 | missing input validation | app/vulnerable-version | Semgrep / manual |
