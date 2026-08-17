---
name: signalproof-knowledge
description: Govern authorized source ingestion, source identity, rights-aware knowledge transformation, provenance, derived-policy propagation, knowledge-base preparation, and skill-candidate handoff without losing source ancestry or silently broadening permissions. Use when books, SOPs, manuals, white papers, training material, research, or other authorized sources must become structured reusable knowledge.
---

# Signalproof Knowledge

## Status

**CANDIDATE / NOT ACTIVE — RD0.5B EVIDENCE UPDATE**

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

1. **Register the source before transformation.** Bind title, declared version, source type, source identity, and source SHA-256.
2. **Require a declared rights envelope.** Record rights basis, policy status, allowed uses, allowed outputs, transformation permission, redistribution permission, and derivative-output permission.
3. **Fail closed on unresolved authorization.** Unknown or blocked rights must not proceed into governed transformation.
4. **Preserve exact source ancestry.** Every extracted object must retain source ID/hash, policy ID/hash, source location where available, and its own content fingerprint.
5. **Do not launder restrictions through derivation.** Derived knowledge inherits the least-privilege intersection of its parent policies.
6. **Preserve multi-generation lineage.** A child of derived knowledge must retain the root-source and root-policy ancestry of its parents.
7. **Separate effective permission from ancestry identity.** The effective rights policy may be identical across different derivations, while a separate policy-lineage fingerprint binds that policy to the exact ancestry chain.
8. **Gate output at the point of export/use.** Authorization to ingest or transform a source does not imply authorization for every output type.
9. **Keep generated skills as candidates.** Source-derived skill material remains `CANDIDATE / NOT ACTIVE` until the Signalproof skill lifecycle is completed.
10. **Do not silently broaden rights.** A later transformation, model, format conversion, merge, summary, or repackaging must not create permissions absent from its ancestors.
11. **Treat provenance validation as a hard gate.** Changed ancestry fingerprints, mismatched source hashes, reused source versions with changed bytes, or broken policy lineage require correction before continuation.
12. **Keep public/private boundaries explicit.** Public artifacts must contain only material authorized for public release and must not expose private source data, local paths, credentials, or proprietary implementation details.
13. **Persist provenance without inventing identity.** A persistent registry must use globally unambiguous object identity, bind local IDs to source identity/content fingerprints, and reject orphaned or hash-mismatched parents.
14. **Minimize provenance storage.** A provenance index should store the identities, policy metadata, fingerprints, and edges needed for audit/query without automatically copying source bytes or filesystem paths.
15. **Verify persisted ancestry.** Registry rows and ancestry edges must remain independently checkable for identity/hash consistency before downstream claims rely on them.
16. **Verify before presenting trusted provenance.** A human-facing provenance review must expose the registry-integrity condition and must not label evidence verified when the underlying registry fails integrity checks.
17. **Keep provenance review read-only by default.** Inspection must not silently repair ancestry, change a policy, approve a candidate, or mutate transformation state.
18. **Minimize review exports.** Human-readable provenance reports should expose the identities, hashes, policy state, ancestry, and findings needed for review without automatically copying source bytes or filesystem paths.
19. **Treat portable packaging as a governed output boundary.** Repackaging selected knowledge must re-evaluate inherited policy rather than assuming that already-extracted content may be freely bundled.
20. **Bind packages to an intended output.** A governed package must declare the downstream output class it is being prepared for, and that class must be authorized by the package effective policy before the package is written.
21. **Compile only from verified persistent evidence.** Package compilation requires registry-integrity PASS, exact selected-object resolution, and VERIFIED provenance review for every selected object.
22. **Make package identity deterministic and tamper-evident.** Selected content hashes, object identities, policy identities/lineage, and intended output must bind the package identity; selection ordering must not silently change identity.
23. **Verify a portable package before adapting it.** A downstream adapter must verify safe member names, the member checksum manifest, package structure, effective policy, selected objects, and provenance evidence before trusting the package.
24. **Do not silently repurpose a package.** A Knowledge Base adapter must require a package compiled specifically for the `knowledge_base` intended output instead of treating authorization for another output as transferable intent.
25. **Keep Knowledge Base ingestion distinct from activation.** Producing an ingestion bundle does not authorize activation, embeddings, model calls, content rewriting, or publication.
26. **Preserve policy at the consumer boundary.** A Knowledge Base handoff must carry the effective policy forward and explicitly require the consumer to enforce it.

## Workflow

### 1. Source Registration

Capture source title, declared source version, source format, source SHA-256, deterministic source ID, ingestion timestamp, and structural metadata where available. If the same declared version appears with changed source bytes, block continuation until a new version is assigned or the discrepancy is resolved.

### 2. Rights Envelope

Record a machine-readable policy including rights basis, owner/licensor or responsible authority, policy status, allowed uses, transformation permission, allowed output types, public redistribution permission, derivative-output permission, release label, and authorization context. The tool records the declaration; it does not independently make the legal determination.

### 3. Extraction and Provenance

Each knowledge object should retain object ID, object kind, source locator, source ID/hash, policy ID/hash, element SHA-256, available page/block/bounding-box evidence, extraction method, and confidence/reconciliation evidence when applicable.

### 4. Derived Knowledge

Before combining or repackaging source-derived objects: validate every parent; verify derivation permission; compute the least-privilege intersection of parent permissions; preserve the most restrictive redistribution behavior; preserve immediate parents and root-source/root-policy ancestry; bind ancestry with deterministic lineage; and validate the derived object before downstream use.

