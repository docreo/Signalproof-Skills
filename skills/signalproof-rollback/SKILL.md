---
name: signalproof-rollback
description: Select and verify a trustworthy known-good rollback target from available backups, versions, commits, packages, snapshots, or installers without confusing existence or recency with recoverability.
---

# Signalproof Rollback

## Purpose

`signalproof-rollback` is the specialist for choosing and proving the recovery target.

> **A backup is not a rollback until identity, completeness, compatibility, and recoverability are sufficiently established.**

## Inheritance

Inherits the active root `signalproof` contract. Selection does not grant overwrite or restore authority.

## Contract

1. Inventory available candidates and their evidence.
2. Prefer owner-accepted or runtime-verified known-good baselines over newest copies.
3. Record version/build/commit/package identity.
4. Verify completeness, hashes/manifests/signatures where available.
5. Check required runtime/dependency/configuration/data-schema compatibility.
6. Distinguish application payload from persistent user data.
7. Reject known failed/rejected candidates as rollback unless separately repaired and reaccepted.
8. Do not infer acceptance from names such as `backup`, `previous`, or `golden`.
9. Preserve uncertainty when evidence is partial.
10. Return the exact target and evidence required by Restore.

## Candidate Classes

- **VERIFIED ROLLBACK** — identity and recovery evidence sufficient for intended boundary.
- **PROMISING CANDIDATE** — likely usable but needs more verification.
- **BACKUP ONLY** — bytes exist; recoverability not established.
- **REJECTED / FAILED** — known unsuitable.
- **UNKNOWN** — insufficient evidence.

## Selection Order

Default preference:

1. owner-accepted known-working rollback with verified identity;
2. previously runtime-verified baseline with sufficient recovery evidence;
3. candidate that can be safely verified before replacement;
4. unverified backup only under explicit risk acceptance.

## STOP Conditions

STOP when no trustworthy identity can be established, manifest evidence contradicts the claimed target, data/schema compatibility is materially unknown, the only good copy would be consumed or overwritten, or recency/name is being substituted for acceptance evidence.

## Completion Criteria

Complete when the selected target, identity, completeness, compatibility, evidence class, limitations, and reason for selection are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-rollback`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Rollback target selection and identity verification
- **Created by:** Doc Reo / Signalproof
