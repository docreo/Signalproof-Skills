# `/design-git` — Operator Command V0.2 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.2.0-candidate  
**Date:** 2026-08-18

## Purpose

`/design-git` is the governed Signalproof next-action design and routing workmode. It does not mean every task is UI/product design.

Core rule:

> Verify current Git and evidence, establish what is actually known, preserve protected state, check prior failures, and design the smallest governed next action before execution.

## Mandatory sequence

1. Verify governing Git state.
2. Establish current work/build stream, protected baseline, rollback/non-mutation boundary, dependencies, and unresolved gates.
3. Read strongest current evidence.
4. Run Known Failure Preflight when the intended next action is consequential, failure-prone, or a retry.
5. Route through the current Active Signalproof Router using the smallest sufficient specialists.
6. If evidence is insufficient, route first to Research, Investigate, Query/Inspect, or Verify rather than speculating or building.
7. Define one singular or tightly bounded next action.
8. Classify authority as READ_ONLY, DESIGN_ONLY, MUTATING_CANDIDATE, REQUIRES_OWNER, or BLOCKED.
9. Emit a Next Action Contract.

## Next Action Contract

```text
NEXT ACTION CONTRACT
Objective:
Current truth:
Unknowns blocking later work:
Governing Git ref:
Build/work stream:
Protected state:
Known-failure result:
Selected route:
Action class:
Allowed scope:
Forbidden scope:
Evidence to gather/create:
Acceptance gate:
Rollback / non-mutation rule:
Authority:
After-action logging trigger:
```

If the correct next action is read-only investigation/query/research, specify the exact question/source/evidence sufficient to advance. If implementation is justified, bound it only after evidence and authority support it.

## Relationship to `signalproof-design`

`signalproof-design` is the specialist for product information architecture, workflow/state presentation, and visual/state acceptance. `/design-git` decides what governed action should happen next and may or may not route to that specialist.

## Relationship to `/build-git`

`/design-git` decides and bounds the next action. `/build-git` executes it. Material evidence change during execution requires re-design/re-investigation rather than silent scope rewrite.

## Build-stream / chronology rule

Preserve stable work-stream lineage independently from global Build Ledger chronology. Never reserve a projected C-number.

## Authority and public/private boundary

The Next Action Contract must preserve licensing, attribution, contractual, privacy, secret, security/provenance, public/private, and owner-only gates. Technical accessibility is not permission.

## STOP conditions

STOP or emit a non-executable contract when governing Git/current evidence cannot be established, protected state or stream identity is materially ambiguous, a known failure would be blindly repeated, required authority is missing, legal/security/provenance uncertainty is material, a projected C-number is being treated as reserved, contradictory evidence prevents an honest selection, or the command would fabricate system/agent state.

## Promotion requirements

Before Active promotion, demonstrate real cases routed to Investigation, bounded Build, and another materially different specialist route; carry known-failure constraints; preserve protected/read-only boundaries; survive paused/resumed streams; detect stale Git; and reduce unnecessary context reconstruction.

## Identity

- **Command:** `/design-git`
- **Conversational shorthand:** `design-git`
- **Maturity:** Candidate / Not Active
- **Owner approval for merge:** 2026-08-18 via private `/merge-candidates`
