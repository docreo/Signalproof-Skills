---
name: signalproof-supply-chain
description: Review dependencies, package sources, publishers, immutable identities, licenses, checksums/signatures, update channels, installation hooks, transitive expansion, and rollback/removal paths before external components are trusted or integrated.
---

# Signalproof Supply Chain

## Purpose

`signalproof-supply-chain` governs dependency and external-component trust.

> **A dependency is a trust decision, not merely an installation step.**

## Inheritance

Inherits the active root `signalproof` contract. It does not grant install, execute, adopt, redistribute, licensing, or publication authority.

## Contract

1. Identify canonical source/publisher and exact version or immutable identity when possible.
2. Record license and redistribution/attribution implications.
3. Prefer pinned versions and verified hashes/signatures over mutable `latest` references for accepted baselines.
4. Inspect install/build/update scripts and executable hooks proportionately to risk.
5. Record transitive dependency/runtime expansion where material.
6. Identify network/update behavior and permissions required.
7. Separate integrity proof from safety/fitness claims.
8. Check known advisories when material to the decision.
9. Define removal/rollback path before consequential adoption.
10. Treat missing provenance or conflicting license/security evidence as UNKNOWN or STOP, not PASS.

## Dispositions

- **SOURCE / IDENTITY VERIFIED**
- **PROMISING / MORE REVIEW REQUIRED**
- **INTEGRATION CANDIDATE**
- **LICENSE / PROVENANCE BLOCKED**
- **SECURITY REVIEW REQUIRED**
- **REJECT / STOP**

Strategic ADOPT/ADAPT/INTEGRATE/WATCH/REJECT decisions remain under Evaluate and owner authority.

## STOP Conditions

STOP when the source cannot be established, license obligations conflict with intended use, an executable install path must be trusted without adequate basis, a mutable artifact is being represented as a frozen baseline, or removal/recovery is unavailable for a consequential integration.

## Completion Criteria

Complete when source, identity, version, license, integrity evidence, install/update behavior, transitive impact, permissions, known material risks, rollback/removal, and remaining unknowns are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-supply-chain`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Dependency provenance, licensing, integrity and update trust
- **Created by:** Doc Reo / Signalproof
