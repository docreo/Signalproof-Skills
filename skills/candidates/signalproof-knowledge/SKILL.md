---
name: signalproof-knowledge
description: Govern authorized source ingestion, source identity, rights-aware knowledge transformation, provenance, derived-policy propagation, knowledge-base preparation, and skill-candidate handoff without losing source ancestry or silently broadening permissions. Use when books, SOPs, manuals, white papers, training material, research, or other authorized sources must become structured reusable knowledge.
---

# Signalproof Knowledge

## Status

**CANDIDATE / NOT ACTIVE — RD0.5A EVIDENCE UPDATE**

This candidate is staged for governance review. It is not an Active Signalproof skill and must not be represented as one until testing, owner approval, registry promotion, and the applicable closeout path are complete.

## Purpose

`signalproof-knowledge` governs the transformation of authorized source material into structured, traceable knowledge that can be prepared for a knowledge base, learning workflow, procedure, or governed skill candidate.

Its central rule is:

> **Knowledge may be transformed, but its identity, provenance, restrictions, and human authority must not disappear during transformation.**

This skill is complementary to `signalproof-learn`. `signalproof-learn` extracts reusable lessons from completed evidence-backed work. `signalproof-knowledge` governs external/source-material transformation and knowledge-base preparation.

## Inheritance

This candidate inherits the root Signalproof requirements for human authority, evidence classification, protected state, public/private boundaries, verification, recovery, STOP conditions, milestone closeout, and governed skill activation.

It does not provide legal advice or determine whether a source is legally authorized. The human/operator must establish the declared rights basis and authorization boundary.

## Knowledge Contract

1. Register the source before transformation and bind source identity to a SHA-256 fingerprint.
2. Require a declared rights envelope before governed transformation.
3. Fail closed when rights are unknown, blocked, or insufficient for the requested operation.
4. Preserve exact source and policy ancestry on extracted knowledge objects.
5. Do not launder restrictions through derivation; derived knowledge inherits least-privilege parent permissions.
6. Preserve multi-generation root-source and root-policy lineage.
7. Keep effective policy separate from exact ancestry identity.
8. Re-check authorization at each export or downstream-use boundary.
9. Keep generated Signalproof skills as `CANDIDATE / NOT ACTIVE` until lifecycle governance is complete.
10. Do not silently broaden permissions through model changes, format conversion, summaries, merges, or repackaging.
11. Treat provenance validation failures as hard gates.
12. Preserve public/private boundaries and omit private paths, secrets, proprietary data, and unauthorized source material from public artifacts.
13. Persist provenance using globally unambiguous identity and reject orphaned, hash-mismatched, or ambiguous objects.
14. Minimize provenance storage to the identities, fingerprints, policy metadata, and edges required for audit and query.
15. Verify persisted ancestry before downstream claims rely on it.
16. Do not present provenance as trusted when the underlying registry fails integrity checks.
17. Keep provenance review read-only by default.
18. Minimize human-readable provenance exports.
19. Treat portable knowledge packaging as a new governed output boundary.
20. Bind every governed package to one declared intended output and verify that output is authorized.
21. Compile packages only from registry-integrity PASS and VERIFIED provenance objects.
22. Make governed package identity deterministic and tamper-evident.

## Workflow

### 1. Source Registration

Capture source title, declared version, source format, source SHA-256, deterministic source ID, and structural metadata where available. If the same declared version appears with changed bytes, stop until the discrepancy is resolved or a new version is assigned.

### 2. Rights Envelope

Record a machine-readable policy including rights basis, responsible authority, policy status, allowed uses, transformation permission, allowed outputs, redistribution permission, derivative permission, release label, and relevant authorization context.

The tool records the declaration; it does not independently make the legal determination.

### 3. Extraction and Provenance

Each knowledge object should retain object identity, source locator, source identity/hash, policy identity/hash, its own content fingerprint, extraction method, and available page/block/bounding-box evidence.

### 4. Derived Knowledge

Before combining or repackaging source-derived objects:

1. validate every parent;
2. verify each parent permits the derivation;
3. compute the least-privilege intersection of parent permissions;
4. preserve the most restrictive redistribution behavior;
5. preserve immediate parent references;
6. preserve root-source and root-policy ancestry;
7. bind ancestry with a deterministic lineage fingerprint;
8. validate the derived object before downstream use.

### 5. Output Authorization

Evaluate each requested output independently, such as `knowledge_base`, `training`, `procedure`, `skill_candidate`, `structured_xml`, or another registered adapter. If an output is not authorized by the effective policy, block it even when ingestion and transformation were permitted.

