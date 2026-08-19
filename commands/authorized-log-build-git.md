# `/authorized-log-build-git` — Owner Authorization + Ordered Orchestration Command V0.1 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0-candidate  
**Date:** 2026-08-18

## Canonical command

`/authorized-log-build-git`

Conversational shorthand in chat may omit the slash and punctuation, for example `authorized log-build-git`, but the slash form above is the canonical command identity.

## Purpose

`/authorized-log-build-git` is the Signalproof owner-response command for the situation where the current work has reached an explicit human authorization gate and the owner wants to:

1. grant the **currently requested bounded authorization**;
2. preserve/log the current work and authorization state;
3. design the next governed action from the newly authorized state; and
4. continue execution through `/build-git`.

Its required order is:

```text
CURRENT PENDING OWNER GATE
        ↓
AUTHORIZE THAT BOUNDED GATE
        ↓
/log-skill
        ↓
/design-git
        ↓
/build-git
```

Core rule:

> **Authorize the gate that was actually asked, record the authority precisely, then continue governed work. Do not convert one approval into blanket future authority.**

This is an operator-command composition, not a new specialist skill and not an unlimited authority token.

## When to use

Use `/authorized-log-build-git` when:

- the assistant/orchestrator has explicitly asked the owner to authorize a bounded next action;
- the owner intends the answer to be YES for that presented action;
- the owner wants the current work/evidence/authorization logged; and
- the owner wants governed work to continue immediately afterward.

Examples of bounded authorization gates may include, when otherwise eligible under the governing contracts:

- proceed with the next build/correction step;
- modify a specifically identified file or bounded surface;
- run a specifically identified test/harness;
- adopt a specific candidate design direction;
- perform a specifically described recovery action;
- proceed with a security-sensitive action whose exact scope was presented;
- promote/release an exact artifact when all separate release gates are satisfied;
- perform a canonical Build Ledger append only when the exact append was presented and all chain/dedup/verification prerequisites are already satisfied.

The command does not waive prerequisite gates merely because authorization was granted.

## Phase 0 — Resolve the authorization envelope

Before `/log-skill`, identify the exact pending owner request from the current conversation/evidence state.

Record an **Authorization Envelope** containing proportionately:

- **Authorization subject:** exact action/candidate/change being approved;
- **Requested scope:** files/components/artifact/operation/phase involved;
- **Authority source:** explicit owner invocation of `/authorized-log-build-git`;
- **Preconditions:** required gates that must already be satisfied or must still be checked;
- **Protected state:** what remains outside the authorization;
- **Expiration boundary:** the authorization is consumed by the presented bounded action/phase and does not automatically carry into unrelated later work;
- **Excluded authority:** destructive, privilege, credential, security-control, release, canonical-ledger, publication, lifecycle, or other authority not actually contained in the presented request;
- **Status:** `AUTHORIZED`, `AUTHORIZED-PENDING-PRECONDITION`, or `STOP / AMBIGUOUS`.

If there is no clear pending authorization request, do not invent one. Return to `/design-git` or ask for the required human decision.

## Authorization does not waive prerequisites

The owner may authorize an action whose execution still depends on objective prerequisites.

Example:

- Owner authorizes a proposed canonical append.
- Latest canonical head verification or chain-safe precondition is still incomplete.

Required behavior:

- record the owner's authorization as `AUTHORIZED-PENDING-PRECONDITION`;
- continue through `/log-skill -> /design-git -> /build-git` to satisfy/verify the missing prerequisite;
- do **not** append canonically until the governing ledger contract says the action is executable.

Human permission and technical/governance readiness remain separate facts.

## Phase 1 — `/log-skill`

After resolving the Authorization Envelope, run the Active `/log-skill` behavior.

Preserve:

- current milestone/build-stream identity;
- current evidence and failures;
- known-failure recurrence/mitigation state;
- the exact Authorization Envelope;
- protected state and rollback/non-mutation boundaries;
- public/private classification;
- open versus closed milestone status;
- Build Ledger chronology boundaries;
- any pending closeout obligation.

Plain `/log-skill` does not automatically close the milestone merely because authority was granted.

If the presented owner gate itself was explicitly a closeout/canonical append/release decision, preserve that exact distinction and apply the corresponding specialist gates.