### 5. Output Authorization

Evaluate the requested output independently, such as `knowledge_base`, `training`, `procedure`, `skill_candidate`, `structured_xml`, or another registered adapter. If an output is not authorized by the effective policy, block it even when ingestion and transformation were allowed.

### 6. Persistent Provenance Registry

Register source and canonical policy identity, bind source-local object IDs to source identity and content fingerprints, require parents to exist before child registration, preserve root edges across generations, reject ambiguous IDs, minimize source duplication, and verify registry integrity before relying on persisted ancestry.

### 7. Provenance Review

Verify registry integrity, resolve an exact object identity, expose generation/status/content fingerprint/source locator, immediate and recursive ancestry, root source/policy identity, effective policy, and integrity findings. Integrity failure must be blocked rather than presented as trusted evidence.

### 8. Governed Knowledge Package Compilation

When multiple governed objects must move into a downstream Knowledge Base, learning, procedure, or skill workflow: verify the registry; resolve every selected object exactly; require VERIFIED provenance review; derive a least-privilege package policy; authorize one declared intended output; bind content/object/policy/provenance evidence into deterministic package identity; write a candidate portable package with member checksums; validate it; and keep downstream ingestion, publication, and activation as separate gates.

### 9. Knowledge Base Adapter Handoff

When a governed package is prepared for a Knowledge Base:

1. verify the package archive and all member checksums;
2. validate package, effective-policy, object, and provenance evidence consistency;
3. require `intended_output=knowledge_base`;
4. re-check that the effective policy authorizes `knowledge_base`;
5. create deterministic candidate entry identities bound to package/object/content identity;
6. preserve object hashes, provenance review digests, policy references, root-source/root-policy ancestry, and source-package identity;
7. mark the bundle and entries `CANDIDATE`;
8. explicitly deny activation, embedding generation, model calls, and content rewriting at this stage;
9. require the eventual consumer to enforce the carried effective policy.

### 10. Skill Candidate Handoff

When the output is a Signalproof skill candidate, preserve source/policy provenance, mark it `CANDIDATE / NOT ACTIVE`, remove content not authorized for the publication boundary, define tests/non-scope, and route through the governed review/verification/approval lifecycle.

## Derived-Policy Rule

For multiple parents, effective permission is the least-privilege intersection. A later generation may narrow permissions but must not broaden them.

## STOP Conditions

Stop when rights are unknown or blocked; transformation or derivation is unauthorized; requested output is not permitted; source bytes changed under a reused version; ancestry cannot be reproduced; a downstream operation would broaden permissions; a portable package fails checksum/evidence validation; a package is being silently repurposed for a different output; Knowledge Base adaptation is being treated as activation; a generated skill is being activated without lifecycle governance; private/restricted material would cross a public boundary; or acceptance evidence is missing for a consequential provenance/authorization claim.

## Current Candidate Evidence

Signalproof Knowledge Forge RD0.3A through RD0.5B provide candidate evidence for source identity and rights envelopes; fail-closed authorization; source/policy ancestry; least-privilege derivation; multi-generation provenance; persistent registry integrity; human provenance review; governed multi-object package compilation; deterministic package identity and archives; package tamper detection; verified governed-package intake for Knowledge Base adaptation; input archive member/checksum verification and purpose blocking; deterministic Knowledge Base candidate entry/bundle identity; carried effective policy and provenance references at the consumer boundary; and explicit evidence that adaptation performs no activation, embeddings, model calls, or content rewriting.

This evidence supports Candidate status only. Production Knowledge Base ingestion, richer semantic transformation, and Active skill promotion remain future work.

## Build Ledger Evidence Linkage

The RD0.5B candidate is linked to staged Signalproof Build Ledger evidence using stable event identities:

- `stage-skills:knowledge-forge:rd0.5b:signalproof-knowledge:0.1.0-candidate`
- `milestone-closeout:knowledge-forge:rd0.5b`
- `artifact-bind:knowledge-forge:rd0.5b`

Bound artifact evidence:

- Artifact: `Signalproof-Knowledge-Forge-RD0.5B.zip`
- SHA-256: `cbdd8ed6af3ce8f918d4d24575d75acc69b6c593619adea74b936f90387a3bcc`
- Automated acceptance evidence: `45 PASS / 0 FAIL`
- Packaged-artifact retest: `45 PASS / 0 FAIL`
- Public-boundary review: `PASS`

Ledger status is **STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION**. These references provide continuity between the skill candidate and milestone evidence but must not be represented as a canonical Build Ledger append until the live ledger head and chain are verified.

## Candidate Acceptance Before Promotion

Promotion should require at minimum owner approval of scope and name; no overlap/conflict with `signalproof-learn`; regression tests for source identity, rights gating, derivation propagation, tamper detection, provenance review, governed package compilation, and Knowledge Base adapter handoff; a representative isolated Knowledge Base import/inspection scenario; an end-to-end Skill Candidate scenario; negative authorization tests; registry/router review where applicable; public/private boundary review; and milestone closeout with Build Ledger evidence.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-knowledge`
- **Version:** `0.1.0-candidate`
- **Maturity:** Candidate
- **Status:** Not Active
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-learn`, `signalproof-research`, `signalproof-document`, `signalproof-verify`, `signalproof-review`, `signalproof-closeout`
- **Domain:** Governed knowledge transformation, knowledge-package compilation, knowledge-base preparation, source provenance, rights-aware derivation, skill-candidate preparation
- **Created by:** Doc Reo / Signalproof
