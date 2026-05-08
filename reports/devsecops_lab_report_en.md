# Project Report: Qubes Secure SDLC / DevSecOps Lab

Subtitle: Automated Security Testing, SBOM, Policy Gates and Remediation Workflow  
Environment: Qubes OS 4.3  
Project type: diploma and portfolio engineering case  
Language: EN  

---

## 1. Executive Summary

This project implements a reproducible Secure SDLC / DevSecOps lab in Qubes OS.

The main goal is to demonstrate the full secure software development workflow:

    vulnerable application
    -> security scans
    -> findings
    -> policy gate failed
    -> remediation
    -> fixed application
    -> repeated scans
    -> policy gate passed
    -> evidence
    -> report
    -> GitHub portfolio

Key result:

| Version | Policy Gate Result |
|---|---|
| vulnerable-version | FAILED |
| fixed-version | PASSED |

The project demonstrates not only security tool execution, but also a complete evidence-first workflow: scan reports, SBOM, command outputs, before/after results, remediation matrix, policy gate results and Git history.

---

## 2. Scope

In scope:

- Qubes OS lab architecture;
- intentionally vulnerable Python/Flask application;
- fixed version after remediation;
- SAST checks;
- SCA checks;
- secret scanning;
- IaC scanning;
- Dockerfile/container-oriented checks;
- SBOM generation;
- SBOM vulnerability scanning;
- policy gate failed/passed demonstration;
- evidence collection;
- technical report;
- GitHub-ready portfolio structure.

Out of scope:

- production CI/CD deployment;
- cloud-only security pipeline;
- Docker Desktop on the host;
- project work in dom0;
- real secrets, tokens, keys or production credentials;
- autonomous AI pentesting.

---

## 3. Qubes OS Architecture

The project separates responsibilities between qubes.

| Qube | Purpose |
|---|---|
| dev-workbench | repository, documentation, demo app and final evidence assembly |
| security-runner | security tools execution and scan report generation |
| evidence-vault | optional long-term evidence storage |
| report-vm | optional report and presentation build environment |
| ai-workbench | optional human-in-the-loop layer for sanitized findings |

Logical workflow:

    dev-workbench
      -> repository snapshot
      -> security-runner
      -> SAST / SCA / secrets / IaC / SBOM
      -> evidence package
      -> dev-workbench / evidence
      -> report / GitHub portfolio

Separating qubes reduces role mixing. File transfer through qvm-copy is a controlled inter-qube data exchange mechanism in Qubes OS.

---

## 4. Secure SDLC Methodology

The project maps to Secure SDLC practices.

| Secure SDLC stage | Project implementation |
|---|---|
| Requirements | security acceptance criteria and policy gate conditions |
| Design | Qubes VM architecture and trust boundaries |
| Implementation | vulnerable and fixed application versions |
| Verification | SAST, SCA, secret scanning, IaC scanning, SBOM |
| Remediation | fixing defects and repeating scans |
| Release decision | policy gate failed / passed |
| Evidence | reports, SBOM, outputs, before/after summaries |

Methodology baseline:

- OWASP ASVS;
- OWASP SAMM;
- NIST SSDF;
- SLSA;
- CycloneDX.

---

## 5. Demo Application

The demo application has two versions.

| Path | Purpose |
|---|---|
| app/vulnerable-version/ | intentionally vulnerable baseline |
| app/fixed-version/ | remediated version |

The vulnerable version contains intentionally introduced educational defects.

| ID | Defect | Security area |
|---|---|---|
| D01 | fake hardcoded secret | secret scanning |
| D02 | vulnerable/outdated dependency | SCA |
| D03 | unsafe subprocess usage | SAST |
| D04 | debug mode enabled | insecure runtime configuration |
| D05 | missing or weak security headers | web hardening |
| D06 | insecure Dockerfile | container hardening |
| D07 | Terraform ingress 0.0.0.0/0 | IaC scanning |
| D08 | dependency without proper pinning | dependency hygiene |
| D09 | missing input validation | AppSec controls |

All secrets are fake and used only for controlled lab detection.

---

## 6. Security Pipeline

The project uses the following tools.

| Category | Tool | Evidence path |
|---|---|---|
| SAST | Semgrep | evidence/scan_reports/semgrep/ |
| Python SAST | Bandit | evidence/scan_reports/bandit/ |
| SCA | pip-audit | evidence/scan_reports/pip-audit/ |
| Secret scanning | Gitleaks | evidence/scan_reports/gitleaks/ |
| IaC scanning | Checkov | evidence/scan_reports/checkov/ |
| FS/IaC/Dockerfile scanning | Trivy | evidence/scan_reports/trivy/ |
| SBOM generation | Syft | evidence/sbom/ |
| SBOM vulnerability scan | Grype | evidence/scan_reports/grype/ |
| Policy gate | local bash gate | evidence/command_outputs/ |

---

## 7. Vulnerable Baseline Results

Vulnerable baseline results:

| Check | Result |
|---|---:|
| Semgrep findings | 10 |
| Bandit findings | 7 |
| Gitleaks findings | 2 |
| Checkov failed checks | 4 |
| Trivy filesystem vulnerabilities | 17 |
| Trivy IaC misconfigurations | 2 |
| Trivy Dockerfile misconfigurations | 2 |
| Syft SBOM components | 5 |
| Grype matches | 17 |

Policy gate result:

    POLICY_GATE_STATUS=FAILED

Key evidence:

- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_failed.txt
- evidence/before_after/DEVSECOPS_07_POLICY_GATE_FAILED_SUMMARY.json

---

