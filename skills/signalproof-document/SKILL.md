---
name: signalproof-document
description: Create or update durable project documentation from verified state, decisions, procedures, interfaces, acceptance evidence, and explicit non-claims while preserving provenance, version scope, source-of-truth boundaries, and staleness signals. Use when documentation must accurately represent what is known without silently inventing facts, flattening evidence classes, or allowing an old document to masquerade as current system truth.
---

# Signalproof Document

## Purpose

`signalproof-document` is the durable-documentation specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

Its central rule is:

> **Document the strongest supported state, identify its source and scope, and never let polished prose outrank verified system evidence.**

Documentation preserves continuity. It must not create false continuity by making inferred, proposed, stale, or unverified material read like current fact.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, smallest effective action, verification, review, readiness, recovery, security, release, milestone closeout, STOP conditions, public/private boundaries, proof, and continuity.

Documentation does not automatically authorize implementation, policy change, architecture change, release, signing, security approval, deployment, or canonical Build Ledger mutation.

## Documentation Contract

1. **Define the document purpose and audience.** A handoff, SOP, ADR, release note, README, build report, acceptance record, operator guide, and architecture reference have different truth requirements.
2. **Identify source-of-truth inputs before drafting.** Prefer current verified artifacts, canonical repository state, accepted decisions, direct runtime evidence, and owner authority over stale summaries or conversational memory.
3. **Preserve evidence class.** Artifact-backed, runtime-verified, human-observed, design authority, inference, and proposal must not silently collapse into one factual voice.
4. **Bind documentation to version/state.** Record the relevant artifact, commit, version, date, environment, milestone, or other identity needed to interpret the document correctly.
5. **Distinguish current state from planned state.** Planned, proposed, candidate, pending, deprecated, and active states must remain explicit.
6. **Do not invent missing facts to make documentation complete.** Mark UNKNOWN, UNVERIFIED, PENDING, or NOT PROVIDED when the source does not support a statement.
7. **Preserve contradictions and supersession.** Later evidence may supersede earlier state, but prior failures, rejected candidates, and historical decisions remain traceable when material.
8. **Respect canonical authority.** A README, handoff, generated report, or prose summary does not silently override the repository, runtime, Build Ledger, ADR, registry, or other declared authority.
9. **Prevent staleness ambiguity.** Time-sensitive or state-sensitive documentation should identify freshness, last-verified state, or the mechanism for determining current truth.
10. **Protect private and sensitive material.** Do not move secrets, credentials, private reasoning, private customer data, internal-only evidence, or sensitive identifiers into public documentation merely because they appeared in working context.
11. **Keep claims proportional to evidence.** “Compiled,” “tested,” “verified,” “secure,” “ready,” “released,” and “working” have distinct evidence boundaries.
12. **Preserve actionable recovery and failure information.** Do not document only the happy path when rollback, STOP conditions, or known failure modes materially affect safe operation.
13. **Minimize duplication of volatile truth.** Link or point to canonical state when repeating it would create avoidable drift.
14. **Close documentation milestones appropriately.** Meaningful documentation baselines and handoffs still route through `signalproof-closeout` when they represent a phase boundary.

## Documentation Workflow

### 1. Define the Document Objective

Capture:

- document type;
- intended audience;
- decision or operation it supports;
- required scope;
- public/private boundary;
- canonical sources;
- version/state boundary;
- update owner or freshness expectation when relevant.

### 2. Establish the Evidence Package

Use the strongest available inputs, such as:

- canonical repository files and commit identity;
- accepted ADRs/design authority;
- Build Ledger records or staged noncanonical deltas;
- runtime/acceptance results;
- Verify/Review/Security/Readiness/Recovery/Release outcomes;
- owner-observed acceptance;
- exact artifact hashes/manifests;
- existing documentation being updated.

If a source is stale, contradictory, incomplete, or noncanonical, state that before using it.

### 3. Classify Content Before Writing

For material statements classify them as:

