# `handoff-log` - Active Operator Command V0.2.1

**Status:** ACTIVE  
**Version:** 0.2.1  
**Owner:** Doc Reo

## Purpose

`handoff-log` creates a governed continuity package and synchronizes meaningful work state through `log-skill` so a fresh chat can resume without reconstructing the prior conversation from memory.

> **Transfer the mission, provenance, authority, protected state, failure constraints, and exact continuation path - not the entire chat.**

It does not itself close an open milestone, activate a Candidate, publish private evidence, or create canonical Build Ledger authority.

## Required behavior

1. Run `log-skill` synchronization for material milestone/learning state.
2. Produce or refresh a durable `WORK-CHAT-HANDOFF.md` unless another durable format is explicitly requested.
3. Make the artifact reflect the latest material state at handoff time, including the final user/tool exchange.
4. Preserve work-stream identity, objective, current phase/status, protected state, rollback/non-mutation boundary, material failures, known-failure constraints, authority, Git state, evidence references, open gates, and exact next action.
5. Preserve failed attempts and uncertainty rather than rewriting history around the successful path.
6. Keep public-safe and private/internal evidence boundaries distinct.
7. Do not reserve a `C###` sequence or treat projected chronology as canonical.
8. Keep an open milestone OPEN unless completion and closeout are separately established.
9. When PowerShell remains relevant, preserve the PowerShell Guard State so a new chat cannot reset the same-failure attempt count.

## Receiving chat bootstrap

The handoff should begin with a visible instruction equivalent to:

```text
RECEIVING CHAT - START HERE
Run: log-build-git
Treat this handoff as a provenance-bound transfer packet, not complete current truth.
Refetch current Signalproof-Skills Git definitions before consequential work.
If PowerShell is relevant, reload library/POWERSHELL-FAILURE-REGISTRY.yaml before generating another runner.
Use private Build Ledger continuity selectively when accessible; otherwise mark it UNAVAILABLE rather than guessing.
Revalidate the transferred Next Gate before mutation.
```

Git is the doctrine source; the handoff is the mission/provenance index.

## Handoff artifact contract

Include proportionately:

- transfer/handoff identity and creation time;
- project/work-stream and phase;
- objective and definition of done for the current phase;
- current evidence-backed truth and evidence class;
- protected state, rollback/non-mutation boundary, and forbidden changes;
- material failures, failed attempts, and do-not-repeat constraints;
- operator/runtime vocabulary or aliases that affect routing, such as `pshell = PowerShell` when established;
- already authorized, not authorized, and owner-decision-required boundaries;
- public Git files/repositories to refetch;
- task-relevant private continuity to retrieve if accessible;
- Build Ledger boundary, including whether state is canonical, staged/noncanonical, or unknown;
- exact next gate, acceptance evidence, result branches, and STOP conditions;
- artifact hashes/identities needed for safe continuation.

For active development/recovery, the next-chat instructions must state the actual first action, what evidence to inspect first, what to preserve, the smallest next authorized step, what not to guess/change, evidence to capture, acceptance criteria, result-specific branches, and any authority needed for the next consequential boundary.

## Freshness rule

Before delivery, compare the handoff against the latest user message and latest material tool/evidence result. Refresh stale Git state, hashes, status, authority, failure classification, PowerShell guard state, and next-action instructions. Do not hand off an earlier snapshot after newer evidence exists.

## Private/public retrieval rule

Prefer, in order:

1. current task-relevant private Build Ledger/project evidence when accessible;
2. current public Signalproof/project Git evidence;
3. evidence embedded/referenced in the handoff;
4. explicit `UNKNOWN` or `UNAVAILABLE`.

Do not preload unrelated private history and do not guess missing private truth.

## PowerShell Guard State

When the next gate may generate, modify, stage, or run PowerShell, the handoff must preserve, where available:

- current `POWERSHELL-FAILURE-REGISTRY.yaml` Git ref/version used;
- applicable PowerShell registry IDs;
- failed runner identity/hash when identity matters;
- unresolved failure class;
- attempt count for that failure class;
- last parser/harness/runtime/product classification;
- mitigation already tried;
- exact material condition required before another retry;
- explicit do-not-repeat path;
- exact next allowed diagnostic or runner.

A new chat, renamed `.ps1`, wrapper change, formatting change, or new prompt does not reset the same-failure attempt count.

The receiving workflow must reload current Git prevention data, reconcile any drift, run applicable executable known-error preflight, parser-preflight the exact final staged `.ps1`, hash-bind the exact staged artifact when identity matters, preserve failed runners, and distinguish harness/parser/path/staging failures from product evidence.

## Idempotency and supersession

Repeated `handoff-log` should refresh or supersede the same work-stream handoff rather than mint duplicates. Preserve the supersession trail and failed-attempt history. Do not repeat completed or disproven actions as the next instruction.

## STOP conditions

STOP when the handoff cannot identify the work stream or exact next gate; protected state or authority is materially ambiguous; the artifact is stale; required PowerShell failure continuity would be dropped; private/public boundaries cannot be preserved; safe mutation requires unavailable private truth; critical state would have to be reconstructed from memory instead of available Git/artifacts; chronology would be fabricated; a Candidate would be silently treated as Active; or the proposed next step repeats a disproven failure condition.
