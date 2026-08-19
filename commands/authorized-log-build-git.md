# `/authorized-log-build-git` - Active Operator Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`/authorized-log-build-git` is the owner-response command for a clearly pending bounded authorization gate.

Its order is:

```text
IDENTIFY CURRENT PENDING OWNER GATE
-> AUTHORIZE THAT BOUNDED GATE
-> log-skill
-> design-git
-> build-git
```

> **Authorize only the gate that was actually presented, preserve that authority precisely, then continue governed work. One approval is not blanket future authority.**

## Authorization Envelope

Before continuation, record:

- authorization subject;
- exact requested scope/action;
- authority source: explicit owner invocation;
- objective prerequisites still required;
- protected state outside the authorization;
- expiration/consumption boundary;
- excluded authority not contained in the presented request;
- status: `AUTHORIZED`, `AUTHORIZED-PENDING-PRECONDITION`, or `STOP / AMBIGUOUS`.

If no clear pending owner gate exists, do not invent one. Return to `design-git` or request the actual decision.

## Authorization does not waive prerequisites

Owner permission and technical/governance readiness are separate facts. If the owner approves an action whose prerequisites remain incomplete, preserve `AUTHORIZED-PENDING-PRECONDITION` and route through the normal sequence to establish those prerequisites before actuation.

This is especially important for release, security, credential, privilege, destructive, and canonical Build Ledger actions.

## Phase 1 - `log-skill`

Preserve the exact Authorization Envelope alongside current evidence, failures, protected state, work-stream identity, public/private boundaries, and closeout obligations. Plain invocation does not automatically close the milestone.

## Phase 2 - `design-git`

Create the Next Action Contract from the newly authorized state. Carry the Authorization Envelope, remaining prerequisites, known-failure constraints, allowed/forbidden surfaces, acceptance evidence, STOP conditions, and whether the planned action consumes the authority.

Do not silently expand the approved scope.

## Phase 3 - `build-git`

Execute only the bounded authorized action that remains valid after current Git/evidence recheck. If conditions materially changed, STOP and obtain a new design/authority decision rather than stretching the old authorization.

## Authority consumption

Authorization is scope-bound and consumable. After the exact action/phase completes, fails materially, is superseded, or its basis changes, mark the envelope consumed/superseded/blocked and do not reuse it for another consequential action.

## STOP conditions

STOP when no specific pending gate can be identified; proposed action is broader than what was presented; prerequisites remain unsatisfied for actuation; Git/evidence changed materially; protected state would be crossed outside authorization; security/provenance/licensing/legal conditions remain unresolved; projected Build Ledger chronology would be treated as reserved; private evidence would leak publicly; or owner approval is being interpreted as automatic Candidate activation, release, privilege, credential, or future blanket authority.

## Maintenance acceptance

Keep regression evidence that exact pending gates are resolved correctly, only bounded scope is authorized, prerequisites remain binding, `log-skill` preserves the envelope, `design-git` carries it forward, `build-git` does not ask for the same consumed gate again, changed conditions invalidate stale authority, and authority does not drift into unrelated future work.
