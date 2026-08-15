---
name: signalproof-router
description: Route a request to the smallest appropriate active Signalproof skill or skill sequence without silently expanding authority, treating planned skills as active, or executing consequential work merely because routing identified a capable specialist. Use when choosing among active Signalproof skills, including Research, Readiness, Verify, Review, Recovery, Security, Release, and milestone Closeout.
---

# Signalproof Router

## Purpose

`signalproof-router` selects the smallest active Signalproof discipline or ordered sequence that fits the current objective and evidence state.

> **Route by objective and evidence state, not by keyword—and never confuse capability selection with permission to execute.**

The router does not create authority, activate planned skills, or bypass STOP conditions.

## Active-Skill Rule

Only skills marked **Active** in the canonical Skill Registry are routable.

## Current Routing Set

- `signalproof` — root governing contract/fallback;
- `signalproof-research` — acquire and synthesize external evidence while preserving source quality, freshness, contradictions, provenance, and the boundary between findings and decisions;
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
2. Check evidence state and select the governing discipline.
3. Use only Active skills.
4. Prefer the smallest sufficient route.
5. Sequence only when one discipline needs evidence from another.
6. Route external evidence acquisition/synthesis through Research when the central question is what current sources establish.
7. Do not confuse Research with Evaluate: Research establishes evidence; Evaluate decides among options using explicit criteria.
8. Do not confuse Research with Investigate: Research looks outward to sources; Investigate determines what is happening in a specific system/state.
9. Do not confuse Research with Readiness: Research may identify requirements; Readiness checks whether those requirements are satisfied on the exact target.
10. Route specific material claims through Verify when proof is required.
11. Route work-quality/change-integrity acceptance through Review when materially relevant.
12. Route restoration/rollback through Recovery.
13. Route material security-sensitive questions through Security.
14. Route exact-artifact promotion/distribution decisions through Release.
15. Close meaningful milestones before the next development phase.
16. Do not invent permission. Routing never authorizes install, purchase, adoption, elevation, credentials, destructive recovery, security-control changes, signing, publication/deployment, or canonical-ledger mutation.
17. Preserve explicit human scope and STOP conditions.
18. Return to Router when state changes materially and leave a route decision trace.

## Routing Decision Model

### Route to `signalproof-research` when

- the user asks what current evidence says about a technology, framework, model, standard, product, competitor, market claim, license, capability, API, policy, or external development;
- source freshness, primary-vs-secondary evidence, contradictions, provenance, or claim classification materially matters;
- multiple external sources must be compared before a decision is made;
- current external facts must be established before Evaluate, Plan, Readiness, Security, or Release can proceed;
- vendor/project claims need separation from independent evidence.

Research does not authorize installing, cloning, executing, purchasing, adopting, publishing, or modifying protected state.

### Route to `signalproof-investigate` when

- the failed layer or true state of a specific system/runtime is unknown;
- competing causes require discriminating tests.

### Route to `signalproof-plan` when

- a known objective needs scope, authority, acceptance, recovery, dependencies, or sequencing before implementation.

### Route to `signalproof-readiness` when

- a specific target machine/environment must be checked against objective-specific prerequisites.

### Route to `signalproof-build` when

- implementation is already bounded and authorized.

### Route to `signalproof-debug` when

- a demonstrable defect requires bounded correction.

### Route to `signalproof-verify` when

- a specific material claim must be proven rather than merely researched.

### Route to `signalproof-review` when

- work quality, scope fidelity, protected state, architecture/contracts, dependencies, maintainability, privacy/security hazards, or recovery integrity must be assessed.

### Route to `signalproof-recovery` when

- a failed/unsafe/corrupted/rejected state should be rolled back.

### Route to `signalproof-security` when

- secrets, privilege, executable/dependency trust, network/data flow, authentication/TLS/signing validation, ACLs, or security controls materially affect the decision.

### Route to `signalproof-release` when

- an exact candidate may be published, distributed, promoted, shipped, deployed, tagged, or designated as a release.

### Route to `signalproof-closeout` when

- a meaningful milestone/baseline has been accepted or promoted;
- a major research, readiness, security, recovery, release, governance, or defect decision has closed;
- the project is about to enter a new phase or handoff.

### Route to root `signalproof` when

- no active specialist cleanly fits or a higher-level governance boundary must be resolved first.

## Sequencing Patterns

Use only when necessary:

- `research -> evaluate` when Evaluate is Active;
- `research -> readiness`;
- `research -> security`;
- `research -> verify`;
- `research -> plan`;
- `research -> investigate`;
- `plan -> readiness -> build`;
- `debug/build -> verify`;
- `build/debug -> review`;
- `failed/rejected build -> recovery -> verify`;
- `verify/review/security/recovery/readiness as applicable -> release`;
- `research/readiness/release -> closeout` when the decision forms a meaningful milestone.

Do not force every request through every skill.

## Authority Gate

Routing never grants write/destructive authority, installation/adoption authority, purchase authority, privilege elevation, credentials/secrets access, security-control changes, signing authority, publication/deployment/release authority, or canonical Build Ledger mutation authority.

## Routing Output

For meaningful decisions return **Objective**, **Evidence state**, **Selected route**, **Why**, **Not selected**, **Authority note**, and **Next handoff condition**.

## Router Status

- **ROUTED**
- **ROOT FALLBACK**
- **AWAITING AUTHORITY**
- **RESEARCH REQUIRED**
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

Fail routing when it routes by keyword rather than objective/evidence state; treats planned/candidate skills as active; routes external evidence questions to Build; uses Research to make an ungoverned adoption decision; treats popularity or vendor claims as sufficient evidence; routes a target-machine readiness question to Research instead of Readiness; routes a specific claim to Research when Verify is needed; routes system root-cause work to Research when Investigate is required; allows another skill to bypass STOP/authority; treats READY/Security PASS as Release authority; forces all specialists on every micro-edit; or skips meaningful milestone Closeout.

## Completion Criteria

Routing is complete when the smallest appropriate Active skill/sequence is selected; Research is used for external evidence acquisition/synthesis and remains distinct from Evaluate, Investigate, Readiness, Verify, Review, Recovery, Security, and Release; authority remains separate from capability; STOP conditions are preserved; and the next handoff condition is clear.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-router`
- **Version:** `0.1.8`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Routes among:** active Signalproof specialist skills only
- **Domain:** Capability routing, sequencing, Research/Readiness/Verify/Review/Recovery/Security/Release/Closeout routing, evidence-state selection, authority-preserving dispatch
- **Created by:** Doc Reo / Signalproof
