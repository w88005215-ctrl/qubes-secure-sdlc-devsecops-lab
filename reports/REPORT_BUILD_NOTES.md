# Report Build Notes

## Qube

dev-workbench

## Report files

- reports/devsecops_lab_report.md
- reports/devsecops_lab_report_ru.md
- reports/devsecops_lab_report_en.md

## Source evidence

- PROJECT_TREE.txt
- evidence/EVIDENCE_INVENTORY.csv
- evidence/DEVSECOPS_10_SHA256SUMS.txt
- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_failed.txt
- evidence/command_outputs/DEVSECOPS_09_OUTPUT_policy_gate_passed.txt
- evidence/before_after/DEVSECOPS_08_REMEDIATION_MATRIX.csv
- evidence/before_after/DEVSECOPS_09_BEFORE_AFTER_SECURITY_SUMMARY.csv
- evidence/before_after/DEVSECOPS_10_BEFORE_AFTER_EXECUTIVE_SUMMARY.csv

## Report purpose

The report summarizes the full Secure SDLC / DevSecOps workflow:

    architecture
    -> vulnerable baseline
    -> security scans
    -> failed policy gate
    -> remediation
    -> fixed version
    -> repeated scans
    -> passed policy gate
    -> evidence pack

## Notes

- The report is based on local evidence.
- All secrets are fake.
- The project is a lab model, not a production CI/CD platform.
- Security findings require human validation.
- Qubes OS is used as an isolated engineering workspace.
