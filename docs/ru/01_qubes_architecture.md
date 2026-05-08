# Архитектура Qubes OS

| Qube | Назначение |
|---|---|
| dev-workbench | разработка demo app и репозитория |
| security-runner | запуск security tools |
| evidence-vault | хранение evidence |
| report-vm | отчёты и презентация |
| ai-workbench | опционально: sanitized findings draft |

dom0 не используется для рабочих файлов проекта.

Рабочие файлы проекта размещаются в AppVM.

Системные пакеты устанавливаются в TemplateVM, если это уместно.
