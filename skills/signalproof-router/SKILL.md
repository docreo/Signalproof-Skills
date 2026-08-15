---
name: signalproof-router
description: Route a request to the smallest appropriate active Signalproof skill or skill sequence without silently expanding authority, treating planned skills as active, or executing consequential work merely because routing identified a capable specialist. Use when choosing among active Signalproof skills, including Verify, Review, Recovery, Security, Release, and milestone Closeout.
---

# Signalproof Router

## Purpose

`signalproof-router` is the capability-selection specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract and selects the smallest active skill or ordered skill sequence that fits the current objective and evidence state.

Its central rule is:

> **Route by objective and evidence state, not by keyword—and never confuse capability selection with permission to execute.**

The router does not create authority, activate planned skills, or bypass STOP conditions.

## Active-Skill Rule

A skill is routable only when the canonical Signalproof Skill Registry marks it **Active**. Planned, candidate, deprecated, retired, missing, or locally invented skills are not active capabilities.

## Current Routing Set

- `signalproof` — root governing contract and fallback;
- `signalproof-investigate` — establish what actually failed or what state is true;
- `signalproof-plan` — create a bounded, authorized execution contract;
- `signalproof-build` — execute an already bounded implementation;
- `signalproof-debug` — reproduce, localize, correct, and regression-test a demonstrable defect;
- `signalproof-verify` — determine whether a specific claim is proven by the required evidence;
- `signalproof-review` — determine whether the work itself is sound, scoped correctly, and consistent with protected state/contracts;
- `signalproof-recovery` — select/verify a trustworthy rollback, protect persistent data/evidence, and verify restored state;
- `signalproof-security` — assess security-sensitive trust boundaries, secrets, privilege, untrusted execution, dependency/provenance, network/data exposure, control regressions, and security STOP conditions;
- `signalproof-release` — govern promotion of the exact accepted artifact to a defined distribution boundary with evidence binding, provenance, recovery, truthful claims, and release authority;
- `signalproof-closeout` — close meaningful milestones, preserve Build Ledger continuity, extract learning, and govern phase transition.

## Router Contract

1. Read the objective, not just vocabulary.
2. Check evidence state and identify the actual discipline required.
3. Use only active skills.
4. Prefer the smallest sufficient route.
5. Sequence only when evidence demands it.
6. Route material claim proof through Verify.
7. Route work-quality/change-integrity acceptance through Review when materially relevant.
8. Route restoration/rollback through Recovery rather than generic Build/Debug.
9. Route materially security-sensitive trust, privilege, secret, execution, dependency, network/data, or control questions through Security.
10. Route exact-artifact promotion/distribution decisions through Release.
11. Do not substitute Release for Verify, Review, Security, or Recovery. Their outputs are inputs to Release, not automatic release authority.
12. Do not force Release onto ordinary builds, test runs, internal edits, or pre-release development work.
13. Close meaningful milestones before the next development phase.
14. Do not invent permission. Routing never authorizes publication, deployment, signing, destructive recovery, privilege changes, credential use, or canonical-ledger mutation.
15. Preserve explicit human scope.
16. Do not route around STOP conditions.
17. Return to Router when state changes materially.
18. Leave a route decision trace.

## Routing Decision Model

### Route to `signalproof-investigate` when

- the failed layer/cause is unknown;
- current state is inconsistent or poorly evidenced;
- discriminating tests are needed;
- a prior hypothesis/fix failed.

### Route to `signalproof-plan` when

- consequential implementation needs scope, protected state, authority, dependencies, acceptance, recovery, or sequencing;
- a material architecture/security/release-preparation choice must be bounded before execution.

### Route to `signalproof-build` when

- the objective/change surface is already bounded and authorized;
- implementation—not investigation, restoration, security assessment, or release governance—is the current task.

### Route to `signalproof-debug` when

- a demonstrable defect exists;
- correction is requested and can remain bounded;
- the goal is fixing forward rather than restoring a known-good state.

### Route to `signalproof-verify` when

- the question is whether a claim is proven, fixed, ready, complete, signed, non-regressing, safe, or production-ready;
- a build/debug/recovery/security/remediation result needs proof against an acceptance condition;
- release evidence binding or a specific release claim needs proof.

Do not force Verify on every micro-edit.

### Route to `signalproof-review` when

- completed/proposed work needs assessment against plan/scope/protected state/contracts;
- tests pass but the work itself may be unsound;
- architecture, interface, dependency, maintainability, privacy/security-hazard, recovery, or release-preparation concerns need broad change-integrity review.

Do not treat Review as a complete Security assessment or Release decision.

### Route to `signalproof-recovery` when

- a failed, unsafe, corrupted, or rejected state should be rolled back;
- the user asks which backup/rollback is trustworthy;
- persistent data/evidence must survive restoration;
- a release requires validating or preserving the designated rollback.

Read-only rollback inspection does not authorize restore.

