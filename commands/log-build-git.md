# `/log-build-git` — Ordered Operator Command V0.1 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0-candidate  
**Date:** 2026-08-18

## Purpose

`/log-build-git` is the ordered Signalproof orchestration command for continuing governed work after meaningful progress, discoveries, failures, corrections, decisions, or phase transitions.

Required order:

```text
/log-skill
   ↓
/design-git
   ↓
/build-git
```

Core rule:

> Preserve what was learned, design the next governed action from current truth, then execute that action, whether it is investigation, query, examination, research, verification, design, recovery, or implementation.

## Phase 1 — `/log-skill`

Preserve/synchronize the current meaningful work state, failures, uncertainty, reusable learning candidates, known-failure recurrence, public/private boundaries, build/work-stream identity, and closeout obligations. Use plain `/log-skill` by default; do not falsely close an open milestone or fabricate canonical chronology.

## Phase 2 — `/design-git`

Verify Git/current truth, protected state, unresolved gates, known failures, and route the smallest next action. Emit a bounded Next Action Contract with acceptance evidence and STOP conditions.

## Phase 3 — `/build-git`

Execute only the selected Next Action Contract using the smallest applicable Active route. If the contract says investigate/query/examine/research/verify, perform that action and stop at its evidence gate rather than forcing implementation.

## Legitimate outcomes

The composite may end in investigation complete, query/inspection complete, research complete, design/plan complete, verification complete, build candidate pass, blocked, owner decision required, or milestone closeout required.

## Build-stream / chronology rule

Preserve stable build/work-stream lineage separately from global canonical Build Ledger chronology. Never reserve a C-number.

## Idempotency

Repeated invocation must not duplicate stable log records, failure IDs, C projections, or blindly repeat an unchanged failed path.

## Authority boundary

Invocation authorizes the ordered command sequence and ordinary governed routing only. It does not itself grant destructive host changes, privilege elevation, secret use, security-control modification, licensing/legal exceptions, protected-state overwrite, release/deployment, direct protected-main mutation, skill/policy activation, or canonical Build Ledger append.

## Relationship to `/build-git spawn`

`/design-git` may select `/build-git spawn` only when role separation materially helps. The main LLM/session remains the Signalproof Orchestrator.

## STOP conditions

STOP when logging would falsify closure/chronology or leak private data, Git/current project state materially changed, design cannot establish a trustworthy next action, a high-confidence known failure would be repeated unchanged, protected-state/authority/security/provenance/legal gates remain unresolved, or continuing would silently convert an open milestone into a closed one.

## Promotion requirements

Before Active promotion, demonstrate materially different real cases ending in investigation/query, verification/review, bounded implementation, and blocked/owner decision; prove idempotency, known-failure preflight, protected-state preservation, Git freshness, correct routing, and no authority laundering.

## Identity

- **Command:** `/log-build-git`
- **Conversational shorthand:** `log-build-git`
- **Order:** `/log-skill -> /design-git -> /build-git`
- **Maturity:** Candidate / Not Active
- **Owner approval for merge:** 2026-08-18 via private `/merge-candidates`
