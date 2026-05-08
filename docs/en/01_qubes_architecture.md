# Qubes OS Architecture

| Qube | Purpose |
|---|---|
| dev-workbench | demo app and repository development |
| security-runner | security tools execution |
| evidence-vault | evidence storage |
| report-vm | reports and presentation |
| ai-workbench | optional sanitized findings draft |

dom0 is not used for project working files.

Project working files are stored in an AppVM.

System packages are installed in a TemplateVM when appropriate.