### 6. Persistent Provenance Registry

Register source and policy identity, bind local object IDs to source identity and fingerprints, require parents to exist before child registration, preserve root edges across generations, reject ambiguous IDs, avoid storing source filesystem paths by default, and verify registry integrity before relying on persisted lineage.

### 7. Provenance Review

Verify registry integrity, resolve an exact object, expose object identity/generation/hash/source location, immediate and recursive ancestry, root source/policy identity, effective policy, and integrity findings. Integrity failure must produce a blocked review rather than a trusted one.

### 8. Governed Knowledge Package Compilation

When governed objects must move into a Knowledge Base, learning, procedure, or skill workflow:

1. verify the provenance registry;
2. resolve every selected object exactly;
3. require VERIFIED provenance review for each selected object;
4. verify parent policies permit derivation/repackaging;
5. derive a least-privilege package policy;
6. authorize one declared `intended_output`;
7. bind content hashes, object identities, policy identity/lineage, intended output, and provenance review evidence into deterministic package identity;
8. write a candidate portable package with member checksums;
9. validate the package before downstream use;
10. keep downstream ingestion, publication, and activation as separate gates.

### 9. Skill Candidate Handoff

When the output is a Signalproof skill candidate, preserve source/policy provenance, mark it `CANDIDATE / NOT ACTIVE`, remove content not authorized for the publication boundary, define tests/non-scope, and route through the governed review/verification/approval lifecycle.

## Derived-Policy Rule

For multiple parents, effective permission is the least-privilege intersection. A later generation may narrow permissions but must not broaden them.

## STOP Conditions

Stop when rights are unknown or blocked; transformation or derivation is unauthorized; requested output is not permitted; source bytes changed under a reused version; ancestry cannot be reproduced; a downstream operation would broaden permissions; a generated skill is being activated without lifecycle governance; private/restricted material would cross a public boundary; or acceptance evidence is missing for a consequential provenance/authorization claim.

## Current Candidate Evidence

Signalproof Knowledge Forge RD0.3A through RD0.5A provide candidate evidence for:

- source identity and fingerprinting;
- machine-readable rights envelopes;
- fail-closed unresolved-rights behavior;
- output-specific authorization gates;
- exact source/policy ancestry;
- changed-source/version conflict detection;
- least-privilege multi-source policy propagation;
- no permission broadening across generations;
- root-source/root-policy preservation;
- policy-lineage tamper detection;
- persistent provenance registration and recursive lineage query;
- orphan/ambiguity/hash-drift rejection;
- integrity-aware human provenance review;
- governed multi-object package compilation;
- intended-output authorization bound to package creation;
- package tamper detection;
- deterministic package identity and deterministic portable ZIP output;
- negative evidence that restricted knowledge cannot be packaged for unauthorized `skill_candidate` output.

## Build Ledger Evidence Linkage

The RD0.5A candidate is linked to staged Signalproof Build Ledger evidence using stable event identities:

- `stage-skills:knowledge-forge:rd0.5a:signalproof-knowledge:0.1.0-candidate`
- `milestone-closeout:knowledge-forge:rd0.5a`
- `artifact-bind:knowledge-forge:rd0.5a`

Bound artifact evidence:

- Artifact: `Signalproof-Knowledge-Forge-RD0.5A.zip`
- SHA-256: `33c3bc5298986be13da2d511853d8b2911ec2f828ee294910d952c582e2b863a`
- Automated acceptance evidence: `37 PASS / 0 FAIL`
- Public-boundary review: `PASS`

Ledger status is **STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION**. These references provide continuity between the skill candidate and milestone evidence but must not be represented as a canonical Build Ledger append until the live ledger head and chain are verified.

## Candidate Acceptance Before Promotion

Promotion requires at minimum an end-to-end Knowledge Base adapter scenario, an end-to-end authorized Skill Candidate scenario, repetition of the restricted-source negative test at the final adapter boundary, overlap review against `signalproof-learn`, router review where applicable, public-boundary verification, owner approval, governed closeout, and chain-safe Build Ledger ingestion.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-knowledge`
- **Version:** `0.1.0-candidate`
- **Maturity:** Candidate
- **Status:** Not Active
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-learn`, `signalproof-document`, `signalproof-review`, `signalproof-verify`, `signalproof-closeout`, `signalproof-router`
- **Domain:** Governed knowledge transformation, provenance, rights-aware derivation, Knowledge Base preparation, skill-candidate handoff
- **Created by:** Doc Reo / Signalproof
