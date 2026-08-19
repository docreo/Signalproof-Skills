# `build-git` — Operator Command V0.2.1 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.2.1-candidate  
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
3. **Known Failure Preflight** — search applicable Signalproof failure intelligence and prior evidence for the tool/runtime/action/boundary before repeating costly, failure-prone, or previously failed work. This search must include current `main` plus relevant open/draft Signalproof candidate PRs or candidate records when the needed failure intelligence may not yet be merged. Candidate evidence may inform prevention and routing but must not be treated as Active doctrine or authority.
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

### Retrieval scope

Known Failure Preflight is not satisfied by checking only merged files on `main`.

Search, in order of relevance:

1. current canonical `main` skills, commands, acceptance evidence, and failure intelligence;
2. current work-stream evidence and handoff material;
3. relevant **open or draft Signalproof pull requests and candidate records** when they may contain newer failure intelligence not yet merged;
4. private Build Ledger/failure continuity only when available and needed for the action.

Open/draft candidate material may be used as **historical evidence and prevention intelligence**. It remains Candidate / Not Active unless separately promoted and must not grant authority by itself.

If a known failure is discovered in an open/draft candidate after a generated harness has already repeated it, classify the event as a **Known Failure Preflight miss** and correct the retrieval path before generating the next harness.

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

Before authoring or executing a generated/modified PowerShell harness, Known Failure Preflight must include relevant PowerShell harness reliability evidence, including applicable open/draft candidate PRs when that evidence has not landed on `main`.

For Windows PowerShell / `pshell` harnesses:

- deliver interactive launch logic as one complete statement, preferably one `& { ... }` block; never split an `if` and its `else` across separate submissions;
- parser-preflight the exact final staged `.ps1` with `System.Management.Automation.Language.Parser.ParseFile` before execution;
- calculate SHA-256 after final serialization and verify the same hash immediately before execution;
- preserve failed runners separately and do not broad-patch or overwrite them;
- do not use `ConvertFrom-Json` under Windows PowerShell 5.1 for external JSON whose property names may be arbitrary or empty, such as modern npm lockfile shapes, unless that exact schema has been proven compatible;
- distinguish generic `Dictionary[string,object]` `.ContainsKey()` from non-generic `IDictionary` `.Contains()` before key lookup;
- validate property presence before dereferencing heterogeneous report objects;
- compute ambiguous multiline function-call/index values first rather than relying on parser-sensitive inline expressions;
- treat parser/harness STOP as harness evidence, not product failure, unless separate evidence proves product actuation;
- keep expected console output outside executable command blocks so transcript text cannot be accidentally re-entered as commands;
- canonicalize filesystem paths before deriving relative paths; do not derive byte-sensitive child paths from serialized raw-string lengths.

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

## STOP conditions

STOP when:

- Git current state cannot be established before a consequential action;
- the same known high-confidence failure is about to be repeated under unchanged conditions;
- relevant newer failure intelligence is known to exist in an open/draft Signalproof candidate but has not been inspected before generating the next failure-prone harness;
- the proposed mitigation violates security/licensing/legal/authority boundaries;
- protected state must be changed outside authority;
- a concurrent Git change invalidates the candidate base;
- a projected Build Ledger sequence is being treated as reserved;
- `build-git` is being forced into implementation when the evidence requires investigation/verification first;
- an output would falsely claim independent agents ran;
- a candidate skill/policy is being silently promoted;
- canonical ledger/release/production authority is being inferred from the command itself.

## Promotion requirements

Before Active promotion, test `build-git` on real repository-backed work and prove:

1. at least one invocation correctly routes to a non-build action such as Investigate/Verify before implementation;
2. at least one invocation correctly routes to bounded implementation when implementation is actually justified;
3. Git current-state recheck catches at least one concurrent-state condition or stale base;
4. Known Failure Preflight avoids at least one repeated failure or selects a prior tested mitigation earlier;
5. Known Failure Preflight retrieves relevant open/draft candidate PR evidence when newer failure intelligence is not yet merged on `main`;
6. at least one PowerShell harness generation case applies the relevant known-failure set before authoring and avoids a previously documented parser/interactive/JSON/native-boundary recurrence;
7. changed-condition retest is not overblocked;
8. protected state/rollback or read-only non-mutation boundary remains intact;
9. closeout updates recurrence intelligence without duplicate IDs;
10. build-stream continuity survives unrelated global ledger advancement;
11. `build-git spawn` integration does not confuse Orchestrator/subagent authority.
