# Qubes Secure SDLC / DevSecOps Lab

## Описание

Проект демонстрирует проектирование и реализацию лабораторного Secure SDLC / DevSecOps workflow в Qubes OS 4.3.

Цепочка проекта:

архитектура -> demo vulnerable app -> security scans -> findings -> policy gate failed -> remediation -> fixed app -> policy gate passed -> evidence -> отчёт -> презентация

## Реализуемые направления

- SAST
- Python SAST
- SCA
- secret scanning
- IaC scanning
- container scanning
- SBOM
- vulnerability scan by SBOM
- policy gates
- before/after remediation workflow
- evidence-first documentation

## Qubes OS роли

| Qube | Назначение |
|---|---|
| dev-workbench | разработка demo app и репозитория |
| security-runner | запуск security tools |
| evidence-vault | хранение evidence |
| report-vm | отчёты и презентация |
| ai-workbench | опционально: sanitized findings draft |

dom0 не используется для рабочих файлов проекта.

## Ключевой результат

Проект должен подтвердить рабочий Secure SDLC pipeline:

vulnerable-version -> findings -> policy gate failed -> remediation -> fixed-version -> policy gate passed

## Основные evidence

- evidence/command_outputs/DEVSECOPS_00_OUTPUT_session_context.txt
- evidence/command_outputs/DEVSECOPS_01_OUTPUT_project_tree.txt
- evidence/scan_reports/semgrep/
- evidence/scan_reports/gitleaks/
- evidence/scan_reports/checkov/
- evidence/sbom/
- evidence/before_after/
- evidence/EVIDENCE_INVENTORY.md
- evidence/EVIDENCE_SUMMARY.md

## Важное ограничение

Это лабораторный проект. Demo application будет содержать intentionally vulnerable code только для учебной демонстрации security pipeline.

Все secrets должны быть фейковыми.
