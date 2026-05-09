# Portfolio Summary — Qubes Secure SDLC / DevSecOps Lab

## One-liner

A Qubes-based Secure SDLC lab that demonstrates a full DevSecOps workflow: vulnerable baseline, multi-tool security scans, failed policy gate, remediation, fixed scans, passed policy gate, evidence pack, final report, and presentation.

## Skills demonstrated

- Secure SDLC design.
- DevSecOps pipeline thinking.
- AppSec remediation.
- SAST/SCA/secrets/IaC/container/SBOM scanning.
- Policy gate design.
- Qubes OS workflow isolation.
- Evidence-driven engineering.
- Technical reporting and case defense.

## Tools

Semgrep, Bandit, pip-audit, Gitleaks, Checkov, Trivy, Syft, Grype, Git, Qubes OS.

## Results

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

## Best demo path

1. Show `PROJECT_TREE.txt`.
2. Show vulnerable baseline under `app/vulnerable-version`, `docker/vulnerable.Dockerfile`, and `iac/vulnerable`.
3. Show Phase 6 scan reports.
4. Show `POLICY_GATE_STATUS=FAILED`.
5. Show remediation matrix.
6. Show fixed version.
7. Show Phase 9 scan reports.
8. Show `POLICY_GATE_STATUS=PASSED`.
9. Show final report and presentation.
