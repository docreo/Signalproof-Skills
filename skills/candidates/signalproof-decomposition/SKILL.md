---
name: signalproof-decomposition
description: Decompose heavy Signalproof products and runtimes into bounded subsystems with stable interfaces, preserved authority boundaries, independent testability, and reversible integration while avoiding unnecessary fragmentation of simple tools.
---

# Signalproof Decomposition

## Status

**CANDIDATE / NOT ACTIVE — RD1**

## Purpose

`signalproof-decomposition` is the architectural specialist for preventing complex Signalproof products from becoming brittle monoliths.

> **Keep product identity unified. Split implementation responsibility where complexity, state, failure domains, or change velocity justify independent boundaries.**

This skill generalizes lessons from the OpenAI Codex source architecture into a Signalproof build pattern. Codex is evidence and inspiration only; Signalproof owns its architecture, governance, implementation, product identity, and UX.

## Trigger

Use decomposition when one or more of the following are materially true:

- a product contains multiple independently evolving capabilities;
- state, memory, model/runtime, media processing, connectors, permissions, or UI logic are entangled;
- one subsystem failure can destabilize unrelated functionality;
- the build cannot be tested or replaced in bounded units;
- multiple agents/teams need clear ownership boundaries;
- the same subsystem should be reusable across products;
- a component needs an independently governed security, permission, or data boundary;
- a heavy product such as Workbench, Media Studio, Music Studio, Video Studio, or Greenlight is accumulating cross-domain responsibilities.

Do **not** decompose merely because decomposition is fashionable. Small, cohesive tools may remain simple when splitting them would add more coupling, latency, deployment burden, or maintenance cost than it removes.

## Core Contract

1. Preserve the product-facing experience as one coherent Signalproof product even when its implementation is decomposed.
2. Identify responsibilities before choosing packages, services, processes, repositories, languages, or deployment boundaries.
3. Separate subsystems by coherent responsibility, state ownership, failure domain, authority boundary, and change cadence.
4. Define explicit interfaces between subsystems. Prefer typed/versioned contracts where practical.
5. Keep domain identity separate from implementation choice: agent role is not model identity; product module is not vendor identity; connector is not authority.
6. Preserve human authority and Signalproof governance across every boundary.
7. Separate permission capability from approval policy.
8. Separate model/provider routing from agent identity and task role.
9. Separate memory read/retrieval from memory extraction/consolidation/write governance when persistent memory is material.
10. Make each significant subsystem independently observable, testable, replaceable, and recoverable where practical.
11. Preserve provenance, rollback, protected state, and exact acceptance criteria during migration.
12. Integrate proven legacy behavior through adapters or compatibility contracts before retiring old paths.
13. Do not rewrite accepted behavior solely to achieve architectural purity.
14. Avoid distributed-monolith failure: splitting files/processes without reducing coupling does not count as successful decomposition.
15. Record rejected boundaries when a proposed split creates more operational cost than architectural value.

## Standard Decomposition Lanes

Heavy Signalproof tools should consider these lanes, but only instantiate those justified by evidence:

```text
PRODUCT / CLIENT EXPERIENCE
    Signalproof UI, navigation, workflows, user-visible state

CONTROL / APPLICATION API
    stable product commands, orchestration-facing contracts

AGENT ORCHESTRATION
    roles, identity, graph, spawning, collaboration, task ownership

MODEL RUNTIME
    provider abstraction, model catalog, routing, capability gates, auth scopes

TOOLS / CONNECTORS
    MCP, plugins, integrations, external apps, governed tool invocation

MEMORY / CONTEXT
    retrieval, citations, extraction, consolidation, retention, scoped context

GOVERNANCE
    permissions, approval, authority, protected state, evidence, policy

EXECUTION
    sandbox, shell/process, worktree/filesystem, network execution boundaries

STATE / HISTORY
    sessions, rollouts, queues, durable state, logs, continuity

MEDIA / DOMAIN ENGINES
    audio, video, image, rendering, transcription, generation, editing engines
```

The product need not implement all lanes as separate processes. A boundary can be a module, crate/package, internal service, worker, plugin, or external service depending on scale and evidence.

## Workbench Core Baseline

The new Workbench Core should preserve accepted legacy behavior while reorganizing its internals around bounded responsibilities.

Preserve as invariants unless later evidence authorizes change:

- Signalproof product identity and visual language;
- conversation-first Workbench experience and accepted navigation behavior;
- Governor as the authority/governance boundary;
- Core Runtime as the durable product runtime boundary;
- Agent Runtime/Broker separation from UI concerns;
- distinct Sessions and Bots state;
- Bots do not become authority merely because they can act;
- existing proven model/runtime paths, including Granite, remain available during migration;
- Control/Evidence surfaces remain inspectable;
- local-first capability remains a design objective where compatible with the workload.

Target operational characteristics:

- Hermes-style fluid agent/tool operation;
- proper LLM/provider abstraction rather than hard-wired model identity;
- Codex-informed decomposition patterns where they survive Signalproof review;
- Signalproof governance, knowledge, evidence, UX, branding, and product ownership.

## Migration Pattern

For an existing heavy tool:

