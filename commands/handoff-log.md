# `handoff-log` — Active Operator Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Activated:** 2026-08-18  
**Owner approval:** Doc Reo

## Purpose

`handoff-log` is an Active Signalproof operator command shorthand. It combines a normal governed handoff with `log-skill` synchronization so continuity, pending closeout obligations, reusable learning, and public/private evidence state survive the chat boundary.

It is not a separate specialist skill and does not itself create canonical Build Ledger authority.

Core rule:

> **Transfer the work and transfer the governance state.**

## Required behavior

1. Run the normal Signalproof handoff discipline: preserve objective, phase, protected state, rollback/recovery, material failures, evidence classes, repository state, Build Ledger boundaries, prohibited actions, exact next action, and receiving-chat boot instructions.
2. Run the `log-skill` synchronization path for material milestone/learning state created or updated in the chat.
3. Preserve pending `close-when-complete` obligations in the handoff.
4. Deduplicate before creating new public/private records.
5. Keep public-safe records separate from private/internal continuity evidence.
6. Do not reserve a canonical C-number.
7. Do not treat a projected/preview sequence as live chronology.
8. Do not auto-activate candidate outputs.
9. If the underlying milestone is actually complete and the operator explicitly requests closure, use the appropriate `log-skill close` form; otherwise handoff does not imply closeout.
10. The receiving chat must refetch volatile repository/ledger state before consequential writes.

## Relationship to `handoff`, `log-skill`, and `closeout`

- `handoff` preserves conversation continuity.
- `log-skill` preserves/synchronizes milestone and reusable-learning state.
- `handoff-log` performs both together.
- `closeout` is still separate unless completion is actually established and closure is requested/required.

Typical patterns:

`open work -> handoff-log -> fresh chat -> continue`

`completed milestone -> log-skill close -> handoff-log -> fresh chat`

`open milestone with latch -> log-skill close-when-complete -> handoff-log -> fresh chat`

## Idempotency

Repeated `handoff-log` should refresh or verify existing handoff/log records rather than duplicate stable identities. Preserve supersession history when materially new evidence changes state.

## Public/private boundary

Public Git may contain public-safe handoff/governance documentation or candidate learning. Private evidence may contain exact local paths, hashes, internal recovery state, and staged ledger continuity needed for reconstruction. Never publish credentials, customer/private data, private ledger internals, or local recovery details without explicit authority.

## Update rule

Active does not mean frozen. Changes to `handoff-log` must be versioned, reviewed, tested proportionately, owner-approved, and preserve prior history through supersession rather than silent rewrite.

## STOP conditions

STOP when the handoff cannot state the exact next authorized action, protected state is ambiguous, public/private boundaries would be violated, chronology is being fabricated, duplicate records would be created, or the command would silently turn a handoff into unauthorized canonical closeout.
