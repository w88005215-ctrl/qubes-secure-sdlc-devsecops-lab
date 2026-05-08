# Vulnerable Demo Application

## RU

Это учебное Flask-приложение содержит intentional security defects для демонстрации DevSecOps pipeline.

Дефекты добавлены намеренно и используются только для лабораторного проекта.

## Defects

| ID | Defect | Location |
|---|---|---|
| D-01 | fake hardcoded secret | app.py |
| D-02 | outdated dependency | requirements.txt |
| D-03 | unsafe subprocess usage | /ping route |
| D-04 | debug mode enabled | app.run debug=True |
| D-05 | missing or weak security headers | index route |
| D-08 | dependency without proper pinning | flask-cors |
| D-09 | missing input validation | /profile and / routes |

## EN

This educational Flask application contains intentional security defects for DevSecOps pipeline demonstration.

The defects are intentionally added and used only for the lab project.

## Safety Note

All secrets are fake. Do not add real credentials, real tokens, real private keys or sensitive data.
