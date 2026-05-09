# Qubes Secure SDLC / DevSecOps Lab

## Что демонстрирует проект

Это publication-ready лабораторный проект по Secure SDLC / DevSecOps в стиле SOC evidence workflow. Проект построен в Qubes OS и показывает полный путь от уязвимого baseline до исправленной версии с passed policy gate.

## Финальный статус

- Policy gate уязвимой версии: `FAILED`
- Policy gate исправленной версии: `PASSED`
- Состояние релиза: готов к публикации

## Главная история проекта

1. Создана изолированная рабочая модель в Qubes.
2. Создан намеренно уязвимый baseline.
3. Выполнены проверки Semgrep, Bandit, pip-audit, Gitleaks, Checkov, Trivy, Syft и Grype.
4. Baseline заблокирован policy gate.
5. Выполнена remediation приложения, зависимостей, Dockerfile и IaC.
6. Повторные проверки подтвердили отсутствие gate-blocking условий.
7. Исправленная версия прошла policy gate.
8. Evidence pack, отчет и презентация подготовлены для публикации.

## Ключевые артефакты

- RU отчет: `reports/devsecops_lab_report_ru.md`
- EN отчет: `reports/devsecops_lab_report_en.md`
- PDF отчеты: `reports/devsecops_lab_report_ru.pdf`, `reports/devsecops_lab_report_en.pdf`
- Презентация: `presentation/devsecops_case_defense.html`
- Evidence inventory: `evidence/EVIDENCE_INVENTORY.csv`
- SHA256 manifest: `evidence/DEVSECOPS_10_SHA256SUMS.txt`
- Дерево проекта: `PROJECT_TREE.txt`
- Portfolio summary: `PORTFOLIO_SUMMARY.md`

## Результаты before/after

| Контроль | Уязвимая версия | Исправленная версия | Интерпретация |
| --- | --- | --- | --- |
| Policy gate | FAILED | PASSED | FAILED baseline -> PASSED fixed release |
| Semgrep findings | 10 | 0 | all Semgrep findings removed |
| Semgrep ERROR findings | 5 | 0 | blocking severity removed |
| Bandit findings | 7 | 0 | all Bandit findings removed |
| Bandit HIGH findings | 2 | 0 | no HIGH issues in fixed app |
| pip-audit vulnerabilities | 24 | 4 | residual non-blocking dependency findings documented |
| Gitleaks findings | 2 | 0 | lab secrets removed from fixed app |
| Checkov failed checks | 4 | 1 | public ingress removed; residual unattached SG check documented |
| Checkov public ingress | 4 | 0 | 0.0.0.0/0 removed |
| Trivy fs vulnerabilities | 17 | 4 | dependency risk reduced |
| Trivy fs HIGH/CRITICAL | 6 | 0 | no gate-blocking high/critical risk |
| Grype SBOM matches | 17 | 4 | SBOM scan retained for transparency |
| Grype HIGH/CRITICAL | 6 | 0 | no high/critical SBOM blockers |
| Syft SBOM components | 5 | 3 | smaller dependency surface |

## Область применения

Проект является учебным controlled lab. Уязвимая версия сохранена специально для демонстрации failed policy gate и не предназначена для deployment.
