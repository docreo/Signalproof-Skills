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

## Documentation Contract

1. Define the document purpose, audience, public/private boundary, and state/version scope.
2. Identify source-of-truth inputs before drafting; prefer canonical repository state, verified artifacts, accepted decisions, runtime evidence, and owner authority over stale summaries.
3. Preserve evidence class. Artifact-backed, runtime-verified, human-observed, design authority, inference, proposal, and unknown states must not silently collapse into one factual voice.
4. Distinguish current, historical, planned, candidate, pending, deprecated, and active state explicitly.
5. Never invent missing facts, dates, versions, hashes, PR numbers, statuses, or evidence to make documentation complete.
6. Preserve contradictions, failed evidence, supersession, and rejected candidates when material.
7. Respect canonical authority. README, handoff, generated report, or prose summary does not silently override the repository, runtime, Build Ledger, ADR, registry, or other declared authority.
8. Prevent staleness ambiguity. State-sensitive documentation should identify freshness, last-verified state, or where current truth is determined.
9. Protect secrets, credentials, private reasoning, private customer data, internal-only evidence, and other protected material from inappropriate publication.
10. Keep consequential claims proportional to evidence: compiled, tested, runtime-verified, reviewed, secure, ready, released, signed, and working are not interchangeable.
11. Preserve recovery, STOP conditions, limitations, and material failure information rather than documenting only the happy path.
12. Minimize duplicated volatile truth; point to canonical state when repetition would create avoidable drift.
13. Route unresolved material factual conflicts to `signalproof-verify` or `signalproof-investigate` instead of inventing a harmonized answer.
14. Close meaningful documentation milestones through `signalproof-closeout`.

## Workflow

### 1. Define the Document Objective

Capture document type, audience, decision/operation supported, required scope, public/private boundary, canonical sources, version/state boundary, and freshness/update expectation where relevant.

### 2. Establish the Evidence Package

Use the strongest available canonical repository state, ADR/design authority, Build Ledger or explicitly staged noncanonical evidence, runtime/acceptance results, Verify/Review/Security/Readiness/Recovery/Release outcomes, owner-observed acceptance, hashes/manifests, and existing documentation.

Mark stale, contradictory, incomplete, historical, or noncanonical sources before using them.

### 3. Preserve Evidentiary Meaning

Material content should remain distinguishable as current verified state, artifact-backed state, human observation, design authority, historical state, candidate/pending state, inference, proposal, or unknown/unverified state. The prose need not expose these exact labels everywhere, but it must preserve their meaning.

### 4. Resolve Source Conflicts

When sources disagree:

1. identify scope/date/version for each source;
2. prefer the declared canonical authority for the question;
3. preserve stronger direct evidence over weaker summaries where governance allows;
4. mark unresolved contradiction when authority cannot be established;
5. do not harmonize incompatible facts merely for readability.

### 5. Bind the Document to State

Where material, record project/product, version/build/commit, artifact identity/hash, environment/target scope, milestone/date, status, canonical source, and supersession relationship.

A statement that was once correct can become misleading when its state boundary is removed.

### 6. Document by Type

- **Handoff:** objective, current/protected state, accepted decisions, open gates, evidence, recovery, next action, and non-assumptions.
- **SOP/Runbook:** prerequisites, authority, ordered steps, expected results, verification, STOP conditions, recovery, escalation.
- **ADR:** context, decision, alternatives, constraints, consequences, evidence basis, authority, version/date, supersession.
- **Release notes:** exact release identity, changes, verified state, limitations, compatibility, rollback, signing/security state, non-claims.
- **README/Overview:** keep durable concepts local; point volatile status to canonical registry/status sources.
- **Acceptance/Build report:** exact scenario, artifact/environment, expected behavior, actual result, pass/fail counts, evidence limits, failures, non-claims.

### 7. Apply the Staleness Test

If a statement can change independently of the document, duplicates a registry/manifest/runtime/external service, or lacks a last-verified boundary, prefer a bounded snapshot or canonical reference rather than timeless prose.

