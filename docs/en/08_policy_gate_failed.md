# Phase 7 — Policy Gate Failed

## Objective

The objective of this phase is to demonstrate that the insecure application version is blocked by the security policy gate before remediation.

## Context

Branch under evaluation: vulnerable-baseline

Application version: app/vulnerable-version

The policy gate used Phase 6 outputs:

- Semgrep;
- Bandit;
- pip-audit;
- Gitleaks;
- Checkov;
- Trivy;
- Syft SBOM;
- Grype SBOM vulnerability scan.

## Gate conditions

The policy gate must fail if at least one of the following conditions is true:

1. hardcoded secret detected;
2. high/critical dependency vulnerability detected;
3. IaC contains public ingress 0.0.0.0/0;
4. Dockerfile/container configuration contains high/critical misconfiguration;
5. SAST contains high/error severity finding.

## Result

Expected result for the vulnerable baseline:

POLICY_GATE_STATUS=FAILED

This is correct behavior because the vulnerable version intentionally contains educational security defects.

## Evidence

Main evidence files:

- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_precheck.txt
- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_script_creation.txt
- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_failed.txt
- evidence/command_outputs/DEVSECOPS_07_OUTPUT_policy_gate_failed_validation.txt
- evidence/before_after/DEVSECOPS_07_POLICY_GATE_FAILED_SUMMARY.json

## Conclusion

This phase demonstrates that the security pipeline does not only detect issues, but also makes an engineering decision: blocking the unsafe version before remediation.
