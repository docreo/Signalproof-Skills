---
name: signalproof-security
description: Coordinate defensive security review across Signalproof trust boundaries and route to the smallest security specialist set without treating technical capability, scanner output, hashes, signatures, or successful tests as universal security authority.
---

# Signalproof Security

## Purpose

`signalproof-security` is the cross-cutting defensive security coordinator for the Signalproof Library.

> **Trust only what the defined boundary and evidence justify.**

Use this coordinator when a decision spans multiple security domains. For a narrow issue, route directly to the matching specialist.

## Inheritance

Inherits the active root `signalproof` contract. This skill does not grant penetration-testing, exploitation, credential-use, privilege-elevation, security-control bypass, release, publication, or canonical Build Ledger authority.

## Specialist Routing

- `signalproof-secrets` — credentials, tokens, keys, secret storage, redaction, logging leakage.
- `signalproof-permissions` — identity, authorization, privilege, ACLs, OAuth scopes, least privilege.
- `signalproof-supply-chain` — dependencies, source/publisher, versions, licensing, integrity/signing, update trust.
- `signalproof-network` — listening interfaces, endpoints, telemetry, transport validation, external data flow.
- `signalproof-execution-security` — untrusted input influencing shell/code/plugin/archive/deserialization/tool execution.

Use the coordinator when two or more domains materially interact or a single security disposition must reconcile them.

## Security Contract

1. Define the exact asset/component/workflow and security question.
2. Map trust boundaries and material assets.
3. Identify which specialist domains actually apply.
4. Preserve explicit identity, privilege, data-flow, dependency, execution, and recovery boundaries where material.
5. Treat external code, models, plugins, scripts, packages, and updates as trust decisions.
6. Separate integrity evidence from safety claims: hashes prove byte identity; signatures may prove signer/integrity; neither proves fitness or safety alone.
7. Separate scanner findings from security acceptance; record scanner scope and what was not tested.
8. Apply least privilege and minimum exposure.
9. Do not disable controls for convenience without explicit bounded authority and compensating evidence.
10. Preserve recovery before consequential hardening or permission changes.
11. Verify the exact security claim made using `signalproof-verify` when needed.
12. Do not overclaim beyond the reviewed boundary.

## Workflow

### 1. Establish Scope

Capture artifact/version/commit, environment, affected files/config/services, identities, new dependencies, network endpoints, persistent state, security controls, recovery path, and authority.

If the change surface is unclear, route first to Review or Investigate.

### 2. Map Trust Transitions

Example:

```text
USER
  -> APP
      -> LOCAL RUNTIME
      -> FILES / MODELS
      -> EXTERNAL API
```

For every transition ask: what crosses, why, under whose authority, and with what control?

### 3. Route Specialists

Prefer one principal specialist when sufficient. Add additional specialists only when the decision genuinely crosses boundaries.

Examples:

- API key written to logs -> Secrets.
- Installer requests admin and broad ACLs -> Permissions.
- New binary dependency from mutable URL -> Supply Chain.
- App sends project metadata externally -> Network.
- User-controlled path reaches shell execution -> Execution Security.

### 4. Reconcile Findings

When several specialists apply, reconcile severity, scope, authority, protected state, recovery, and evidence. A PASS in one domain cannot erase a material finding in another.

### 5. Verify and Close

Verify claims that materially affect acceptance. Preserve findings, unknowns, mitigations, and remaining gates. Use Closeout at meaningful phase boundaries.

## Finding Status

- **NO MATERIAL FINDING IN SCOPE**
- **FINDING / MITIGATION AVAILABLE**
- **FINDING / MITIGATION REQUIRED**
- **UNKNOWN / MORE EVIDENCE REQUIRED**
- **AWAITING AUTHORITY**
- **BLOCKED**
- **STOP**

## STOP Conditions

STOP when:

- privilege or exposure would expand outside authority;
- secrets would be copied into public evidence or unnecessary logs;
- unknown executable content would be run merely to inspect it when safer review is available;
- a security control would be disabled for convenience without bounded authority;
- the only recovery path would be weakened by the proposed change;
- a scoped PASS is being represented as universal certification;
- a narrow specialist finding is being overridden by coordinator convenience.

## Completion Criteria

Security coordination is complete when scope, applicable specialist domains, evidence, findings, authority, mitigations, verification, recovery implications, remaining unknowns, and final disposition are explicit enough to reconstruct why the security decision was made.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-security`
- **Version:** `0.2.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Defensive security coordination and specialist routing
- **Created by:** Doc Reo / Signalproof
