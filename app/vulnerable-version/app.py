from flask import Flask, request, jsonify, make_response
import subprocess
import os

app = Flask(__name__)

# INTENTIONALLY VULNERABLE LAB CODE
# These are fake educational secrets. Do not use real credentials.
FAKE_AWS_ACCESS_KEY_ID = "AKIAIOSFODNN7EXAMPLE"
FAKE_AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
FAKE_GITHUB_TOKEN = "ghp_FAKE_TOKEN_FOR_SECURITY_LAB_ONLY_1234567890"

app.config["SECRET_KEY"] = "fake-hardcoded-flask-secret-for-lab-only"


@app.route("/")
def index():
    name = request.args.get("name", "student")

    # Missing input validation and unsafe direct HTML rendering for lab demonstration.
    html = f"""
    <html>
      <head>
        <title>Vulnerable DevSecOps Lab App</title>
      </head>
      <body>
        <h1>Qubes Secure SDLC / DevSecOps Lab</h1>
        <p>Hello, {name}</p>
        <p>This application is intentionally vulnerable for educational scanning.</p>
        <ul>
          <li>/ping?host=127.0.0.1</li>
          <li>/profile?user=alice&age=25</li>
          <li>/debug-info</li>
        </ul>
      </body>
    </html>
    """

    response = make_response(html)

    # Intentionally weak/missing security headers.
    response.headers["X-Powered-By"] = "Vulnerable-Flask-Lab"
    return response


@app.route("/ping")
def ping():
    host = request.args.get("host", "127.0.0.1")

    # INTENTIONALLY VULNERABLE:
    # Unsafe subprocess usage with shell=True and user-controlled input.
    command = f"ping -c 1 {host}"
    output = subprocess.check_output(command, shell=True, text=True, stderr=subprocess.STDOUT)

    return jsonify({
        "command": command,
        "output": output
    })


@app.route("/profile")
def profile():
    user = request.args.get("user", "")
    age = request.args.get("age", "")

    # INTENTIONALLY VULNERABLE:
    # Missing input validation. Values are trusted directly.
    return jsonify({
        "user": user,
        "age": age,
        "message": f"profile generated for {user}"
    })


@app.route("/debug-info")
def debug_info():
    # INTENTIONALLY VULNERABLE:
    # Exposes internal debug-style information.
    return jsonify({
        "environment": dict(os.environ),
        "fake_access_key_id": FAKE_AWS_ACCESS_KEY_ID,
        "debug": True
    })


if __name__ == "__main__":
    # INTENTIONALLY VULNERABLE:
    # Debug mode enabled for security scanning demonstration.
    app.run(host="0.0.0.0", port=5000, debug=True)
