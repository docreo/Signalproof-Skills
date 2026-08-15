---
name: signalproof-router
description: Route a request to the smallest appropriate active Signalproof skill or skill sequence without silently expanding authority. Use when choosing among active Signalproof skills, including Research, Evaluate, Readiness, Verify, Review, Recovery, Security, Release, Document, Learn, and milestone Closeout.
---

# Signalproof Router

## Purpose

`signalproof-router` selects the smallest active Signalproof discipline or ordered sequence that fits the current objective and evidence state.

> **Route by objective and evidence state, not by keyword—and never confuse capability selection with permission to execute.**

Only skills marked **Active** in the canonical Skill Registry are routable.

## Current Routing Set

- `signalproof` — root governing contract/fallback;
- `signalproof-research` — establish what current external evidence supports;
- `signalproof-evaluate` — decide disposition from evidence using explicit criteria and hard gates;
- `signalproof-investigate` — establish what failed or what state is true;
- `signalproof-plan` — create a bounded execution contract;
- `signalproof-readiness` — determine whether objective-specific prerequisites/capabilities exist on the target;
- `signalproof-build` — execute an already bounded implementation;
- `signalproof-debug` — reproduce, localize, correct, and regression-test a defect;
- `signalproof-verify` — determine whether a specific claim is proven;
- `signalproof-review` — assess whether work itself is sound and scope/contract faithful;
- `signalproof-recovery` — select/verify a trustworthy rollback and verify restoration;
- `signalproof-security` — assess material security-sensitive trust, privilege, secret, dependency, network/data, and control risks;
- `signalproof-release` — govern promotion of the exact accepted artifact to a defined distribution boundary;
- `signalproof-document` — create durable documentation while preserving canonical-source/evidence/version/privacy boundaries;
- `signalproof-learn` — extract governed reusable lessons, tests, policy/skill/router candidates, and deprecation candidates from completed evidence-backed work;
- `signalproof-closeout` — close meaningful milestones and govern phase transition.

## Router Contract

1. Read the objective, not vocabulary alone.
2. Use only Active skills.
3. Prefer the smallest sufficient route; sequence only when evidence demands it.
4. Research establishes evidence; Evaluate recommends disposition; Plan/Build execute only after separate authority.
5. Document records established state; Learn extracts future capability from completed evidence.
6. Route unresolved factual truth to Investigate/Verify before authoritative documentation or learning.
7. Route exact claim proof to Verify, work-quality acceptance to Review, restoration to Recovery, security-sensitive trust questions to Security, exact-artifact promotion to Release, durable records to Document, and reusable-lesson extraction/governance to Learn.
8. Do not allow Learn to auto-promote observations into Active doctrine.
9. Do not allow Learn to bypass existing-intelligence checks, falsifiable acceptance testing, governance, or human approval.
10. Do not use Document or Learn to override canonical registry/runtime/ledger/ADR/release evidence.
11. Close meaningful milestones before opening the next development phase.
12. Routing never creates install, purchase, adoption, privilege, credential, signing, publication/deployment, policy, skill-activation, or canonical-ledger authority.
13. Preserve explicit scope, STOP conditions, and a route decision trace.

## Routing Decision Model

### Research
Use when the central question is what current external evidence says, especially when source quality, freshness, provenance, contradictions, or claim classification matter.

### Evaluate
Use when evidence is sufficiently developed and the central question is what to adopt, adapt, integrate, pilot, defer, research more, reject, build from scratch, or watchlist against explicit criteria.

### Investigate
Use for unknown system/runtime state or competing failure causes.

### Plan
Use when a known objective or authorized disposition needs bounded scope, authority, acceptance, recovery, dependencies, or sequencing before implementation.

### Readiness
Use when a specific target machine/environment must be checked against objective-specific prerequisites.

### Build / Debug
Use for bounded authorized implementation or correction.

### Verify
Use when a specific material claim must be proven.

### Review
Use when work quality, scope fidelity, protected state, architecture/contracts, dependencies, maintainability, privacy/security hazards, or recovery integrity must be assessed.

### Recovery
Use when a failed, unsafe, corrupted, or rejected state should be restored to a trustworthy known-good state.

### Security
Use when secrets, privilege, executable/dependency trust, network/data flow, authentication/TLS/signing validation, ACLs, or security controls materially affect the decision.

