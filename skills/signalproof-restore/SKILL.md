---
name: signalproof-restore
description: Execute an authorized bounded restoration from a verified rollback target while preserving user data, coherent version state, evidence, dependency order, and post-restore verification.
---

# Signalproof Restore

## Purpose

`signalproof-restore` performs the bounded act of restoring a selected known-good state.

> **Restore only the defined boundary, then prove both identity and behavior.**

## Inheritance

Inherits the active root `signalproof` contract. Destructive replacement, service interruption, and elevation require explicit authority.

## Contract

1. Require an identified recovery target with sufficient evidence; use Rollback if target selection is unresolved.
2. Declare exact replace/retain boundaries before actuation.
3. Protect persistent user data by default.
4. Preserve current failed-state evidence when useful and safe.
5. Stage the recovery candidate before switching when practical.
6. Restore a coherent version/configuration rather than accidental mixed state.
7. Recover in dependency order.
8. Verify target identity after copy/switch/install.
9. Verify representative required behavior and persistent-data survival.
10. Preserve fallback and remaining rollback options if the attempt fails.

## Typical Sequence

```text
QUIESCE WRITES
  -> PRESERVE DATA / EVIDENCE
  -> VERIFY TARGET
  -> STAGE
  -> VERIFY STAGED IDENTITY
  -> SWITCH / REPLACE
  -> RESTORE CONFIG / SERVICES
  -> VERIFY IDENTITY
  -> VERIFY FUNCTION
  -> VERIFY PROTECTED DATA
```

## Restore Boundaries

Possible boundaries include application payload, configuration, runtime/dependencies, service registration, database/schema, or complete install tree. Data restoration is a separate explicit boundary unless already authorized by the recovery plan.

## Status

- **RESTORE READY**
- **RESTORED / VERIFIED**
- **RESTORED / PARTIAL**
- **AWAITING AUTHORITY**
- **TARGET INVALID**
- **RESTORE FAILED**
- **STOP**

## STOP Conditions

STOP when overwrite scope is ambiguous, persistent data would be erased outside authority, target verification fails, current writes cannot be safely stopped, required privilege is unauthorized, or the restore would leave an unexplained mixed-version state.

## Completion Criteria

Complete when target, restore boundary, retained state, exact actions, identity verification, functional verification, protected-data verification, failures, and remaining fallback are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-restore`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Bounded restoration execution and verification
- **Created by:** Doc Reo / Signalproof
