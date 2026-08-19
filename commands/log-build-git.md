# `log-build-git` - Active Operator Command V0.2

**Status:** ACTIVE  
**Version:** 0.2.0  
**Owner:** Doc Reo

## Purpose

`log-build-git` is the ordered Signalproof continuation command:

```text
log-skill
   ->
design-git
   ->
build-git
```

It means: preserve what is true, design the next governed action from current evidence, then execute only that routed action.

It does not imply code implementation and does not create new authority.

## Handoff receipt/bootstrap mode

When invoked first in a fresh chat after `handoff-log`, treat it as:

```text
RECEIVE HANDOFF
-> REFETCH GOVERNING GIT
-> RECONCILE PRIVATE/PUBLIC CONTINUITY
-> RECORD RECEIPT
-> log-skill
-> design-git
-> build-git
```

Before normal continuation:

1. Read the handoff and identify its transfer ID, work-stream identity, source snapshots, protected state, authority, failures, and Exact Next Gate.
2. Refetch current `docreo/Signalproof-Skills/main` and current command/Router definitions.
3. If private Build Ledger access exists and is relevant, retrieve only task-relevant private continuity/evidence/failure/protected-state records.
4. If private access does not exist, mark it `UNAVAILABLE`; do not guess private state.
5. Compare handoff-time state to receiving-time Git/evidence and preserve material drift.
6. Deduplicate any prior receipt for the same handoff ID/hash.
7. Revalidate the transferred Next Gate before execution.

A receipt is provenance evidence, not milestone closeout.

## Phase 1 - `log-skill`

Preserve/synchronize current meaningful work, failures, uncertainty, owner authority, protected state, work-stream identity, closeout obligations, and reusable learning. Plain `log-build-git` uses plain `log-skill`; it must not silently replace it with `log-skill close` for open work.

## Phase 2 - `design-git`

Produce a fresh Next Action Contract from current reconciled evidence. Include current Git basis, work stream, protected state, relevant known failures, authority/dependencies, selected Active route, acceptance evidence, recovery/non-mutation path, and STOP conditions.

A handoff's stated next gate is transferred intent, not immutable current truth.

## Phase 3 - `build-git`

Execute only the Next Action Contract. Recheck Git, apply Known Failure Preflight, preserve protected state, verify incrementally, and stop/re-design if material evidence changes.

Legitimate outcomes include investigation, inspection, research, design/plan, verification, bounded build, debug, recovery, review/security, closeout, blocked state, or STOP/owner decision required.

## Known Failure Preflight

Fresh chat context does not reset failure history. Search applicable merged and current candidate evidence before repeat-prone consequential work. Candidate evidence may prevent recurrence without becoming Active authority.

## Build-stream / chronology rule

Preserve stable work-stream lineage separately from global canonical Build Ledger chronology. Never reserve a future `C###`. If a canonical append becomes relevant, reverify live private ledger identity/head/chain/projection and use separately authorized chain-safe tooling.

## Idempotency

Repeated invocation must not duplicate the same work-state log, handoff receipt, or failure identity. Reuse stable identities and update only materially changed evidence/state.

## Authority boundary

Invocation does not itself authorize destructive host changes, privilege elevation, credentials/secrets use, security-control modification, protected-state overwrite, release/deployment, candidate activation, direct protected-main mutation, or canonical Build Ledger append.

## STOP conditions

STOP before execution when transfer identity/current Git cannot be established; private truth required for safe mutation is unavailable; `log-skill` cannot preserve state without fabrication/leakage; `design-git` cannot establish a trustworthy next action; a known failure would be repeated unchanged; protected-state/security/provenance/licensing/legal gates remain unresolved; the next action requires a human-owned decision; a Candidate is being treated as Active without promotion; or continuing would silently close an open milestone.

## Maintenance acceptance

Keep regression evidence for fresh-chat bootstrap, selective private retrieval, public fallback with no guessing, Git drift, non-build routing, bounded implementation, known-failure route change, open-milestone preservation, idempotent receipt/logging, Candidate lifecycle preservation, and public/private boundaries.
