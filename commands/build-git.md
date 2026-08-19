# `build-git` — Operator Command V0.2 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.2.0-candidate  
**Date:** 2026-08-18

## Purpose

`build-git` is the governed Signalproof **next-action execution workmode** for repository-backed work.

Its central rule is:

> **Verify current Git, learn from prior failures, route the smallest governed next action, execute only that action, preserve rollback where applicable, and leave proof.**

The word `build` in this operator command does **not** mean every invocation must write code. `build-git` may route the next governed action to Research, Investigate, Query/Inspect, Evaluate, Plan, Design, Readiness, Build, Debug, Verify, Review, Security, Recovery, Release, Document, Learn, Handoff, or Closeout according to current evidence and authority.

`signalproof-build` remains the implementation specialist and is loaded only when implementation is actually the routed action.

`build-git` is an operator command, not a separate authority source. It coordinates current Active Signalproof skills and Git evidence. It does not grant canonical Build Ledger, release, security-change, privilege, licensing, legal, or skill-activation authority.

## Mandatory sequence

For consequential work:

1. **Git preflight** — refetch the current relevant repository branch/head and verify the intended base before consequential action.
2. **Router preflight** — determine the smallest applicable Active Signalproof route; do not assume `signalproof-build` is required.
3. **Known Failure Preflight** — search applicable Signalproof failure intelligence and prior evidence for the tool/runtime/action/boundary before repeating costly, failure-prone, or previously failed work.
4. **Protected-state / evidence contract** — establish baseline, rollback or non-mutation boundary, forbidden changes, current build-stream identity, and evidence needed for the routed action.
5. **Consume the current Next Action Contract** — when `design-git` or another governed plan already produced one, execute that contract rather than silently redesigning it.
6. **Execute the routed action** — investigate, query, inspect, research, evaluate, plan, design, test, verify, build, debug, review, recover, document, or otherwise act only within the selected route and authority.
7. **Incremental verification** — verify the affected boundary before stacking additional uncertain actions.
8. **Independent review/security/provenance checks as applicable.**
9. **Git recheck before consequential write/publication/promotion** — detect concurrent branch/main movement rather than assuming the earlier preflight remains current.
10. **Closeout / continuity update** — preserve evidence, failures, known-failure recurrence/mitigation updates, rollback or non-mutation state, learning, Build Ledger/build-stream state, and next authority when a meaningful boundary is reached.

## Routed next-action classes

### Read-only truth finding

Examples:

- `signalproof-research` — current external/source evidence;
- `signalproof-investigate` — unknown system/build/runtime state or failure cause;
- `signalproof-verify` — prove a specific claim;
- repository/file/query inspection using the appropriate connected source and evidence class.

Read-only action must remain read-only unless later evidence and authority establish a separate write step.

### Decision / design

Examples:

- `signalproof-evaluate` — disposition;
- `signalproof-plan` — bounded execution contract;
- `signalproof-design` — product information architecture / state presentation when that is actually central;
- `signalproof-security` — security-sensitive trust/authority review;
- `signalproof-readiness` — prerequisite/capability state.

### Actuation

Examples:

- `signalproof-build` — bounded implementation;
- `signalproof-debug` — bounded defect correction;
- `signalproof-recovery` — rollback/restoration;
- `signalproof-release` — exact-artifact promotion when separately authorized.

### Continuity / durable state

Examples:

- `signalproof-document`;
- `signalproof-learn`;
- `signalproof-handoff`;
- `signalproof-closeout`;
- Active operator commands such as `log-skill` when their trigger is satisfied.

## Known Failure Preflight

Before consequential execution, ask whether the intended path matches a known Signalproof failure fingerprint.

Search by combinations of:

- shell/interpreter/runtime;
- tool/framework/dependency;
- operating system/platform;
- command/action;
- wrapper/harness pattern;
- symptom/error text;
- parser/schema behavior;
- path/encoding/line-ending behavior;
- permissions/privilege/security surface;
- packaging/provenance/license/legal boundary;
- protected-state or Build Ledger chronology pattern.

Decision:

- `NO KNOWN MATCH` -> proceed normally;
- `POSSIBLE MATCH` -> inspect evidence;
- `KNOWN FAILURE / MITIGATION AVAILABLE` -> use the tested mitigation unless current evidence justifies a different method;
- `KNOWN FAILURE / CONDITIONS CHANGED` -> retest deliberately and record the changed condition;
- `KNOWN FAILURE / NO APPROVED MITIGATION` -> investigate/plan before retry;
- `PROHIBITED / STOP` -> do not repeat.

Do not turn a keyword match into a diagnosis. Match the supported conditions and cause.

## Initial high-value prevention examples

### Generated PowerShell or changed wrapper syntax

Parse/validate before consequential execution when syntax changed or the wrapper is not already accepted.

### PowerShell 5.1 native stderr

Do not use stderr presence as the success/failure signal for native tools that legitimately emit progress/notices there. Preserve stdout/stderr separately and bind acceptance to actual native exit status plus expected artifacts.

### Heterogeneous report objects

Validate field/property presence before dereferencing acceptance evidence objects.

### Git byte-sensitive packaging

