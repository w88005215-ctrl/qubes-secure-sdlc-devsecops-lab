from __future__ import annotations

import os
import re
from typing import Tuple

from flask import Flask, jsonify, request

app = Flask(__name__)

ALLOWED_NAME_PATTERN = re.compile(r"^[a-zA-Z0-9 _.-]{1,64}$")
ALLOWED_TARGET_PATTERN = re.compile(r"^[a-zA-Z0-9.-]{1,253}$")


def validate_name(value: str) -> Tuple[bool, str]:
    if not value:
        return False, "name is required"

    if not ALLOWED_NAME_PATTERN.fullmatch(value):
        return False, "name contains unsupported characters or is too long"

    return True, value


def validate_target(value: str) -> Tuple[bool, str]:
    if not value:
        return False, "target is required"

    if not ALLOWED_TARGET_PATTERN.fullmatch(value):
        return False, "target contains unsupported characters or is too long"

    if ".." in value or value.startswith(".") or value.endswith("."):
        return False, "target format is invalid"

    return True, value


@app.after_request
def add_security_headers(response):
    response.headers["Content-Security-Policy"] = "default-src 'self'; frame-ancestors 'none'"
    response.headers["X-Content-Type-Options"] = "nosniff"
    response.headers["X-Frame-Options"] = "DENY"
    response.headers["Referrer-Policy"] = "no-referrer"
    response.headers["Permissions-Policy"] = "geolocation=(), microphone=(), camera=()"
    response.headers["Cache-Control"] = "no-store"
    return response


@app.route("/")
def index():
    return jsonify(
        {
            "service": "Qubes Secure SDLC DevSecOps Lab",
            "version": "fixed",
            "status": "ok",
        }
    )


@app.route("/hello")
def hello():
    raw_name = request.args.get("name", "")
    valid, result = validate_name(raw_name)

    if not valid:
        return jsonify({"error": result}), 400

    return jsonify({"message": f"Hello, {result}"})


@app.route("/validate-target")
def validate_target_endpoint():
    raw_target = request.args.get("target", "")
    valid, result = validate_target(raw_target)

    if not valid:
        return jsonify({"error": result}), 400

    return jsonify(
        {
            "target": result,
            "status": "validated",
            "note": "No shell command execution is performed in the fixed version.",
        }
    )


@app.route("/health")
def health():
    return jsonify({"status": "healthy"})


if __name__ == "__main__":
    port = int(os.environ.get("APP_PORT", "5000"))
    app.run(host="127.0.0.1", port=port, debug=False)
