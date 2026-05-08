# INTENTIONALLY VULNERABLE Dockerfile for lab scanning.
# Do not use this Dockerfile in production.

FROM python:3.9

WORKDIR /app

COPY app/vulnerable-version/requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r /app/requirements.txt

COPY app/vulnerable-version/ /app/

ENV FLASK_ENV=development
ENV FLASK_DEBUG=1
ENV LAB_MODE=intentionally-vulnerable

EXPOSE 5000

# Intentionally runs as root by default.
CMD ["python", "app.py"]
