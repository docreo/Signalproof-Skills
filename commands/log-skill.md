# `log-skill` — Active Operator Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Activated:** 2026-08-18  
**Owner approval:** Doc Reo

## Purpose

`log-skill` is an Active Signalproof operator command shorthand. It is not a separate specialist skill. It coordinates existing Active Signalproof disciplines, especially Closeout, Learn, Verify, Document, Handoff, and Router, while preserving public/private evidence boundaries and Build Ledger chronology.

Core rule:

> **Logging does not reserve a canonical event number. Canonical chronology is assigned only by a verified chain-safe append.**

## Forms

### `log-skill`

Preserve and synchronize the current milestone or learning state without claiming closure unless closure is already established and authorized.

Required behavior:

- identify the milestone/work unit and current evidence state;
- deduplicate existing public and private records where available;
- extract reusable learning through governed lifecycle rules;
- publish only public-safe records;
- preserve private/internal evidence separately;
- stage only when canonical append is unavailable, unnecessary, or unauthorized;
- do not reserve a C-number;
- do not activate a candidate merely because it was logged.

### `log-skill close`

Request full immediate closeout for a milestone that is actually complete.

Route:

`Validate -> Record -> Extract -> Govern -> Closeout -> Verify`

Before canonical append, verify the actual ledger identity/head/chain/projection, deduplicate stable identities, use approved chain-safe tooling, and run native/original verification immediately after append. If canonical append cannot be safely performed, preserve a staged/noncanonical closeout instead of fabricating chronology.

### `log-skill close-when-complete`

Mark the current milestone as **closure-required before phase transition** while leaving it open.

This is a governance latch, not a scheduler or background automation. Preserve milestone identity and explicit acceptance criteria. When completion is later established, route through `log-skill close`. Never reserve a future Build Ledger number.

### `log-skill close C###`

Optional strict conditional close. The requested number is an assertion, never a reservation.

Requested `C###` may proceed only when the verified canonical current sequence is exactly the requested predecessor and every normal closeout/authority/dedup gate passes. If chronology has moved, **STOP**. Do not overwrite or silently renumber.

## Preview rule

Projected labels such as `C405-C415` remain **PROJECTION / PREVIEW / NOT CANONICAL** until native append actually assigns those sequences. If the canonical head changes, regenerate the preview.

## Idempotency

Repeated `log-skill` verifies and synchronizes existing stable identities rather than creating duplicates. New evidence may update/supersede prior staged state, but history is preserved.

## Public/private boundary

Public Signalproof-Skills may contain public-safe lessons, tests, generic governance records, and candidate changes. Private Build Ledger evidence may contain internal continuity, hashes, recovery, and staged closeout details. Never leak private ledger heads, local paths, credentials, customer/private data, or recovery internals into public records without explicit publication authority.

## Lifecycle

The command itself is Active. Outputs produced by it are not automatically Active.

Reusable capability still follows:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`

## Update rule

Active does not mean immutable. Changes to this command must be versioned, reviewed, tested proportionately to the change, owner-approved, and supersede rather than erase prior command behavior.

## STOP conditions

STOP when chronology cannot be verified, a projected number is being treated as canonical, a duplicate would be appended, completion is being falsely claimed, private evidence would leak publicly, an output is being auto-promoted, or command scope would silently expand into unauthorized canonical mutation.