- **CURRENT VERIFIED STATE**
- **CURRENT ARTIFACT-BACKED STATE**
- **HUMAN-OBSERVED STATE**
- **DESIGN AUTHORITY**
- **HISTORICAL STATE**
- **PENDING / CANDIDATE**
- **INFERENCE**
- **PROPOSAL**
- **UNKNOWN / UNVERIFIED**

The final document need not expose these exact labels everywhere, but its wording must preserve the distinction.

### 4. Resolve Source Conflicts Without Inventing Truth

When sources disagree:

1. identify each source and its scope/date/version;
2. prefer the declared canonical authority for the question;
3. preserve stronger direct evidence over weaker summaries where governance allows;
4. mark unresolved contradiction when authority cannot be determined;
5. do not harmonize incompatible facts merely for readability.

Use `signalproof-investigate` or `signalproof-verify` when the underlying truth itself must be established.

### 5. Bind the Document to State

Where material, include:

- product/project name;
- version/build/commit;
- artifact identity or SHA-256;
- environment/target scope;
- date or milestone;
- status such as Active/Candidate/Deprecated/Pending;
- canonical source location;
- supersedes/superseded-by relationship.

A document without a state boundary can become misleading even if every sentence was once correct.

### 6. Write for the Document Type

#### Handoff
Preserve objective, current state, protected state, accepted decisions, open gates, evidence, rollback/recovery, exact next action, and what must not be assumed.

#### SOP / Runbook
Preserve prerequisites, authority, ordered steps, expected results, verification, STOP conditions, recovery, and escalation/ownership.

#### ADR
Preserve context, decision, alternatives considered, constraints, consequences, evidence basis, authority, date/version, and supersession state.

#### Release Notes
Preserve exact release identity, changes, evidence-supported status, known limitations, compatibility boundary, rollback, signing/security state, and non-claims.

#### README / Overview
Keep durable concepts local; point volatile status to canonical registry/status sources where possible.

#### Acceptance / Build Report
Preserve exact scenario, artifact/environment identity, expected behavior, actual result, pass/fail counts, evidence limitations, failures, and non-claims.

### 7. Apply the Staleness Test

Ask:

- Could this statement change independently of the document?
- Is it duplicating a registry, manifest, version file, runtime state, external service state, or current dependency status?
- Would a reader know when it was last verified?
- Is there a canonical place to check current truth?

If yes, prefer a bounded snapshot statement or canonical reference rather than timeless prose.

### 8. Apply the Claim Test

For consequential words, check evidence:

- **installed** ≠ configured;
- **detected** ≠ ready;
- **compiled** ≠ runtime verified;
- **tests passed** ≠ reviewed or secure;
- **security scoped pass** ≠ universally secure;
- **backup exists** ≠ verified rollback;
- **release ready** ≠ published;
- **candidate** ≠ active;
- **planned** ≠ implemented.

Use the narrowest accurate wording.

### 9. Apply the Public/Private Boundary

Before publishing or committing documentation, remove or avoid:

- secrets/tokens/passwords/keys;
- private chain-of-thought or hidden reasoning;
- customer/private user data not authorized for publication;
- internal-only paths or infrastructure details when disclosure is not intended;
- security-sensitive operational detail whose publication would violate policy;
- proprietary content not licensed for redistribution.

Preserve enough provenance to be useful without leaking protected material.

### 10. Validate Documentation Against Sources

Before calling the document complete:

- compare current-version identifiers;
- verify statuses and names;
- verify links/paths when part of the acceptance boundary;
- check that active/planned/candidate distinctions are correct;
- check acceptance numbers and artifact hashes exactly;
- ensure open gates remain visible;
- ensure non-claims are not contradicted elsewhere in the document;
- identify any statement that is not source-supported.

Use `signalproof-verify` when a material factual claim requires direct proof rather than editorial checking.

### 11. Documentation Decision

Return one of:

