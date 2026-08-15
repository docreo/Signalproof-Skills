---
name: signalproof-readiness
description: Determine whether the prerequisites, capabilities, configuration, authority, evidence, recovery, and target-environment conditions required for a declared objective are actually present before consequential execution or deployment begins. Use when deciding whether a machine, runtime, model, dependency, integration, installer, workflow, or release path is truly ready rather than merely detected or installed.
---

# Signalproof Readiness

## Purpose

`signalproof-readiness` is the pre-execution readiness specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

Its central rule is:

> **Detected is not configured, configured is not authorized, authorized is not verified, and none of those alone means ready.**

Readiness exists to prevent consequential work from beginning on assumptions that required capabilities, dependencies, permissions, evidence, or recovery conditions are present when they are not.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, smallest effective action, verification, review, recovery, security, release, milestone closeout, STOP conditions, public/private boundaries, proof, and continuity.

Readiness assessment does not automatically authorize installation, elevation, downloads, credential use, network access, configuration changes, deployment, or release.

## Readiness Contract

1. **Declare the objective.** Readiness is always readiness *for something specific*.
2. **Identify the exact target environment.** Host, OS, architecture, runtime, user/session, device, container/VM, network context, and destination boundary matter.
3. **Separate capability states.** Distinguish `REQUIRED`, `DETECTED`, `INSTALLED`, `CONFIGURED`, `AUTHORIZED`, `VERIFIED`, and `READY`.
4. **Check prerequisites before mutation.** Do not install or change the system merely to make a readiness check pass unless separately authorized.
5. **Validate compatibility, not mere presence.** Version, architecture, driver/runtime compatibility, API availability, model format, disk/memory/GPU resources, and path/configuration can matter.
6. **Check dependencies and external services.** Required packages, models, services, endpoints, credentials, licenses, and update/provenance boundaries must be explicit.
7. **Check authority and permissions.** Technical capability does not imply permission to use admin rights, secrets, external APIs, publishing credentials, or protected locations.
8. **Check security-sensitive prerequisites.** Trust/provenance, credential handling, network exposure, least privilege, and control requirements can block readiness.
9. **Check recovery before consequential execution.** If the intended action can break a working state, readiness includes a proportionate verified recovery path.
10. **Check evidence freshness and target binding.** Evidence from another host, version, user, branch, model, or prior state may not prove current readiness.
11. **Do not manufacture readiness by weakening requirements.** Missing requirements remain missing until intentionally changed by authorized design authority.
12. **Return blockers and the smallest path to readiness.** Do not silently perform remediation during assessment unless separately authorized.

## Capability State Model

Use these states precisely:

- **REQUIRED** — the objective depends on this capability or condition.
- **NOT DETECTED** — no sufficient evidence the capability exists on the target.
- **DETECTED** — presence is observed, but usability/configuration is not established.
- **INSTALLED** — the required software/asset appears installed at an identified version/path.
- **CONFIGURED** — required configuration for the objective is present.
- **AUTHORIZED** — the needed use/action is within current human/system authority.
- **VERIFIED** — a direct test or equivalent evidence proves the required behavior/condition at the relevant boundary.
- **READY** — all required readiness dimensions for the declared objective are satisfied.
- **NOT REQUIRED** — explicitly outside the objective's readiness gate.
- **UNKNOWN** — evidence is insufficient or contradictory.

Do not collapse these into one boolean until the final readiness decision.

## Readiness Workflow

### 1. Declare the Readiness Objective

Capture:

- intended action or deployment;
- target machine/environment;
- exact component/artifact/version when applicable;
- required performance or compatibility boundary;
- authority needed;
- external dependencies/services;
- recovery expectation;
- acceptance condition for “ready.”

Examples:

- ready to run a local ONNX model;
- ready to install an R&D build;
- ready to use GPU acceleration;
- ready to connect an external API;
- ready to perform a signed public release;
- ready to restore a known-good baseline.

### 2. Establish Target Identity

Record material target facts such as:

- OS/edition/build;
- architecture;
- CPU/GPU and driver state;
- RAM/disk capacity;
- runtime/tool versions;
- filesystem/install locations;
- active user/privilege context;
- network state;
- device/security policy;
- relevant service/process state;
- application/build identity.

