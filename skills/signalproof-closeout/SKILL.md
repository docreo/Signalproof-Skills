---
name: signalproof-closeout
description: Close a meaningful Signalproof milestone by protecting accepted state, recording evidence canonically or as a staged delta, preserving failures and recovery, evaluating reusable learning and Skill architecture, and explicitly authorizing or deferring the next phase.
---

# Signalproof Closeout

## Purpose

`signalproof-closeout` is the milestone-transition specialist.

> **Close the milestone before opening the next one.**

Default sequence:

`VALIDATE -> RECORD -> EXTRACT -> GOVERN -> AUTHORIZE NEXT PHASE`

A feature working or a PR merging is not enough. Accepted state, evidence, failures, recovery, library/skill impacts, and next authority must remain reconstructable without conversation memory.

## Inheritance

Inherits the active root `signalproof` contract. Closeout does not create release, destructive, security, privilege, or canonical Build Ledger authority.

## Trigger

Use full closeout at meaningful boundaries such as owner acceptance, protected baseline designation, RD/phase transition, release promotion, major capability completion, significant defect closure, architecture/governance/security/recovery decision, or transfer where the next work depends on exact current state.

Micro-commits do not each require full closeout.

## Contract

1. Declare project/milestone, objective achieved, owner, exact status, and proposed next phase.
2. Protect accepted state, parent/baseline, rollback/recovery, persistent data, and forbidden-change boundaries.
3. Gather actual evidence: repository/ref, changed files, tests actually run, runtime/owner observations, hashes/manifests, dependencies/licenses where relevant.
4. Keep static, compile, automated, runtime, visual, owner-observed, security, signing, and release evidence distinct.
5. Verify canonical Build Ledger identity/head/count/chain/projection and deduplicate stable event IDs before any append. Never hand-edit canonical JSONL/SQLite.
6. When canonical state is unavailable/unverifiable, preserve a clearly labeled `STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION` delta without invented sequence/hash.
7. Preserve failures, blockers, uncertainty, and deferred gates; later success may supersede but not erase them.
8. Evaluate reusable learning and choose the smallest durable mechanism.
9. When Skills changed, run Skill Atomicity/Context Budget checks before promotion.
10. Govern reusable capability through the lifecycle; discovery or successful use is not automatic activation.
11. Explicitly authorize or defer the next phase.

## Workflow

### 1. Declare and Freeze

Capture product/project, milestone identity, current status, owner, source ref/package, accepted baseline, rollback targets, persistent data, security/permission boundary, and next proposed phase.

### 2. Gather Proof

Record only evidence needed to reconstruct the milestone. Do not copy secrets, customer data, private reasoning, or unnecessary local/private details into public artifacts.

### 3. Determine Ledger Path

**Canonical path:** verify actual working-ledger identity, event count/head, hash chain, SQLite projection, and deduplication; append only through approved chain-safe tooling; reverify afterward.

**Staged path:** when any canonical prerequisite is unavailable, create a staged delta with stable identities and enough evidence for later deduplicated ingestion. Do not fabricate chronology.

### 4. Preserve Failure and Uncertainty

Do not rewrite failed candidates away, convert pending to PASS, or claim security/signing/release evidence that was not performed.

### 5. Extract Learning

Ask what solved the problem, what failed/wasted time, what evidence proved success, what should STOP next time, what generalizes across tools/vendors/models, and whether the right durable output is documentation, regression test, checklist/gate, policy, loop, schema, Skill Candidate, deprecation, or research question.

### 6. Skill Architecture Check

When a `SKILL.md` was created or materially changed:

- record exact UTF-8 bytes before/after where available;
- classify HEALTHY / WATCH / REVIEW / OVER LIMIT;
- at 12,000–14,999 bytes require decomposition/conciseness review before material expansion;
- at 15,000+ bytes block promotion/material expansion until below limit;
- assess responsibility cohesion even below the threshold;
- remove duplicated root/other-Skill doctrine where safe;
- prefer independently routeable specialists, loops, schemas, policies, tests, registries, or documentation over an ever-growing Skill;
- verify Router/registry/README/test consequences of decomposition.

Do not meet the byte budget by deleting required governance.

### 7. Govern

Reusable capability follows:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`

Public promotion must also preserve public/private boundaries and supersession history.

### 8. Close

Report outcome, changed/protected state, proof, failures/lessons, rollback/recovery, ledger status, Skill/library decision, open gates, and next-phase authority.

## Status

- **CLOSED / NEXT PHASE AUTHORIZED**
- **CLOSED / NEXT PHASE DEFERRED**
- **STAGED / PENDING LEDGER INGESTION**
- **AWAITING OWNER ACCEPTANCE**
- **BLOCKED**
- **STOP**

## PASS Criteria

Closeout passes only when current state is reconstructable, protected state/recovery is explicit where applicable, evidence classes are honest, ledger continuity is canonical or explicitly staged, material failures/open gates survive, reusable learning and Skill architecture were evaluated, and next-phase authority is explicit.

## STOP Conditions

STOP when canonical ledger mutation would occur without verified head/chain/projection, accepted baseline cannot be identified, material failures would be hidden, recovery would be lost, private data would cross a public boundary, a Skill at/over 15,000 bytes would be promoted without refactor, or the next phase would begin without required authority.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-closeout`
- **Version:** `0.2.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Milestone closeout, Build Ledger continuity, Skill/library governance, phase transition
- **Created by:** Doc Reo / Signalproof
