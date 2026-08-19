# `design-git` — Operator Command V0.2 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.2.0-candidate  
**Date:** 2026-08-18

## Purpose

`design-git` is the governed Signalproof **next-action design and routing workmode**.

Its central rule is:

> **Verify current Git and evidence, identify what is actually known, preserve protected state, check prior failures, and design the smallest governed next action before execution.**

`design-git` is broader than the `signalproof-design` product/UI specialist. It may route to that specialist when information architecture or visual/state design is central, but it may instead conclude that the next correct action is Investigate, Query, Research, Evaluate, Plan, Readiness, Verify, Review, Security, Recovery, Build, Debug, Document, Learn, Handoff, or Closeout.

`design-git` does not itself grant execution authority. Its primary output is a **Next Action Contract** for `build-git` or another explicitly selected command to consume.

## Mandatory sequence

For consequential work:

1. **Verify governing Git state** — fetch current relevant repository/ref and bind the decision to that state.
2. **Establish current work/build stream** — product/project, current phase, prior stream anchor, open/closed state, protected baseline, rollback/non-mutation boundary, dependencies, and unresolved gates.
3. **Read current evidence** — strongest relevant source, runtime, human-observed, design-authority, and prior decision evidence.
4. **Known Failure Preflight** — inspect applicable known-failure intelligence before designing a retry or reusing a failure-prone harness/tool/path.
5. **Route by evidence state** — use the current Active `signalproof-router` and only the smallest needed specialists.
6. **Define the next action** — make it singular or tightly bounded enough to execute without silent scope growth.
7. **Define acceptance/evidence** — state what would prove the action succeeded or what evidence should be returned.
8. **Define STOP conditions** — authority, protected state, security, provenance, licensing/legal, stale Git, contradictory evidence, or changed conditions that require replanning.
9. **Emit the Next Action Contract.**

## Next Action Contract

The contract should be compact but contain enough information for another competent agent/session to execute safely:

```text
NEXT ACTION CONTRACT
Work stream: <stable stream identity>
Git basis: <repo/ref/head>
Current state: <open/closed/blocked/etc.>
Objective: <single bounded outcome>
Route: <Active specialist or sequence>
Action class: READ / QUERY / INVESTIGATE / RESEARCH / DECIDE / DESIGN / TEST / VERIFY / BUILD / DEBUG / RECOVER / DOCUMENT / CLOSE
Protected state: <must-not-change>
Allowed surface: <what may be touched/read/executed>
Known-failure constraints: <applicable IDs/rules or none found>
Dependencies/authority: <required before action>
Acceptance evidence: <what proves outcome>
STOP conditions: <conditions requiring halt/re-design>
Closeout trigger: <when meaningful milestone closes>
```

Not every field needs verbose prose; compact exactness is preferred.

## Route selection examples

### Unknown cause or state

Route:

`signalproof-investigate`

Do not build a correction yet.

### Need to inspect repository/file/API evidence

Route to the appropriate query/read mechanism plus `signalproof-verify` when a material claim needs proof.

The action remains read-only unless a later contract separately authorizes mutation.

### Current external information needed

Route:

`signalproof-research`

### Evidence exists and a disposition is needed

Route:

`signalproof-evaluate`

### Product information architecture or visual/state behavior needs design

Route:

`signalproof-design`

### Implementation objective is known but execution contract is not bounded

Route:

`signalproof-plan` and, where applicable, `signalproof-design` before Build.

### Implementation is already bounded and authorized

Route:

`signalproof-build`

### Defect is reproduced/localized enough for bounded correction

Route:

`signalproof-debug`

### Claim must be proven

Route:

`signalproof-verify`

### Security/provenance/authority uncertainty materially affects action

Route:

`signalproof-security` and/or appropriate provenance/review path before actuation.

### Milestone is actually complete

Route:

`signalproof-closeout` / `log-skill close` as applicable.

## Relationship to `signalproof-design`

`signalproof-design` is a specialist skill for product information architecture, workflow/state presentation, dashboard/technical-view semantics, visual acceptance, and related design concerns.

`design-git` is an orchestration command that designs **what should happen next**.

Therefore:

```text
DESIGN-GIT
  may route to
  ├─ Investigate
  ├─ Research
  ├─ Plan
  ├─ signalproof-design
  ├─ Verify
  ├─ Security
  ├─ Build
  └─ other Active governed routes
```

Do not assume UI design merely because the command contains the word `design`.

## Known Failure Intelligence

Before proposing a retry, wrapper, script, package operation, test harness, Git operation, recovery action, security change, or evidence parser that matches a prior Signalproof failure class, include the relevant failure constraint in the Next Action Contract.

A known-failure match may change the next action from BUILD to INVESTIGATE, from RETRY to REUSE MITIGATION, or to STOP.

Changed conditions may justify a deliberate retest; record what changed.

## Build-stream / chronology rule

`design-git` works with stable build/work-stream lineage, not reserved Build Ledger sequence numbers.

When a stream resumes after unrelated work:

- identify its own prior stream anchor;
- inspect what changed globally or in dependencies while it was paused;
- design the next action from current state;
- never force the next milestone into an old projected `C###` slot.

## Public/private and legal boundary

The Next Action Contract must preserve public/private evidence classification and any relevant:

- license/redistribution limits;
- attribution/notice requirements;
- contractual or customer restrictions;
- secrets/privacy boundaries;
- security/provenance uncertainty;
- owner-only approval gates.

Do not infer permission from technical accessibility.

## Relationship to `build-git`

`design-git` decides and bounds the next action.

`build-git` executes it.

```text
design-git
   ↓
Next Action Contract
   ↓
build-git
   ↓
execute routed Active specialist/action
```

If evidence changes materially during execution, `build-git` must stop and return to `design-git` or another planning/investigation route instead of silently rewriting the contract.

## Relationship to `log-build-git`

`log-build-git` runs:

`log-skill -> design-git -> build-git`

This makes current learning durable before the next action is designed and executed.

## STOP conditions

STOP or return a non-executable contract when:

- governing Git/current evidence cannot be established;
- current work-stream identity or protected state is materially ambiguous;
- prior known-failure evidence indicates the proposed action would blindly repeat a high-confidence failure;
- execution requires authority not yet granted;
- security/provenance/license/legal uncertainty is material and unresolved;
- a projected Build Ledger number is being treated as reserved;
- contradictory evidence means the next action cannot yet be selected honestly;
- the command would fabricate system state or agent capabilities.

## Promotion requirements

Before Active promotion, demonstrate that `design-git`:

1. routes at least one real case to Investigation rather than premature Build;
2. routes at least one real case to bounded Build after sufficient evidence;
3. routes at least one materially different case to another specialist such as Research/Verify/Security/Design;
4. carries known-failure constraints into the Next Action Contract;
5. preserves protected state and read-only boundaries;
6. survives a paused/resumed build stream without reserving C-numbers;
7. detects stale/concurrent Git state before consequential execution;
8. reduces unnecessary context reconstruction while preserving exact next-step authority.
