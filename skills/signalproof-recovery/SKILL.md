---
name: signalproof-recovery
description: Coordinate rollback, restoration, partial-operation cleanup, and continuity after failed, corrupted, unsafe, or rejected change while preserving trusted baselines, user data, evidence, and remaining recovery options.
---

# Signalproof Recovery

## Purpose

`signalproof-recovery` is the coordinator for multi-part recovery work.

> **Recovery is not copying files. It is restoring a verified state without destroying what is still trustworthy.**

Use a narrow specialist directly when the task is only rollback selection, restore execution, cleanup, or continuity preservation.

## Inheritance

Inherits the active root `signalproof` contract. Recovery may require destructive replacement, service interruption, or elevation; those actions require explicit authority.

## Specialist Routing

- `signalproof-rollback` — select and verify the intended known-good target.
- `signalproof-restore` — execute a bounded restoration and verify restored behavior.
- `signalproof-cleanup` — safely contain/remove resources created by a failed or partial operation.
- `signalproof-recovery-continuity` — preserve journals, ownership identities, remaining rollback options, and unresolved recovery state.

## Recovery Contract

1. Identify the failed boundary and what still works.
2. Protect the last trustworthy baseline and persistent user data.
3. Select a recovery target from evidence, not folder names or recency alone.
4. Preserve failed-state evidence when useful and safe.
5. Separate application payload from persistent data/configuration.
6. Avoid unexplained mixed-version recovery.
7. Define exact restore/cleanup boundary before destructive action.
8. Recover in dependency order.
9. Preserve resource ownership identity for partial operations; do not act on reused identifiers blindly.
10. Verify both target identity and required behavior.
11. Preserve a path forward if recovery itself fails.
12. STOP when no trustworthy recovery source or authority exists.

## Coordinator Workflow

### 1. Scope

Record failed state, desired state, protected data, available evidence, current service/process state, authority, and maximum acceptable disruption where known.

### 2. Route

- Need to choose a prior baseline? -> Rollback.
- Known rollback chosen; need to switch/restore? -> Restore.
- Failed operation left process/service/files/locks behind? -> Cleanup.
- Cleanup/restore state must survive a handoff or later retry? -> Recovery Continuity.

Use several only when the recovery genuinely crosses those boundaries.

### 3. Sequence

Typical pattern:

```text
STOP ACTIVE WRITES
  -> PRESERVE EVIDENCE / DATA
  -> VERIFY ROLLBACK
  -> CLEAN UP OWNED PARTIAL STATE when required
  -> RESTORE BOUNDED STATE
  -> VERIFY
  -> PRESERVE CONTINUITY / REMAINING OPTIONS
```

Project dependency order controls when different.

### 4. Reconcile

A successful file restore is not complete recovery if data, services, configuration, ownership cleanup, or verification remains unresolved.

## Status

- **RECOVERY READY**
- **RECOVERED / VERIFIED**
- **RECOVERED / PARTIAL**
- **INVESTIGATE FIRST**
- **AWAITING AUTHORITY**
- **NO VERIFIED ROLLBACK**
- **RECOVERY FAILED**
- **STOP**

## STOP Conditions

STOP when the only known-good state would be overwritten, user data would be erased outside authority, the target identity is ambiguous, destructive cleanup may touch an unowned resource, required elevation is unauthorized, or the same failed recovery is being repeated without materially new evidence.

## Completion Criteria

Recovery coordination is complete when target, restore boundary, cleanup state, protected data, authority, verification, evidence, remaining rollback options, and unresolved ownership are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-recovery`
- **Version:** `0.2.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Recovery coordination
- **Created by:** Doc Reo / Signalproof