## 8. Remediation

The fixed version remediates the intentionally introduced defects.

| Defect | Vulnerable state | Fixed state |
|---|---|---|
| Hardcoded secret | fake secret in source | removed |
| Unsafe subprocess | unsafe command pattern | controlled safe handling |
| Debug mode | enabled | disabled |
| Security headers | missing or weak | defensive headers added |
| Public ingress | 0.0.0.0/0 | restricted CIDR |
| Dockerfile | weak baseline | hardened non-root style |
| Dependencies | outdated/vulnerable | reduced and updated |
| Input validation | missing/weak | validation added |

Main remediation artifact:

- evidence/before_after/DEVSECOPS_08_REMEDIATION_MATRIX.csv

---

## 9. Fixed Version Results

After remediation, repeated scans were performed.

Gate-relevant counters:

| Check | Result |
|---|---:|
| Semgrep ERROR findings | 0 |
| Bandit HIGH findings | 0 |
| Gitleaks findings | 0 |
| Public ingress 0.0.0.0/0 | 0 |
| Trivy HIGH/CRITICAL filesystem vulnerabilities | 0 |
| Trivy Dockerfile HIGH/CRITICAL misconfigurations | 0 |
| Grype HIGH/CRITICAL SBOM matches | 0 |

Residual non-blocking findings:

| Check | Result | Gate impact |
|---|---:|---|
| pip-audit total vulnerabilities | 4 | non-blocking |
| Checkov failed checks | 1 | non-blocking; no public ingress |

Policy gate result:

    POLICY_GATE_STATUS=PASSED

Key evidence:

- evidence/command_outputs/DEVSECOPS_09_OUTPUT_policy_gate_passed.txt
- evidence/before_after/DEVSECOPS_09_BEFORE_AFTER_SECURITY_SUMMARY.csv

---

## 10. Policy Gate Logic

The policy gate blocks the pipeline if one of the following conditions is present:

- hardcoded secret;
- high or critical dependency vulnerability;
- public ingress 0.0.0.0/0 in IaC;
- critical container finding;
- high severity SAST finding.

Actual result:

| Version | Result |
|---|---|
| vulnerable-version | FAILED |
| fixed-version | PASSED |

---

## 11. Before / After Summary

| Category | Vulnerable | Fixed |
|---|---:|---:|
| Semgrep findings | 10 | 0 |
| Bandit findings | 7 | 0 |
| Gitleaks findings | 2 | 0 |
| Checkov failed checks | 4 | 1 |
| Trivy fs vulnerabilities | 17 | 4 |
| Grype matches | 17 | 4 |
| Policy gate | FAILED | PASSED |

---

## 12. Evidence Table

| Evidence | Purpose |
|---|---|
| PROJECT_TREE.txt | project structure |
| DEVSECOPS_05_OUTPUT_security_tools_versions.txt | tool versions |
| DEVSECOPS_06_REPORT_semgrep_vulnerable.json | vulnerable SAST evidence |
| DEVSECOPS_06_REPORT_bandit_vulnerable.json | vulnerable Python SAST evidence |
| DEVSECOPS_06_REPORT_gitleaks_vulnerable.json | fake secret detection |
| DEVSECOPS_06_REPORT_checkov_vulnerable.json | vulnerable IaC findings |
| DEVSECOPS_06_REPORT_trivy_fs_vulnerable.json | vulnerable dependency findings |
| DEVSECOPS_06_SBOM_vulnerable_syft_cyclonedx.json | vulnerable SBOM |
| DEVSECOPS_07_OUTPUT_policy_gate_failed.txt | failed gate evidence |
| DEVSECOPS_08_REMEDIATION_MATRIX.csv | remediation mapping |
| DEVSECOPS_09_REPORT_semgrep_fixed.json | fixed SAST evidence |
| DEVSECOPS_09_REPORT_gitleaks_fixed.json | fixed secret scan evidence |
| DEVSECOPS_09_SBOM_fixed_syft_cyclonedx.json | fixed SBOM |
| DEVSECOPS_09_OUTPUT_policy_gate_passed.txt | passed gate evidence |
| DEVSECOPS_10_SHA256SUMS.txt | integrity manifest |
| EVIDENCE_INVENTORY.csv | evidence inventory |

---

## 13. Limitations

Project limitations:

1. This is a lab model, not a production CI/CD system.
2. The demo application contains intentionally vulnerable code.
3. All secrets are fake.
4. Tool results require human validation.
5. False positives and false negatives are possible.
6. Policy gates must be tuned to the organization risk profile.
7. SBOM does not remove risk by itself.
8. Qubes OS is used as an isolated engineering workspace.
9. Residual low/medium findings may remain outside the blocking policy.

---

## 14. Lessons Learned

The project demonstrates:

- DevSecOps pipeline should be evidence-driven.
- One tool does not cover all risk classes.
- Security gates must be clear and reproducible.
- Qubes OS helps separate development, scanning and evidence roles.
- Automation does not replace human validation.
- Before/after workflow makes the project strong for diploma defense and portfolio review.

---

## 15. Conclusion

The project demonstrates the complete Secure SDLC / DevSecOps cycle:

    design
    -> vulnerable baseline
    -> automated security testing
    -> failed policy gate
    -> remediation
    -> repeated security testing
    -> passed policy gate
    -> evidence pack
    -> report

Portfolio value:

- diploma: practical secure software development implementation;
- GitHub: reproducible engineering case;
- portfolio: AppSec, DevSecOps, supply chain security and Qubes OS;
- interview: clear story about findings, remediation, SBOM and policy gates.
