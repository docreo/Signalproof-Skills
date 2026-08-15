---
name: signalproof-router
description: Route a request to the smallest appropriate active Signalproof skill or skill sequence without silently expanding authority, treating planned skills as active, or executing consequential work merely because routing identified a capable specialist. Use when choosing among active Signalproof skills, when a claim needs evidence verification, and when a meaningful completed milestone must be closed out before the next development phase.
---

# Signalproof Router

## Purpose

`signalproof-router` is the capability-selection specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract and selects the smallest active skill or ordered skill sequence that fits the current objective and evidence state.

Its central rule is:

> **Route by objective and evidence state, not by keyword—and never confuse capability selection with permission to execute.**

The router does not create authority. It does not activate planned skills. It does not bypass the root contract. It chooses which active Signalproof discipline should govern the next step.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, bounded change, verification, recovery, milestone closeout, STOP conditions, public/private boundaries, proof, and continuity.

The router may become more restrictive than the root contract. It must not silently weaken it.

## Active-Skill Rule

A skill is routable only when the canonical Signalproof Skill Registry marks it **Active**.

Planned, candidate, deprecated, retired, missing, or locally invented skill names must not be treated as active capabilities.

If the requested capability does not yet exist as an active specialist, route to the root `signalproof` contract or the closest active discipline and state the limitation.

## Current Routing Set

The active routing set includes:

- `signalproof` — root governing contract and fallback;
- `signalproof-investigate` — establish what actually failed or what state is actually true;
- `signalproof-plan` — turn intent into a bounded, authorized execution contract;
- `signalproof-build` — execute an already bounded/authorized implementation;
- `signalproof-debug` — reproduce, localize, correct, and regression-test a demonstrable defect;
- `signalproof-verify` — determine whether a specific claim is actually proven by the required evidence and what remains unverified;
- `signalproof-closeout` — close a meaningful milestone, update or stage Build Ledger continuity, extract reusable learning, preserve open gates, and govern transition to the next phase.

Future specialists become routable only after their registry status is Active.

## Router Contract

1. **Read the objective, not just the vocabulary.** A request containing “build” may still require investigation first if current state is unclear.
2. **Check evidence state.** Determine whether the task is primarily investigation, planning, implementation, defect correction, verification, milestone closeout, or root-level governance.
3. **Use only active skills.** Never route to a planned or candidate skill as though it were available.
4. **Prefer the smallest sufficient skill.** Do not invoke a chain when one active specialist can responsibly handle the task.
5. **Sequence when evidence demands it.** Example: unclear failure -> investigate -> debug; ambiguous consequential change -> plan -> build; completed change with a consequential success claim -> verify.
6. **Verify consequential claims before treating them as established.** When acceptance, release, non-regression, “fixed,” “ready,” “secure,” “works,” or similar claims depend on evidence not yet classified, route through `signalproof-verify` before promotion/closeout decisions that rely on those claims.
7. **Close meaningful milestones before the next phase.** When a meaningful phase boundary has been reached, route through `signalproof-closeout` before selecting the next development-phase skill unless the human owner explicitly records a justified deferral.
8. **Do not invent permission.** Routing to build/debug/verify/closeout does not authorize destructive, privileged, credential-sensitive, security-sensitive, publication-sensitive, release-sensitive, or canonical-ledger actions.
9. **Preserve explicit human scope.** Do not broaden “diagnose only” into “diagnose and fix.”
10. **Do not route around STOP conditions.** If an active skill says STOP/blocked/awaiting authority, the router must not select another skill merely to bypass that boundary.
11. **Return to the router when state changes materially.** A task may move from investigate to plan, debug to verify, verify to closeout, or another bounded route after evidence changes the next responsible action.
12. **Leave a route decision trace.** State why the selected skill or sequence fits, what was not selected, and any authority/evidence limitation that remains.

## Routing Decision Model

### Route to `signalproof-investigate` when

- something appears broken but the failed layer is unknown;
- current state is unclear, inconsistent, suspicious, or poorly evidenced;
- competing causes need discriminating tests;
- a human observation has not yet been reproduced or localized;
- a prior fix failed and the hypothesis must be revisited.

### Route to `signalproof-plan` when

- the objective is known but consequential implementation needs scope, protected state, authority, dependencies, acceptance, recovery, or sequencing;
- a material architecture or scope choice must be bounded before execution;
- new investigation evidence invalidated or expanded the prior implementation contract.

### Route to `signalproof-build` when

- the objective and change surface are sufficiently bounded;
- authority is adequate for the requested implementation stage;
- protected state, acceptance conditions, and recovery are known or proportionately established;
- the task is implementation, not root-cause discovery;
- there is no unresolved meaningful milestone-closeout gate from the preceding phase.

