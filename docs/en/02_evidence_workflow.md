# Evidence-first workflow

Every important project step must be documented.

Required minimum:

1. Executed command.
2. Saved command output under evidence/command_outputs/.
3. Updated tree output if the repository structure changed.
4. Screenshot under evidence/screenshots/.
5. Git commit with a clear message.

Naming standard:

DEVSECOPS_STEP_TYPE_DESCRIPTION.ext

Examples:

- DEVSECOPS_00_OUTPUT_session_context.txt
- DEVSECOPS_01_OUTPUT_project_tree.txt
- DEVSECOPS_02_OUTPUT_tool_versions.txt
- DEVSECOPS_03_REPORT_semgrep_vulnerable.json
- DEVSECOPS_06_OUTPUT_policy_gate_failed.txt
- DEVSECOPS_07_OUTPUT_policy_gate_passed.txt