- **DOCUMENTATION READY** — document accurately represents the defined state and sources.
- **READY WITH STALENESS BOUNDARY** — accurate as a bounded snapshot with explicit freshness/current-truth references.
- **SOURCE VERIFICATION REQUIRED** — one or more material claims need Verify/Investigation before documentation can be authoritative.
- **DOCUMENTATION CHANGES REQUIRED** — wording, provenance, status, privacy, versioning, or scope is materially inaccurate/incomplete.
- **BLOCKED** — required sources or authority are unavailable.
- **STOP** — publishing would expose protected information, overwrite canonical truth with unsupported prose, erase material failure history, or knowingly make unsupported consequential claims.

## Documentation vs Verify, Review, Research, Evaluate, Closeout

`signalproof-research` establishes external evidence.

`signalproof-evaluate` determines disposition against explicit criteria.

`signalproof-verify` proves specific claims.

`signalproof-review` assesses the work/change itself.

`signalproof-document` turns established state, evidence, and decisions into durable human-usable records without changing their evidentiary meaning.

`signalproof-closeout` governs milestone continuity and Build Ledger transition.

Document may consume their outputs but must not silently replace them.

## Canonical Truth Rule

```text
POLISHED DOCUMENT
      ≠
CANONICAL SYSTEM STATE
```

If a document conflicts with the declared canonical source, fix or qualify the document. Do not reinterpret the canonical source merely to preserve prose consistency.

## Snapshot Rule

A point-in-time document should say what it is:

> “Verified for version X / commit Y / environment Z as of the stated milestone.”

Do not rewrite a snapshot into a timeless universal statement.

## Documentation Is Not Authority

Creating an SOP does not authorize its execution. Writing an ADR does not create architecture authority unless the required human/project authority approved the decision. Writing release notes does not release software. Writing “secure” does not establish security. Writing “active” does not promote a candidate.

## STOP Conditions

Stop when:

- the canonical source for a material statement is unknown or contradictory and the document would otherwise present certainty;
- documentation would expose secrets, private data, or protected internal material;
- a candidate/planned state would be represented as active/current;
- stale evidence would be represented as current without qualification;
- a failed/rejected result would be erased or rewritten as success;
- unsupported production/security/release/readiness claims are being requested;
- a document is being used to bypass required Verify/Review/Security/Release/owner authority;
- canonical Build Ledger history would be hand-edited or fabricated to make documentation complete.

## Anti-Patterns

Fail this skill when documentation:

- copies an old README status without checking the current registry;
- calls a candidate Active because the branch exists;
- converts a compile result into “working on Windows”;
- copies a stale external claim as current fact;
- hides failed acceptance runs to make a handoff cleaner;
- records a backup as verified rollback without recovery evidence;
- claims a release is signed when signing is pending;
- treats a staged noncanonical Build Ledger delta as a canonical append;
- republishes secrets or private reasoning from working notes;
- duplicates volatile state everywhere instead of identifying a canonical source;
- documents a proposal in imperative language as though it were already approved;
- creates invented dates, hashes, PR numbers, versions, or evidence to fill gaps.

## Completion Criteria

Documentation is complete when the document objective, audience, public/private boundary, source-of-truth inputs, state/version scope, evidence wording, current/planned/historical distinctions, contradictions, staleness boundary, sensitive-data handling, recovery/failure context, verification limitations, canonical references, and non-claims are explicit enough that another competent human or agent can rely on the document without mistaking presentation quality for stronger evidence than actually exists.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-document`
- **Version:** `0.1.0-rc1`
- **Maturity:** Initial public release candidate
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-investigate`, `signalproof-research`, `signalproof-evaluate`, `signalproof-readiness`, `signalproof-plan`, `signalproof-build`, `signalproof-verify`, `signalproof-review`, `signalproof-security`, `signalproof-recovery`, `signalproof-release`, `signalproof-closeout`
- **Domain:** Durable documentation, source-of-truth control, evidence-preserving prose, version binding, staleness management, provenance, handoffs, SOPs, ADRs, reports, public/private documentation boundaries
- **Created by:** Doc Reo / Signalproof
