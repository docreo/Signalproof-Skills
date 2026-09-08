# Incident Response Runbook

## Purpose

This runbook defines the executable response path for suspected security incidents affecting Signalproof Skills, repository governance, public-boundary controls, or related automation. It supplements `SECURITY.md` and preserves evidence, rollback, and existing working controls.

## 1. Classify from observed impact

Use concrete conditions rather than labels alone. Relevant conditions include:

- suspected credential or secret exposure;
- unauthorized repository mutation;
- public/private boundary violation;
- CI or governance-control bypass;
- malicious or compromised dependency/action behavior;
- integrity loss affecting release, provenance, or protected state.

Record confirmed facts separately from hypotheses.

## 2. Contain with the smallest reversible action

Contain only the affected path where possible. Do not disable unrelated working systems merely to satisfy an incident procedure.

Examples:

- revoke or rotate an exposed credential through its provider;
- stop publishing an affected artifact;
- temporarily block the affected workflow or integration only when the exposure is verified and a reversible containment exists;
- preserve the current repository state before corrective mutation when safe.

Do not force-push, rewrite history, delete evidence, or weaken required checks as an incident-response shortcut.

## 3. Preserve evidence

Capture and retain:

- UTC timestamps;
- repository/ref/commit identities;
- observed symptoms;
- relevant sanitized logs;
- hashes of preserved artifacts where applicable;
- exact containment actions;
- the scope and time window reviewed.

Use wording such as `no evidence found in the reviewed scope/time window` rather than making an unsupported claim that no unauthorized access occurred.

## 4. Sensitive public-repository remediation

For sensitive vulnerabilities in this public repository, use GitHub's private vulnerability-reporting/security-advisory workflow and temporary private fork where available.

An ordinary branch in a public repository is not a private remediation channel.

Do not place credentials, exploit details that create unnecessary exposure, or sensitive customer/infrastructure data into public issues, branches, commits, workflow logs, or pull-request discussion.

## 5. Correct

Apply the smallest correction that removes the verified cause while preserving unrelated accepted behavior and existing governance checks.

## 6. Verify

Run the repository's existing required checks plus any incident-specific regression test. Verification must establish both:

- the verified defect/exposure no longer reproduces; and
- previously accepted behavior remains intact.

## 7. Recover

Use ordinary Git revert or the documented recovery path when a correction causes regression. Do not rewrite protected history.

## 8. Close out

Record:

- verified root cause if known;
- containment;
- correction;
- tests and evidence;
- residual uncertainty;
- follow-up controls.

Any tabletop or simulated record must be labeled `SYNTHETIC / NOT AN ACTUAL INCIDENT` so it cannot be mistaken for historical incident evidence.
