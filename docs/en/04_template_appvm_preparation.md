# TemplateVM and AppVM Preparation

## Purpose

Phase 3 prepares the base environment for the next DevSecOps Lab implementation phases.

Only basic system utilities are installed during this phase.

Security tools are not installed in Phase 3. They will be installed separately in Phase 5.

## Where Preparation Happens

| Environment | Purpose |
|---|---|
| TemplateVM | base system package installation |
| dev-workbench | repository and base utility verification |
| security-runner | environment readiness check for security tools |

## Base Packages

- git
- tree
- curl
- wget
- jq
- python3
- python3-venv
- python3-pip
- pipx
- ca-certificates
- unzip
- tar
- gzip

## Not Installed in This Phase

- Semgrep
- Bandit
- pip-audit
- Gitleaks
- Trivy
- Checkov
- Syft
- Grype

## Phase 3 Evidence

| Evidence | Purpose |
|---|---|
| evidence/command_outputs/DEVSECOPS_03_OUTPUT_dev_workbench_base_tools_check.txt | base utility check in dev-workbench |
| evidence/command_outputs/DEVSECOPS_03_OUTPUT_security_runner_base_tools_check.txt | base utility check in security-runner |
| evidence/command_outputs/DEVSECOPS_03_OUTPUT_template_appvm_preparation_checklist.txt | TemplateVM and AppVM preparation checklist |
| evidence/command_outputs/DEVSECOPS_03_OUTPUT_project_tree_after_template_appvm_preparation.txt | project tree after Phase 3 |
