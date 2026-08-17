# Signalproof Operating Model

Signalproof uses a governed operating model for AI-assisted work. The exact path depends on the task, but the public Skills suite currently defines a set of specialist disciplines that can be routed as needed.

## Core flow

```text
REQUEST
  ↓
ROUTER
  ↓
RESEARCH -> EVALUATE
  ↓
INVESTIGATE / PLAN / DESIGN / READINESS
  ↓
BUILD / DEBUG
  ↓
VERIFY -> REVIEW -> SECURITY / RECOVERY as applicable
  ↓
RELEASE when an exact candidate is being promoted
  ↓
DOCUMENT when established state/results need durable representation
  ↓
CLOSEOUT when a meaningful milestone resolves
  ↓
HANDOFF when conversation continuity requires a fresh chat
  ↓
LEARN when reusable capability should be extracted
```

This is not a mandatory conveyor belt. Signalproof routing is intended to select the smallest responsible path.

## Build discipline

Signalproof software work emphasizes:

- inspect before rebuilding;
- protect known-good state;
- keep scope bounded;
- distinguish design approval from runtime acceptance;
- verify exact artifacts rather than general impressions;
- preserve rollback and recovery;
- document what changed and why;
- avoid declaring success from partial evidence.

## Milestone closeout

Meaningful milestones are closed through a discipline that can be summarized as:

**Validate → Record → Extract → Govern → Authorize Next Phase**

The purpose is to stop development from outrunning its own evidence and institutional memory.

## Conversation continuity

AI-assisted development introduces a newer form of operational risk: the working conversation itself can become a temporary concentration of project state.

Signalproof Handoff therefore treats context continuity as something to govern explicitly. A handoff should preserve current state, protected assumptions, open risks, exact next actions, and evidence references without pretending that a conversation boundary is itself a product milestone.

## Institutional learning

Signalproof does not automatically turn every successful workaround into doctrine.

Reusable lessons move through a governed maturity path:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED -> RETIRED`

The purpose is to learn from real work without allowing one successful case to become an unjustified universal rule.