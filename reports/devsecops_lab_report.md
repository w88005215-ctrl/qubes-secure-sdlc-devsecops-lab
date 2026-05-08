# Qubes Secure SDLC / DevSecOps Lab Report

This is the main report landing page.

## RU report

- reports/devsecops_lab_report_ru.md

## EN report

- reports/devsecops_lab_report_en.md

## Project result

| Version | Policy Gate Result |
|---|---|
| vulnerable-version | FAILED |
| fixed-version | PASSED |

## Key evidence

- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_failed.txt
- evidence/command_outputs/DEVSECOPS_09_OUTPUT_policy_gate_passed.txt
- evidence/before_after/DEVSECOPS_09_BEFORE_AFTER_SECURITY_SUMMARY.csv
- evidence/EVIDENCE_INVENTORY.csv
- evidence/DEVSECOPS_10_SHA256SUMS.txt

## Portfolio summary RU

Спроектировал и реализовал лабораторный DevSecOps workflow в Qubes OS для автоматизированного тестирования безопасности ПО. Настроил проверки SAST, SCA, secret scanning, IaC scanning, container scanning, генерацию SBOM и security gates. На демонстрационном приложении показал полный цикл: vulnerable version -> detection -> failed gate -> remediation -> fixed version -> passed gate -> report.

## Portfolio summary EN

Designed and implemented a Qubes OS-based Secure SDLC / DevSecOps lab demonstrating automated SAST, SCA, secret scanning, IaC scanning, container scanning, SBOM generation, policy gates and remediation workflow. Built a vulnerable demo application, detected security issues, blocked unsafe builds, remediated findings and documented before/after results.
