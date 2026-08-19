---
name: signalproof-cleanup
description: Safely contain or remove resources created by failed or partial operations using verified ownership identity so recovery does not damage unrelated processes, services, files, locks, tasks, or registrations.
---

# Signalproof Cleanup

## Purpose

`signalproof-cleanup` governs post-failure cleanup of resources created or controlled by the current operation.

> **Never destroy a resource merely because its name, PID, path, port, or label looks familiar. Verify ownership first.**

## Inheritance

Inherits the active root `signalproof` contract. Cleanup can be destructive and requires authority appropriate to the resource.

## Contract

1. Identify the operation that created or acquired the resource.
2. Preserve the strongest ownership identity available: PID plus start identity, process handle, service/task identity, transaction ID, lock/token, exact path/hash, registration identity, or equivalent.
3. Re-verify current identity before destructive cleanup when reuse or drift is possible.
4. Distinguish proven absent, proven present/owned, present/external, and ownership unknown.
5. Remove only the owned boundary.
6. Verify cleanup before clearing ownership/recovery state.
7. Preserve failure evidence and unresolved ownership if cleanup cannot be verified.
8. Do not broaden cleanup because a narrow attempt failed.
9. Hand unresolved state to Recovery Continuity.
10. Use Verify for material cleanup claims.

## Status

- **NOT PRESENT**
- **PRESENT / OWNED**
- **PRESENT / EXTERNAL**
- **OWNERSHIP UNKNOWN**
- **CLEANED / VERIFIED**
- **CLEANUP PARTIAL**
- **AWAITING AUTHORITY**
- **STOP**

## STOP Conditions

STOP when ownership cannot be distinguished from an external resource, identifier reuse is plausible and not rechecked, destructive scope exceeds the failed operation's owned boundary, or cleanup failure is being hidden by dropping the ownership record.

## Completion Criteria

Complete when resource identity, ownership evidence, cleanup action, verification, residual state, and any handoff to Recovery Continuity are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-cleanup`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Partial-operation ownership and cleanup
- **Created by:** Doc Reo / Signalproof
