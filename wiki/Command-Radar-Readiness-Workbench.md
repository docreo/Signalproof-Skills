# Command, Radar, Readiness, and Workbench

The Signalproof Knowledge Plane is not a standalone notebook. It is used through coordinated system surfaces that each have a distinct responsibility.

## Command

**Command** is the human-facing access and orchestration surface.

Its role is to:

- receive intent;
- route questions and tasks;
- retrieve relevant knowledge;
- identify when more evidence is needed;
- present current state with authority and provenance boundaries;
- invoke approved downstream capability.

Command should not need to reconstruct known context from scratch when maintained knowledge already exists.

## Radar

**Radar** is the external sensing and discovery surface.

Its role is to detect information that may alter current understanding, including:

- model and tool releases;
- dependency changes;
- security developments;
- competitor activity;
- research;
- standards;
- regulatory or ecosystem changes;
- relevant public technical information.

Radar findings are not automatically truth or policy. They enter the knowledge workflow as candidate evidence or candidate knowledge.

```text
EXTERNAL SIGNAL
    ↓
RADAR
    ↓
SOURCE / CANDIDATE FINDING
    ↓
INGEST / VERIFY
    ↓
KNOWLEDGE UPDATE
```

## Readiness

**Readiness** evaluates whether current knowledge and systems are sufficiently trustworthy and prepared for their intended use.

For the Knowledge Plane, Readiness may inspect:

- stale knowledge;
- unresolved contradictions;
- missing provenance;
- unsupported claims;
- orphaned pages or concepts;
- missing cross-links;
- unverified operational assertions;
- pending human review;
- outdated dependency information;
- gaps between documentation and current canonical state.

This extends system readiness beyond uptime. A system may be technically available while its knowledge state is stale, contradictory, or weakly evidenced.

## Workbench

**Workbench** is the human review and knowledge-authoring environment.

It should make source-to-knowledge changes inspectable.

A useful pattern is:

```text
SOURCE / EVIDENCE          PROPOSED KNOWLEDGE
-----------------          ------------------
Original document     →    Summary / concept
Repository state      →    Architecture update
Test result           →    Verified claim
New source            →    Contradiction notice
Research              →    Candidate relationship
```

The operator can then accept, modify, reject, defer, or request more evidence.

Workbench is therefore the natural place for human-in-the-loop knowledge maintenance.

## One architecture, four surfaces

```text
                        COMMAND
                           ↓
                    KNOWLEDGE PLANE
                     ↙     ↓      ↘
                 RADAR  READINESS  WORKBENCH
```

These are not four unrelated dashboards.

- Radar helps determine what may have changed.
- Workbench helps determine what should be incorporated.
- Readiness helps determine whether current knowledge can be trusted for the intended task.
- Command uses that maintained state to support action.

## Relationship to the Build Ledger

The Build Ledger remains separate.

```text
KNOWLEDGE PLANE  →  What do we know?
BUILD LEDGER      →  What did we do, verify, protect, or change?
GOVERNANCE        →  What is authorized?
RUNTIME STATE     →  What is currently operating?
```

These systems should link to one another when useful, but should not collapse their authority boundaries.
