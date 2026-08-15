# Signalproof Skills V0.2 — Governed Capability Intake & Assurance Objective

**Status:** Objective definition / research authorization only  
**Version:** V0.2 objective baseline  
**Canonical parent:** `04767ee4116e0d6968a3d341a8952e4853baa3ad`

## Objective

Define a governed Signalproof method for discovering, inspecting, classifying, testing, provenance-recording, and dispositioning external or newly extracted capabilities before they may become trusted Signalproof capability.

This objective exists because the same intake problem now recurs across skills, tools, agents, frameworks, runtimes, models, connectors, libraries, and research projects.

> **Discovery is not trust. Extraction is not approval. Recommendation is not authority. Installation is not activation.**

## Problem to solve

Signalproof needs a repeatable way to answer, with evidence:

1. What is this capability?
2. Where did it come from?
3. What exactly was inspected, and at what version/commit/hash?
4. What license, attribution, dependency, permission, execution, network, data, and security boundaries apply?
5. What capability does it provide that Signalproof does not already possess?
6. Is it a direct dependency, adaptation candidate, compatibility target, design influence, clean-room reference, internal derivation, or unrelated discovery?
7. What evidence supports adopting, adapting, integrating, studying, rebuilding, rejecting, or watchlisting it?
8. What tests would falsify the proposed disposition?
9. What human authority is required before execution, installation, activation, publication, or policy/skill promotion?
10. What evidence and provenance must be retained so the same investigation is not repeated from scratch?

## Governing intake flow

```text
DISCOVER / RECEIVE
        ↓
QUARANTINE / NON-EXECUTING INTAKE
        ↓
IDENTIFY EXACT SOURCE + VERSION + LICENSE + HASH/COMMIT
        ↓
STATIC / DOCUMENTARY INSPECTION
        ↓
SECURITY + PERMISSION + DATA/NETWORK + DEPENDENCY BOUNDARY REVIEW
        ↓
CAPABILITY GAP / DUPLICATION ANALYSIS
        ↓
RESEARCH
        ↓
EVALUATE
        ↓
DISPOSITION
  ├─ ADOPT
  ├─ ADAPT
  ├─ INTEGRATE
  ├─ STUDY / REFERENCE
  ├─ CLEAN-ROOM REBUILD
  ├─ BUILD FROM SCRATCH
  ├─ WATCHLIST
  └─ REJECT
        ↓
HUMAN AUTHORITY GATE
        ↓
CANDIDATE IMPLEMENTATION / TESTING
        ↓
VERIFY → REVIEW → SECURITY as applicable
        ↓
DOCUMENT → CLOSEOUT → LEARN
        ↓
ONLY THEN: governed activation/promotion if separately approved
```

## Scope

This V0.2 objective covers intake governance for:

- AI/agent skills and skill collections;
- agents and agent frameworks;
- models and runtimes;
- libraries and packages;
- connectors and MCP servers;
- desktop/web applications and developer tools;
- research repositories and prototypes;
- extracted or inferred reusable capability from completed Signalproof work.

## Candidate capability areas to research

These are **research/evaluation candidates**, not Active skills:

- Safe Third-Party Skill Inspection;
- Application / Repository Provenance Check;
- Dependency and License Safety Inspection;
- Permission / Network / Data-Flow Inspection;
- Capability Gap and Duplication Analysis;
- Skill Candidate Extraction from completed work;
- Skill Provenance Review;
- Intake Disposition Record;
- Candidate Acceptance / Falsification Test generation;
- portability testing across model/agent/runtime environments;
- reusable intake evidence envelope/schema.

## Existing Signalproof disciplines that must be reused

V0.2 must not duplicate existing Active skill authority.

