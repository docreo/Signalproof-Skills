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
  ↓
WRITEBACK when durable knowledge should update the Knowledge Plane
```

This is not a mandatory conveyor belt. Signalproof routing is intended to select the smallest responsible path.

## Knowledge flow

Signalproof now distinguishes the operational workflow above from the maintained knowledge flow:

```text
RAW EVIDENCE
   ↓
INGEST / NORMALIZE
   ↓
COMPILED KNOWLEDGE
   ↓
VERIFY / REVIEW
   ↓
DECISION / POLICY where authorized
   ↓
OPERATIONAL USE
   ↓
WRITEBACK of durable learning
```

The purpose is to let knowledge compound without allowing AI-generated summaries to become authority merely because they are convenient.

## Build discipline

Signalproof software work emphasizes:

- inspect before rebuilding;
- protect known-good state;
- keep scope bounded;
- distinguish design approval from runtime acceptance;
- verify exact artifacts rather than general impressions;
- preserve rollback and recovery;
- document what changed and why;
- avoid declaring success from partial evidence;
- write durable public knowledge back into the Wiki when appropriate;
- keep restricted knowledge with the private canonical source that owns it.

## Milestone closeout

Meaningful milestones are closed through a discipline that can be summarized as:

**Validate → Record → Extract → Govern → Authorize Next Phase**

The purpose is to stop development from outrunning its own evidence and institutional memory.

## Conversation continuity

AI-assisted development introduces a newer form of operational risk: the working conversation itself can become a temporary concentration of project state.

Signalproof Handoff therefore treats context continuity as something to govern explicitly. A handoff should preserve current state, protected assumptions, open risks, exact next actions, and evidence references without pretending that a conversation boundary is itself a product milestone.

The Knowledge Plane reduces this risk further by moving durable understanding out of transient conversations and into maintained, reviewable knowledge.

## Institutional learning

Signalproof does not automatically turn every successful workaround into doctrine.

Reusable lessons move through a governed maturity path:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED -> RETIRED`

The purpose is to learn from real work without allowing one successful case to become an unjustified universal rule.

## System roles

The Knowledge Plane connects several Signalproof surfaces:

- **Command** uses maintained knowledge to support action.
- **Radar** detects external information that may change current understanding.
- **Readiness** evaluates freshness, contradictions, evidence gaps, and trustworthiness.
- **Workbench** provides the human review surface for knowledge changes.
- **Build Ledger** remains the evidence and continuity record of what was done, verified, protected, or changed.

See [Signalproof Knowledge Plane](Signalproof-Knowledge-Plane.md) and [Command, Radar, Readiness, and Workbench](Command-Radar-Readiness-Workbench.md).