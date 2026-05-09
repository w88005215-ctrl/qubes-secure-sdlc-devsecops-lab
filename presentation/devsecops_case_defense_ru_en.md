# Qubes Secure SDLC / DevSecOps Lab

Subtitle: Automated Security Testing, SBOM, Policy Gates and Remediation Workflow

RU:
Проектирование и реализация процесса безопасной разработки ПО с автоматизированным тестированием безопасности, SBOM и security gates.

EN:
Design and implementation of a Secure SDLC / DevSecOps workflow with automated security testing, SBOM and policy gates.

---

# Slide 1 — Title

Qubes Secure SDLC / DevSecOps Lab

Automated Security Testing, SBOM, Policy Gates and Remediation Workflow

Key result:

| Version | Gate |
|---|---|
| vulnerable-version | FAILED |
| fixed-version | PASSED |

Speaker note RU:
Это не просто набор security tools. Это полный инженерный цикл: уязвимая версия, обнаружение, блокировка, remediation, повторная проверка и успешный gate.

Speaker note EN:
This is not just a set of security tools. It is a complete engineering workflow: vulnerable version, detection, blocking, remediation, repeated validation and a passed gate.

---

# Slide 2 — Problem

Security must be built into SDLC before production.

RU:
Проблема классического подхода в том, что security часто появляется слишком поздно: после разработки, перед релизом или уже после инцидента.

EN:
The problem with a traditional approach is that security is often introduced too late: after development, before release or after an incident.

Key risks:
- vulnerable dependencies
- hardcoded secrets
- unsafe code patterns
- insecure IaC
- missing release gates
- weak evidence trail

---

# Slide 3 — Goal

Build a reproducible Secure SDLC / DevSecOps lab in Qubes OS.

RU:
Цель — показать, как security controls могут быть встроены в процесс разработки и как небезопасная версия блокируется до исправления.

EN:
The goal is to show how security controls can be embedded into the development workflow and how an unsafe version is blocked before remediation.

Workflow:
vulnerable app -> scans -> findings -> failed gate -> remediation -> fixed app -> repeated scans -> passed gate

---

# Slide 4 — Qubes OS Architecture

RU:
Qubes OS используется как изолированная инженерная среда.

EN:
Qubes OS is used as an isolated engineering workspace.

| Qube | Purpose |
|---|---|
| dev-workbench | repository, code, docs, evidence assembly |
| security-runner | security tools and scan reports |
| evidence-vault | optional evidence storage |
| report-vm | report and presentation work |
| ai-workbench | optional sanitized findings review |

Architecture flow:
dev-workbench -> security-runner -> evidence -> report -> GitHub portfolio

---

# Slide 5 — Demo Vulnerable Application

RU:
Создано учебное Flask-приложение с намеренными security defects.

EN:
A deliberately vulnerable Flask demo application was created.

Vulnerable defects:
- fake hardcoded secret
- vulnerable dependency
- unsafe subprocess usage
- debug mode enabled
- weak or missing security headers
- insecure Dockerfile
- Terraform ingress 0.0.0.0/0
- dependency without proper pinning
- missing input validation

---

# Slide 6 — Security Pipeline

RU:
Pipeline покрывает разные классы рисков.

EN:
The pipeline covers multiple risk categories.

| Category | Tool |
|---|---|
| SAST | Semgrep |
| Python SAST | Bandit |
| SCA | pip-audit |
| Secret scanning | Gitleaks |
| IaC scanning | Checkov |
| FS/IaC/Dockerfile scanning | Trivy |
| SBOM | Syft |
| SBOM vulnerability scan | Grype |
| Gate | local policy script |

---

# Slide 7 — Vulnerable Scan Results

RU:
Vulnerable baseline дал реальные findings.

EN:
The vulnerable baseline produced real findings.

| Check | Result |
|---|---:|
| Semgrep findings | 10 |
| Bandit findings | 7 |
| Gitleaks findings | 2 |
| Checkov failed checks | 4 |
| Trivy fs vulnerabilities | 17 |
| Grype matches | 17 |
| Syft SBOM components | 5 |

Evidence:
- DEVSECOPS_06_REPORT_* files
- DEVSECOPS_06_SBOM_vulnerable_syft_cyclonedx.json

---

# Slide 8 — Policy Gate Failed

RU:
Policy gate заблокировал vulnerable baseline.

EN:
The policy gate blocked the vulnerable baseline.

Gate result:
POLICY_GATE_STATUS=FAILED

Gate fails when:
- hardcoded secret detected
- high or critical dependency vulnerability detected
- IaC contains public ingress 0.0.0.0/0
- high severity SAST finding exists
- critical container finding exists

Evidence:
- DEVSECOPS_07_OUTPUT_policy_gate_failed.txt

---

# Slide 9 — Remediation

RU:
После failed gate была создана fixed-version.

EN:
After the failed gate, a fixed-version was created.

Remediation actions:
- removed fake hardcoded secret
- removed unsafe subprocess usage
- disabled Flask debug mode
- added input validation
- added security headers
- restricted Terraform ingress
- improved Dockerfile posture
- reduced dependency risk

Evidence:
- DEVSECOPS_08_REMEDIATION_MATRIX.csv

---

# Slide 10 — Fixed Scan Results

RU:
Повторные проверки fixed-version показали отсутствие gate-blocking findings.

EN:
Repeated scans of the fixed-version showed no gate-blocking findings.

| Gate-relevant check | Result |
|---|---:|
| Semgrep ERROR findings | 0 |
| Bandit HIGH findings | 0 |
| Gitleaks findings | 0 |
| Public ingress 0.0.0.0/0 | 0 |
| Trivy HIGH/CRITICAL vulnerabilities | 0 |
| Grype HIGH/CRITICAL matches | 0 |

Residual findings:
- pip-audit total vulnerabilities: 4
- Checkov failed checks: 1
- treated as non-blocking residual risk

---

# Slide 11 — Policy Gate Passed

RU:
Fixed-version прошла security gate.

EN:
The fixed-version passed the security gate.

Gate result:
POLICY_GATE_STATUS=PASSED

Before/after:
| Version | Gate |
|---|---|
| vulnerable-version | FAILED |
| fixed-version | PASSED |

Evidence:
- DEVSECOPS_09_OUTPUT_policy_gate_passed.txt
- DEVSECOPS_09_BEFORE_AFTER_SECURITY_SUMMARY.csv

---

# Slide 12 — Portfolio and Diploma Value

RU:
Проект демонстрирует практические навыки AppSec, DevSecOps, Secure SDLC, SBOM и Qubes OS.

EN:
The project demonstrates practical AppSec, DevSecOps, Secure SDLC, SBOM and Qubes OS skills.

Value:
- reproducible lab
- evidence-first workflow
- real security tools
- policy gate logic
- remediation workflow
- before/after comparison
- GitHub-ready portfolio artifact

Final message:
Security was moved left into the SDLC, findings were detected, unsafe build was blocked, defects were remediated and the fixed build passed the gate.
