# Qubes Secure SDLC / DevSecOps Lab

[RU](README_RU.md) | [EN](README_EN.md)

## What this project demonstrates

This repository is a publication-ready Secure SDLC / DevSecOps case study built with a SOC-style evidence workflow in Qubes OS.

The lab shows the full path:

1. Design an isolated Qubes workflow.
2. Create an intentionally vulnerable baseline.
3. Run multi-tool security scans.
4. Fail a policy gate on the vulnerable baseline.
5. Remediate the application, dependencies, Dockerfile, and IaC.
6. Re-run scans.
7. Pass the policy gate.
8. Build an evidence pack, final report, and presentation.

## Final status

- Vulnerable baseline policy gate: `FAILED`
- Fixed policy gate: `PASSED`
- Final release state: publication-ready

## Main artifacts

- Final RU report: `reports/devsecops_lab_report_ru.md`
- Final EN report: `reports/devsecops_lab_report_en.md`
- PDF reports: `reports/devsecops_lab_report_ru.pdf`, `reports/devsecops_lab_report_en.pdf`
- Presentation: `presentation/devsecops_case_defense.html`
- Evidence inventory: `evidence/EVIDENCE_INVENTORY.csv`
- SHA256 manifest: `evidence/DEVSECOPS_10_SHA256SUMS.txt`
- Project tree: `PROJECT_TREE.txt`
- Portfolio summary: `PORTFOLIO_SUMMARY.md`

## Security tools

Semgrep, Bandit, pip-audit, Gitleaks, Checkov, Trivy, Syft, and Grype.

## Result snapshot

| Control | Vulnerable baseline | Fixed version | Interpretation |
| --- | --- | --- | --- |
| Policy gate | FAILED | PASSED | FAILED baseline -> PASSED fixed release |
| Semgrep findings | 10 | 0 | all Semgrep findings removed |
| Semgrep ERROR findings | 5 | 0 | blocking severity removed |
| Bandit findings | 7 | 0 | all Bandit findings removed |
| Bandit HIGH findings | 2 | 0 | no HIGH issues in fixed app |
| pip-audit vulnerabilities | 24 | 4 | residual non-blocking dependency findings documented |
| Gitleaks findings | 2 | 0 | lab secrets removed from fixed app |
| Checkov failed checks | 4 | 1 | public ingress removed; residual unattached SG check documented |
| Checkov public ingress | 4 | 0 | 0.0.0.0/0 removed |
| Trivy fs vulnerabilities | 17 | 4 | dependency risk reduced |
| Trivy fs HIGH/CRITICAL | 6 | 0 | no gate-blocking high/critical risk |
| Grype SBOM matches | 17 | 4 | SBOM scan retained for transparency |
| Grype HIGH/CRITICAL | 6 | 0 | no high/critical SBOM blockers |
| Syft SBOM components | 5 | 3 | smaller dependency surface |

## Repository layout

- `app/vulnerable-version` — intentionally vulnerable application.
- `app/fixed-version` — remediated application.
- `docker` — vulnerable and fixed Dockerfiles.
- `iac` — vulnerable and fixed Terraform examples.
- `scripts` — control scripts and policy gate.
- `evidence` — command outputs, scan reports, SBOMs, screenshots, summaries.
- `docs/ru`, `docs/en` — phase documentation.
- `reports` — final report pack.
- `presentation` — storyboard, slide source, and HTML deck.

## Educational scope

This repository contains intentionally vulnerable code for controlled educational demonstration. Do not deploy the vulnerable version in a real environment.

## Reviewer quick path

Start with the visual reports:

- Russian PDF: `reports/devsecops_lab_report_ru.pdf`
- English PDF: `reports/devsecops_lab_report_en.pdf`
- HTML presentation: `presentation/devsecops_case_defense.html`

Then validate the result through:

- failed gate evidence: `evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_failed.txt`
- passed gate evidence: `evidence/command_outputs/DEVSECOPS_09_OUTPUT_policy_gate_passed.txt`
- before/after comparison: `evidence/before_after/DEVSECOPS_09_BEFORE_AFTER_SECURITY_SUMMARY.csv`
- full evidence inventory: `evidence/EVIDENCE_INVENTORY.csv`
