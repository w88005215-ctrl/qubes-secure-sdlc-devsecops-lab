# Phase 8 — Remediation

## Objective

The objective of this phase is to create the fixed version of the demo application and prepare evidence for the repeated security pipeline execution.

## Remediated issues

1. Hardcoded fake secret removed from fixed-version.
2. Unsafe subprocess usage removed.
3. Flask debug mode disabled.
4. Allowlist input validation added.
5. Basic security headers added.
6. Dependencies pinned in requirements.txt.
7. Dockerfile updated with production-style settings and a non-root user.
8. Terraform ingress restricted to an internal lab CIDR instead of 0.0.0.0/0.
9. Remediation matrix created for before/after analysis.

## Fixed components

- app/fixed-version/app.py
- app/fixed-version/requirements.txt
- docker/fixed.Dockerfile
- iac/fixed/main.tf
- evidence/before_after/DEVSECOPS_08_REMEDIATION_MATRIX.csv

## Evidence

- evidence/command_outputs/DEVSECOPS_08_OUTPUT_remediation_branch_preparation.txt
- evidence/command_outputs/DEVSECOPS_08_OUTPUT_remediation_diff.txt
- evidence/command_outputs/DEVSECOPS_08_OUTPUT_fixed_files_acceptance_check.txt
- evidence/command_outputs/DEVSECOPS_08_OUTPUT_project_tree_after_remediation_files.txt
- evidence/before_after/DEVSECOPS_08_REMEDIATION_MATRIX.csv

## Expected next step

In Phase 9, the fixed-version will be scanned again with the same security tools. The expected result is that the policy gate passes with POLICY_GATE_STATUS=PASSED.
