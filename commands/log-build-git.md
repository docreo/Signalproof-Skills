# `log-build-git` — Ordered Operator Command V0.1 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0-candidate  
**Date:** 2026-08-18

## Purpose

`log-build-git` is the ordered Signalproof orchestration command for continuing governed work after meaningful progress, discoveries, failures, corrections, decisions, or phase transitions.

Its required order is:

```text
log-skill
   ↓
design-git
   ↓
build-git
```

The command means:

> **Preserve what we have learned, design the next governed action from current evidence, then execute that action through the current Git-backed Signalproof workmode.**

This is an operator-command composition, not a new specialist skill and not a new authority source.

## Core semantics

`log-build-git` does not imply that the next action is software implementation.

The `design-git` phase may determine that the next correct action is to:

- investigate;
- query/search/read;
- inspect/examine;
- research;
- evaluate;
- plan;
- design;
- check readiness;
- test;
- verify;
- review;
- perform security/provenance analysis;
- build;
- debug;
- recover;
- document;
- close/handoff;
- or STOP pending human authority/evidence.

`build-git` then executes only the routed action.

## Phase 1 — `log-skill`

Run the Active `log-skill` command first.

Purpose:

- preserve/synchronize the current meaningful work state;
- record failures and uncertainty rather than losing them between actions;
- extract reusable learning candidates when warranted;
- update or reference known-failure intelligence when a recurring pattern exists;
- preserve public/private boundaries;
- preserve current build/work-stream identity and closeout obligations;
- stage rather than fabricate canonical Build Ledger chronology when canonical append is not available/authorized.

Default `log-build-git` uses plain `log-skill`, not `log-skill close`, unless the current milestone is actually complete and the user/current governance explicitly calls for closure.

Therefore invocation of `log-build-git` must not falsely close an open phase.

## Phase 2 — `design-git`

After logging/synchronization, invoke `design-git` against the **newly preserved current state**.

Required outputs:

- current governing Git/ref;
- current work/build stream;
- protected state / non-mutation boundary;
- relevant prior failures and proven mitigations;
- unresolved evidence/authority/security/provenance/licensing/legal gates;
- smallest appropriate Active Signalproof route;
- one bounded **Next Action Contract**;
- acceptance evidence and STOP conditions.

The next action must be selected from current evidence, not from momentum or an assumption that a build must follow every log.

## Phase 3 — `build-git`

Execute the Next Action Contract through `build-git`.

`build-git` must:

- recheck current Git as required;
- consume the designed route instead of silently substituting another objective;
- apply Known Failure Preflight before failure-prone/consequential execution;
- use the smallest relevant Active specialist(s);
- preserve protected state/rollback or read-only boundary;
- stop and return to design/investigation if material evidence changes;
- leave proof of what was actually done;
- maintain work-stream continuity without reserving Build Ledger C-numbers.

## Default status behavior

The composite may end with different legitimate outcomes:

- `LOGGED -> INVESTIGATION COMPLETE`
- `LOGGED -> QUERY/INSPECTION COMPLETE`
- `LOGGED -> RESEARCH COMPLETE`
- `LOGGED -> DESIGN/PLAN COMPLETE`
- `LOGGED -> VERIFICATION COMPLETE`
- `LOGGED -> BUILD CANDIDATE PASS`
- `LOGGED -> BLOCKED`
- `LOGGED -> STOP / OWNER DECISION REQUIRED`
- `LOGGED -> MILESTONE CLOSEOUT REQUIRED`

The command must not manufacture a build success simply because its name includes `build`.

## Examples

### Example A — recurring PowerShell failure

Current run fails with a PowerShell parser pattern already known to Signalproof.

`log-build-git` should:

1. `log-skill` — preserve the failed attempt/recurrence without closing the open build;
2. `design-git` — match known-failure intelligence and define a parser-validation/inspection action rather than another blind execution;
3. `build-git` — perform the inspection/verified correction path.

### Example B — unknown runtime condition

Current app appears broken but cause is unclear.

1. log current evidence;
2. design next action as `signalproof-investigate`;
3. execute read-only/runtime investigation;
4. do not modify product code merely because `log-build-git` was invoked.

### Example C — implementation is ready

Design, protected baseline, acceptance matrix, dependencies, and authority are already established.

1. log prior design/decision state;
2. design next action as bounded `signalproof-build`;
3. execute implementation through `build-git`;
4. verify/close according to the contract.

### Example D — evidence requires external research

A dependency/license/API behavior is uncertain and material.

1. log current uncertainty;
2. route next action to Research/provenance review;
3. execute research;
4. return to design/build only after evidence resolves the gate.

## Relationship to `build-git spawn`

If `design-git` determines the next action is a consequential multi-role build where independent Builder/Design/Governor challenge provides material value, its Next Action Contract may select:

`build-git spawn`

The main LLM/session remains the Signalproof Orchestrator. Spawn is not the default for simple queries, inspections, or narrow actions.

## Build Ledger / build-stream rule

The command maintains two distinct concepts:

- stable build/work-stream lineage;
- global canonical Build Ledger chronology.

`log-build-git` never reserves a `C###` number. Logging a paused/open build keeps its stream state durable. When work resumes, current chronology is rechecked and any future canonical event appends at the then-current valid head under separate authority.

## Idempotency / repeated invocation

Repeated `log-build-git` must not duplicate the same log record or failure identity merely because the command is invoked again.

Each invocation should determine:

- whether current state already has a stable log identity;
- whether new evidence materially changes it;
- whether a known failure is recurrence under an existing failure ID;
- whether a new Next Action Contract is actually required.

## Authority boundary

Invocation authorizes the command sequence and ordinary read/Git-governed routing needed to perform it. It does **not** by itself authorize:

- destructive host changes;
- privilege elevation;
- credentials/secrets use;
- security-control modification;
- third-party licensing/legal exceptions;
- protected-state overwrite;
- release/deployment;
- direct protected-main mutation;
- skill/policy activation;
- canonical Build Ledger append when its separate gates are unsatisfied.

The routed action may require explicit human authority before execution.

## Failure / STOP conditions

STOP the composite before Phase 3 when:

- `log-skill` cannot preserve the current state without fabricating chronology or leaking private data;
- governing Git/current project state materially changed and must be reconciled;
- `design-git` cannot establish a trustworthy next action;
- the proposed next action repeats a high-confidence known failure with unchanged conditions;
- protected state/authority/security/provenance/license/legal gates remain unresolved;
- the next action requires a human-owned decision;
- the designed action and available execution capability do not match;
- continuing would silently convert an open milestone into a closed one.

## Acceptance requirements

Before Active promotion, exercise `log-build-git` on materially different real workflows and demonstrate at minimum:

1. one case where the final action is investigation/query rather than code build;
2. one case where the final action is bounded implementation;
3. one case where known-failure intelligence changes the chosen next step;
4. open work remains open after plain `log-skill`;
5. completed work can separately route to proper closeout;
6. current Git is checked across the sequence and concurrent/stale state is not silently ignored;
7. build/work-stream continuity survives unrelated Build Ledger advancement;
8. public/private and security/licensing/legal boundaries remain intact;
9. repeated invocation is idempotent for existing log/failure identities;
10. `build-git spawn` is selected only when multi-role orchestration is actually justified.

## Identity

- **Command:** `log-build-git`
- **Type:** ordered Git-backed Signalproof orchestration command
- **Order:** `log-skill -> design-git -> build-git`
- **Maturity:** Candidate / Not Active
- **Created by:** Doc Reo / Signalproof