### Release
Use when an exact candidate may be published, distributed, promoted, shipped, deployed, tagged, or designated as a release.

### Document
Use when the objective is durable representation of established state: handoffs, SOPs/runbooks, ADRs, README/overview material, acceptance/build reports, release documentation, state summaries, operator instructions, or milestone records.

Do not use Document to determine whether a claim is true. Route unresolved truth to Investigate/Verify first.

### Learn
Use when meaningful completed work has produced one or more potentially reusable lessons and the objective is to decide whether they should remain local, become documentation/tests/checklists, advance as policy/skill/router candidates, trigger deprecation review, or become research questions.

Select Learn when the central question is:

> **What should future Signalproof work permanently remember from this evidence, and through what governed mechanism?**

Do **not** route every successful task to Learn. Use it when reusable extraction is material enough to justify deeper generalization/governance beyond the normal Closeout learning check.

Learn does not make observations Active. It cannot bypass `DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE` governance.

### Closeout
Use after a meaningful research, evaluation, readiness, build, security, recovery, release, documentation, learning/governance, or defect milestone has resolved.

Closeout asks whether a reusable lesson exists; Learn performs the deeper extraction when warranted.

## Sequencing Patterns

- `research -> evaluate`
- `evaluate -> research/readiness/security/plan`
- `plan -> readiness -> build`
- `build/debug -> verify -> review`
- `failed/rejected build -> recovery -> verify`
- `verify -> document`
- `research/evaluate/readiness/security/recovery/release -> document`
- `closeout -> learn` when the milestone surfaces material reusable learning requiring deeper extraction;
- `learn -> research` when generalization evidence is insufficient;
- `learn -> verify/review` when a candidate requires claim proof or change-quality assessment;
- `learn -> document` when the smallest durable output is documentation;
- `learn -> plan/build` only after a separately approved candidate requires implementation;
- `learn -> closeout` when a meaningful learning/governance milestone resolves;
- `release -> document -> closeout -> learn` for a consequential completed cycle with material reusable lessons.

Do not force every request through every skill.

## Authority Gate

Routing never grants write/destructive authority, installation/adoption authority, purchase authority, privilege elevation, credentials/secrets access, security-control changes, signing authority, publication/deployment/release authority, architecture/policy authority, skill activation authority, or canonical Build Ledger mutation authority.

## Router Status

- **ROUTED**
- **ROOT FALLBACK**
- **AWAITING AUTHORITY**
- **RESEARCH REQUIRED**
- **EVALUATION REQUIRED**
- **READINESS ASSESSMENT REQUIRED**
- **VERIFICATION REQUIRED**
- **REVIEW REQUIRED**
- **RECOVERY REQUIRED**
- **SECURITY REVIEW REQUIRED**
- **RELEASE REVIEW REQUIRED**
- **DOCUMENTATION REQUIRED**
- **LEARNING REVIEW REQUIRED**
- **MILESTONE CLOSEOUT REQUIRED**
- **BLOCKED**
- **STOP**

## Anti-Patterns

Fail routing when it:

- confuses Research with Evaluate;
- treats an Evaluate recommendation as execution authority;
- sends target readiness to Research/Evaluate instead of Readiness;
- sends unresolved factual truth to Document/Learn instead of Investigate/Verify;
- routes every successful task to Learn;
- treats one observation as Active doctrine;
- lets Learn bypass candidate/testing/approval governance;
- lets Learn duplicate an existing skill/policy without checking existing intelligence;
- uses Document or Learn to override canonical state;
- bypasses STOP/authority;
- forces all specialists on every micro-edit;
- skips meaningful milestone Closeout.

## Completion Criteria

Routing is complete when the smallest appropriate Active skill/sequence is selected; Learn remains distinct from Closeout, Document, Research, Evaluate, Verify, and Review; reusable lessons do not become doctrine without governance; authority remains separate from capability; STOP conditions are preserved; and the next handoff condition is clear.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-router`
- **Version:** `0.1.11`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Routes among:** active Signalproof specialist skills only
- **Domain:** Capability routing, sequencing, Research/Evaluate/Readiness/Verify/Review/Recovery/Security/Release/Document/Learn/Closeout routing, evidence-state selection, authority-preserving dispatch
- **Created by:** Doc Reo / Signalproof
