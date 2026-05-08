# Архитектура Qubes VM

## Назначение

Фаза 2 фиксирует архитектуру Qubes OS для проекта Qubes Secure SDLC / DevSecOps Lab.

Создание и настройка qubes выполняются вручную через графический интерфейс Qubes Manager.

В рамках репозитория фиксируются:

- назначение qubes
- поток работы
- роли AppVM
- screenshot evidence
- manual checklist evidence

## Qubes проекта

| Qube | Назначение |
|---|---|
| dev-workbench | разработка репозитория и demo application |
| security-runner | запуск security tools |
| evidence-vault | хранение evidence, screenshots, scan reports и SBOM |
| report-vm | подготовка отчёта и презентации |

## Поток работы

dev-workbench -> security-runner -> evidence-vault -> report-vm

## Принципы

1. Рабочие файлы проекта находятся в AppVM.
2. dev-workbench используется для разработки.
3. security-runner используется для запуска security tools.
4. evidence-vault используется как изолированное хранилище evidence.
5. report-vm используется для подготовки отчёта и презентации.
6. Создание и настройка qubes выполняются через GUI.
7. В проекте не используются реальные secrets.
8. Все evidence сохраняются в каталоге evidence.

## Evidence Фазы 2

| Evidence | Назначение |
|---|---|
| evidence/screenshots/DEVSECOPS_02_SCREENSHOT_qubes_vm_architecture_gui.png | скриншот Qube Manager |
| evidence/command_outputs/DEVSECOPS_02_OUTPUT_qubes_vm_architecture_gui_checklist.txt | checklist ручной проверки архитектуры |
| evidence/command_outputs/DEVSECOPS_02_OUTPUT_project_tree_after_qubes_architecture.txt | структура проекта после Фазы 2 |
| evidence/command_outputs/DEVSECOPS_02_OUTPUT_phase2_acceptance_check.txt | итоговая проверка Фазы 2 |
