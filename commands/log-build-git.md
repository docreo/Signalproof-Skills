# `/log-build-git` — Ordered Operator Command V0.2 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.2.0-candidate  
**Date:** 2026-08-18

## Purpose

`/log-build-git` is the ordered Signalproof orchestration command for continuing governed work after meaningful progress, discoveries, failures, corrections, decisions, phase transitions, or receipt of a governed `/handoff-log` transfer.

Its normal order is:

```text
/log-skill
   ↓
/design-git
   ↓
/build-git
```

The command means:

> **Preserve what is true, recover current governing doctrine and provenance, design the next governed action from current evidence, then execute only that routed action.**

This is an operator-command composition, not a new specialist skill and not a new authority source.

## Canonical command

`/log-build-git`

Conversational shorthand may omit the slash in ordinary chat, but the slash form is the canonical command identity.

## Handoff receipt/bootstrap mode

When `/log-build-git` is invoked as the first command in a fresh chat after receiving a `/handoff-log` packet, it MUST treat the invocation as:

```text
RECEIVE HANDOFF
   ↓
REFETCH GOVERNING GIT
   ↓
RECONCILE PRIVATE/PUBLIC CONTINUITY
   ↓
RECORD RECEIPT
   ↓
/log-skill
   ↓
/design-git
   ↓
/build-git
```

The receiving chat must not rely on remembered command definitions when GitHub is available.

### Handoff bootstrap preflight

Before normal Phase 1, do the following proportionately:

1. Read `WORK-CHAT-HANDOFF.md` and identify its handoff ID, work/build-stream identity, stated Git snapshots, protected state, authority, material failures, and Exact Next Gate.
2. Refetch `docreo/Signalproof-Skills/main`.
3. Read the current public command definitions required for the transfer, beginning with:
   - `commands/log-build-git.md`;
   - `commands/design-git.md`;
   - `commands/build-git.md`;
   - `commands/handoff-log.md`.
4. Read the current `skills/signalproof-router/SKILL.md` and load only the smallest applicable Active specialist skills.
5. Determine whether private Signalproof continuity is accessible.
6. If private access exists, refetch `docreo/Signalproof-Build-Ledger/main` and retrieve only task-relevant private handoff, continuity, protected-state, failure-intelligence, evidence, staged/canonical ledger, and project records.
7. If private access does not exist, mark private continuity `UNAVAILABLE`; use current public Git plus the handoff's public-safe embedded/referenced evidence. Do not guess private state.
8. Compare handoff-time snapshots to receiving-time current Git/evidence and record any material drift.
9. Deduplicate against any prior receipt/log record for the same handoff ID/hash.
10. Only after current doctrine/provenance is established, continue to `/log-skill -> /design-git -> /build-git`.

### Handoff Receipt Record

Preserve, where available:

```text
HANDOFF RECEIPT
Handoff ID:
Handoff hash:
Source work/build stream:
Source phase/state:
Handoff-time public Git snapshot:
Receiving-time public Git snapshot:
Private continuity: AVAILABLE / UNAVAILABLE / PARTIAL
Receiving-time private Git snapshot:
Private records retrieved:
Material drift since handoff:
Protected state confirmed:
Authority confirmed:
Known-failure constraints:
Receipt status: RECEIVED / RECONCILIATION_REQUIRED / BLOCKED
```

The receipt is provenance evidence, not milestone closure.

## Current Git doctrine rule

For Signalproof work, `/log-build-git` must treat the current GitHub repository as the authoritative source for command/skill definitions when accessible.

The handoff tells the receiver **what mission to continue and where to look**. GitHub tells the receiver **what the commands and skills currently mean**.

Do not duplicate stale doctrine from a handoff when a newer current Git definition exists. If the current Git definition materially changes the planned next action, preserve that drift and redesign before execution.

## Private/public retrieval rule

When current work depends on prior private state:

- prefer current task-relevant private Build Ledger/project evidence when accessible;
- preserve its evidence class and lifecycle state;
- do not preload unrelated private repository history;
- do not leak private details into public Git/output;
- if private access is unavailable, explicitly preserve `UNAVAILABLE` and choose a public-safe read-only verification/investigation gate or STOP when mutation would require missing private truth.

Public fallback is not permission to invent private continuity.

## Core semantics

`/log-build-git` does not imply that the next action is software implementation.

`/design-git` may determine that the next correct action is to investigate, query/search/read, inspect/examine, research, evaluate, plan, design, check readiness, test, verify, review, perform security/provenance analysis, build, debug, recover, document, close/handoff, or STOP pending human authority/evidence.

`/build-git` executes only the routed action.

## Phase 1 — `/log-skill`

Run the Active `/log-skill` command first after any required handoff-bootstrap receipt.

Purpose:

- preserve/synchronize the current meaningful work state;
- record handoff receipt/provenance when this invocation came from a transfer;
- record failures and uncertainty rather than losing them between actions;
- extract reusable learning candidates when warranted;
- update or reference known-failure intelligence when a recurring pattern exists;
- preserve public/private boundaries;
- preserve current build/work-stream identity and closeout obligations;
- stage rather than fabricate canonical Build Ledger chronology when canonical append is unavailable/unauthorized.

Default `/log-build-git` uses plain `/log-skill`, not `/log-skill close`, unless the current milestone is actually complete and the user/current governance explicitly calls for closure.

Therefore invocation must not falsely close an open phase or merely close work because it crossed a chat boundary.

## Phase 2 — `/design-git`

After logging/synchronization, invoke `/design-git` against the newly reconciled current state.

Required outputs:

- current governing Git/ref;
- current work/build stream;
- current private/public continuity state;
- protected state / non-mutation boundary;
- relevant prior failures and proven mitigations;
- unresolved evidence/authority/security/provenance/licensing/legal gates;
- smallest appropriate Active Signalproof route;
- one bounded Next Action Contract;
- acceptance evidence and STOP conditions.

When a handoff supplied an Exact Next Gate, treat it as transferred intent, not immutable current truth. Revalidate it against current Git/evidence before execution.

## Phase 3 — `/build-git`

Execute the Next Action Contract through `/build-git`.

`/build-git` must:

- recheck current Git as required;
- consume the designed route instead of silently substituting another objective;
- apply Known Failure Preflight before failure-prone/consequential execution;
- use the smallest relevant Active specialist(s);
- preserve protected state/rollback or read-only boundary;
- stop and return to design/investigation if material evidence changes;
- leave proof of what was actually done;
- maintain work-stream continuity without reserving Build Ledger C-numbers.

## Known Failure Preflight

Before consequential execution, search current applicable failure intelligence and prior evidence by supported conditions: tool/runtime/version/environment/action/symptom/protected boundary, not keywords alone.

Possible decisions:

- `NO KNOWN MATCH`;
- `POSSIBLE MATCH`;
- `KNOWN FAILURE / MITIGATION AVAILABLE`;
- `KNOWN FAILURE / CONDITIONS CHANGED`;
- `KNOWN FAILURE / NO APPROVED MITIGATION`;
- `PROHIBITED / STOP`.

Do not repeat a high-confidence known failure under unchanged conditions merely because the receiving chat is fresh.

## Build Ledger / build-stream rule

Maintain two distinct concepts:

- stable build/work-stream lineage;
- global canonical Build Ledger chronology.

`/log-build-git` never reserves a `C###` number. A handed-off stream keeps its identity and prior stream anchor even when unrelated global chronology advanced between chats.

Any future canonical append occurs only at the then-current verified global head under separate authority and chain-safe tooling.

## Handoff provenance chain

When invoked from `/handoff-log`, maintain a durable conceptual chain:

```text
SOURCE CHAT / WORK STREAM
    ↓
/handoff-log
    ↓
HANDOFF ID + ARTIFACT HASH + SOURCE SNAPSHOTS
    ↓
RECEIVING /log-build-git
    ↓
CURRENT GIT + PRIVATE/PUBLIC RECONCILIATION
    ↓
HANDOFF RECEIPT
    ↓
NEXT ACTION CONTRACT
    ↓
EXECUTION EVIDENCE
```

This chain exists to preserve provenance and governance across chat boundaries, especially for Signalproof work.

## Idempotency

Repeated `/log-build-git` must not duplicate the same log record, handoff receipt, or failure identity merely because the command is invoked again.

For a previously received handoff:

- compare handoff ID/hash;
- reuse the prior receipt when still valid;
- update only material drift/current-state changes;
- do not re-log the transfer as a new exchange unless it was superseded by a new handoff artifact.

## Authority boundary

Invocation authorizes the command sequence and ordinary read/Git-governed routing needed to perform it. It does not by itself authorize destructive host changes, privilege elevation, credentials/secrets use, security-control modification, third-party licensing/legal exceptions, protected-state overwrite, release/deployment, direct protected-main mutation, skill/policy activation, or canonical Build Ledger append when its separate gates are unsatisfied.

The routed action may still require explicit human authority before execution.

## Lifecycle rule

Current Git presence is not the same as Active lifecycle state.

- Read current command/skill files to understand them.
- Use Active contracts as governing authority.
- Candidate files may inform current candidate testing or explicitly owner-authorized candidate workflows, but must not be silently promoted to Active because they are present in `main` or referenced by a handoff.

## STOP conditions

STOP before Phase 3 when:

- a handoff receipt cannot establish the transfer identity or work stream;
- governing Git/current project state cannot be established;
- private continuity is required for safe mutation but unavailable;
- `/log-skill` cannot preserve current state without fabricating chronology or leaking private data;
- `/design-git` cannot establish a trustworthy next action;
- the proposed next action repeats a high-confidence known failure with unchanged conditions;
- protected state/authority/security/provenance/license/legal gates remain unresolved;
- the next action requires a human-owned decision;
- the designed action and available execution capability do not match;
- continuing would silently convert an open milestone into a closed one;
- a Candidate is being treated as Active merely because the handoff or Git file mentions it.

## Acceptance requirements

Before Active promotion, exercise `/log-build-git` on materially different real workflows and demonstrate at minimum:

1. one fresh-chat `/handoff-log` receipt where the receiver refetches current Git doctrine and logs receipt before continuation;
2. one private-access handoff where task-relevant private Build Ledger continuity is retrieved selectively;
3. one no-private-access handoff where private state is marked unavailable and no guessing occurs;
4. one case where current Git drift changes/revalidates the transferred Next Gate;
5. one case where final action is investigation/query rather than code build;
6. one case where final action is bounded implementation;
7. one case where known-failure intelligence changes the chosen next step;
8. open milestone remains open after plain `/log-skill`;
9. repeated receipt is idempotent;
10. public/private and security/licensing/legal boundaries remain intact.

## Identity

- **Command:** `/log-build-git`
- **Type:** ordered Git-backed Signalproof orchestration + handoff receipt/bootstrap command
- **Order:** `[/handoff receipt preflight] -> /log-skill -> /design-git -> /build-git`
- **Version:** 0.2.0-candidate
- **Maturity:** Candidate / Not Active
- **Created by:** Doc Reo / Signalproof
