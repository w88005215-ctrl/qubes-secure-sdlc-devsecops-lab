# Qubes Secure SDLC / DevSecOps Lab

## Description

This project demonstrates the design and implementation of a Secure SDLC / DevSecOps lab workflow in Qubes OS 4.3.

Project chain:

architecture -> demo vulnerable app -> security scans -> findings -> policy gate failed -> remediation -> fixed app -> policy gate passed -> evidence -> report -> presentation

## Implemented Areas

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

## Qubes OS Roles

| Qube | Purpose |
|---|---|
| dev-workbench | demo app and repository development |
| security-runner | security tools execution |
| evidence-vault | evidence storage |
| report-vm | reports and presentation |
| ai-workbench | optional sanitized findings draft |

dom0 is not used for project working files.

## Key Result

The project must demonstrate a working Secure SDLC pipeline:

vulnerable-version -> findings -> policy gate failed -> remediation -> fixed-version -> policy gate passed

## Main Evidence

- evidence/command_outputs/DEVSECOPS_00_OUTPUT_session_context.txt
- evidence/command_outputs/DEVSECOPS_01_OUTPUT_project_tree.txt
- evidence/scan_reports/semgrep/
- evidence/scan_reports/gitleaks/
- evidence/scan_reports/checkov/
- evidence/sbom/
- evidence/before_after/
- evidence/EVIDENCE_INVENTORY.md
- evidence/EVIDENCE_SUMMARY.md

## Important Limitation

This is a lab project. The demo application will contain intentionally vulnerable code only for educational security pipeline demonstration.

All secrets must be fake.