1. **Inventory legacy behavior** — accepted user-visible behavior, state, protocols, dependencies, known failures, and protected invariants.
2. **Draw responsibility map** — identify domains currently sharing one component.
3. **Locate seams** — existing APIs, interfaces, event boundaries, data ownership, or adapter opportunities.
4. **Select smallest valuable split** — isolate the highest-coupling/highest-change/highest-risk responsibility first.
5. **Define compatibility contract** — old callers continue to work while new subsystem is introduced.
6. **Build bounded subsystem** — independent tests, telemetry, failure handling, recovery.
7. **Integrate behind adapter** — preserve product behavior.
8. **Verify parity and new capability** — machine gates plus human-visible acceptance where relevant.
9. **Retire duplicate path only after evidence** — no premature deletion of the proven implementation.
10. **Repeat only when the next split has measurable value.**

## Heavy Product Guidance

### Workbench / Agent Runtime

Prioritize agent identity/roles, model-provider routing, tools/connectors, memory, permissions/approval, execution isolation, state/history, and UI/runtime separation.

### Media Studio

Treat Media Studio as a product shell that can compose domain engines rather than one giant media implementation. Shared project/session state, asset registry, render jobs, model routing, storage, provenance, and export contracts should be explicit.

### Music Studio

Potential bounded domains include project/song state, timeline/arrangement, recording/import, playback engine, waveform/audio analysis, effects/mix pipeline, MIDI/instrument generation, AI composition assistance, model/provider routing, rendering/export, and asset/version history.

### Video Studio

Potential bounded domains include project/timeline state, media ingest/index, proxy/transcode, preview/playback, edit graph, captions/transcription, effects/compositing, AI generation/analysis, render queue, export, and asset/version history.

### Greenlight

Potential bounded domains should be determined from its actual product contract, but readiness/scoring, evidence ingestion, recommendation logic, workflow state, integrations, identity/permissions, and presentation should not become one inseparable implementation if they evolve independently.

## Interface Rules

A boundary is acceptable when it has:

- explicit inputs and outputs;
- owned state or a clearly declared stateless contract;
- defined errors/failure behavior;
- authority/permission assumptions;
- versioning or compatibility strategy where external callers depend on it;
- observability sufficient to localize failure;
- tests that prove the contract independently;
- a recovery/rollback story.

Prefer events for loose coordination and request/response contracts for direct commands. Do not use events to hide required consistency semantics.

## Model / Agent Separation

Signalproof agent identity must survive model changes.

```text
Agent Role -> Task Requirements -> Capability Policy -> Provider -> Model
```

Do not encode:

```text
Agent Role == Specific LLM
```

This allows Builder, Charlie, Nick, Dani, researchers, reviewers, or future specialist roles to retain their governed identity while the model switchboard selects the most appropriate available model.

## Decomposition Decision

Classify a proposed split as:

- **KEEP TOGETHER** — responsibility is cohesive and split cost exceeds benefit.
- **MODULE SPLIT** — separate package/module, same runtime/process.
- **PLUGIN / ADAPTER SPLIT** — replaceable implementation behind stable interface.
- **WORKER SPLIT** — isolated execution/job boundary is valuable.
- **SERVICE SPLIT** — independent deployment, scaling, security, or availability boundary is justified.
- **EXTERNAL PROVIDER BOUNDARY** — vendor/service integration is isolated behind Signalproof-owned contract.

Do not jump directly to SERVICE SPLIT when MODULE or PLUGIN boundaries satisfy the requirement.

## Anti-Patterns

STOP or redesign when decomposition creates:

- circular subsystem dependencies;
- shared mutable state with unclear ownership;
- duplicate authority/governance logic;
- vendor-specific concepts leaking throughout the product;
- UI components directly owning privileged execution;
- every feature requiring coordinated changes across many modules;
- network/service boundaries with no independent scaling/security reason;
- hidden data replication with no consistency contract;
- adapter layers that permanently preserve two competing sources of truth;
- a "microservices" label without reduced coupling or improved failure isolation.

## Evidence / Acceptance

A decomposition milestone is not successful merely because code moved.

Acceptance should demonstrate as applicable:

- preserved legacy behavior;
- reduced coupling or clearer responsibility ownership;
- independent subsystem tests;
- localized failure;
- stable interface contract;
- successful replacement/mockability where claimed;
- unchanged or improved security/authority boundaries;
- observable state and evidence;
- rollback or compatibility path;
- user-facing parity where the migration is internal.

## Relationship to Other Signalproof Skills

- `signalproof-design` owns product information/state architecture and user-visible behavior.
- `signalproof-plan` converts the decomposition decision into bounded implementation stages.
- `signalproof-build` implements one bounded stage.
- `signalproof-build-spawn-debug` coordinates convergence and challenge lanes.
- `signalproof-known-errors` and Candidate Failure Intelligence prevent repeating prior architectural failures.
- `signalproof-security` and its specialists own security-specific controls.
- `signalproof-verify` proves architectural and behavioral claims.
- `signalproof-closeout` and `log-skill` govern reusable learning and milestone continuity.

This Skill does not grant deployment, canonical Build Ledger append, Skill activation, or destructive migration authority.

## Completion Criteria

Complete when the current product has an evidence-backed responsibility map, explicit retained invariants, a justified decomposition disposition for each major boundary, a smallest valuable migration stage, stable interface/compatibility requirements, acceptance evidence, and rollback/retirement criteria.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-decomposition`
- **Version:** `0.1.0-candidate`
- **Maturity:** Candidate
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Modular architecture, subsystem decomposition, and legacy-to-decomposed migration
- **Created by:** Doc Reo / Signalproof
