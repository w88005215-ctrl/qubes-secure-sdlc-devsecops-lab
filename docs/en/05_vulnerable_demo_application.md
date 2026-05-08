# Vulnerable Demo Application

## Purpose

Phase 4 creates a demonstration Flask application with intentionally added educational security defects.

This application is used to validate the DevSecOps pipeline in the next phases.

## Location

| Component | Path |
|---|---|
| Flask app | app/vulnerable-version/app.py |
| Dependencies | app/vulnerable-version/requirements.txt |
| Dockerfile | docker/vulnerable.Dockerfile |
| Terraform IaC | iac/vulnerable/main.tf |

## Educational Defects

| ID | Defect | Location | Expected Tool |
|---|---|---|---|
| D-01 | fake hardcoded secret | app.py | Gitleaks |
| D-02 | outdated dependency | requirements.txt | pip-audit, Trivy, Grype |
| D-03 | unsafe subprocess usage | app.py | Semgrep, Bandit |
| D-04 | debug mode enabled | app.py | Semgrep, Bandit |
| D-05 | missing or weak security headers | app.py | Semgrep, manual review |
| D-06 | insecure Dockerfile | docker/vulnerable.Dockerfile | Trivy |
| D-07 | public ingress 0.0.0.0/0 | iac/vulnerable/main.tf | Checkov, Trivy |
| D-08 | dependency without proper pinning | requirements.txt | manual review |
| D-09 | missing input validation | app.py | Semgrep, manual review |

## Safety Limitations

All secrets are fake.

The application is not intended for production.

Unsafe code paths are added only for educational security scanning and policy gate demonstration.
