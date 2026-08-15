---
name: signalproof-router
description: Route a request to the smallest appropriate active Signalproof skill or skill sequence without silently expanding authority, treating planned skills as active, or executing consequential work merely because routing identified a capable specialist. Use when choosing among active Signalproof skills, including Readiness, Verify, Review, Recovery, Security, Release, and milestone Closeout.
---

# Signalproof Router

## Purpose

`signalproof-router` selects the smallest active Signalproof discipline or ordered sequence that fits the current objective and evidence state.

Its central rule is:

> **Route by objective and evidence state, not by keyword—and never confuse capability selection with permission to execute.**

The router does not create authority, activate planned skills, or bypass STOP conditions.

## Active-Skill Rule

Only skills marked **Active** in the canonical Skill Registry are routable. Planned, Candidate, Deprecated, Retired, missing, or invented skills are not active capabilities.

## Current Routing Set

- `signalproof` — root governing contract/fallback;
- `signalproof-investigate` — establish what failed or what state is true;
- `signalproof-plan` — create a bounded execution contract;
- `signalproof-readiness` — determine whether objective-specific prerequisites, capabilities, configuration, authority, security, recovery, and evidence are actually present on the target before consequential execution;
- `signalproof-build` — execute an already bounded implementation;
- `signalproof-debug` — reproduce, localize, correct, and regression-test a defect;
- `signalproof-verify` — determine whether a specific claim is proven;
- `signalproof-review` — assess whether the work itself is sound and scope/contract faithful;
- `signalproof-recovery` — select/verify a trustworthy rollback and verify restoration;
- `signalproof-security` — assess security-sensitive trust, privilege, secret, dependency, network/data, and control risks;
- `signalproof-release` — govern promotion of the exact accepted artifact to a defined distribution boundary;
- `signalproof-closeout` — close meaningful milestones and govern phase transition.

## Router Contract

1. Read the actual objective, not vocabulary alone.
2. Check evidence state and identify the governing discipline.
3. Use only Active skills.
4. Prefer the smallest sufficient route.
5. Sequence only when the next skill depends on evidence from the prior one.
6. Route objective-specific pre-execution prerequisite/capability questions through Readiness.
7. Do not confuse Readiness with Plan: Plan defines the execution contract; Readiness checks whether its required conditions actually exist on the target.
8. Do not confuse Readiness with Verify: Readiness assembles the gate state; Verify proves a material readiness claim when direct proof is required.
9. Route work-quality/change-integrity acceptance through Review when materially relevant.
10. Route restoration/rollback through Recovery.
11. Route material security-sensitive questions through Security.
12. Route exact-artifact promotion/distribution decisions through Release.
13. Close meaningful milestones before the next development phase.
14. Do not invent permission. Routing never authorizes installation, elevation, credentials, destructive recovery, security-control changes, signing, publication/deployment, or canonical-ledger mutation.
15. Preserve explicit human scope.
16. Do not route around STOP conditions.
17. Return to Router when state changes materially.
18. Leave a route decision trace.

## Routing Decision Model

### Route to `signalproof-investigate` when

- the failed layer or true state is unknown;
- evidence is inconsistent or competing causes need discriminating tests;
- a prior hypothesis/fix failed.

### Route to `signalproof-plan` when

- the objective is known but consequential implementation needs scope, protected state, authority, acceptance, recovery, dependencies, or sequencing;
- a material architecture/security/release-preparation choice must be bounded before execution.

### Route to `signalproof-readiness` when

- the user asks whether a machine/environment is ready for an installation, build, model, runtime, GPU path, integration, deployment, recovery, or release prerequisite;
- hardware/software/assets are detected or installed but configuration/compatibility/usability has not been established;
- the current decision depends on whether runtimes, versions, drivers, packages, models, storage, services, credentials, paths, permissions, or external endpoints are actually usable for the declared objective;
- technical capability must be separated from authorization;
- a consequential action should not begin until recovery/security prerequisites are checked;
- evidence may be stale or belong to another host/build/environment;
- the correct outcome may be READY, PARTIALLY READY, NOT READY, AWAITING AUTHORITY, BLOCKED, or STOP.

Do **not** route to Readiness merely because a task mentions hardware, Python, packages, models, or a “ready” word. Use Readiness when the central question is whether required preconditions for a defined objective are actually satisfied on a specific target.

Readiness is inspection-first and does not authorize installing missing prerequisites or changing the target merely to make the check pass.

### Route to `signalproof-build` when

- the objective/change surface is already bounded and authorized;
- required preconditions are sufficiently established for the intended execution;
- implementation—not readiness assessment, investigation, restoration, security review, or release—is the current task.

### Route to `signalproof-debug` when

- a demonstrable defect exists;
- correction is requested and can remain bounded;
- the goal is fix-forward rather than restore-known-good.

### Route to `signalproof-verify` when