## Phase 2 — `/design-git`

Design the next action **from the newly authorized state**.

The Next Action Contract must carry:

- the Authorization Envelope;
- what action is now permitted;
- which prerequisites remain unresolved;
- known-failure constraints;
- protected/forbidden surfaces;
- exact route;
- acceptance evidence;
- STOP conditions;
- whether execution consumes the granted authority.

`/design-git` must not silently expand the authorization simply because the owner approved the previous gate.

## Phase 3 — `/build-git`

Execute the Next Action Contract through `/build-git`.

The final action may be implementation, investigation, query, inspection, research, verification, recovery, security/provenance review, release, closeout, or another routed Active discipline depending on the current state.

If the authorized action becomes invalid because Git, dependencies, evidence, protected state, or prerequisites changed, STOP and return to a new design/authority decision rather than stretching the old authorization.

## Authority consumption rule

Authorization is **scope-bound and consumable**.

After the exact authorized action/phase has been performed or its conditions materially change:

- mark that Authorization Envelope as consumed, superseded, blocked, or no longer applicable;
- do not reuse it automatically for another consequential action;
- request new owner authority when the governing skills require it.

This prevents authorization drift across long build chains.

## Relationship to `/log-build-git`

`/log-build-git` means:

```text
/log-skill -> /design-git -> /build-git
```

`/authorized-log-build-git` adds one owner-authorization phase in front:

```text
AUTHORIZE CURRENT PENDING GATE
        ↓
/log-skill -> /design-git -> /build-git
```

Therefore `/authorized-log-build-git` should be used only when an owner authorization gate is actually pending.

## Relationship to `/build-git spawn`

If the newly authorized Next Action Contract justifies multi-role execution, `/build-git` may route to `/build-git spawn` under its separate Candidate/Active state and acceptance rules.

The main LLM/session remains the Signalproof Orchestrator. The owner's authorization applies only to the delegated scope represented in the Authorization Envelope.

## Private form

A future/private governed form may use:

`/authorized-log-build-git private`

when both the authorization record and resulting work/evidence must remain within the private Build Ledger/private project boundary.

Do not treat this public Candidate as automatically activating that private form. The private variant must preserve the same authority envelope and governance strength.

## STOP conditions

STOP when:

- no specific pending owner authorization request can be identified;
- the proposed action is broader than the gate the owner was asked to approve;
- the command would be interpreted as blanket authorization for future work;
- required prerequisites remain unsatisfied and the action cannot safely proceed yet;
- Git/current evidence changed materially and invalidated the presented authorization basis;
- protected state would be crossed outside the authorization;
- a security/licensing/legal/provenance condition remains unresolved and is not covered by the presented gate;
- canonical Build Ledger chronology would be fabricated or a projected C-number treated as reserved;
- an Active/release/publication status would be inferred beyond what the owner actually approved;
- private evidence would leak publicly;
- a candidate command/skill would be auto-promoted because the owner authorized product work.

## Acceptance requirements

Before Active promotion, exercise `/authorized-log-build-git` on materially different real owner gates and demonstrate at minimum:

1. the exact pending authorization request is correctly identified;
2. only that bounded scope is authorized;
3. the authorization is preserved by `/log-skill`;
4. `/design-git` carries the Authorization Envelope into the Next Action Contract;
5. `/build-git` continues the correct routed work without asking for the same already-granted gate again;
6. unsatisfied prerequisites remain blocking even after owner permission;
7. a changed-condition/stale-Git case invalidates or re-scopes prior authorization rather than stretching it;
8. authorization does not silently become release/canonical-ledger/security/privilege authority when those were not the presented gate;
9. the command works for at least one non-code routed action and one bounded implementation action;
10. authorization consumption prevents reuse for unrelated later work.

## Identity

- **Command:** `/authorized-log-build-git`
- **Conversational shorthand:** `authorized log-build-git`
- **Type:** owner authorization + ordered Git-backed Signalproof orchestration command
- **Order:** `AUTHORIZE CURRENT GATE -> /log-skill -> /design-git -> /build-git`
- **Maturity:** Candidate / Not Active
- **Created by:** Doc Reo / Signalproof
