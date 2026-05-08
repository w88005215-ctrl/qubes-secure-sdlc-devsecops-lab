# Qubes VM Architecture

## Purpose

Phase 2 documents the Qubes OS architecture for the Qubes Secure SDLC / DevSecOps Lab project.

Qubes are created and configured manually through the Qubes Manager graphical interface.

The repository documents:

- qube purpose
- workflow
- AppVM roles
- screenshot evidence
- manual checklist evidence

## Project Qubes

| Qube | Purpose |
|---|---|
| dev-workbench | repository and demo application development |
| security-runner | security tools execution |
| evidence-vault | evidence, screenshots, scan reports and SBOM storage |
| report-vm | report and presentation preparation |

## Workflow

dev-workbench -> security-runner -> evidence-vault -> report-vm

## Principles

1. Project working files are stored in AppVMs.
2. dev-workbench is used for development.
3. security-runner is used for security tools execution.
4. evidence-vault is used as isolated evidence storage.
5. report-vm is used for report and presentation preparation.
6. Qubes are created and configured through the GUI.
7. No real secrets are used in the project.
8. All evidence is stored under the evidence directory.

## Phase 2 Evidence

| Evidence | Purpose |
|---|---|
| evidence/screenshots/DEVSECOPS_02_SCREENSHOT_qubes_vm_architecture_gui.png | Qube Manager screenshot |
| evidence/command_outputs/DEVSECOPS_02_OUTPUT_qubes_vm_architecture_gui_checklist.txt | manual architecture checklist |
| evidence/command_outputs/DEVSECOPS_02_OUTPUT_project_tree_after_qubes_architecture.txt | project tree after Phase 2 |
| evidence/command_outputs/DEVSECOPS_02_OUTPUT_phase2_acceptance_check.txt | Phase 2 final acceptance check |
