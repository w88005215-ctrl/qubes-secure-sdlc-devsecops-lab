# Фаза 8 — Remediation

## Цель

Цель фазы — создать исправленную версию демонстрационного приложения и подготовить evidence для последующей повторной проверки security pipeline.

## Что было исправлено

1. Hardcoded fake secret удалён из fixed-version.
2. Unsafe subprocess usage удалён.
3. Flask debug mode отключён.
4. Добавлена allowlist input validation.
5. Добавлены базовые security headers.
6. Зависимости зафиксированы в requirements.txt.
7. Dockerfile переведён на production-style настройки и non-root user.
8. Terraform ingress ограничен внутренним lab CIDR вместо 0.0.0.0/0.
9. Создана remediation matrix для before/after анализа.

## Исправленные компоненты

- app/fixed-version/app.py
- app/fixed-version/requirements.txt
- docker/fixed.Dockerfile
- iac/fixed/main.tf
- evidence/before_after/DEVSECOPS_08_REMEDIATION_MATRIX.csv

## Evidence

- evidence/command_outputs/DEVSECOPS_08_OUTPUT_remediation_branch_preparation.txt
- evidence/command_outputs/DEVSECOPS_08_OUTPUT_remediation_diff.txt
- evidence/command_outputs/DEVSECOPS_08_OUTPUT_fixed_files_acceptance_check.txt
- evidence/command_outputs/DEVSECOPS_08_OUTPUT_project_tree_after_remediation_files.txt
- evidence/before_after/DEVSECOPS_08_REMEDIATION_MATRIX.csv

## Ожидаемый следующий шаг

На Фазе 9 fixed-version будет повторно просканирована теми же security tools. Ожидаемый результат: policy gate должен пройти со статусом POLICY_GATE_STATUS=PASSED.
