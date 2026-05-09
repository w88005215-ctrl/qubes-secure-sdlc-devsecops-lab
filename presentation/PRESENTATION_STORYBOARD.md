# Presentation Storyboard

Project: Qubes Secure SDLC / DevSecOps Lab  
Subtitle: Automated Security Testing, SBOM, Policy Gates and Remediation Workflow  
Target: diploma defense, GitHub portfolio, security engineering interview

## Slide 1 — Title

Message: This is a complete Secure SDLC / DevSecOps engineering lab in Qubes OS.

Visual idea:
- title
- Qubes OS isolated lab
- DevSecOps pipeline line: vulnerable -> findings -> failed gate -> remediation -> passed gate

## Slide 2 — Problem

Message: Security must be built into SDLC before production.

Key points:
- vulnerabilities should be detected early
- dependencies and secrets must be controlled
- infrastructure code must be checked
- security gates should block unsafe builds

## Slide 3 — Project Goal

Message: Build a reproducible DevSecOps lab with evidence-first workflow.

Key result:
- vulnerable-version failed the policy gate
- fixed-version passed the policy gate

## Slide 4 — Qubes OS Architecture

Message: The lab separates development, scanning and evidence handling.

Qubes:
- dev-workbench
- security-runner
- evidence-vault
- report-vm
- optional ai-workbench

## Slide 5 — Demo Application

Message: A deliberately vulnerable Flask app was created for controlled security testing.

Defects:
- fake secret
- vulnerable dependencies
- unsafe subprocess
- debug mode
- missing headers
- insecure Dockerfile
- public ingress
- unpinned dependency
- missing validation

## Slide 6 — Security Pipeline

Message: Multiple tools cover different risk categories.

Tools:
- Semgrep
- Bandit
- pip-audit
- Gitleaks
- Checkov
- Trivy
- Syft
- Grype

## Slide 7 — Vulnerable Scan Results

Message: The vulnerable baseline produced real findings.

Key results:
- Semgrep: 10
- Bandit: 7
- Gitleaks: 2
- Trivy filesystem vulnerabilities: 17
- Grype matches: 17
- Checkov failed checks: 4

## Slide 8 — Policy Gate Failed

Message: The policy gate blocked the unsafe version.

Gate status:
- POLICY_GATE_STATUS=FAILED

Blocking reasons:
- hardcoded secret
- high risk dependency findings
- public ingress
- SAST findings
- insecure configuration

## Slide 9 — Remediation

Message: Findings were remediated in a fixed version.

Fixes:
- removed fake secret
- removed unsafe subprocess
- disabled debug mode
- added input validation
- added security headers
- restricted IaC ingress
- hardened Dockerfile
- reduced dependency risk

## Slide 10 — Fixed Scan Results

Message: Repeated scans showed no gate-blocking findings.

Gate-relevant results:
- Semgrep ERROR: 0
- Bandit HIGH: 0
- Gitleaks: 0
- Public ingress: 0
- Trivy HIGH/CRITICAL: 0
- Grype HIGH/CRITICAL: 0

## Slide 11 — Policy Gate Passed

Message: The fixed version passed the policy gate.

Gate status:
- POLICY_GATE_STATUS=PASSED

Before/after:
- vulnerable-version: FAILED
- fixed-version: PASSED

## Slide 12 — Portfolio Value

Message: This project demonstrates practical AppSec, DevSecOps and Qubes OS skills.

Value:
- Secure SDLC implementation
- security automation
- software supply chain security
- evidence-first engineering
- GitHub-ready portfolio case
