# `design-git` - Active Operator Command V0.2

**Status:** ACTIVE  
**Version:** 0.2.0  
**Owner:** Doc Reo

## Purpose

`design-git` is the governed Signalproof next-action design and routing workmode.

> **Verify current Git and evidence, preserve protected state, check prior failures, and design the smallest governed next action before execution.**

It is broader than the `signalproof-design` specialist. Its output is a bounded Next Action Contract, not automatic implementation authority.

## Mandatory sequence

1. Verify current relevant Git/ref/head.
2. Establish work-stream identity, phase/state, protected baseline, rollback/non-mutation boundary, dependencies, and unresolved gates.
3. Read the strongest current evidence and separate fact, observation, authority, inference, and proposal.
4. Run Known Failure Preflight when the next action is consequential, repeated, or failure-prone.
5. Route through the minimum applicable Active Signalproof capabilities.
6. Define one singular or tightly bounded next action.
7. Define acceptance evidence and recovery/non-mutation expectations.
8. Define STOP conditions for stale Git, authority, security, provenance, licensing/legal, protected state, or contradictory evidence.
9. Emit the Next Action Contract.

## Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: <stable identity>
Git basis: <repo/ref/head>
Current state: <open/closed/blocked/etc.>
Objective: <bounded outcome>
Route: <Active capability or sequence>
Action class: READ / QUERY / INVESTIGATE / RESEARCH / DECIDE / DESIGN / TEST / VERIFY / BUILD / DEBUG / RECOVER / DOCUMENT / CLOSE
Protected state: <must not change>
Allowed surface: <what may be touched/read/executed>
Known-failure constraints: <applicable evidence/rules or none>
Dependencies/authority: <required before action>
Acceptance evidence: <proof required>
Recovery/non-mutation: <safe failure path>
STOP conditions: <halt/re-design conditions>
Closeout trigger: <meaningful boundary>
```

## Routing principle

Unknown state routes to Investigate. Current external evidence routes to Research. A disposition routes to Evaluate. Product/state architecture routes to Design. Unbounded implementation routes to Plan first. Bounded implementation routes to Build. A localized defect routes to Debug. A material claim routes to Verify. Security/provenance uncertainty routes to the relevant security/review path. A completed milestone routes to Closeout.

Do not use the word `design` in the command name as a reason to force UI/product design.

## Known Failure Intelligence

Before proposing a retry, wrapper, package operation, test harness, recovery action, security change, evidence parser, or other repeat-prone method, surface applicable prior failure constraints in the contract. A known failure may change the route from BUILD to INVESTIGATE, RETRY to REUSE MITIGATION, or to STOP.

Changed conditions may justify a deliberate retest; record what changed.

## Build-stream / chronology rule

Use stable work-stream lineage, not projected Build Ledger sequence numbers. If a stream resumes after unrelated work, recheck current state and never force the next milestone into an old projected `C###` slot.

## Authority boundary

`design-git` does not grant execution, write, destructive, credential, privilege, security-change, release, publication, candidate-activation, or canonical Build Ledger authority.

## STOP conditions

STOP or return a non-executable contract when governing Git/current evidence cannot be established; work-stream identity or protected state is materially ambiguous; known failure evidence predicts an unchanged repeat; execution authority is missing; security/provenance/license/legal uncertainty is material; a projected ledger sequence is treated as reserved; contradictory evidence prevents an honest route; or the command would fabricate runtime or agent capability.

## Maintenance acceptance

Keep regression evidence showing routes to Investigation, bounded Build, Research/Verify/Security/Design, known-failure constraints, protected-state preservation, paused/resumed stream continuity, stale/concurrent Git detection, and exact next-step authority.
