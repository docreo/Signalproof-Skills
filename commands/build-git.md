# `build-git` — Operator Command V0.1 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0-candidate  
**Date:** 2026-08-18

## Purpose

`build-git` is the governed Signalproof build-orchestration command for repository-backed implementation work.

Its central rule is:

> **Verify current Git, learn from prior failures, route the smallest governed build path, preserve rollback, and leave proof.**

`build-git` is an operator command, not a separate authority source. It coordinates current Active Signalproof skills and Git evidence. It does not grant canonical Build Ledger, release, security-change, privilege, licensing, legal, or skill-activation authority.

## Mandatory sequence

For consequential work:

1. **Git preflight** — refetch the current relevant repository branch/head and verify the intended base before design/build writes.
2. **Router preflight** — load the smallest applicable Active Signalproof skills; do not load the whole suite without need.
3. **Known Failure Preflight** — search applicable Signalproof failure intelligence and prior evidence for the tool/runtime/action/boundary before repeating costly, failure-prone, or previously failed work.
4. **Protected-state contract** — establish baseline, rollback, forbidden-change boundaries, and current build-stream identity.
5. **Plan/design as required** — do not let implementation silently replace product requirements.
6. **Build** — implement the smallest authorized change surface.
7. **Incremental verify** — test the changed boundary before stacking additional uncertain changes.
8. **Independent review/security/provenance checks as applicable.**
9. **Git recheck before consequential publication/promotion** — detect concurrent branch/main movement rather than assuming the earlier preflight remains current.
10. **Closeout** — preserve evidence, failures, known-failure recurrence/mitigation updates, rollback, learning, Build Ledger state, and next authority.

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

A build may pause while unrelated Build Ledger events continue.

`build-git` must preserve a stable build-stream identity and the stream's own last accepted anchor. On resume:

- verify the current product/repository state;
- verify the current global Build Ledger state if ledger action matters;
- connect the new milestone to the prior stream anchor;
- append canonically only at the then-current global head when authorized;
- never renumber historical work merely to make the stream appear contiguous.

## `build-git spawn`

`build-git spawn` is the multi-role extension under separate candidate governance. The main LLM/session remains the **Signalproof Orchestrator** and coordinates three subordinate roles when the environment truly supports them:

- Builder Agent;
- Design Agent;
- Governor Agent.

If independent spawning is unavailable, execute the same role-separated protocol as logical lanes and state that accurately.

Known Failure Preflight occurs **before delegation** so all subordinate roles receive the relevant failure constraints. Any new recurrence discovered by a subordinate role returns to the Orchestrator for evidence reconciliation and later closeout/update.

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

## STOP conditions

STOP when:

- Git current state cannot be established before a consequential write;
- the same known high-confidence failure is about to be repeated under unchanged conditions;
- the proposed mitigation violates security/licensing/legal/authority boundaries;
- protected state must be changed outside authority;
- a concurrent Git change invalidates the candidate base;
- a projected Build Ledger sequence is being treated as reserved;
- an output would falsely claim independent agents ran;
- a candidate skill/policy is being silently promoted;
- canonical ledger/release/production authority is being inferred from the command itself.

## Promotion requirements

Before Active promotion, test `build-git` on real repository-backed builds and prove:

1. Git current-state recheck catches at least one concurrent-state condition or stale base;
2. Known Failure Preflight avoids at least one repeated failure or selects a prior tested mitigation earlier;
3. changed-condition retest is not overblocked;
4. protected state/rollback remain intact;
5. closeout updates recurrence intelligence without duplicate IDs;
6. build-stream continuity survives unrelated global ledger advancement;
7. `build-git spawn` integration does not confuse Orchestrator/subagent authority.
