# Фаза 13 — GitHub Publication

## Назначение

Эта фаза фиксирует готовность проекта Qubes Secure SDLC / DevSecOps Lab к публикации на GitHub как дипломного и портфельного кейса.

Проект демонстрирует полный цикл Secure SDLC:

vulnerable application -> security scans -> findings -> failed policy gate -> remediation -> fixed application -> repeated scans -> passed policy gate -> evidence -> report -> presentation.

## Публикуемая ценность проекта

Проект показывает практические навыки:

| Область | Что реализовано |
|---|---|
| Secure SDLC | Процесс безопасной разработки от дефектов до исправлений |
| SAST | Semgrep и Bandit |
| SCA | pip-audit, Trivy, Grype |
| Secret scanning | Gitleaks с учебными fake secrets |
| IaC scanning | Checkov и Trivy config |
| SBOM | Syft CycloneDX SBOM |
| Policy gates | Failed gate для vulnerable baseline и passed gate для fixed version |
| Evidence-first | Все ключевые команды и результаты сохранены |
| Qubes OS workflow | Разделение dev-workbench, security-runner, evidence-vault, report-vm |

## Ветки и теги

| Git object | Назначение |
|---|---|
| main | Базовая ветка проекта |
| vulnerable-baseline | Уязвимая версия и failed gate |
| remediation | Исправленная версия и passed gate |
| v0.1-skeleton | Начальная структура |
| v1.0-vulnerable-baseline | Уязвимое приложение |
| v1.1-policy-gate-failed | Security gate failed |
| v1.2-remediation | Исправления |
| v1.3-policy-gate-passed | Security gate passed |
| v1.4-evidence-pack | Evidence pack |
| v1.5-report | Technical report |
| v1.6-presentation | Presentation pack |
| v1.7-publication-ready | Финальная готовность к публикации |

## Что публикуется

Публикуется весь репозиторий, включая:

- исходный код vulnerable и fixed версий;
- IaC examples;
- Dockerfiles;
- scripts;
- scan reports;
- SBOM;
- before/after evidence;
- technical report;
- presentation source;
- publication notes.

## Что не публикуется

В репозитории не должно быть:

- реальных токенов;
- реальных ключей;
- реальных паролей;
- приватных данных;
- кэшей Python;
- временных backup-директорий;
- рабочих файлов Qubes OS вне проекта.

Все secrets в проекте являются учебными fake secrets.

## GitHub publication approach

Рекомендуемый способ публикации:

1. Создать пустой публичный репозиторий на GitHub.
2. Не добавлять README через GitHub UI, потому что README уже есть локально.
3. Добавить remote origin.
4. Выполнить push веток и тегов.
5. Проверить отображение README, docs, reports, presentation и evidence.
6. Проверить, что GitHub не показывает предупреждения о реальных secrets.
7. Если GitHub показывает secret alert, проверить, что это fake lab secret, и при необходимости заменить fake pattern на lab-specific marker.

## Portfolio summary

Спроектировал и реализовал лабораторный DevSecOps workflow в Qubes OS для автоматизированного тестирования безопасности ПО. Настроил проверки SAST, SCA, secret scanning, IaC scanning, container/config scanning, генерацию SBOM и policy gates. На демонстрационном приложении показал полный цикл: vulnerable version -> detection -> failed gate -> remediation -> fixed version -> passed gate -> evidence -> report -> presentation.

## Итоговый статус

Phase 13 считается завершённой, если:

- git status чистый;
- финальный tree сохранён;
- publication readiness evidence создан;
- финальный тег v1.7-publication-ready создан;
- архив publication candidate собран;
- проект готов к загрузке на GitHub.
