# `log-build-git` Command Contract V0.1 — Promotion Record

**Status:** OWNER-APPROVED / PENDING MERGE TO MAIN  
**Version:** 0.1.0  
**Owner approval date:** 2026-08-19  
**Owner:** Doc Reo

## Promotion decision

The `log-build-git` operator shorthand is approved as a Signalproof command contract, subject to repository merge into the canonical `main` branch.

It combines three already-governed behaviors:

1. `log-skill` milestone/state synchronization semantics;
2. execution of only the smallest build/test/reproduction step already authorized by the current evidence state;
3. public-safe Git synchronization of reusable command, skill, test, documentation, or governance changes.

## Parent command lineage

- `log-skill` V0.1 — Active
- `handoff-log` V0.1 — Active
- Signalproof build/verify/closeout disciplines remain authoritative for their own specialist scopes.

`log-build-git` does not replace those disciplines. It is an operator shorthand that coordinates them.

## Acceptance conditions

The command is acceptable only when it preserves all of these boundaries:

- no canonical Build Ledger sequence is guessed, reserved, or manufactured;
- logging does not silently become milestone closeout;
- the build scope must already be identifiable and authorized from current evidence;
- protected production state is not mutated without separate authority;
- build failures, partial actuation, and mismatches remain preserved evidence;
- harness failures are distinguished from product failures;
- public Git receives only public-safe reusable material;
- private local paths, recovery internals, private ledger chronology, credentials, customer data, and other restricted evidence remain private;
- successful build verification does not automatically authorize implementation, deployment, release, or production activation;
- candidate skills or doctrine are not auto-promoted merely because they were logged or published.

## Authorization phrase

When a bounded build scope is already established, the operator phrase:

`authorized log-build-git`

means the current bounded build/checkpoint may proceed, the milestone state may be synchronized under `log-skill` rules, and public-safe Git changes may be synchronized.

It does **not** imply canonical Build Ledger mutation, milestone closeout, production deployment, protected-state replacement, or release authority.

## Repository state

This promotion record and the command contract are introduced on a dedicated review branch. They become canonical repository doctrine only when merged to `main`.

## Supersession

Future revisions must be versioned, proportionately tested/reviewed, owner-approved, and preserve prior history rather than silently rewriting the V0.1 contract.
