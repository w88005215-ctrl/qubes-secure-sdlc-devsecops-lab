# Phase 13 — GitHub Publication

## Purpose

This phase documents the publication readiness of the Qubes Secure SDLC / DevSecOps Lab as a diploma and portfolio project.

The project demonstrates the full Secure SDLC workflow:

vulnerable application -> security scans -> findings -> failed policy gate -> remediation -> fixed application -> repeated scans -> passed policy gate -> evidence -> report -> presentation.

## Portfolio value

The project demonstrates practical skills:

| Area | Implementation |
|---|---|
| Secure SDLC | Security workflow from defects to remediation |
| SAST | Semgrep and Bandit |
| SCA | pip-audit, Trivy and Grype |
| Secret scanning | Gitleaks with educational fake secrets |
| IaC scanning | Checkov and Trivy config |
| SBOM | Syft CycloneDX SBOM |
| Policy gates | Failed gate for vulnerable baseline and passed gate for fixed version |
| Evidence-first workflow | Key commands and outputs are preserved |
| Qubes OS workflow | Separation between dev-workbench, security-runner, evidence-vault and report-vm |

## Branches and tags

| Git object | Purpose |
|---|---|
| main | Base project branch |
| vulnerable-baseline | Vulnerable version and failed gate |
| remediation | Fixed version and passed gate |
| v0.1-skeleton | Initial repository skeleton |
| v1.0-vulnerable-baseline | Vulnerable application |
| v1.1-policy-gate-failed | Security gate failed |
| v1.2-remediation | Remediation |
| v1.3-policy-gate-passed | Security gate passed |
| v1.4-evidence-pack | Evidence pack |
| v1.5-report | Technical report |
| v1.6-presentation | Presentation pack |
| v1.7-publication-ready | Final publication-ready state |

## Published content

The repository includes:

- vulnerable and fixed application source code;
- IaC examples;
- Dockerfiles;
- scripts;
- scan reports;
- SBOM files;
- before/after evidence;
- technical report;
- presentation source;
- publication notes.

## Excluded content

The repository must not include:

- real tokens;
- real keys;
- real passwords;
- private data;
- Python cache files;
- temporary backup directories;
- Qubes OS working files outside the project scope.

All secrets in the project are educational fake secrets.

## GitHub publication approach

Recommended publication workflow:

1. Create an empty public repository on GitHub.
2. Do not initialize it with a README because the local project already contains one.
3. Add the remote origin.
4. Push branches and tags.
5. Verify README, docs, reports, presentation and evidence rendering.
6. Check that GitHub does not report real secret exposure.
7. If GitHub reports a secret alert, verify that it is a fake lab secret and replace the fake pattern with a lab-specific marker if needed.

## Portfolio summary

Designed and implemented a Qubes OS-based Secure SDLC / DevSecOps lab demonstrating automated SAST, SCA, secret scanning, IaC scanning, container/config scanning, SBOM generation, policy gates and remediation workflow. Built a vulnerable demo application, detected security issues, blocked unsafe builds, remediated findings and documented before/after results.

## Final status

Phase 13 is complete when:

- git status is clean;
- final project tree is saved;
- publication readiness evidence is created;
- final tag v1.7-publication-ready is created;
- publication candidate archive is built;
- the project is ready for GitHub publication.