### Route to `signalproof-debug` when

- a demonstrable defect exists;
- the failing behavior can be reproduced or is sufficiently localized;
- the goal includes correction and regression proof;
- the correction can remain bounded or can be bounded through a short plan.

### Route to `signalproof-verify` when

- the user asks whether a claim is proven, fixed, ready, complete, safe, signed, non-regressing, or production-ready;
- a build/debug result must be checked against its acceptance condition;
- evidence classes or gates are being conflated;
- protected-state non-regression is part of the claim;
- evidence from different versions/environments conflicts;
- a milestone/release/acceptance decision depends on whether a claim is actually established.

Do **not** route every implementation or micro-edit through Verify. Verification is required when a material claim or acceptance gate needs proof.

### Route to `signalproof-closeout` when

- owner acceptance establishes a meaningful completed milestone;
- a protected or active baseline has just been designated;
- the project is about to move to a new RD/phase;
- a release candidate/release or major capability has been promoted/completed;
- a significant defect, governance, security, licensing, or recovery decision has been closed;
- work is being handed to another builder/account/model/team;
- the user says “next” after a meaningful milestone and the milestone has not yet been durably closed out.

Do **not** route every micro-commit or ordinary intermediate edit through closeout. The trigger is a meaningful phase boundary where later work depends on preserving the current state.

### Route to root `signalproof` when

- the request is consequential but does not fit an active specialist;
- the needed specialist is not active;
- the task is primarily governance, evidence classification, authority, protected-state, recovery, or continuity discipline;
- multiple specialist routes are plausible but a higher-level boundary must be resolved first.

## Sequencing Patterns

Use sequences only when necessary. Common patterns:

- `investigate -> debug` — symptom exists, failed layer/cause unclear, correction requested after localization;
- `investigate -> plan -> build` — current state is unclear, then a bounded change must be designed and executed;
- `plan -> build` — current state is sufficiently known but implementation needs a formal bounded contract;
- `debug -> verify` — a defect was corrected and the “fixed without regression” claim must be proven;
- `build -> verify` — implementation is complete and a material acceptance claim needs evidence;
- `verify -> closeout` — the milestone claim is established (or bounded limitations are explicit) and the phase boundary can be durably closed;
- `build/debug/... -> verify -> closeout -> next-phase plan/build/...` — common consequential milestone path.

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
- security-policy boundaries;
- canonical Build Ledger mutation boundaries.

## Routing Output

For meaningful routing decisions, return:

- **Objective**
- **Evidence state**
- **Selected route**
- **Why**
- **Not selected**
- **Authority note**
- **Next handoff condition**

## Router Status

Return one of:

- **ROUTED** — an active skill or sequence is appropriate;
- **ROOT FALLBACK** — no active specialist cleanly fits;
- **AWAITING AUTHORITY** — routing is clear but the next consequential action is not authorized;
- **VERIFICATION REQUIRED** — a material claim/acceptance decision needs `signalproof-verify`;
- **MILESTONE CLOSEOUT REQUIRED** — next-phase work should wait for `signalproof-closeout` or explicit owner deferral;
- **BLOCKED** — evidence/registry/current-state information is insufficient to route responsibly;
- **STOP** — proceeding would bypass an explicit protection, authority boundary, verification requirement, closeout requirement, or prior STOP condition.

## Anti-Patterns

Fail this skill when a router:

- routes by a single keyword instead of objective/evidence state;
- treats planned/candidate skills as active;
- routes directly to build when current state must first be investigated;
- accepts a consequential “fixed/ready/production-ready” claim without verification when evidence is incomplete;
- forces Verify on every micro-edit despite no material claim or acceptance gate;
- routes a meaningful accepted milestone directly into the next phase while skipping required closeout;
- forces full closeout on every micro-commit despite no phase boundary;
- routes “diagnose only” to a fixing workflow;
- uses another specialist to bypass an authority or STOP decision;
- invokes every skill in sequence when one specialist is sufficient;
- claims that selecting a capability authorizes its consequential actions;
- invents a specialist that is not in the active registry.

## Completion Criteria

A Signalproof routing decision is complete when the smallest appropriate active skill or sequence has been selected from the canonical registry, the rationale reflects the objective and evidence state, material claims are routed through verification when required, meaningful milestone transitions are routed through closeout when required, authority remains separate from capability, planned/candidate skills were not misrepresented as active, and the next handoff condition is clear when sequencing is required.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-router`
- **Version:** `0.1.2`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Routes among:** active Signalproof specialist skills only
- **Domain:** Capability routing, skill sequencing, verification routing, milestone closeout routing, evidence-state selection, authority-preserving dispatch
- **Created by:** Doc Reo / Signalproof
