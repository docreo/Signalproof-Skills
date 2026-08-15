---
name: signalproof-router
description: Route a request to the smallest appropriate active Signalproof skill or skill sequence without silently expanding authority, treating planned skills as active, or executing consequential work merely because routing identified a capable specialist. Use when choosing among active Signalproof skills, including Research, Evaluate, Readiness, Verify, Review, Recovery, Security, Release, Document, and milestone Closeout.
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
- `signalproof-investigate` — establish what failed or what state is true in a specific system/runtime;
- `signalproof-plan` — create a bounded execution contract;
- `signalproof-readiness` — determine whether objective-specific prerequisites/capabilities exist on the target;
- `signalproof-build` — execute an already bounded implementation;
- `signalproof-debug` — reproduce, localize, correct, and regression-test a defect;
- `signalproof-verify` — determine whether a specific claim is proven;
- `signalproof-review` — assess whether work itself is sound and scope/contract faithful;
- `signalproof-recovery` — select/verify a trustworthy rollback and verify restoration;
- `signalproof-security` — assess material security-sensitive trust, privilege, secret, dependency, network/data, and control risks;
- `signalproof-release` — govern promotion of the exact accepted artifact to a defined distribution boundary;
- `signalproof-document` — turn established state/evidence/decisions into durable documentation while preserving canonical-source, evidence-class, version, staleness, privacy, failure-history, and non-claim boundaries;
- `signalproof-closeout` — close meaningful milestones and govern phase transition.

## Router Contract

1. Read the objective, not vocabulary alone.
2. Use only Active skills.
3. Prefer the smallest sufficient route and sequence only when evidence demands it.
4. Research establishes evidence; Evaluate recommends disposition; Plan/Build execute only after separate authority.
5. Document records established state; it does not invent or prove state that another discipline has not established.
6. Route unresolved factual truth to Investigate/Verify before authoritative documentation.
7. Route exact claim proof to Verify, work-quality acceptance to Review, restoration to Recovery, security-sensitive trust questions to Security, exact-artifact promotion to Release, and durable state/procedure/handoff recording to Document.
8. Do not allow Document to override canonical registry/runtime/ledger/ADR/release evidence or to convert planned/candidate state into current state.
9. Do not use documentation as a bypass around authority, security, release, readiness, or verification gates.
10. Close meaningful milestones before the next development phase.
11. Routing never creates install, purchase, adoption, privilege, credential, signing, publication/deployment, or canonical-ledger authority.
12. Preserve explicit scope, STOP conditions, and a route decision trace.

## Routing Decision Model

### Research
Use when the central question is what current external evidence says, especially when source quality, freshness, provenance, contradictions, or claim classification matter.

### Evaluate
Use when evidence is sufficiently developed and the central question is what to ADOPT, ADAPT, INTEGRATE, PILOT, DEFER, RESEARCH MORE, REJECT, BUILD FROM SCRATCH, or WATCHLIST against explicit project criteria.

### Investigate
Use for unknown system/runtime state or competing failure causes.

### Plan
Use when a known objective or authorized disposition needs bounded scope, authority, acceptance, recovery, dependencies, or sequencing before implementation.

### Readiness
Use when a specific target machine/environment must be checked against objective-specific prerequisites.

### Build / Debug
Use for bounded authorized implementation or correction.

### Verify
Use when a specific material claim must be proven, including claims that documentation needs to state as current fact.

### Review
Use when work quality, scope fidelity, protected state, architecture/contracts, dependencies, maintainability, privacy/security hazards, or recovery integrity must be assessed.

### Recovery
Use when a failed, unsafe, corrupted, or rejected state should be restored to a trustworthy known-good state.

### Security
Use when secrets, privilege, executable/dependency trust, network/data flow, authentication/TLS/signing validation, ACLs, or security controls materially affect the decision.

### Release
Use when an exact candidate may be published, distributed, promoted, shipped, deployed, tagged, or designated as a release.

### Document
Use when the objective is to create or update durable project records such as:

- handoffs;
- SOPs/runbooks;
- ADRs;
- README/overview material;
- acceptance/build reports;
- release documentation;
- state summaries;
- operator instructions;
- milestone records.

Select Document when the central problem is accurate representation of already established state, decisions, procedures, evidence, provenance, status, and limitations.

Do **not** route to Document to determine whether a claim is true. If source truth is unresolved, use Investigate or Verify first. Do not route to Document to make a release happen, approve architecture, establish security, or create execution authority merely because those subjects appear in the document.

Document may follow Research/Evaluate/Readiness/Verify/Review/Security/Recovery/Release to preserve their outcome. It may also precede Closeout when durable handoff or milestone documentation is required.

### Closeout
Use after a meaningful research, evaluation, readiness, build, security, recovery, release, documentation, governance, or defect milestone has resolved.

## Sequencing Patterns

- `research -> evaluate`
- `evaluate -> research`
- `evaluate -> readiness`
- `evaluate -> security`
- `evaluate -> plan -> build`
- `plan -> readiness -> build`
- `debug/build -> verify`
- `build/debug -> review`
- `failed/rejected build -> recovery -> verify`
- `verify -> document` when a material claim must be established before it is recorded as current fact;
- `investigate -> verify -> document` when source truth was initially ambiguous;
- `research/evaluate/readiness/security/recovery/release -> document` when their governed result needs durable representation;
- `document -> verify` if drafting exposes a consequential unsupported claim;
- `document -> closeout` when the documentation baseline itself forms a meaningful milestone;
- `verify/review/security/recovery/readiness as applicable -> release -> document -> closeout` for consequential releases.

Do not force every request through every skill.

## Authority Gate

Routing never grants write/destructive authority, installation/adoption authority, purchase authority, privilege elevation, credentials/secrets access, security-control changes, signing authority, publication/deployment/release authority, architecture authority, or canonical Build Ledger mutation authority.

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
- **MILESTONE CLOSEOUT REQUIRED**
- **BLOCKED**
- **STOP**

## Anti-Patterns

Fail routing when it confuses Research with Evaluate; uses Evaluate to invent missing evidence; treats an Evaluate recommendation as execution authority; sends target readiness to Research/Evaluate instead of Readiness; sends a specific factual claim to Document instead of Verify/Investigate; lets stale prose override canonical state; uses Document to turn candidate/planned work into Active/current state; treats documentation as security/release/architecture authority; bypasses STOP/authority; forces all specialists on every micro-edit; or skips meaningful milestone Closeout.

## Completion Criteria

Routing is complete when the smallest appropriate Active skill/sequence is selected; Document remains distinct from Investigate/Verify/Review/Release/Closeout; documentation consumes established evidence without creating stronger truth or authority; Research and Evaluate remain distinct; authority remains separate from capability; STOP conditions are preserved; and the next handoff condition is clear.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-router`
- **Version:** `0.1.10-rc1`
- **Maturity:** Document-routing integration candidate
- **Parent:** `signalproof` 0.1.1+
- **Routes among:** active Signalproof specialist skills only
- **Domain:** Capability routing, sequencing, Research/Evaluate/Readiness/Verify/Review/Recovery/Security/Release/Document/Closeout routing, evidence-state selection, authority-preserving dispatch
- **Created by:** Doc Reo / Signalproof
