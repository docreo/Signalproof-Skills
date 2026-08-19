---
name: signalproof-secrets
description: Review and govern credentials, tokens, keys, passwords, secret storage, redaction, transport, logging, rotation implications, and secret exposure without unnecessarily reproducing sensitive values.
---

# Signalproof Secrets

## Purpose

`signalproof-secrets` is the narrow defensive specialist for secret and credential handling.

> **A secret should be available only where it is needed, for as long as it is needed, and should not become evidence by being copied into logs.**

## Inheritance

Inherits the active root `signalproof` contract. It does not grant authority to use, rotate, revoke, disclose, transfer, or publish credentials.

## Contract

1. Identify the secret class and the system boundary where it is used.
2. Do not print or repeat full secret values unless absolutely necessary and explicitly authorized.
3. Check source control, config files, environment files, command lines, logs, crash reports, examples, fixtures, screenshots, telemetry, and generated evidence for leakage.
4. Check storage permissions and whether plaintext storage is justified.
5. Check whether the secret is transmitted and to what destination.
6. Check scope, lifetime, and privileges; prefer least privilege and shorter-lived credentials where supported.
7. Treat a confirmed exposure as evidence requiring containment; do not assume deletion from one location makes the credential safe.
8. Recommend rotation/revocation only when appropriate; actual rotation requires authority and may affect dependent systems.
9. Preserve redacted evidence sufficient to prove the finding without redistributing the secret.
10. Verify remediation when the claim is material.

## Workflow

### Locate

Identify where the secret originates, where it is stored, how it is injected, which process reads it, and where it may be copied.

### Classify exposure

- **NOT EXPOSED IN REVIEWED BOUNDARY**
- **POTENTIAL EXPOSURE**
- **CONFIRMED EXPOSURE**
- **UNKNOWN**

### Contain

Possible bounded actions include stopping further logging, removing a committed/example value, reducing permissions, replacing plaintext configuration with an approved secret mechanism, or requesting rotation.

Do not silently perform externally consequential credential rotation.

### Verify

Verify the exact remediation claim: secret absent from tracked source, logs redacted, file permissions narrowed, credential no longer accepted, or replacement path functioning, as applicable.

## STOP Conditions

STOP when continuing would require exposing a full credential unnecessarily, using a credential outside authority, publishing secret-bearing evidence, rotating/revoking credentials without approval, or deleting the only evidence needed to prove an exposure before preservation.

## Completion Criteria

Complete when the secret boundary, exposure status, evidence, containment/remediation, authority, verification, and remaining rotation or dependency impact are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-secrets`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Credentials, tokens, keys, secret exposure and handling
- **Created by:** Doc Reo / Signalproof