### Route to `signalproof-security` when

- secrets, credentials, tokens, keys, or sensitive logs may be exposed;
- administrator/root/elevated privilege or ACL/firewall/identity changes materially affect the decision;
- external executable/script/package/plugin/model/updater/dependency trust must be assessed;
- a new external API/service/network/data flow crosses a trust boundary;
- authentication, TLS/certificate validation, signature/hash validation, sandboxing, allowlists, path validation, secret redaction, ACLs, or update-source verification may be weakened;
- security gates materially affect whether a candidate may proceed toward release.

Security routing does not authorize offensive testing, destructive remediation, credential use/rotation, privilege elevation, control bypass, publication, or release.

### Route to `signalproof-release` when

- the user asks whether an exact candidate is ready to publish, distribute, promote, ship, deploy, tag, or designate as a release;
- a release artifact must be tied to the exact accepted bytes/version/commit;
- build/test/Verify/Review/Security/Recovery results must be assembled into a release gate matrix;
- signing/checksum/provenance state must be represented accurately for distribution;
- rollback designation must be confirmed before promotion;
- version, package, manifest, filename, tag, and release-note identity must be coherent;
- technical readiness must be separated from owner/publication/deployment authority;
- a rebuilt/repacked/re-signed artifact may have drifted from the accepted candidate;
- release notes or public claims may overstate what the evidence proves.

Do **not** route to Release merely because a build completed or a test passed. Release is selected when the current decision is promotion/distribution of a specific candidate to a defined boundary.

Release routing does not itself authorize publishing, deploying, signing, tagging, overwriting a distribution channel, rotating rollback baselines, or broadening the intended audience.

### Route to `signalproof-closeout` when

- a meaningful milestone/baseline has been accepted or promoted;
- a major defect, governance, security, licensing, recovery, or release decision has closed;
- the project is about to enter a new phase;
- work is being handed off.

Do not close every micro-commit.

### Route to root `signalproof` when

- no active specialist cleanly fits;
- the needed specialist is not active;
- a higher-level authority/governance boundary must be resolved first.

## Sequencing Patterns

Use only when necessary:

- `investigate -> debug`
- `investigate -> recovery`
- `investigate -> plan -> build`
- `plan -> build`
- `debug -> verify`
- `build -> verify`
- `build/debug -> review`
- `review -> security`
- `security -> plan/build/debug -> verify`
- `security -> recovery -> verify`
- `verify -> review`
- `failed/rejected build -> recovery -> verify`
- `verify/review/security/recovery -> release` — required gates are assembled for the exact candidate and distribution boundary;
- `release -> verify` — Release identifies a specific claim/artifact-binding question that requires direct proof;
- `release -> recovery` — rollback identity or recoverability is unresolved;
- `release -> security` — a security gate is unresolved or candidate drift introduces a new trust boundary;
- `release -> closeout` — the release/promotion decision is resolved and forms a meaningful milestone;
- `build -> verify -> review -> security/recovery as applicable -> release -> closeout` — common consequential release path.

Do not force every request through every skill.

## Authority Gate

Routing never grants:

- write/destructive authority;
- privilege elevation;
- credentials/secrets access;
- security-control changes;
- penetration-testing authority;
- signing authority;
- publication/deployment/release authority;
- canonical Build Ledger mutation authority.

The selected skill must independently honor all applicable boundaries.

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

- selects by keyword rather than objective/evidence state;
- treats a planned/candidate skill as active;
- routes rollback to Build/Debug merely because they can change files;
- routes a general quality question to Security when Review is sufficient;
- routes a specific claim to Release when Verify is needed to prove it;
- treats Security SCOPED PASS as release authority or universal certification;
- treats a Release decision as evidence that an untested claim is true;
- routes every successful build to Release even when no promotion/distribution decision exists;
- allows Release to bypass unresolved Verify/Review/Security/Recovery gates;
- infers publication/deployment authority from technical readiness;
- uses another skill to bypass STOP/authority;
- forces all specialists on every micro-edit;
- skips meaningful milestone Closeout;
- invents permission from capability selection.

## Completion Criteria

Routing is complete when the smallest appropriate **active** skill or sequence is selected from the canonical registry; the rationale matches objective/evidence state; Verify, Review, Recovery, Security, and Release remain distinct; release decisions route through Release only when promotion/distribution of an exact candidate is materially at issue; authority remains separate from capability; STOP conditions are preserved; and the next handoff condition is clear.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-router`
- **Version:** `0.1.6-rc1`
- **Maturity:** Release-routing integration candidate
- **Parent:** `signalproof` 0.1.1+
- **Routes among:** active Signalproof specialist skills only
- **Domain:** Capability routing, skill sequencing, Verify/Review/Recovery/Security/Release/Closeout routing, evidence-state selection, authority-preserving dispatch
- **Created by:** Doc Reo / Signalproof