### 8. Apply the Claim Test

Remember:

- installed ≠ configured;
- detected ≠ ready;
- compiled ≠ runtime verified;
- tests passed ≠ reviewed or secure;
- Security SCOPED PASS ≠ universally secure;
- backup exists ≠ verified rollback;
- release ready ≠ published;
- candidate ≠ active;
- planned ≠ implemented.

Use the narrowest accurate wording.

### 9. Protect the Public/Private Boundary

Do not publish secrets/tokens/passwords/keys, hidden reasoning, unauthorized customer/user data, protected internal infrastructure detail, security-sensitive operational detail outside policy, or proprietary content without redistribution rights.

### 10. Validate Against Sources

Before completion, verify status/version/name consistency, acceptance counts, artifact hashes, active/planned/candidate distinctions, open gates, non-claims, and source support for material statements. Use `signalproof-verify` where the factual claim itself needs direct proof.

## Documentation Decisions

- **DOCUMENTATION READY** — accurately represents the defined state and sources.
- **READY WITH STALENESS BOUNDARY** — accurate as a bounded snapshot with explicit freshness/current-truth references.
- **SOURCE VERIFICATION REQUIRED** — material claims require Verify/Investigation.
- **DOCUMENTATION CHANGES REQUIRED** — wording, provenance, status, privacy, versioning, or scope is materially inaccurate/incomplete.
- **BLOCKED** — required sources or authority unavailable.
- **STOP** — publication would expose protected information, overwrite canonical truth with unsupported prose, erase material failure history, fabricate evidence, or make knowingly unsupported consequential claims.

## Canonical Truth Rule

```text
POLISHED DOCUMENT
      ≠
CANONICAL SYSTEM STATE
```

If prose conflicts with the declared canonical source, fix or qualify the prose rather than reinterpreting the source to preserve narrative consistency.

## Snapshot Rule

A point-in-time document should remain visibly bounded to the version, commit, artifact, environment, or milestone it represents. Do not rewrite a snapshot into a timeless universal statement.

## Documentation Is Not Authority

Creating an SOP does not authorize execution. Writing an ADR does not create architecture authority without the required approval. Writing release notes does not release software. Writing “secure” does not establish security. Writing “active” does not promote a candidate. Documentation consumes governed evidence; it does not manufacture authority.

## STOP Conditions

Stop when canonical truth for a material statement is unknown/contradictory but certainty would be published; secrets/private data would leak; candidate/planned state would be represented as active; stale evidence would be represented as current; failed evidence would be erased; unsupported production/security/release/readiness claims are requested; documentation is being used to bypass Verify/Review/Security/Release/owner authority; or canonical Build Ledger history would be fabricated or hand-edited.

## Anti-Patterns

Fail when documentation copies stale status without checking current authority; inflates compile evidence into runtime truth; hides failed tests; treats a staged ledger delta as canonical; turns proposals into implemented state; duplicates volatile status everywhere; republishes protected data; calls a backup a verified rollback without evidence; reports pending signing/release as completed; or invents identifiers/evidence to fill gaps.

## Completion Criteria

Documentation is complete when objective, audience, public/private boundary, source-of-truth inputs, version/state scope, evidence wording, current/planned/historical distinctions, contradictions, staleness boundary, sensitive-data handling, recovery/failure context, verification limits, canonical references, and non-claims are explicit enough that another competent human or agent can rely on the document without mistaking presentation quality for stronger evidence than actually exists.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-document`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-investigate`, `signalproof-research`, `signalproof-evaluate`, `signalproof-readiness`, `signalproof-plan`, `signalproof-build`, `signalproof-verify`, `signalproof-review`, `signalproof-security`, `signalproof-recovery`, `signalproof-release`, `signalproof-closeout`
- **Domain:** Durable documentation, source-of-truth control, evidence-preserving prose, version binding, staleness management, provenance, handoffs, SOPs, ADRs, reports, public/private documentation boundaries
- **Created by:** Doc Reo / Signalproof
