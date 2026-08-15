---
name: signalproof-router
description: Route a request to the smallest appropriate active Signalproof skill or skill sequence without silently expanding authority, treating planned skills as active, or executing consequential work merely because routing identified a capable specialist. Use when choosing among Signalproof root, investigate, plan, build, debug, or future active specialist skills.
---

# Signalproof Router

## Purpose

`signalproof-router` is the capability-selection specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract and selects the smallest active skill or ordered skill sequence that fits the current objective and evidence state.

Its central rule is:

> **Route by objective and evidence state, not by keyword—and never confuse capability selection with permission to execute.**

The router does not create authority. It does not activate planned skills. It does not bypass the root contract. It chooses which active Signalproof discipline should govern the next step.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, bounded change, verification, recovery, STOP conditions, public/private boundaries, proof, and continuity.

The router may become more restrictive than the root contract. It must not silently weaken it.

## Active-Skill Rule

A skill is routable only when the canonical Signalproof Skill Registry marks it **Active**.

Planned, candidate, deprecated, retired, missing, or locally invented skill names must not be treated as active capabilities.

If the requested capability does not yet exist as an active specialist, route to the root `signalproof` contract or the closest active discipline and state the limitation.

## Current V0.1 Routing Set

At initial V0.1, the expected active routing set is:

- `signalproof` — root governing contract and fallback for consequential work that does not fit a more specific active specialist;
- `signalproof-investigate` — establish what actually failed or what state is actually true before correction;
- `signalproof-plan` — turn intent into a bounded, authorized execution contract;
- `signalproof-build` — execute an already bounded/authorized implementation;
- `signalproof-debug` — reproduce, localize, correct, and regression-test a demonstrable defect.

Future specialists become routable only after their registry status is Active.

## Router Contract

1. **Read the objective, not just the vocabulary.** A request containing “build” may still require investigation first if current state is unclear.
2. **Check evidence state.** Determine whether the task is primarily unknown-state investigation, planning, implementation, defect correction, or root-level governance.
3. **Use only active skills.** Never route to a planned or candidate skill as though it were available.
4. **Prefer the smallest sufficient skill.** Do not invoke a chain when one active specialist can responsibly handle the task.
5. **Sequence when evidence demands it.** Example: unclear failure -> investigate -> debug; ambiguous consequential change -> plan -> build.
6. **Do not invent permission.** Routing to build/debug does not authorize destructive, privileged, credential-sensitive, security-sensitive, or publication-sensitive actions.
7. **Preserve explicit human scope.** Do not broaden “diagnose only” into “diagnose and fix.”
8. **Do not route around STOP conditions.** If an active skill says STOP/blocked/awaiting authority, the router must not select another skill merely to bypass that boundary.
9. **Return to the router when state changes materially.** A task may move from investigate to plan, or debug to plan, after new evidence changes the next responsible action.
10. **Leave a route decision trace.** State why the selected skill or sequence fits, what was not selected, and any authority/evidence limitation that remains.

## Routing Decision Model

### Route to `signalproof-investigate` when:

- something appears broken but the failed layer is unknown;
- the current state is unclear, inconsistent, suspicious, or poorly evidenced;
- competing causes need discriminating tests;
- a human observation has not yet been reproduced or localized;
- a prior fix failed and the hypothesis must be revisited.

### Route to `signalproof-plan` when:

- the objective is known but consequential implementation needs scope, protected state, authority, dependencies, acceptance, recovery, or sequencing;
- a material architecture or scope choice must be bounded before execution;
- new investigation evidence invalidated or expanded the prior implementation contract.

### Route to `signalproof-build` when:

- the objective and change surface are sufficiently bounded;
- authority is adequate for the requested implementation stage;
- protected state, acceptance conditions, and recovery are known or proportionately established;
- the task is implementation, not root-cause discovery.

### Route to `signalproof-debug` when:

- a demonstrable defect exists;
- the failing behavior can be reproduced or is sufficiently localized;
- the goal includes correction and regression proof;
- the correction can remain bounded or can be bounded through a short plan.

### Route to root `signalproof` when:

- the request is consequential but does not fit an active specialist;
- the needed specialist is not active;
- the task is primarily governance, evidence classification, authority, protected-state, recovery, or continuity discipline;
- multiple specialist routes are plausible but a higher-level boundary must be resolved first.

## Sequencing Patterns

Use sequences only when necessary. Common patterns:

- `investigate -> debug` — symptom exists, failed layer/cause unclear, correction requested after localization.
- `investigate -> plan -> build` — current state is unclear, then a bounded change must be designed and executed.
- `plan -> build` — current state is sufficiently known but implementation needs a formal bounded contract.
- `debug -> plan -> build` — defect reveals that the required correction is architectural or materially outside the original debug boundary.

Do not force every request through every skill.

## Authority Gate

The router classifies the next discipline; it does **not** grant action authority.

For consequential actions, the selected skill must still independently honor:

- explicit owner/user direction;
- read-only versus write authority;
- destructive-action boundaries;
- elevation/privilege boundaries;
- credentials and secrets boundaries;
- production/publication boundaries;
- security-policy boundaries.

## Routing Output

For meaningful routing decisions, return:

- **Objective** — what the user is trying to achieve;
- **Evidence state** — what is known versus unknown;
- **Selected route** — one active skill or the smallest necessary sequence;
- **Why** — the discriminating reason;
- **Not selected** — relevant alternatives and why they are premature/unnecessary;
- **Authority note** — any consequential permission boundary still unresolved;
- **Next handoff condition** — what evidence/state should trigger the next skill in a sequence.

## Router Status

Return one of:

- **ROUTED** — an active skill or sequence is appropriate.
- **ROOT FALLBACK** — no active specialist cleanly fits; use root `signalproof`.
- **AWAITING AUTHORITY** — routing is clear but the next consequential action is not authorized.
- **BLOCKED** — evidence/registry/current-state information is insufficient to route responsibly.
- **STOP** — proceeding would bypass an explicit protection, authority boundary, or prior STOP condition.

## Anti-Patterns

Fail this skill when a router:

- routes by a single keyword instead of objective/evidence state;
- treats planned/candidate skills as active;
- routes directly to build when current state must first be investigated;
- routes “diagnose only” to a fixing workflow;
- uses another specialist to bypass an authority or STOP decision;
- invokes every skill in sequence when one specialist is sufficient;
- claims that selecting a capability authorizes its consequential actions;
- invents a specialist that is not in the active registry.

## Completion Criteria

A Signalproof routing decision is complete when the smallest appropriate active skill or sequence has been selected from the canonical registry, the rationale reflects the objective and evidence state, authority remains separate from capability, planned/candidate skills were not misrepresented as active, and the next handoff condition is clear when sequencing is required.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-router`
- **Version:** `0.1.0-rc1`
- **Maturity:** Initial public release candidate
- **Parent:** `signalproof` 0.1.0+
- **Routes among:** active Signalproof specialist skills only
- **Domain:** Capability routing, skill sequencing, evidence-state selection, authority-preserving dispatch
- **Created by:** Doc Reo / Signalproof
