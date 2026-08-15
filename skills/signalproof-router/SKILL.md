---
name: signalproof-router
description: Route a request to the smallest appropriate active Signalproof skill or skill sequence without silently expanding authority, treating planned skills as active, or executing consequential work merely because routing identified a capable specialist. Use when choosing among active Signalproof skills, including Research, Evaluate, Readiness, Verify, Review, Recovery, Security, Release, and milestone Closeout.
---

# Signalproof Router

## Purpose

`signalproof-router` selects the smallest active Signalproof discipline or ordered sequence that fits the current objective and evidence state.

> **Route by objective and evidence state, not by keyword—and never confuse capability selection with permission to execute.**

Only skills marked **Active** in the canonical Skill Registry are routable.

## Current Routing Set

- `signalproof` — root governing contract/fallback;
- `signalproof-research` — establish what current external evidence supports;
- `signalproof-evaluate` — decide disposition from that evidence using explicit criteria, hard gates, reversibility, readiness/security/licensing implications, and alternatives;
- `signalproof-investigate` — establish what failed or what state is true in a specific system/runtime;
- `signalproof-plan` — create a bounded execution contract;
- `signalproof-readiness` — determine whether objective-specific prerequisites/capabilities actually exist on the target;
- `signalproof-build` — execute an already bounded implementation;
- `signalproof-debug` — reproduce, localize, correct, and regression-test a defect;
- `signalproof-verify` — determine whether a specific claim is proven;
- `signalproof-review` — assess whether work itself is sound and scope/contract faithful;
- `signalproof-recovery` — select/verify a trustworthy rollback and verify restoration;
- `signalproof-security` — assess material security-sensitive trust, privilege, secret, dependency, network/data, and control risks;
- `signalproof-release` — govern promotion of the exact accepted artifact to a defined distribution boundary;
- `signalproof-closeout` — close meaningful milestones and govern phase transition.

## Router Contract

1. Read the objective, not vocabulary alone.
2. Use only Active skills.
3. Prefer the smallest sufficient route and sequence only when evidence demands it.
4. Research establishes evidence; Evaluate recommends disposition; Plan/Build execute only after separate authority.
5. Do not use Evaluate to invent missing Research, target Readiness, Security evidence, or Verify proof.
6. Hard-gate failures cannot be bypassed by routing or averaged away through another specialist.
7. Route exact claim proof to Verify, work-quality acceptance to Review, restoration to Recovery, security-sensitive trust questions to Security, and exact-artifact promotion to Release.
8. Close meaningful milestones before the next development phase.
9. Routing never creates install, purchase, adoption, privilege, credential, security-exception, signing, publication/deployment, or canonical-ledger authority.
10. Preserve explicit scope, STOP conditions, and a route decision trace.

## Routing Decision Model

### Research
Use when the central question is what current external evidence says, especially when source quality, freshness, provenance, contradictions, or claim classification matter.

### Evaluate
Use when evidence is sufficiently developed and the central question is what to **ADOPT, ADAPT, INTEGRATE, PILOT, DEFER, RESEARCH MORE, REJECT, BUILD FROM SCRATCH, or WATCHLIST** against explicit project criteria.

Evaluate is selected when strategic/technical fit, licensing, cost, readiness burden, security implications, reversibility, integration effort, or alternatives must be judged together. Popularity, benchmarks, or one attractive metric do not decide adoption.

If decision-critical evidence is missing, hand back to Research. If target-specific compatibility is missing, route to Readiness. If action is approved, route to Plan/Build only with explicit authority.

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

### Closeout
Use after a meaningful research, evaluation, readiness, build, security, recovery, release, governance, or defect milestone has resolved.

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
- `verify/review/security/recovery/readiness as applicable -> release`
- `research/evaluate/readiness/release -> closeout` when the result forms a meaningful milestone.

Do not force every request through every skill.

## Authority Gate

Routing never grants write/destructive authority, installation/adoption authority, purchase authority, privilege elevation, credentials/secrets access, security-control changes, signing authority, publication/deployment/release authority, or canonical Build Ledger mutation authority.

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
- **MILESTONE CLOSEOUT REQUIRED**
- **BLOCKED**
- **STOP**

## Anti-Patterns

Fail routing when it confuses Research with Evaluate; uses Evaluate to invent missing evidence; treats Evaluate ADOPT/INTEGRATE as execution authority; sends target readiness to Research/Evaluate instead of Readiness; sends a specific claim to Research/Evaluate instead of Verify; averages security/licensing blockers away; treats READY/Security PASS/Evaluate recommendation as Release authority; bypasses STOP/authority; forces all specialists on every micro-edit; or skips meaningful milestone Closeout.

## Completion Criteria

Routing is complete when the smallest appropriate Active skill/sequence is selected; Research and Evaluate remain distinct; Evaluate remains distinct from Plan/Build/Readiness/Verify/Security/Release; authority remains separate from capability; STOP conditions are preserved; and the next handoff condition is clear.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-router`
- **Version:** `0.1.9`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Routes among:** active Signalproof specialist skills only
- **Domain:** Capability routing, sequencing, Research/Evaluate/Readiness/Verify/Review/Recovery/Security/Release/Closeout routing, evidence-state selection, authority-preserving dispatch
- **Created by:** Doc Reo / Signalproof