- `signalproof-research` — establish external evidence;
- `signalproof-evaluate` — recommend disposition against explicit criteria;
- `signalproof-security` — security-sensitive trust/permission/dependency/data boundaries;
- `signalproof-readiness` — target-specific prerequisite state;
- `signalproof-verify` — prove material claims;
- `signalproof-review` — review work quality and scope fidelity;
- `signalproof-document` — preserve established state without strengthening evidence;
- `signalproof-learn` — extract reusable capability without automatic doctrine;
- `signalproof-closeout` — preserve milestone and phase transition evidence;
- `signalproof-router` — select the smallest sufficient existing discipline.

A new specialist is justified only if Research/Evaluate show a recurring capability gap that cannot be expressed cleanly by the existing suite.

## Human-authority boundary

No intake agent, scanner, extractor, guild, model, or automation may automatically:

- approve itself;
- install or execute quarantined code;
- elevate privilege;
- obtain or expand credentials;
- enable network/data access beyond an approved inspection boundary;
- suppress adverse findings;
- rewrite provenance;
- designate a capability trusted/Active;
- merge or publish a skill;
- alter security controls;
- append fabricated canonical Build Ledger state.

Automation may discover, inspect, classify, test, compare, and recommend within its granted boundary. Human authority remains separate.

## Provenance requirement

Every material disposition should retain, where applicable:

- source repository/project and publisher/author;
- exact version/tag/commit/hash;
- license and attribution requirements;
- files/surfaces actually inspected;
- tools/scanners/models/agents used;
- tests actually run and their scope;
- known failures and unresolved unknowns;
- permission/network/data/dependency observations;
- duplication/gap analysis;
- disposition and rationale;
- approval authority;
- implementation/adaptation boundary;
- rollback/recovery implications;
- later supersession or rejection history.

Public evidence must exclude secrets, credentials, private chain-of-thought, customer/private data, and unnecessary private machine paths.

## Relationship to the Capability Acquisition & Assurance Guild

The planned Signalproof Capability Acquisition & Assurance Guild may later automate portions of this intake workflow using the Signalproof Core Runtime and agent protocol.

The Guild is a **consumer of this governance contract**, not the source of its authority.

It may discover technologies/agents/capabilities, inspect them, compare them with existing Signalproof intelligence, identify gaps, and recommend dispositions. It may not self-approve, self-install, self-escalate, or silently convert research findings into Active capability.

## Acceptance criteria for this V0.2 research phase

The next research/evaluation milestone is complete only when:

1. current Signalproof intake intelligence and existing skills are mapped to avoid duplication;
2. at least three materially different intake cases are analyzed (for example: a third-party skill collection, an agent/framework, and a model/runtime/tool);
3. the common evidence/provenance fields are identified;
4. local-only versus genuinely reusable workflow steps are separated;
5. security/license/permission/data/network hard gates are defined;
6. adopt/adapt/integrate/study/rebuild/reject/watchlist disposition criteria are explicit;
7. at least one falsifiable acceptance scenario is defined for any proposed new capability;
8. Research and Evaluate determine whether V0.2 should produce a new skill, a shared schema/checklist/test suite, automation, or no new specialist;
9. no candidate is represented as Active before normal candidate → test → approval → promotion governance;
10. the milestone is closed before implementation begins.

## Initial research cases

Priority evidence cases should include previously identified real Signalproof intake work such as:

- external skill repositories / skill-creator systems;
- capability inspection tooling such as SkillSpector;
- agent frameworks considered for Signalproof use;
- one model/runtime or connector candidate with materially different dependency/security characteristics.

The purpose is not to re-review every technology immediately. The purpose is to derive a reusable intake contract from sufficiently different evidence cases without overfitting one example.

## Non-claims

This objective does not:

- create a new Active skill;
- authorize cloning, installing, or executing any third-party project;
- approve any previously researched technology;
- create cybersecurity/compliance certification;
- authorize the Capability Acquisition Guild to operate autonomously;
- replace product-specific readiness, security, release, or recovery testing.

## Phase decision

**V0.2 OBJECTIVE DEFINED — RESEARCH → EVALUATE AUTHORIZED**

The next action is to build the evidence matrix from real intake cases and determine the smallest durable V0.2 capability output.