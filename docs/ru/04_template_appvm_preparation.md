# Подготовка TemplateVM и AppVM

## Назначение

Фаза 3 подготавливает базовую среду для дальнейшей реализации DevSecOps Lab.

На этом этапе устанавливаются только базовые системные утилиты.

Security tools не устанавливаются на Фазе 3. Они будут установлены отдельно на Фазе 5.

## Где выполняется подготовка

| Среда | Назначение |
|---|---|
| TemplateVM | установка базовых системных пакетов |
| dev-workbench | проверка репозитория и базовых утилит |
| security-runner | проверка готовности среды для security tools |

## Базовые пакеты

- git
- tree
- curl
- wget
- jq
- python3
- python3-venv
- python3-pip
- pipx
- ca-certificates
- unzip
- tar
- gzip

## Что не устанавливается на этой фазе

- Semgrep
- Bandit
- pip-audit
- Gitleaks
- Trivy
- Checkov
- Syft
- Grype

## Evidence Фазы 3

| Evidence | Назначение |
|---|---|
| evidence/command_outputs/DEVSECOPS_03_OUTPUT_dev_workbench_base_tools_check.txt | проверка базовых утилит в dev-workbench |
| evidence/command_outputs/DEVSECOPS_03_OUTPUT_security_runner_base_tools_check.txt | проверка базовых утилит в security-runner |
| evidence/command_outputs/DEVSECOPS_03_OUTPUT_template_appvm_preparation_checklist.txt | checklist подготовки TemplateVM и AppVM |
| evidence/command_outputs/DEVSECOPS_03_OUTPUT_project_tree_after_template_appvm_preparation.txt | структура проекта после Фазы 3 |
