# Vulnerable Demo Application

## Назначение

Фаза 4 создаёт демонстрационное Flask-приложение с намеренно внесёнными учебными security defects.

Это приложение используется для проверки DevSecOps pipeline в следующих фазах.

## Расположение

| Компонент | Путь |
|---|---|
| Flask app | app/vulnerable-version/app.py |
| Dependencies | app/vulnerable-version/requirements.txt |
| Dockerfile | docker/vulnerable.Dockerfile |
| Terraform IaC | iac/vulnerable/main.tf |

## Учебные defects

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

## Ограничения безопасности

Все secrets являются фейковыми.

Приложение не предназначено для production.

Опасные участки кода добавлены только для учебной демонстрации security scanning и policy gate.
