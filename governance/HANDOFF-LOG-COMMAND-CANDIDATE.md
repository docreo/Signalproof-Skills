# Signalproof `/handoff-log` Command Candidate

**Status:** CANDIDATE / NOT ACTIVE

## Purpose

`/handoff-log` is a composite operator command for situations where Signalproof work must be handed to another chat/session **and** the current work state should be durably logged with reusable learning extracted where justified.

It composes existing governed capabilities rather than replacing them.

Central rule:

> **Preserve continuity, preserve evidence, preserve learning, and never turn a chat boundary into an unauthorized milestone closeout.**

## Canonical forms

Preferred slash command:

- `/handoff-log`

Conversational alias:

- `handoff-log`

## Composition

`/handoff-log` routes through:

1. `signalproof-handoff` for conversation-boundary continuity;
2. `signalproof-closeout` only when a meaningful milestone is actually complete;
3. `signalproof-learn` / `log-skill` for reusable-learning extraction and governance;
4. private/public repository preservation according to the dual-repository `log-skill` contract.

The command does **not** create a new specialist that duplicates Handoff, Closeout, Learn, Document, Verify, or Review.

## Required behavior

When invoked, the command should:

1. identify the current project, phase, objective, and receiving-chat purpose;
2. fetch/verify current governing Git state when materially relevant;
3. preserve protected baseline, rollback, failures, evidence classes, open gates, and exact next authorized action;
4. create a compact receiving-chat handoff that can stand on its own;
5. determine whether the underlying phase is actually closed;
6. if closed, route through milestone Closeout;
7. if still open, **do not falsely close it**; log the handoff state and continuity evidence only;
8. run reusable-learning extraction on completed/observed work;
9. preserve private internal evidence in `docreo/Signalproof-Build-Ledger`;
10. stage public-safe generalized learning in `docreo/Signalproof-Skills` only when justified;
11. obey Build Ledger canonical-head gates and use staged/noncanonical records when canonical append is not chain-safe;
12. return the handoff text, logging status, skill-learning disposition, and next authorized action.

## Output contract

A successful invocation should provide four distinct results:

### 1. Handoff

A receiving-chat packet containing at minimum:

- project/product identity;
- current phase;
- objective;
- protected state and rollback;
- what worked;
- what failed;
- current evidence state;
- canonical vs staged boundaries;
- prohibited actions;
- exact next authorized action;
- acceptance gate for the next step.

### 2. Ledger status

State whether the work was:

- canonically appended;
- staged/noncanonical pending chain-safe ingestion;
- handoff-only because the phase remains open;
- blocked because evidence/head verification failed.

### 3. Learning status

State whether reusable learning was:

- not found;
- discovered;
- candidate;
- tested candidate;
- approved/active only when separately authorized by governance.

### 4. Receiver boot instruction

Provide a concise instruction the operator can paste into the new chat so the receiver knows what sources to fetch and where to resume.

## Authority boundary

Invoking `/handoff-log` does **not** authorize:

- destructive changes;
- release/deployment;
- credentials or secret access;
- direct protected-main writes;
- PR merge;
- skill activation;
- canonical Build Ledger append from an unverified head;
- publication of private evidence;
- declaring a milestone complete merely because the chat is ending;
- advancing to a new phase when closeout has not actually authorized it.

## Relationship to `/handoff`

`signalproof-handoff` remains the continuity specialist.

Use plain handoff behavior when only conversation continuity is needed.

Use `/handoff-log` when continuity should also trigger durable logging and reusable-learning extraction.

## Relationship to `log-skill`

`log-skill` remains the milestone-learning operator concept.

`/handoff-log` adds a conversation-boundary wrapper around it:

```text
/handoff-log
   ↓
signalproof-handoff
   ↓
Is milestone actually complete?
   ├─ NO → preserve handoff + staged/log evidence; no false closeout
   └─ YES → signalproof-closeout
                  ↓
               log-skill / learn
                  ↓
        private + public-safe preservation
```

## Acceptance requirements

Before promotion to Active command status, test `/handoff-log` on materially different cases including:

1. an open development phase that must be handed off without closeout;
2. a completed milestone requiring Closeout + learning extraction;
3. a case with failed/partial evidence that must survive the handoff;
4. a case where canonical Build Ledger append is unavailable and staging is required;
5. a case producing public-safe reusable learning while private evidence remains private;
6. a case with no reusable learning, proving the command does not invent a skill candidate;
7. a fresh-session recovery test proving the receiving chat can resume without the human retelling the captured history.

## Failure conditions

Fail this Candidate if it:

- treats every handoff as milestone completion;
- suppresses failures or uncertainty;
- invents Build Ledger sequence/head state;
- automatically promotes a skill;
- publishes private evidence;
- bypasses Handoff or Closeout authority boundaries;
- creates a duplicate monolithic skill instead of composing existing specialists;
- leaves the receiver guessing about the next authorized action.

## Candidate identity

- **Command:** `/handoff-log`
- **Alias:** `handoff-log`
- **Type:** Composite continuity + logging operator command
- **Maturity:** Candidate / not Active
- **Primary composition:** `signalproof-handoff` + conditional `signalproof-closeout` + `signalproof-learn` / `log-skill`
- **Created by:** Doc Reo / Signalproof
