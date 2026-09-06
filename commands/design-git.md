# `design-git` - Active Operator Command V0.2.1

**Status:** ACTIVE  
**Version:** 0.2.1  
**Owner:** Doc Reo

## Purpose

`design-git` is the governed Signalproof next-action design and routing workmode.

> **Verify current Git and evidence, preserve protected state, check prior failures, verify the required brand pack state, and design the smallest governed next action before execution.**

It is broader than the `signalproof-design` specialist. Its output is a bounded Next Action Contract, not automatic implementation authority.

## Mandatory sequence

1. Verify current relevant Git/ref/head.
2. **Brand Pack Preflight** - as the first project-specific check, determine whether the current workstream has an owner-designated canonical brand pack. For Signalproof-owned builds, the configured Signalproof brand pack is required. Check the target build once, bind the result to the workstream/repo/head/target/brand-pack identity, and reuse a still-valid `VERIFIED-PRESENT` result instead of checking repeatedly.
3. Establish work-stream identity, phase/state, protected baseline, rollback/non-mutation boundary, dependencies, and unresolved gates.
4. Read the strongest current evidence and separate fact, observation, authority, inference, and proposal.
5. Run Known Failure Preflight when the next action is consequential, repeated, or failure-prone.
6. Route through the minimum applicable Active Signalproof capabilities.
7. Define one singular or tightly bounded next action.
8. Define acceptance evidence and recovery/non-mutation expectations.
9. Define STOP conditions for stale Git, authority, security, provenance, licensing/legal, protected state, brand-pack state, or contradictory evidence.
10. Emit the Next Action Contract.

## Brand Pack Guard

When a workstream is Signalproof-owned or otherwise has an owner-designated canonical brand pack:

- the first project-specific design check is whether the approved brand pack is present in the target build or bound as an approved build input;
- record one of `NOT-APPLICABLE`, `REQUIRED-UNCHECKED`, `VERIFIED-PRESENT`, or `MISSING`;
- a `VERIFIED-PRESENT` result may be reused without another check while the workstream, repository/ref/head, build target, and brand-pack identity remain materially unchanged;
- invalidate the cached result when the brand pack changes, the build target changes, relevant Git state changes materially, the asset location changes, or evidence suggests the pack was removed or replaced;
- a missing required pack routes the next action to restore or add the approved pack before substantive build design continues;
- do not substitute a lookalike, regenerated approximation, stale pack, or unverified asset for the owner-designated canonical pack.

### Packaging gate

Immediately before creating a package, archive, installer, release bundle, deployable artifact, or other final distributable, recheck the exact packaging candidate for the applicable approved brand pack even when the initial preflight was already `VERIFIED-PRESENT`.

The pre-package recheck is mandatory because packaging can omit, replace, relocate, or transform assets after the earlier build check.

A required brand pack that is missing, stale, unverified, or excluded from the exact packaging candidate blocks packaging until corrected or the owner explicitly changes the brand requirement.

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
Brand pack state: <NOT-APPLICABLE | REQUIRED-UNCHECKED | VERIFIED-PRESENT identity | MISSING>
Packaging brand gate: <NOT-APPLICABLE | REQUIRED-BEFORE-PACKAGE | PASS exact-candidate identity>
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

STOP or return a non-executable contract when governing Git/current evidence cannot be established; work-stream identity or protected state is materially ambiguous; a required canonical brand pack is missing or cannot be identified honestly; a package is about to be created without the required exact-candidate brand recheck; known failure evidence predicts an unchanged repeat; execution authority is missing; security/provenance/license/legal uncertainty is material; a projected ledger sequence is treated as reserved; contradictory evidence prevents an honest route; or the command would fabricate runtime or agent capability.

## Maintenance acceptance

Keep regression evidence showing routes to Investigation, bounded Build, Research/Verify/Security/Design, initial brand-pack verification, cached `VERIFIED-PRESENT` reuse, mandatory pre-package recheck, missing-brand blocking, known-failure constraints, protected-state preservation, paused/resumed stream continuity, stale/concurrent Git detection, and exact next-step authority.
