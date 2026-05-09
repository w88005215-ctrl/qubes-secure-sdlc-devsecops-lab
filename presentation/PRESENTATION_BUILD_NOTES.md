# Presentation Build Notes

Qube: dev-workbench

## Files

- presentation/PRESENTATION_STORYBOARD.md
- presentation/devsecops_case_defense_ru_en.md
- presentation/devsecops_case_defense.html
- presentation/PRESENTATION_BUILD_NOTES.md

## Purpose

The presentation summarizes the full DevSecOps lab workflow:

vulnerable-version
-> security scans
-> findings
-> policy gate failed
-> remediation
-> fixed-version
-> repeated scans
-> policy gate passed
-> evidence
-> report
-> GitHub portfolio

## Recommended PPTX assembly

The HTML version can be opened in a browser and used as a visual reference.

For final defense, create a PPTX manually in LibreOffice Impress or another editor using the 12-slide structure from PRESENTATION_STORYBOARD.md.

## Key evidence for slides

- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_failed.txt
- evidence/command_outputs/DEVSECOPS_09_OUTPUT_policy_gate_passed.txt
- evidence/before_after/DEVSECOPS_09_BEFORE_AFTER_SECURITY_SUMMARY.csv
- evidence/before_after/DEVSECOPS_10_BEFORE_AFTER_EXECUTIVE_SUMMARY.csv
- reports/devsecops_lab_report_ru.md
- reports/devsecops_lab_report_en.md

## Design guidance

Use a dark technical theme.

Recommended slide sections:
- problem
- goal
- Qubes architecture
- vulnerable application
- security pipeline
- vulnerable results
- failed policy gate
- remediation
- fixed results
- passed policy gate
- portfolio value
