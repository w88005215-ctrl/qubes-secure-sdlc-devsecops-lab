# Qubes Secure SDLC / DevSecOps Lab

## What this project demonstrates

This is a publication-ready Secure SDLC / DevSecOps lab using a SOC-style evidence workflow. The project was built in Qubes OS and demonstrates the full path from a vulnerable baseline to a remediated version with a passed policy gate.

## Final status

- Vulnerable baseline policy gate: `FAILED`
- Fixed version policy gate: `PASSED`
- Release state: publication-ready

## Project story

1. Qubes-based isolated workflow was designed.
2. An intentionally vulnerable baseline was created.
3. Semgrep, Bandit, pip-audit, Gitleaks, Checkov, Trivy, Syft, and Grype were executed.
4. The baseline was blocked by the policy gate.
5. Application, dependency, Dockerfile, and IaC remediation was implemented.
6. Repeat scans confirmed no gate-blocking conditions.
7. The fixed version passed the policy gate.
8. Evidence pack, final report, and presentation were prepared.

## Key artifacts

- RU report: `reports/devsecops_lab_report_ru.md`
- EN report: `reports/devsecops_lab_report_en.md`
- PDF reports: `reports/devsecops_lab_report_ru.pdf`, `reports/devsecops_lab_report_en.pdf`
- Presentation: `presentation/devsecops_case_defense.html`
- Evidence inventory: `evidence/EVIDENCE_INVENTORY.csv`
- SHA256 manifest: `evidence/DEVSECOPS_10_SHA256SUMS.txt`
- Project tree: `PROJECT_TREE.txt`
- Portfolio summary: `PORTFOLIO_SUMMARY.md`

## Before/after results

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

## Scope

This is an educational controlled lab. The vulnerable version is intentionally preserved to demonstrate the failed policy gate and must not be deployed.