When hashes/manifests are byte-sensitive, verify line-ending/attribute/archive behavior rather than assuming Git preserves Windows bytes exactly.

### Protected-state conflict

Do not weaken a working protection gate because it blocks the planned change. Narrow, isolate, replan, or obtain new authority.

### Build Ledger sequence projections

Never treat a projected C-number as reserved. Recheck canonical chronology immediately before any authorized append plan.

## Build-stream continuity

A build/work stream may pause while unrelated Build Ledger events continue.

`build-git` must preserve a stable build-stream identity and the stream's own last accepted anchor. On resume:

- verify the current product/repository state;
- verify the current global Build Ledger state if ledger action matters;
- connect the new milestone to the prior stream anchor;
- append canonically only at the then-current global head when authorized;
- never renumber historical work merely to make the stream appear contiguous.

## Relationship to `design-git`

`design-git` is the Git-backed **next-action design/routing workmode**. It produces a compact Next Action Contract based on current Git, prior evidence, known failures, protected state, and the Router.

`build-git` consumes that contract and performs the routed action.

This distinction prevents two common errors:

- using `design-git` as if it always means UI/product design;
- using `build-git` as if it always means code implementation.

## Relationship to `log-build-git`

`log-build-git` is the ordered composite:

`log-skill -> design-git -> build-git`

The first step preserves current state/learning, the second designs the next governed action, and the third executes that routed action.

## `build-git spawn`

`build-git spawn` is the multi-role extension under separate candidate governance. The main LLM/session remains the **Signalproof Orchestrator** and coordinates three subordinate roles when the environment truly supports them:

- Builder Agent;
- Design Agent;
- Governor Agent.

If independent spawning is unavailable, execute the same role-separated protocol as logical lanes and state that accurately.

Known Failure Preflight occurs **before delegation** so all subordinate roles receive the relevant failure constraints. Any new recurrence discovered by a subordinate role returns to the Orchestrator for evidence reconciliation and later closeout/update.

`build-git spawn` should be used only when multi-role separation provides material value. A read-only query or simple investigation does not need three subagents merely because the command exists.

## Closeout failure-intelligence update

At meaningful closeout, determine whether:

- a known failure recurred;
- a tested mitigation worked again;
- conditions changed;
- a new failure fingerprint is justified;
- an existing fingerprint should be narrowed, strengthened, superseded, or retired;
- the lesson affects root/specialist skills, tests, commands, or documentation.

Do not create duplicate failure IDs for the same supported cause/mitigation class.

## Licensing / legal / governance boundary

A known technical workaround is not automatically allowed. Before reuse, preserve applicable:

- upstream license and redistribution terms;
- attribution/notices;
- proprietary/private boundaries;
- customer/data/privacy obligations;
- security/credential constraints;
- owner approval;
- public/private evidence boundaries.

When permission is unresolved, preserve `UNKNOWN` and route to the appropriate provenance/legal/governance review rather than inventing authority.

## Generated output typography rule

When `build-git` generates Signalproof-controlled build output, it MUST NOT emit Unicode em dash U+2014 characters.

This applies to generated:

- user-facing build instructions;
- PowerShell and shell wrappers;
- comments and strings created by the build when punctuation is under Signalproof control;
- handoffs, manifests, evidence summaries, closeout records, release notes, and build documentation;
- labels and filenames when punctuation is under Signalproof control.

Use context-appropriate alternatives such as commas, colons, semicolons, parentheses, or ASCII hyphen-minus `-`.

Before emitting or writing generated build material, perform a final U+2014 check and replace it when the text is under Signalproof control.

This rule does not authorize rewriting immutable source evidence, quoted external evidence, checksum-covered artifacts, or protected byte-for-byte inputs merely to satisfy presentation style.

## STOP conditions

STOP when:

- Git current state cannot be established before a consequential action;
- the same known high-confidence failure is about to be repeated under unchanged conditions;
- the proposed mitigation violates security/licensing/legal/authority boundaries;
- protected state must be changed outside authority;
- a concurrent Git change invalidates the candidate base;
- a projected Build Ledger sequence is being treated as reserved;
- `build-git` is being forced into implementation when the evidence requires investigation/verification first;
- an output would falsely claim independent agents ran;
- a candidate skill/policy is being silently promoted;
- canonical ledger/release/production authority is being inferred from the command itself;
- generated Signalproof-controlled build output contains U+2014 when the character is not required by immutable/protected source evidence.

## Promotion requirements

Before Active promotion, test `build-git` on real repository-backed work and prove:

1. at least one invocation correctly routes to a non-build action such as Investigate/Verify before implementation;
2. at least one invocation correctly routes to bounded implementation when implementation is actually justified;
3. Git current-state recheck catches at least one concurrent-state condition or stale base;
4. Known Failure Preflight avoids at least one repeated failure or selects a prior tested mitigation earlier;
5. changed-condition retest is not overblocked;
6. protected state/rollback or read-only non-mutation boundary remains intact;
7. closeout updates recurrence intelligence without duplicate IDs;
8. build-stream continuity survives unrelated global ledger advancement;
9. `build-git spawn` integration does not confuse Orchestrator/subagent authority;
10. generated Signalproof-controlled build output contains no U+2014 except where immutable/protected evidence requires byte preservation.
