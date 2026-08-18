# Signalproof `log-skill` Command Contract — V0.1 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Date:** 2026-08-18  
**Scope:** conversational command shorthand for governed milestone preservation, reusable-learning extraction, public/private synchronization, and optional closeout routing

## Purpose

`log-skill` is a Signalproof operator command shorthand. It is not itself a new Active skill and it does not create Build Ledger authority.

It coordinates the smallest responsible route across existing Signalproof disciplines, especially `signalproof-closeout` and `signalproof-learn`, while preserving the distinction between staged evidence and canonical Build Ledger chronology.

Core rule:

> **Logging a milestone does not reserve a canonical event number. Canonical sequence is assigned only by a verified chain-safe append.**

## Command forms

### `log-skill`

Meaning: preserve and synchronize the current milestone or learning state without claiming closure unless closure is already established and authorized.

Required behavior:

1. Identify the milestone/work unit and current evidence state.
2. Deduplicate against existing public candidate records and private staged records where available.
3. Extract reusable lessons through the governed learning lifecycle.
4. Publish only public-safe candidate/test/documentation records.
5. Preserve private/internal evidence separately.
6. If canonical Build Ledger head/authority is unavailable or closure is not authorized, stage only.
7. Do not assign or reserve a canonical sequence number.
8. Do not activate a skill merely because it was logged.

Typical result:

`STAGED / SYNCHRONIZED / NONCANONICAL` or `CANDIDATE CREATED`, depending on evidence and lifecycle state.

### `log-skill close`

Meaning: the operator declares that the present milestone is complete and requests the full Signalproof closeout sequence now.

Route:

`Validate -> Record -> Extract -> Govern -> Closeout -> Verify`

Required behavior:

1. Confirm the milestone actually satisfies its stated completion/acceptance gates.
2. Verify protected state, evidence, rollback/recovery, failures, and open gates.
3. Verify the actual canonical Build Ledger pair/head/chain/projection before any append.
4. Deduplicate proposed stable identities.
5. Append only through approved chain-safe tooling when canonical authority exists.
6. Re-run original/native verification immediately after append.
7. If canonical append cannot be safely performed, preserve a staged/noncanonical closeout instead of fabricating completion chronology.
8. Do not reserve a sequence number before append.

### `log-skill close-when-complete`

Meaning: mark the current milestone as **closure-required before phase transition**, but do not declare it complete yet.

This is a governance latch, not a scheduler and not a background automation.

Required behavior:

1. Record the milestone identity and its explicit completion/acceptance criteria.
2. Record that full closeout is mandatory before the next meaningful phase begins.
3. Continue work normally while the milestone remains open.
4. When the user later indicates completion, or when the current conversation reaches the declared completion gate, route through `log-skill close`.
5. Never fabricate that the gate has passed.
6. Never reserve a future Build Ledger event number.
7. If the work moves to another chat, preserve this pending-closeout requirement in the handoff.

Status while open:

`OPEN / CLOSEOUT REQUIRED WHEN ACCEPTANCE PASSES`

## Optional numbered close syntax

A numbered form such as:

`log-skill close C###`

is permitted only as a strict conditional assertion, never as sequence reservation.

Meaning:

> Close this milestone as event C### only if C### is still the legitimate next canonical event at append time.

Required gate:

- requested sequence `N` requires verified current canonical head sequence `N-1`;
- the current head hash/ledger identity/chain/projection must verify;
- no other event may already occupy `N`;
- deduplication must pass;
- append must use approved tooling;
- post-append verification must prove the resulting event is actually sequence `N`.

If any condition fails: **STOP**.

The command must not silently renumber the requested close, overwrite an existing event, or reinterpret a preview/projection as canonical state.

## Preview/projection rule

Labels such as `C405-C415 projected` are planning/evidence labels only until native append assigns those sequences.

A preview:

- does not reserve chronology;
- does not block another legitimate canonical append;
- must be regenerated if the canonical head changes;
- must be clearly labeled `PROJECTION / PREVIEW / NOT CANONICAL`.

## Public/private behavior

`log-skill` is one governed operation with two evidence surfaces:

### Public Signalproof-Skills

May contain:

- public-safe candidate lessons;
- acceptance/test records;
- generic integration/governance documentation;
- candidate skill/policy/router changes;
- provenance appropriate for public release.

Must not contain:

- private Build Ledger IDs/head hashes unless explicitly approved for publication;
- local machine paths;
- private recovery evidence;
- credentials/secrets;
- customer/private data;
- unapproved proprietary internals.

### Private Signalproof-Build-Ledger

May preserve:

- staged/noncanonical closeout records;
- internal artifact hashes and evidence references;
- recovery/rollback details;
- exact private ledger continuity state;
- candidate learning provenance.

Canonical JSONL/SQLite mutation remains separately gated by verified head and explicit authority.

## Idempotency rule

Repeated `log-skill` should verify/synchronize existing records rather than duplicate them.

Before creating a new record:

1. search for the same stable milestone/candidate identity;
2. compare scope and evidence;
3. update/synchronize only when new evidence materially changes state;
4. preserve supersession history rather than creating accidental duplicates.

## Lifecycle rule

`log-skill` may produce:

- documentation updates;
- regression tests;
- checklist/acceptance gates;
- policy candidates;
- skill candidates;
- router candidates;
- staged closeouts.

It may **not** by itself change lifecycle state to Active.

All reusable capability remains governed by:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`

## STOP conditions

Stop when:

- a requested numbered close does not immediately follow the verified canonical head;
- a projected sequence is being mistaken for a canonical event;
- canonical head/chain/projection cannot be verified;
- a duplicate stable identity already exists and the command would append again;
- milestone completion is being claimed before acceptance gates pass;
- private evidence would leak into a public record;
- an Active skill/policy/router change is being made without its own governance;
- the command would silently change scope from stage/sync into canonical append;
- a failed/uncertain milestone is being cleaned up into a false PASS.

## Command status vocabulary

Use one of:

- `LOGGED / SYNCHRONIZED`
- `STAGED / NONCANONICAL`
- `CANDIDATE CREATED`
- `OPEN / CLOSEOUT REQUIRED WHEN ACCEPTANCE PASSES`
- `CLOSEOUT COMPLETE / CANONICAL VERIFIED`
- `CLOSEOUT COMPLETE / STAGED PENDING INGESTION`
- `ALREADY LOGGED / NO DUPLICATE CREATED`
- `BLOCKED`
- `STOP`

## Non-goals

This contract does not:

- create a new `signalproof-log-skill` Active skill;
- reserve Build Ledger sequence numbers;
- schedule future work in the background;
- activate candidate skills;
- merge pull requests;
- create release authority;
- authorize canonical ledger mutation without separate gates.

## Candidate decision

**KEEP AS CANDIDATE / TEST BEFORE ACTIVE INTEGRATION.**

If accepted after testing, the smallest likely durable change is an update to the existing `signalproof-closeout` / `signalproof-learn` operating contract and router documentation rather than creation of a new specialist skill.