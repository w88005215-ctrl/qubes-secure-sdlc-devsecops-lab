# Фаза 10 — Evidence Collection

## Цель

Фаза 10 фиксирует итоговый evidence pack проекта Qubes Secure SDLC / DevSecOps Lab после remediation и успешного прохождения policy gate.

## Где выполнялось

Qube: dev-workbench

dom0 не использовался для рабочих файлов проекта.

## Роль в проекте

Эта фаза подтверждает evidence-first подход:

- результаты vulnerable scans сохранены;
- failed policy gate сохранён;
- remediation задокументирована;
- fixed scans сохранены;
- passed policy gate сохранён;
- before/after summary создан;
- project tree и evidence tree сохранены;
- evidence inventory создан;
- SHA256 checksum manifest создан.

## Ключевые evidence-файлы

PROJECT_TREE.txt

evidence/EVIDENCE_INVENTORY.csv

evidence/DEVSECOPS_10_SHA256SUMS.txt

evidence/command_outputs/DEVSECOPS_10_OUTPUT_project_tree_full.txt

evidence/command_outputs/DEVSECOPS_10_OUTPUT_evidence_tree.txt

evidence/command_outputs/DEVSECOPS_10_OUTPUT_evidence_inventory_validation.txt

evidence/command_outputs/DEVSECOPS_10_OUTPUT_sha256_manifest_validation.txt

evidence/before_after/DEVSECOPS_10_BEFORE_AFTER_EXECUTIVE_SUMMARY.csv

## Before/After результат

Проект демонстрирует полный цикл:

vulnerable-version
→ security findings
→ policy gate failed
→ remediation
→ fixed-version
→ repeated scans
→ policy gate passed

## Практическая ценность

Evidence pack показывает, что проект не является набором разрозненных команд. Каждый важный шаг имеет сохранённый вывод, отчёт, SBOM, scan result или before/after artifact.

## Итог

Фаза 10 подготавливает доказательную базу для финального отчёта, презентации и GitHub-публикации.
