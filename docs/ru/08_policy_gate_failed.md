# Фаза 7 — Policy Gate Failed

## Цель

Цель фазы — показать, что небезопасная версия приложения блокируется security policy gate до исправления уязвимостей.

## Контекст

Проверялась ветка: vulnerable-baseline

Проверялась версия приложения: app/vulnerable-version

Policy gate использовал результаты Фазы 6:

- Semgrep;
- Bandit;
- pip-audit;
- Gitleaks;
- Checkov;
- Trivy;
- Syft SBOM;
- Grype SBOM vulnerability scan.

## Gate conditions

Policy gate должен падать, если выполняется хотя бы одно условие:

1. найден hardcoded secret;
2. найдена high/critical dependency vulnerability;
3. IaC содержит public ingress 0.0.0.0/0;
4. Dockerfile/container configuration содержит high/critical misconfiguration;
5. SAST содержит high/error severity finding.

## Результат

Ожидаемый результат для vulnerable baseline:

POLICY_GATE_STATUS=FAILED

Это корректное поведение, потому что vulnerable-version намеренно содержит учебные security defects.

## Evidence

Основные evidence-файлы:

- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_precheck.txt
- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_script_creation.txt
- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_failed.txt
- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_failed_validation.txt
- evidence/before_after/DEVSECOPS_07_POLICY_GATE_FAILED_SUMMARY.json

## Вывод

Фаза подтверждает, что security pipeline не только находит проблемы, но и принимает инженерное решение: заблокировать небезопасную версию до remediation.
