---
name: signalproof-router
description: Route a request to the smallest appropriate active Signalproof skill or skill sequence without silently expanding authority, treating planned skills as active, or executing consequential work merely because routing identified a capable specialist. Use when choosing among active Signalproof skills, including Research, Evaluate, Readiness, Verify, Review, Recovery, Security, Release, and milestone Closeout.
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
- `signalproof-evaluate` — judge researched options against explicit criteria, hard gates, strategic/technical fit, licensing, security/readiness implications, reversibility, and alternatives, then recommend a bounded disposition;
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
7. Route option comparison/disposition through Evaluate when the central question is what should be adopted, rejected, deferred, piloted, integrated, adapted, or built after evidence exists.
8. Do not confuse Research with Evaluate: Research establishes evidence; Evaluate applies explicit criteria and constraints to recommend disposition.
9. Do not confuse Evaluate with Plan/Build: recommendation is not implementation authority.
10. Do not confuse Research with Investigate or Readiness: external evidence is different from system-state diagnosis and target-environment proof.
11. Route specific material claims through Verify when proof is required.
12. Route work-quality/change-integrity acceptance through Review when materially relevant.
13. Route restoration/rollback through Recovery.
14. Route material security-sensitive questions through Security.
15. Route exact-artifact promotion/distribution decisions through Release.
16. Close meaningful milestones before the next development phase.
17. Do not invent permission. Routing never authorizes install, purchase, adoption, elevation, credentials, destructive recovery, security-control changes, signing, publication/deployment, or canonical-ledger mutation.
18. Preserve explicit human scope and STOP conditions.
19. Return to Router when state changes materially and leave a route decision trace.

## Routing Decision Model

### Route to `signalproof-research` when

- the central question is what current external evidence says about a technology, model, product, framework, competitor, license, standard, API, capability, or policy;
- source freshness, provenance, contradictions, or primary-vs-secondary quality materially matter;
- decision-critical facts must be established before Evaluate, Readiness, Security, Plan, or Release.

Research does not authorize adoption or execution.

### Route to `signalproof-evaluate` when

- the evidence package is sufficiently developed and the central question is what disposition best fits explicit project criteria;
- candidates must be compared against hard gates and weighted preferences;
- strategic fit, technical fit, licensing, cost, readiness burden, security implications, reversibility, integration effort, or alternatives must be judged together;
- the user asks whether to adopt, adapt, integrate, pilot, defer, reject, build internally, or place a candidate on watchlist;
- popularity, benchmarks, vendor claims, or one attractive metric must be prevented from silently deciding adoption;
- status quo and build-from-scratch should be considered as alternatives.

If decision-critical evidence is missing, Evaluate may hand back to Research. If target-specific compatibility is missing, route to Readiness. If the decision requires action, route to Plan/Build only after authority is explicit.

### Route to `signalproof-investigate` when

- the failed layer or true state of a specific system/runtime is unknown;
- competing causes require discriminating tests.

### Route to `signalproof-plan` when

- a known objective or authorized disposition needs scope, authority, acceptance, recovery, dependencies, or sequencing before implementation.

### Route to `signalproof-readiness` when

- a specific target machine/environment must be checked against objective-specific prerequisites.

### Route to `signalproof-build` when

- implementation is already bounded and authorized.

### Route to `signalproof-debug` when

- a demonstrable defect requires bounded correction.

### Route to `signalproof-verify` when

- a specific material claim must be proven rather than researched or evaluated.

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
- a major research, evaluation, readiness, security, recovery, release, governance, or defect decision has closed;
- the project is about to enter a new phase or handoff.

### Route to root `signalproof` when

- no active specialist cleanly fits or a higher-level governance boundary must be resolved first.

## Sequencing Patterns

Use only when necessary:

- `research -> evaluate` — establish evidence, then determine disposition;
- `evaluate -> research` — decision-critical evidence remains missing;
- `evaluate -> readiness` — a promising option needs target-specific proof;
- `evaluate -> security` — a security-sensitive gate needs defined assessment;
- `evaluate -> plan -> build` — an authorized disposition becomes bounded implementation;
- `research -> readiness`;
- `research -> security`;
- `research -> verify`;
- `plan -> readiness -> build`;
- `debug/build -> verify`;
- `build/debug -> review`;
- `failed/rejected build -> recovery -> verify`;
- `verify/review/security/recovery/readiness as applicable -> release`;
- `research/evaluate/readiness/release -> closeout` when the decision forms a meaningful milestone.

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

Fail routing when it routes by keyword instead of objective/evidence state; treats planned/candidate skills as active; uses Research to make an ungoverned adoption decision; routes a recommendation problem to Research when Evaluate is required; routes an evidence-acquisition problem to Evaluate and invents missing facts; treats Evaluate ADOPT/INTEGRATE as installation authority; routes target readiness to Research/Evaluate instead of Readiness; routes a specific claim to Research/Evaluate when Verify is needed; averages security/licensing blockers away through routing; allows another skill to bypass STOP/authority; treats READY/Security PASS/Evaluate recommendation as Release authority; forces all specialists on every micro-edit; or skips meaningful milestone Closeout.

## Completion Criteria

Routing is complete when the smallest appropriate Active skill/sequence is selected; Research and Evaluate remain distinct; Evaluate remains distinct from Plan/Build/Readiness/Verify/Security/Release; authority remains separate from capability; STOP conditions are preserved; and the next handoff condition is clear.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-router`
- **Version:** `0.1.9-rc1`
- **Maturity:** Router Evaluate integration candidate
- **Parent:** `signalproof` 0.1.1+
- **Routes among:** active Signalproof specialist skills only
- **Domain:** Capability routing, sequencing, Research/Evaluate/Readiness/Verify/Review/Recovery/Security/Release/Closeout routing, evidence-state selection, authority-preserving dispatch
- **Created by:** Doc Reo / Signalproof
