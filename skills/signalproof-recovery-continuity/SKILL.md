---
name: signalproof-recovery-continuity
description: Preserve recovery journals, partial-operation ownership, remaining rollback options, unresolved cleanup state, restore evidence, and exact next recovery action across retries, milestones, or handoffs.
---

# Signalproof Recovery Continuity

## Purpose

`signalproof-recovery-continuity` keeps recovery state reconstructable when restoration or cleanup is incomplete, paused, or transferred.

> **Do not lose the identity of what still needs to be recovered merely because the immediate attempt ended.**

## Inheritance

Inherits the active root `signalproof` contract. It records state; it does not grant destructive recovery authority.

## Contract

1. Preserve failed/current state identity and desired recovery target.
2. Record partial-operation resources and strongest ownership evidence.
3. Preserve which cleanup/restore actions ran, which passed, which failed, and which remain UNKNOWN.
4. Record protected user data and last trustworthy rollback.
5. Preserve remaining rollback/fallback options.
6. Preserve exact STOP conditions and authority gaps.
7. Keep recovery chronology distinct from canonical Build Ledger chronology unless an authorized ledger event is actually appended.
8. Carry exact next action across Handoff or later retry.
9. Clear a recovery item only after the relevant cleanup/restore/verification is proven.
10. Do not rewrite unresolved state as closed for presentation convenience.

## Minimum Recovery Journal

- recovery stream ID;
- failed state;
- desired target;
- protected state;
- rollback identity;
- owned/uncertain resources;
- actions attempted;
- results/evidence;
- remaining risks;
- authority needed;
- exact next action;
- STOP condition.

## Status

- **CONTINUITY CURRENT**
- **RECOVERY OPEN**
- **PARTIAL / OWNERSHIP PRESERVED**
- **AWAITING AUTHORITY**
- **READY FOR HANDOFF**
- **CLOSED / VERIFIED**
- **STOP**

## STOP Conditions

STOP when a recovery journal would erase unresolved ownership, imply a cleanup/restore PASS not verified, fabricate canonical chronology, or omit the last trustworthy rollback/next action in a way that could cause destructive repetition.

## Completion Criteria

Complete when another competent human or agent can resume recovery without guessing what was attempted, what still exists, what is protected, and what action is next.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-recovery-continuity`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Recovery journaling and continuity
- **Created by:** Doc Reo / Signalproof
