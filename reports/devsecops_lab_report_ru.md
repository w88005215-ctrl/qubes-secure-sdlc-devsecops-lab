# Отчёт по проекту: Qubes Secure SDLC / DevSecOps Lab

Subtitle: Automated Security Testing, SBOM, Policy Gates and Remediation Workflow  
Environment: Qubes OS 4.3  
Project type: diploma and portfolio engineering case  
Language: RU  

---

## 1. Executive Summary

В рамках проекта была реализована воспроизводимая лаборатория Secure SDLC / DevSecOps в Qubes OS.

Главная цель проекта — показать полный инженерный цикл безопасной разработки ПО:

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

Ключевой результат:

| Version | Policy Gate Result |
|---|---|
| vulnerable-version | FAILED |
| fixed-version | PASSED |

Проект демонстрирует не только запуск security tools, но и полный evidence-first workflow: scan reports, SBOM, command outputs, before/after results, remediation matrix, policy gate results and Git history.

---

## 2. Scope

В scope проекта входит:

- Qubes OS lab architecture;
- intentionally vulnerable Python/Flask application;
- fixed version после remediation;
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

Вне scope:

- production CI/CD deployment;
- cloud-only security pipeline;
- Docker Desktop на хосте;
- работа в dom0 с проектными файлами;
- использование реальных секретов, токенов, ключей или production credentials;
- автономный AI pentest.

---

## 3. Qubes OS Architecture

Проект использует разделение ролей между qube.

| Qube | Назначение |
|---|---|
| dev-workbench | разработка репозитория, документации, demo app, итоговая сборка evidence |
| security-runner | запуск security tools и генерация scan reports |
| evidence-vault | опциональное долговременное хранение evidence |
| report-vm | опциональная сборка отчёта и презентации |
| ai-workbench | опциональный human-in-the-loop слой для sanitized findings |

Логический workflow:

    dev-workbench
      -> repository snapshot
      -> security-runner
      -> SAST / SCA / secrets / IaC / SBOM
      -> evidence package
      -> dev-workbench / evidence
      -> report / GitHub portfolio

Разделение qube усиливает модель безопасности: разработка, сканирование и хранение evidence не смешиваются в одной роли. Передача файлов через qvm-copy является контролируемым межкубовым обменом в Qubes OS.

---

## 4. Secure SDLC Methodology

Проект связан с практиками Secure SDLC.

| Secure SDLC stage | Реализация |
|---|---|
| Requirements | security acceptance criteria и policy gate conditions |
| Design | Qubes VM architecture и trust boundaries |
| Implementation | vulnerable и fixed версии приложения |
| Verification | SAST, SCA, secret scanning, IaC scanning, SBOM |
| Remediation | исправление defects и повторная проверка |
| Release decision | policy gate failed / passed |
| Evidence | reports, SBOM, outputs, before/after summaries |

Методологическая база:

- OWASP ASVS;
- OWASP SAMM;
- NIST SSDF;
- SLSA;
- CycloneDX.

---

## 5. Demo Application

Demo application состоит из двух версий:

| Path | Purpose |
|---|---|
| app/vulnerable-version/ | intentionally vulnerable baseline |
| app/fixed-version/ | remediated version |

В vulnerable-version были намеренно добавлены учебные security defects.

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

Все секреты являются фейковыми и предназначены только для лабораторного обнаружения.

---

## 6. Security Pipeline

В проекте использовались следующие инструменты.

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

На vulnerable baseline были получены следующие результаты.

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

Ключевые evidence:

- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_failed.txt
- evidence/before_after/DEVSECOPS_07_POLICY_GATE_FAILED_SUMMARY.json

---

## 8. Remediation

В fixed-version были выполнены исправления.

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

Основной remediation artifact:

- evidence/before_after/DEVSECOPS_08_REMEDIATION_MATRIX.csv

---

## 9. Fixed Version Results

После remediation были выполнены повторные проверки.

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

Ключевые evidence:

- evidence/command_outputs/DEVSECOPS_09_OUTPUT_policy_gate_passed.txt
- evidence/before_after/DEVSECOPS_09_BEFORE_AFTER_SECURITY_SUMMARY.csv

---

## 10. Policy Gate Logic

Policy gate блокирует pipeline, если найдено одно из условий:

- hardcoded secret;
- high or critical dependency vulnerability;
- public ingress 0.0.0.0/0 in IaC;
- critical container finding;
- high severity SAST finding.

Фактический результат:

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

Ограничения проекта:

1. Это лабораторная модель, а не production CI/CD система.
2. Demo application содержит intentionally vulnerable code.
3. Все secrets являются фейковыми.
4. Результаты tools требуют human validation.
5. Возможны false positives и false negatives.
6. Policy gates требуют настройки под риск-профиль организации.
7. SBOM сам по себе не устраняет риски.
8. Qubes OS используется как изолированная рабочая среда.
9. Residual low/medium findings могут оставаться вне blocking policy.

---

## 14. Lessons Learned

Проект показывает:

- DevSecOps pipeline должен быть evidence-driven.
- Один инструмент не покрывает все классы рисков.
- Security gate должен быть понятным и воспроизводимым.
- Qubes OS помогает разделить роли разработки, сканирования и evidence.
- Автоматизация не заменяет human validation.
- Before/after workflow делает проект сильным для диплома и портфолио.

---

## 15. Conclusion

Проект демонстрирует полный Secure SDLC / DevSecOps цикл:

    design
    -> vulnerable baseline
    -> automated security testing
    -> failed policy gate
    -> remediation
    -> repeated security testing
    -> passed policy gate
    -> evidence pack
    -> report

Итоговая ценность:

- для диплома: практическая реализация безопасной разработки;
- для GitHub: воспроизводимый engineering case;
- для портфолио: AppSec, DevSecOps, supply chain security и Qubes OS;
- для собеседования: понятный рассказ про findings, remediation, SBOM и policy gates.
