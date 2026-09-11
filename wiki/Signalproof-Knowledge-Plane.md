# Signalproof Knowledge Plane

The **Signalproof Knowledge Plane** is the persistent knowledge layer between raw evidence, governed authority, operational systems, and AI-assisted work.

Its purpose is simple: useful knowledge should accumulate instead of being repeatedly rediscovered, while evidence, interpretation, authority, and operational state remain distinguishable.

## Core architecture

```text
RAW EVIDENCE
    ↓
INGEST / NORMALIZE
    ↓
COMPILED KNOWLEDGE
    ↓
DECISIONS / POLICY
    ↓
OPERATIONAL STATE
    ↓
AUTHORIZED USE
```

These layers are related, but they are not interchangeable.

## 1. Raw evidence

Raw evidence preserves the original source material used to support later claims. Depending on the project, this may include documents, source code, release artifacts, test results, transcripts, research material, logs, screenshots, or other inspectable records.

Raw evidence should remain recoverable and should not be silently rewritten merely to make a later interpretation look cleaner.

## 2. Ingest and normalization

Ingest converts source material into a form that can be indexed, compared, searched, and reasoned over without pretending that normalization changes the source itself.

Typical ingest work may include:

- metadata capture;
- deduplication;
- source classification;
- provenance attachment;
- format normalization;
- relationship extraction;
- candidate-claim extraction.

## 3. Compiled knowledge

Compiled knowledge is the maintained explanatory layer produced from source material and prior verified work.

It may contain:

- summaries;
- concepts;
- entities;
- relationships;
- comparisons;
- known contradictions;
- unresolved questions;
- reusable lessons;
- current understanding.

Compiled knowledge is useful because it allows future work to begin from accumulated understanding instead of repeatedly reconstructing the same context.

Compiled knowledge is **not automatically authority**.

## 4. Decisions and policy

An approved decision, standard, permission, product baseline, or governance rule belongs to an authority-bearing source appropriate to that system.

A wiki page may explain such a decision, but explanation does not create the decision.

Signalproof therefore separates:

```text
WHAT DO WE KNOW?      → Knowledge Plane
WHAT DID WE DO?       → Build / Assurance evidence
WHAT IS AUTHORIZED?   → Governance / policy / owner decision
WHAT IS RUNNING?      → Operational state
```

## 5. Operational state

Operational state describes the current condition of systems, releases, environments, products, services, integrations, and active work.

Operational state can change faster than explanatory documentation. Exact runtime or release status should therefore be verified against the canonical system that owns that state.

## Knowledge should compound

The preferred Signalproof pattern is:

```text
INGEST → COMPILE → USE → VERIFY → UPDATE
```

rather than:

```text
SEARCH → REASON → ANSWER → FORGET
```

When an investigation, answer, build, or research task produces durable knowledge, that knowledge should be considered for governed writeback so future work can reuse it.

## Hybrid retrieval model

The Knowledge Plane does not eliminate retrieval from original sources.

```text
QUESTION
   ↓
COMPILED KNOWLEDGE
   ↓
ENOUGH SUPPORT?
   ├─ YES → answer with appropriate evidence/authority boundary
   └─ NO  → retrieve source evidence → reason → update maintained knowledge
```

Compiled knowledge provides speed and continuity. Retrieval provides grounding and re-verification.

## Human authority

A model may propose a new summary, relationship, contradiction, or update. That technical capability does not automatically authorize the model to change policy, promote a release, alter a protected baseline, expose private information, or declare an operational fact verified.

Signalproof therefore treats AI-maintained knowledge as governed institutional memory under meaningful human control.

## System surfaces

The Knowledge Plane is used through several Signalproof surfaces:

- **Command** — asks, routes, and presents knowledge for action.
- **Radar** — detects external information that may change current understanding.
- **Readiness** — inspects knowledge health, freshness, contradictions, gaps, and verification state.
- **Workbench** — provides a human review surface for source-to-knowledge changes.

See [Command, Radar, Readiness, and Workbench](Command-Radar-Readiness-Workbench.md).

## Public and private knowledge

Signalproof follows a public-by-default rule for material intentionally suitable for the public Wiki. Private, customer-specific, security-sensitive, credential-bearing, proprietary, or restricted operational material remains in the private canonical system that owns it.

See [Public and Private Knowledge Boundary](Public-Private-Knowledge-Boundary.md).
