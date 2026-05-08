# Evidence-first workflow

Каждый важный шаг проекта должен фиксироваться.

Обязательный минимум:

1. Выполненная команда.
2. Сохранённый вывод команды в evidence/command_outputs/.
3. Обновлённый tree output, если изменилась структура проекта.
4. Скриншот в evidence/screenshots/.
5. Git commit с понятным сообщением.

Стандарт именования:

DEVSECOPS_STEP_TYPE_DESCRIPTION.ext

Примеры:

- DEVSECOPS_00_OUTPUT_session_context.txt
- DEVSECOPS_01_OUTPUT_project_tree.txt
- DEVSECOPS_02_OUTPUT_tool_versions.txt
- DEVSECOPS_03_REPORT_semgrep_vulnerable.json
- DEVSECOPS_06_OUTPUT_policy_gate_failed.txt
- DEVSECOPS_07_OUTPUT_policy_gate_passed.txt