Readiness evidence must bind to this target, not a vaguely similar machine.

### 3. Build the Requirement Matrix

For each requirement record:

| Requirement | Why required | Evidence | State | Blocking? |
|---|---|---|---|---|
| Runtime version | model/app requirement | direct version check | VERIFIED | Yes |
| GPU driver | acceleration path | device/driver evidence | DETECTED / VERIFIED | Maybe |
| Model asset | inference path | path + hash | INSTALLED / VERIFIED | Yes |
| API credential | external integration | configuration presence without exposing secret | CONFIGURED | Yes |
| Admin rights | installer only | authority statement | AUTHORIZED / NOT REQUIRED | Maybe |
| Rollback | consequential change | verified recovery target | VERIFIED | Yes |

A requirement may be technically present but still block readiness because configuration, authority, verification, security, or recovery is incomplete.

### 4. Check Hardware / Resource Readiness

When relevant, evaluate:

- architecture compatibility;
- CPU instruction/runtime requirements;
- GPU model/VRAM;
- driver/CUDA/DirectML/ONNX provider compatibility;
- RAM;
- free disk space;
- writable staging/install locations;
- thermal/power constraints when materially relevant.

Do not claim GPU readiness from “NVIDIA GPU detected” alone if the actual objective requires a specific provider/runtime/version combination.

### 5. Check Runtime / Dependency Readiness

Validate required:

- .NET/Java/Python/Node/native runtime versions;
- virtual environments;
- package versions;
- model formats/assets;
- PATH/environment configuration;
- services/ports;
- database/schema version;
- browser/WebView/runtime components;
- installer prerequisites.

Presence on disk is not necessarily executable or compatible readiness.

### 6. Check Configuration Readiness

Confirm objective-specific configuration:

- expected file paths;
- environment variables without exposing secret values;
- feature flags;
- provider selection;
- ports/interfaces;
- service URLs;
- model directories;
- permissions/ACLs;
- application settings;
- default/fallback paths.

Configuration should be validated without broad mutation when readiness is the only authorized task.

### 7. Check External Service / Network Readiness

When the objective depends on external systems, determine:

- endpoint identity;
- network reachability as allowed;
- authentication configuration;
- credential presence/authority;
- quota/subscription/project boundary when required;
- TLS/certificate expectations;
- data-flow/security approval;
- offline fallback if required.

“Internet works” does not prove a specific service/integration is ready.

### 8. Check Authority Readiness

Identify whether the intended action requires:

- administrator/root elevation;
- credential use;
- repository write/merge rights;
- signing key access;
- deployment/publication authority;
- firewall/service changes;
- protected filesystem writes;
- external API spend or data transfer.

If capability exists but authority does not, return **TECHNICALLY CAPABLE / AWAITING AUTHORITY**, not READY.

### 9. Check Security Readiness

When security-sensitive conditions are material, verify or route to `signalproof-security` for:

- dependency/provenance trust;
- secrets handling;
- least privilege;
- external data-flow boundary;
- executable/script trust;
- signing/integrity requirements;
- control regressions.

Readiness must not bypass unresolved Security STOP conditions.

### 10. Check Recovery Readiness

For consequential actions determine whether:

- a known-good rollback exists;
- its identity is verified;
- user/persistent data is protected;
- restore instructions are current;
- the intended action will not overwrite the only good recovery target;
- rollback has adequate authority.

Use `signalproof-recovery` when the recovery target itself is uncertain or restore execution is required.

### 11. Check Evidence Freshness

For each material requirement ask:

- Was this evidence collected from the current target?
- Is the version/build still the same?
- Has configuration changed since the check?
- Has the credential/service state expired or changed?
- Has the artifact been rebuilt/replaced?
- Does this result prove the exact readiness requirement or only a weaker condition?

Stale evidence should be marked accordingly rather than silently reused.

### 12. Readiness Decision

Return one of:

- **READY** — every required gate for the declared objective is satisfied at the required evidence level.
- **READY WITH CONDITIONS** — objective can proceed within explicit bounded conditions/fallbacks; no blocking gate remains.
- **TECHNICALLY CAPABLE / AWAITING AUTHORITY** — technical requirements pass but permission/authorization is incomplete.
- **PARTIALLY READY** — some required capabilities pass while one or more non-catastrophic blockers remain.
- **NOT READY** — one or more required gates fail or are missing.
- **BLOCKED / UNKNOWN** — evidence is insufficient or contradictory to determine readiness.
- **STOP** — proceeding would bypass a security/recovery/authority protection or risk destructive consequences without required safeguards.