- a specific claim must be proven: fixed, ready, complete, signed, safe, non-regressing, production-ready, etc.;
- a readiness gate needs direct proof rather than only state aggregation;
- build/debug/recovery/security/remediation/release evidence requires claim verification.

Do not force Verify on every micro-edit or every readiness inventory item.

### Route to `signalproof-review` when

- completed/proposed work needs assessment against plan, scope, protected state, architecture/contracts, dependencies, maintainability, privacy/security hazards, recovery, or release-preparation integrity.

### Route to `signalproof-recovery` when

- a failed/unsafe/corrupted/rejected state should be rolled back;
- a rollback candidate must be identified/verified;
- persistent data/evidence must survive restoration;
- Readiness or Release discovers that recovery trust is unresolved.

Read-only rollback inspection does not authorize restore.

### Route to `signalproof-security` when

- secrets/credentials may be exposed;
- privilege, ACL/firewall/identity changes materially affect the decision;
- external executable/script/package/plugin/model/updater/dependency trust must be assessed;
- new external API/service/network/data flows cross a trust boundary;
- authentication, TLS, signing/hash validation, sandboxing, allowlists, path validation, secret redaction, ACLs, or update-source verification may be weakened.

### Route to `signalproof-release` when

- the current decision is whether an exact candidate may be published, distributed, promoted, shipped, deployed, tagged, or designated as a release;
- evidence must bind to exact artifact bytes/version/commit;
- release gates, rollback, signing, version/package identity, release notes, and distribution authority must be assembled.

Do not route every successful build or READY environment to Release.

### Route to `signalproof-closeout` when

- a meaningful milestone/baseline has been accepted or promoted;
- a major readiness, security, recovery, release, governance, or defect decision has closed;
- the project is about to enter a new phase or handoff.

Do not close every micro-commit.

### Route to root `signalproof` when

- no active specialist cleanly fits;
- a higher-level authority/governance boundary must be resolved first.

## Sequencing Patterns

Use only when necessary:

- `investigate -> readiness` — target/current state is unclear before prerequisites can be assessed;
- `plan -> readiness -> build` — a bounded plan exists, then target prerequisites must be confirmed before implementation;
- `readiness -> verify` — a specific readiness gate/claim needs direct proof;
- `readiness -> security` — a security-sensitive prerequisite blocks readiness;
- `readiness -> recovery` — safe execution depends on an unresolved rollback path;
- `readiness -> plan/build` — blockers are known and a separately authorized correction is needed;
- `investigate -> debug`;
- `debug/build -> verify`;
- `build/debug -> review`;
- `review -> security`;
- `security -> plan/build/debug -> verify`;
- `failed/rejected build -> recovery -> verify`;
- `verify/review/security/recovery/readiness as applicable -> release`;
- `release -> verify/recovery/security` when a specific unresolved gate requires it;
- `readiness/release -> closeout` when the decision forms a meaningful milestone.

Do not force every request through every skill.

## Authority Gate

Routing never grants write/destructive authority, privilege elevation, credentials/secrets access, security-control changes, penetration-testing authority, signing authority, publication/deployment/release authority, or canonical Build Ledger mutation authority.

## Routing Output

For meaningful decisions return:

- **Objective**
- **Evidence state**
- **Selected route**
- **Why**
- **Not selected**
- **Authority note**
- **Next handoff condition**

## Router Status

- **ROUTED**
- **ROOT FALLBACK**
- **AWAITING AUTHORITY**
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

Fail routing when it:

- routes by keyword instead of objective/evidence state;
- treats planned/candidate skills as active;
- routes “is this machine ready?” directly to Build because tools are installed;
- treats detected/installed capability as verified readiness;
- lets Readiness install/configure prerequisites without separate authority;
- substitutes Readiness for a specific Verify claim;
- routes rollback to Build/Debug merely because they can change files;
- routes a general quality question to Security when Review is sufficient;
- routes a specific claim to Release when Verify is needed;
- treats Security PASS or Readiness READY as release authority;
- allows Release to bypass unresolved readiness/Verify/Review/Security/Recovery gates;
- infers publication/deployment authority from technical readiness;
- uses another skill to bypass STOP/authority;
- forces all specialists on every micro-edit;
- skips meaningful milestone Closeout.

## Completion Criteria

Routing is complete when the smallest appropriate Active skill/sequence is selected; Readiness is used for objective-specific pre-execution prerequisite/capability questions; Verify, Review, Recovery, Security, Readiness, and Release remain distinct; authority remains separate from capability; STOP conditions are preserved; and the next handoff condition is clear.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-router`
- **Version:** `0.1.7-rc1`
- **Maturity:** Integration candidate
- **Parent:** `signalproof` 0.1.1+
- **Routes among:** active Signalproof specialist skills only
- **Domain:** Capability routing, sequencing, Readiness/Verify/Review/Recovery/Security/Release/Closeout routing, evidence-state selection, authority-preserving dispatch
- **Created by:** Doc Reo / Signalproof
