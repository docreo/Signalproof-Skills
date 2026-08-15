---
name: signalproof-plan
description: Convert an ambiguous or consequential request into a bounded, evidence-aware, human-authorized execution plan before implementation. Use when work needs clear objectives, scope, protected state, dependencies, authority, acceptance criteria, sequencing, rollback, STOP conditions, or handoff to build/debug/review without premature execution.
---

# Signalproof Plan

## Purpose

`signalproof-plan` is the planning specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract and turns intent into an execution contract that another competent human or agent can follow without guessing.

Its central rule is:

> **Do not begin consequential implementation until the work is bounded enough to verify and recover.**

A Signalproof plan is not a brainstorm, feature wish list, or permission to execute everything mentioned. It distinguishes requirements from proposals, facts from assumptions, protected state from change surface, and approved work from unresolved decisions.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, smallest effective change, verification, recovery, STOP conditions, public/private boundaries, proof, and continuity.

A plan may be more restrictive than the root contract. It must not silently weaken it.

## Planning Contract

1. **State the objective as an outcome.** Do not confuse an implementation idea with the actual goal.
2. **Establish current state before planning change.** Use the strongest available evidence and identify gaps explicitly.
3. **Declare protected state.** Name working behavior, assets, interfaces, data, security controls, versions, and recovery points that must not regress.
4. **Separate requirements from proposals.** Human direction and established contracts outrank optional design ideas.
5. **Define in-scope and out-of-scope work.** Prevent silent expansion.
6. **Identify authority boundaries.** Mark destructive, credential-sensitive, security-sensitive, publication-sensitive, system-wide, or otherwise consequential actions that require explicit approval.
7. **Resolve dependencies and preconditions.** Do not schedule implementation on top of unknown prerequisites.
8. **Choose the smallest viable change surface.** Prefer bounded implementation over broad refactoring when both can satisfy the objective.
9. **Define acceptance before execution.** Each material objective needs a testable completion condition.
10. **Preserve recovery.** Identify rollback, backup, branch, version, restore point, or other practical recovery path when relevant.
11. **Define STOP conditions.** State what evidence or failure should halt execution and return the work to investigation or human decision.
12. **Leave a handoff that can be audited.** A builder should know what to change, what not to change, how to test it, and when to stop.

## Planning Workflow

### 1. Objective

Capture:

- requested outcome;
- user-visible or system-visible success condition;
- why the work is needed when relevant;
- urgency or sequencing constraints if explicitly known.

Rewrite feature-shaped requests into outcome-shaped objectives when necessary, but preserve the original intent.

### 2. Evidence and Current State

Classify inputs using the root evidence classes:

- Artifact-Backed Fact;
- Runtime-Verified Fact;
- Human-Observed Fact;
- Design Authority;
- Inference;
- Proposal.

Record missing evidence that materially affects the plan. Do not invent current state to make a plan look complete.

### 3. Protected State

List what must remain intact, including where relevant:

- known-working subsystem behavior;
- accepted UI/UX behavior;
- data and history;
- configuration and secrets boundaries;
- APIs and contracts;
- dependency/runtime versions;
- security controls;
- rollback versions;
- hashes or other integrity anchors.

For narrow work, establish a **forbidden-change boundary**.

### 4. Scope

Use three buckets:

- **Required** — necessary to satisfy the approved objective.
- **Allowed if needed** — may be touched only if evidence proves it is required.
- **Out of scope** — must not be changed under this plan without a new decision.

Optional improvements belong in proposals, not hidden inside required work.

### 5. Authority

For each consequential action, identify whether it is:

- already authorized;
- read-only/low risk;
- reversible;
- destructive;
- privilege/elevation-sensitive;
- credential-sensitive;
- security-policy-sensitive;
- publication/external-release-sensitive;
- unresolved and requiring human approval.

A plan must not convert technical capability into permission.

### 6. Dependencies and Preconditions

Identify:

- tools/runtimes required;
- external services or packages;
- versions/compatibility assumptions;
- credentials or permissions;
- files/repos/environments that must exist;
- test fixtures or representative data;
- build or runtime gates that must pass before later steps are meaningful.

If a prerequisite is uncertain and consequential, the plan should investigate it before implementation.

### 7. Change Strategy

Define:

- smallest effective change surface;
- files/components expected to change when known;
- components explicitly forbidden from change;
- sequencing that preserves a working baseline;
- isolation strategy for experimental or risky work;
- when a new branch, environment, backup, or candidate build is required.

Do not prescribe broad architecture replacement unless the evidence supports it.

### 8. Acceptance Matrix

For each material requirement, define:

| Requirement | Verification | Pass Condition | Evidence |
|---|---|---|---|
| What must work | How it will be tested | Observable pass rule | What artifact/runtime/human proof will be retained |

Distinguish compile/static, automated, runtime, visual/human, security, and release acceptance gates.

### 9. Recovery

State:

- rollback target or baseline;
- what is backed up or versioned;
- how failed candidate work is isolated;
- what data/state must be preserved;
- recovery verification when relevant.

If no practical recovery exists, state that risk before implementation.

### 10. STOP Conditions

Execution should stop and return to investigation or human decision when, for example:

- evidence contradicts a core assumption;
- protected state cannot be preserved;
- required authority is missing;
- an expected dependency is absent or incompatible;
- the same failed approach repeats without new evidence;
- change scope expands materially beyond the approved boundary;
- acceptance cannot be tested in the available environment;
- private/proprietary material would cross into public output.

### 11. Execution Handoff

A complete plan should be executable without silent interpretation. Include:

- objective;
- current state/evidence;
- protected state;
- required/allowed/out-of-scope boundaries;
- authority status;
- dependencies/preconditions;
- ordered change steps;
- acceptance matrix;
- recovery;
- STOP conditions;
- unresolved decisions.

## Plan Status

Return one of:

- **READY** — sufficiently bounded and authorized for the next execution stage.
- **READY WITH CHECKPOINTS** — execution may begin but named decisions/verification gates must be reached before later steps.
- **INVESTIGATE FIRST** — a material unknown prevents responsible planning.
- **AWAITING AUTHORITY** — required consequential action is not authorized.
- **BLOCKED** — environment/dependency/evidence prevents a viable plan.
- **STOP** — risk or scope conflict makes proceeding inappropriate under current authority.

## Anti-Patterns

Fail this skill when a plan:

- starts coding before current/protected state is established;
- treats a proposal as an approved requirement;
- omits out-of-scope boundaries on consequential work;
- silently adds dependency upgrades, framework changes, redesigns, or data migrations;
- declares success criteria such as “looks good” when objective verification is possible;
- has no rollback for a reversible-but-risky change;
- assumes credentials/elevation/production publication authority;
- lists every imaginable improvement instead of the smallest effective path;
- hides unresolved assumptions inside implementation steps.

## Completion Criteria

A Signalproof plan is complete when another competent human or agent can tell what outcome is required, what evidence the plan relies on, what must not change, what is authorized, what may change, how completion will be verified, how failure will be recovered, and what conditions require STOP or a new decision.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-plan`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.0+
- **Domain:** Governed planning, scope control, acceptance design, authority, recovery, execution handoff
- **Created by:** Doc Reo / Signalproof
