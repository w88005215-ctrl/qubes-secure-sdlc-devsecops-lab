# Установка security tools

## Назначение

Фаза 5 устанавливает инструменты автоматизированного security testing в security-runner.

На этой фазе инструменты только устанавливаются и проверяются по версиям.

Сканирование vulnerable-version выполняется позже, на Фазе 6.

## Где выполняется установка

| Qube | Назначение |
|---|---|
| security-runner | установка security tools в user-space |
| dev-workbench | хранение evidence, docs и git commit |

## Установленные инструменты

| Tool | Назначение |
|---|---|
| Semgrep | SAST |
| Bandit | Python SAST |
| pip-audit | Python dependency audit |
| Gitleaks | secret scanning |
| Trivy | dependency, container and IaC scanning |
| Checkov | IaC scanning |
| Syft | SBOM generation |
| Grype | vulnerability scan by SBOM |

## Принцип установки

Инструменты установлены внутри security-runner AppVM:

- ~/.local/bin для binaries
- pipx для Python-based tools
- TemplateVM ~/.local не используется
- Docker Desktop не используется
- cloud API не является обязательной частью проекта
- рабочие файлы проекта не размещаются в dom0

## Evidence Фазы 5

| Evidence | Назначение |
|---|---|
| evidence/command_outputs/DEVSECOPS_05_OUTPUT_installation_model_precheck.txt | проверка модели установки |
| evidence/command_outputs/DEVSECOPS_05_OUTPUT_python_tools_installation.txt | установка Semgrep, Bandit, pip-audit, Checkov |
| evidence/command_outputs/DEVSECOPS_05_OUTPUT_gitleaks_installation.txt | установка Gitleaks |
| evidence/command_outputs/DEVSECOPS_05_OUTPUT_trivy_installation.txt | установка Trivy |
| evidence/command_outputs/DEVSECOPS_05_OUTPUT_syft_grype_installation.txt | установка Syft и Grype |
| evidence/command_outputs/DEVSECOPS_05_OUTPUT_security_tools_versions.txt | версии инструментов |
| evidence/command_outputs/DEVSECOPS_05_OUTPUT_security_tools_acceptance_check.txt | проверка доступности инструментов |