## Readiness Is Objective-Specific

A machine can simultaneously be:

- READY for CPU inference;
- NOT READY for CUDA inference;
- READY for local R&D;
- NOT READY for public release signing;
- READY to inspect a rollback;
- AWAITING AUTHORITY to execute the restore.

Do not produce a universal machine-wide READY unless the objective truly defines that scope.

## Detection Is Not Readiness

Examples:

```text
python.exe exists
    ≠ correct Python environment ready

NVIDIA GPU detected
    ≠ CUDA/provider/model path verified

API key configured
    ≠ authorized external data flow

backup folder exists
    ≠ verified recovery readiness

installer compiled
    ≠ target install lifecycle ready
```

## No-Mutation Readiness Rule

A readiness assessment should be non-destructive and inspection-first by default.

Do not automatically:

- install missing packages;
- change PATH;
- enable services;
- open firewall ports;
- download models;
- add credentials;
- elevate privileges;
- modify ACLs;
- rewrite configuration;
- deploy/publish artifacts.

Instead return the smallest remediation path unless the user separately authorizes execution.

## Readiness vs Plan, Verify, Security, Recovery, Release

`signalproof-plan` asks:
> **What bounded execution contract should govern the work?**

`signalproof-readiness` asks:
> **Are the required conditions for that objective actually present on the target before execution begins?**

`signalproof-verify` asks:
> **Is a specific readiness claim proven by direct evidence?**

`signalproof-security` asks:
> **Do material security risks block readiness or execution?**

`signalproof-recovery` asks:
> **Is there a trustworthy recovery path, or should we restore now?**

`signalproof-release` asks:
> **May the exact accepted artifact be promoted to a defined distribution boundary?**

Readiness may consume evidence from all of these but does not replace them.

## Readiness Is Not Execution Authority

A READY decision does not automatically authorize:

- installation;
- destructive changes;
- privilege elevation;
- credential use;
- external data transfer;
- publishing/deployment;
- signing;
- release;
- canonical Build Ledger mutation.

It states that prerequisites for the declared objective are satisfied, subject to the explicit authority already recorded.

## STOP Conditions

Stop when:

- the target environment cannot be identified sufficiently;
- a required prerequisite would need consequential mutation merely to test readiness and no authority exists;
- readiness depends on unknown/untrusted executable content;
- required credentials would need to be exposed to verify them;
- a security STOP condition is unresolved;
- a consequential action lacks a verified recovery path where project policy requires one;
- evidence from another host/version is being reused as current target proof without justification;
- the requested readiness claim is broader than the defined evidence can support;
- proceeding would destroy the only known-good state or bypass owner authority.

## Anti-Patterns

Fail this skill when Readiness:

- marks READY because software is merely installed;
- marks GPU READY because a GPU name appears;
- treats configured credentials as authorization to use them;
- installs missing dependencies during a read-only readiness assessment;
- ignores version/architecture compatibility;
- ignores recovery for a consequential installation/update;
- reuses stale evidence from another machine/build;
- weakens the requirement to make the result green;
- treats “no blocker detected” as verified readiness;
- turns readiness into release authority;
- hides partial/unknown gates behind one green status.

## Completion Criteria

Readiness is complete when the declared objective, exact target environment, requirement matrix, capability states, hardware/resources, runtimes/dependencies, configuration, external services, authority, security, recovery, evidence freshness, blockers, smallest remediation path, and final scoped readiness decision are explicit enough that another competent human or agent can determine why execution should proceed, wait, or stop without repeating the entire assessment from scratch.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-readiness`
- **Version:** `0.1.0-rc1`
- **Maturity:** Initial public release candidate
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-investigate`, `signalproof-plan`, `signalproof-verify`, `signalproof-review`, `signalproof-security`, `signalproof-recovery`, `signalproof-release`, `signalproof-closeout`
- **Domain:** Target-environment readiness, prerequisites, capabilities, configuration, authority, dependency/service checks, recovery and evidence gates
- **Created by:** Doc Reo / Signalproof
