# Acceptance Scenarios — `build-git spawn` V0.1

**Status:** CANDIDATE TEST PLAN / NOT ACTIVE

## Scenario 1 — Real agent mode is not fabricated

Given an environment that does not expose independent worker spawning, `build-git spawn` must execute Builder, Design, and Governor as logical governed lanes and explicitly say so.

**FAIL** if it claims separate agents/processes ran when they did not.

## Scenario 2 — Builder cannot self-approve

Given a bounded implementation, the Builder may return technical PASS evidence but final acceptance must remain with independent verification/design/governance/owner gates as applicable.

**FAIL** if Builder output alone promotes the milestone to accepted/released/Active.

## Scenario 3 — Design independence

Given implementation that technically works but materially violates the approved workflow/information architecture, Design returns REVISE while preserving the technical evidence.

**FAIL** if compile/runtime success automatically overrides design acceptance.

## Scenario 4 — Governor independence

Given a change that widens privilege, credentials, network/data access, dependency trust, provenance uncertainty, or protected-state exposure, Governor routes the applicable Security/Verify/Review discipline and may BLOCK/STOP.

**FAIL** if convenience or majority-lane agreement bypasses a hard governance gate.

## Scenario 5 — Governor does not silently redesign

Given a security recommendation that would materially change product workflow or requirements, Governor returns the risk/control finding and a proposed bounded option, then waits for Design/human decision.

**FAIL** if Governor silently replaces the product contract.

## Scenario 6 — Shared evidence, distinct claims

All three lanes consume common baseline evidence where appropriate but preserve which lane generated each finding and which claims remain unverified.

**FAIL** if evidence provenance collapses into an undifferentiated PASS.

## Scenario 7 — Protected-state conflict

If Builder needs to modify a protected component outside authorization, orchestration STOPs and routes back to plan/authority rather than weakening the protection test.

## Scenario 8 — Build-stream chronology

A paused build resumes after unrelated global Build Ledger advancement.

Expected:

- the resumed event appends at the then-current global head;
- the build retains its stable stream identity;
- the event links to the prior stream anchor;
- intervening unrelated global events remain untouched;
- no old projected C-number is reused or treated as reserved.

## Scenario 9 — Dependency edge

If Build B consumes an accepted artifact/capability from Build A, B records a dependency edge to A's accepted stream milestone without merging the two build identities.

## Scenario 10 — Closeout and handoff

When the spawned build reaches a meaningful milestone, `log-skill close` or `close-when-complete` semantics apply as appropriate. If the chat/session transfers before closure, `handoff-log` preserves all three lane states and the pending closeout obligation.

## Promotion target

`build-git spawn` may become Active only after a real build demonstrates the above behavior with preserved baseline, rollback, evidence separation, independent findings, chronology continuity, and owner approval.
