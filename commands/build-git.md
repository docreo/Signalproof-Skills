# `/build-git` — Operator Command V0.2 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.2.0-candidate  
**Date:** 2026-08-18

## Purpose

`/build-git` is the governed Signalproof next-action execution workmode for repository-backed work.

Core rule:

> Verify current Git, learn from prior failures, route the smallest governed next action, execute only that action, preserve rollback or non-mutation boundaries, and leave proof.

The word `build` does not mean every invocation writes code. `/build-git` may route to Research, Investigate, Query/Inspect, Evaluate, Plan, Design, Readiness, Build, Debug, Verify, Review, Security, Recovery, Release, Document, Learn, Handoff, or Closeout according to current evidence and authority.

`signalproof-build` remains the implementation specialist and is loaded only when implementation is actually the routed action.

## Mandatory sequence

1. Re-fetch governing Git state.
2. Route through the current Active Signalproof Router using the smallest sufficient route.
3. Run Known Failure Preflight for consequential, failure-prone, or repeated work.
4. Establish protected state, rollback/non-mutation boundary, build/work-stream identity, and evidence contract.
5. Consume a current Next Action Contract when one exists.
6. Execute only the selected routed action.
7. Verify incrementally.
8. Apply independent review/security/provenance checks when applicable.
9. Re-check Git before consequential write/publication/promotion.
10. Preserve closeout/continuity/learning evidence at meaningful boundaries.

## Next-action classes

Read-only truth finding may route to Research, Investigate, Verify, or repository/query inspection and must remain read-only unless later authority separately permits mutation.

Decision/design work may route to Evaluate, Plan, signalproof-design, Security, or Readiness.

Actuation may route to signalproof-build, Debug, Recovery, or Release only when the applicable authority exists.

Continuity work may route to Document, Learn, Handoff, Closeout, or Active operator commands such as `/log-skill` when triggered.

## Known Failure Preflight

Before consequential execution, determine whether the intended path matches a known Signalproof failure fingerprint by tool/runtime/platform/action/symptom/parser/path/encoding/authority/security/licensing/provenance/chronology conditions.

Possible dispositions:

- NO KNOWN MATCH
- POSSIBLE MATCH
- KNOWN FAILURE / MITIGATION AVAILABLE
- KNOWN FAILURE / CONDITIONS CHANGED
- KNOWN FAILURE / NO APPROVED MITIGATION
- PROHIBITED / STOP

Do not convert keyword similarity into a diagnosis. Match supported conditions and cause.

## Build-stream continuity

A build/work stream may pause while unrelated Build Ledger events continue. Preserve stable stream identity and the stream's own prior accepted anchor. Never treat a projected C-number as reserved. Canonical append remains separately gated by the actual current global head and authority.

## Relationship to `/design-git`

`/design-git` designs and bounds the next action. `/build-git` executes it. If evidence changes materially during execution, stop and return to design/investigation rather than silently rewriting scope.

## Relationship to `/log-build-git`

`/log-build-git` is the ordered composite:

`/log-skill -> /design-git -> /build-git`

## `/build-git spawn`

`/build-git spawn` is the separately governed multi-role extension. The main LLM/session remains the Signalproof Orchestrator. Builder, Design, and Governor roles remain subordinate, bounded, and unable to self-approve.

## Authority boundary

Invocation does not itself grant destructive host changes, privilege elevation, credential use, security-control changes, licensing/legal exceptions, protected-state overwrite, release/deployment, direct protected-main mutation, skill/policy activation, or canonical Build Ledger append.

## STOP conditions

STOP when current Git cannot be established, a high-confidence known failure would be repeated under unchanged conditions, a mitigation crosses authority/security/legal/licensing boundaries, protected state would be changed without authority, concurrent Git invalidates the base, a projected ledger sequence is treated as reserved, implementation is being forced before investigation/verification, or candidate/release/canonical authority is being inferred from the command itself.

## Promotion requirements

Before Active promotion, demonstrate real cases including a non-build route, bounded implementation, stale/concurrent Git detection, known-failure avoidance, changed-condition retest, protected-state preservation, build-stream continuity, and correct Orchestrator/subagent authority.

## Identity

- **Command:** `/build-git`
- **Conversational shorthand:** `build-git`
- **Maturity:** Candidate / Not Active
- **Owner approval for merge:** 2026-08-18 via private `/merge-candidates`
