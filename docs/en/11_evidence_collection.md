# Phase 10 — Evidence Collection

## Objective

Phase 10 captures the final evidence pack for the Qubes Secure SDLC / DevSecOps Lab after remediation and a successful policy gate.

## Execution location

Qube: dev-workbench

dom0 was not used for project working files.

## Role in the project

This phase confirms the evidence-first workflow:

- vulnerable scan results were preserved;
- failed policy gate evidence was preserved;
- remediation was documented;
- fixed scan results were preserved;
- passed policy gate evidence was preserved;
- before/after summary was created;
- project tree and evidence tree were captured;
- evidence inventory was created;
- SHA256 checksum manifest was created.

## Key evidence files

PROJECT_TREE.txt

evidence/EVIDENCE_INVENTORY.csv

evidence/DEVSECOPS_10_SHA256SUMS.txt

evidence/command_outputs/DEVSECOPS_10_OUTPUT_project_tree_full.txt

evidence/command_outputs/DEVSECOPS_10_OUTPUT_evidence_tree.txt

evidence/command_outputs/DEVSECOPS_10_OUTPUT_evidence_inventory_validation.txt

evidence/command_outputs/DEVSECOPS_10_OUTPUT_sha256_manifest_validation.txt

evidence/before_after/DEVSECOPS_10_BEFORE_AFTER_EXECUTIVE_SUMMARY.csv

## Before/After result

The project demonstrates the full workflow:

vulnerable-version
→ security findings
→ policy gate failed
→ remediation
→ fixed-version
→ repeated scans
→ policy gate passed

## Practical value

The evidence pack proves that the project is not a collection of isolated commands. Every important step has a preserved output, report, SBOM, scan result or before/after artifact.

## Result

Phase 10 prepares the evidence base for the final report, presentation and GitHub publication.
