---
name: signalproof-build
description: Execute an approved, bounded implementation plan while preserving protected state, authority boundaries, recovery, and acceptance evidence. Use when code, configuration, documentation, workflows, or system changes are authorized and the goal is to implement the smallest effective change without silent scope expansion or premature success claims.
---

# Signalproof Build

## Purpose

`signalproof-build` is the execution specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract and is designed to consume a sufficiently bounded plan, whether produced by `signalproof-plan` or established directly by explicit human authority and current evidence.

Its central rule is:

> **Build only what is authorized, preserve what is protected, and verify what you claim.**

Implementation is not permission to redesign the task. A builder may discover new evidence, but new evidence changes the build only through an explicit bounded decision, not silent expansion.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, smallest effective change, verification, recovery, STOP conditions, public/private boundaries, proof, and continuity.

When an approved Signalproof plan exists, its scope, protected-state declaration, acceptance matrix, authority checkpoints, recovery path, and STOP conditions become part of the build contract.

## Build Contract

1. **Confirm the execution contract.** Identify objective, protected state, authorized scope, acceptance criteria, recovery, and unresolved checkpoints before consequential implementation.
2. **Preserve a known baseline.** Work in a branch, candidate copy, isolated environment, backup, versioned artifact, or other recovery-safe context when appropriate.
3. **Change the smallest effective surface.** Do not refactor unrelated code, upgrade dependencies, redesign interfaces, migrate frameworks, or alter security posture without evidence and authority.
4. **Respect forbidden-change boundaries.** Protected components remain untouched unless the build stops and receives a new decision.
5. **Make changes traceable.** Keep implementation increments understandable enough to review, test, and revert.
6. **Verify incrementally when failure cost is meaningful.** Do not stack many uncertain changes before testing the boundary they affect.
7. **Treat discovered defects separately from the approved objective.** Fix only if they block the approved work and fall within authority; otherwise record them as findings/proposals.
8. **Do not hide environment changes.** Package installs, runtime changes, elevation, credentials, services, drivers, model downloads, network dependencies, or machine-wide changes must remain explicit.
9. **Do not declare success from a weaker gate.** Static validation, compile success, automated tests, runtime behavior, visual acceptance, security acceptance, and release acceptance are different evidence classes/gates.
10. **Stop on material plan divergence.** If implementation requires changing protected state, expanding scope, crossing an authority boundary, or invalidating the recovery/acceptance model, stop and return to plan/investigate/human decision.
11. **Preserve evidence.** Retain diffs, hashes, test results, logs, changed-file inventory, or other proof proportionate to the work.
12. **Close with exact status.** State what changed, what did not, what passed, what remains unverified, and whether the build is candidate, accepted, blocked, or reverted.

## Build Workflow

### 1. Preflight

Before writing changes, confirm:

- objective;
- current baseline/version/branch;
- protected state;
- required and allowed change surface;
- out-of-scope/forbidden areas;
- authority status;
- dependencies and environment assumptions;
- acceptance conditions;
- recovery path;
- STOP conditions.

If these are materially unclear for consequential work, use `signalproof-plan` or `signalproof-investigate` before building.

### 2. Baseline Evidence

Capture the strongest practical anchors, such as:

- source commit/ref;
- relevant file hashes;
- current test results;
- known-working runtime result;
- configuration identity;
- package/runtime versions;
- protected artifact inventory.

Do not create fake hashes or pretend a baseline was tested if it was not.

### 3. Isolate the Candidate

Use the least disruptive isolation appropriate to the work:

- feature branch;
- candidate directory;
- virtual environment;
- container/sandbox;
- temporary fixture;
- backup/restore point;
- versioned build output.

Do not overwrite the only known-working artifact when an isolated path is practical.

### 4. Implement Bounded Changes

For each material change:

- identify which approved requirement it satisfies;
- touch only the necessary files/components;
- preserve existing contracts unless the plan explicitly changes them;
- keep optional improvements separate;
- avoid broad cleanup merely because the code is open.

### 5. Checkpoint Verification

After a meaningful boundary changes, run the cheapest relevant verification before expanding further.

Examples:

- parser change -> fixture/schema tests;
- transport change -> seek/playback tests;
- API change -> contract/status tests;
- installer change -> staging/install/rollback tests;
- UI change -> behavioral and visual acceptance;
- dependency change -> provenance, compatibility, security, runtime regression.

A failed checkpoint is evidence. Do not bury it under additional changes.

### 6. Divergence Handling

If new evidence shows the approved plan is wrong or incomplete, classify the divergence:

- **Minor within scope** — bounded implementation detail; proceed and record.
- **Material scope change** — stop for plan/authority update.
- **Protected-state conflict** — stop.
- **Dependency/environment conflict** — investigate or stop.
- **Acceptance-model invalidation** — stop and redefine verification before continuing.

### 7. Final Acceptance

Run every applicable acceptance condition that the current environment can actually support.

Report unexecuted gates honestly. A build that compiles but cannot be runtime-tested is not runtime-verified.

### 8. Recovery Decision

If acceptance fails:

- preserve failure evidence;
- revert or retain isolated candidate according to the recovery plan;
- do not damage the known baseline trying repeated unbounded fixes;
- hand off to `signalproof-investigate` when cause is unclear.

### 9. Closure

Report:

- **Outcome**
- **Baseline**
- **Changed**
- **Protected**
- **Dependencies/environment changes**
- **Verification performed**
- **Proof**
- **Unverified gates**
- **Recovery status**
- **Open findings/proposals**
- **Next decision**, only if required

## Build Status

Return one of:

- **CANDIDATE PASS** — implemented and available acceptance gates pass, but final human/release acceptance may remain.
- **ACCEPTED** — all required acceptance gates and authority checkpoints are satisfied for the defined scope.
- **PARTIAL / UNVERIFIED** — implementation exists but one or more required gates could not be run.
- **BLOCKED** — implementation cannot proceed because required evidence/environment/dependency is unavailable.
- **REVERTED** — candidate failed and recovery restored the protected baseline.
- **STOP** — continuing would violate scope, authority, protected state, or recovery constraints.

## Anti-Patterns

Fail this skill when a builder:

- rewrites unrelated working code during a narrow task;
- upgrades packages/frameworks “while here” without need;
- changes a protected engine to fix a presentation problem;
- executes system-wide installers without explicit authority;
- overwrites the only known-working baseline;
- continues after evidence proves the plan must materially change;
- declares runtime success from compile/static checks;
- hides test failures or unverified gates;
- mixes optional redesign with required correction;
- removes rollback/history/evidence to make the build appear clean.

## Completion Criteria

A Signalproof build is complete when the authorized objective has been implemented within the bounded change surface, protected state and authority were respected, the applicable acceptance gates were run and classified honestly, recovery remains intact or was exercised successfully, and enough evidence exists to review or reproduce the outcome.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-build`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.0+
- **Works with:** `signalproof-plan`, `signalproof-investigate`
- **Domain:** Governed implementation, bounded change, protected execution, verification, recovery
- **Created by:** Doc Reo / Signalproof
