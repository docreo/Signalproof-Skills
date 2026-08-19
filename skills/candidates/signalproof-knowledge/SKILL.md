---
name: signalproof-knowledge
description: Coordinate governed transformation of authorized source material into traceable reusable knowledge while preserving source identity, rights, provenance, output authorization, and candidate-only activation boundaries.
---

# Signalproof Knowledge

## Status

**CANDIDATE / NOT ACTIVE — RD1 REFACTOR**

## Purpose

`signalproof-knowledge` is the coordinator for the future Signalproof Knowledge Library family.

> **Knowledge may be transformed, but source identity, provenance, restrictions, and human authority must survive every transformation.**

It is complementary to `signalproof-learn`: Learn extracts lessons from completed Signalproof work; Knowledge governs authorized external/source-material transformation.

## Proposed Specialists

- `signalproof-knowledge-ingest` — source registration, structural extraction, content fingerprints.
- `signalproof-knowledge-provenance` — ancestry, policy lineage, persistent registry integrity.
- `signalproof-knowledge-transform` — derived knowledge and least-privilege policy propagation.
- `signalproof-knowledge-package` — governed output packaging, adapter handoff, candidate import boundaries.

These remain Candidate until separately tested and promoted.

## Inheritance

Inherits the root Signalproof contract. It does not independently determine legal rights, grant transformation/publication authority, or activate generated knowledge/skills.

## Coordinator Contract

1. Register source identity before transformation.
2. Require a declared rights envelope and fail closed when authorization is unresolved.
3. Preserve source hash, source location where available, object fingerprint, policy identity, and ancestry.
4. Derived knowledge receives the least-privilege intersection of parent permissions; derivation may narrow but never silently broaden rights.
5. Keep effective permission distinct from ancestry identity.
6. Re-evaluate authorization at every output boundary.
7. Treat persistent provenance integrity as a hard gate before trusted downstream claims.
8. Keep inspection read-only by default; inspection must not silently repair, activate, rewrite, or call models.
9. Portable packages must be deterministic/tamper-evident and bound to one intended output class.
10. Knowledge-base adaptation/import remains candidate state; it is not activation, embedding generation, model use, publication, or semantic rewriting.
11. Generated Skill material remains `CANDIDATE / NOT ACTIVE` until the normal Skill lifecycle completes.
12. Preserve public/private boundaries and never copy restricted source bytes into public evidence merely for convenience.

## Coordinator Workflow

### Source and Rights

Route source registration/extraction to Knowledge Ingest. Record source title/version/type/hash and declared rights basis, allowed uses, transformation permission, output classes, redistribution/derivative permissions, and release label.

### Provenance

Route ancestry/registry concerns to Knowledge Provenance. Every object should remain traceable to its source and applicable policy; orphaned or hash-mismatched parents block trusted use.

### Transformation

Route derived/composed knowledge to Knowledge Transform. Validate parents, derivation permission, policy intersection, immediate parents, root ancestry, and deterministic lineage before downstream use.

### Packaging / Handoff

Route governed portable outputs to Knowledge Package. Verify selected objects and provenance, authorize the declared intended output, produce deterministic package identity/checksums, validate the package, then keep downstream activation separately governed.

## Output Classes

Examples include `knowledge_base`, `training`, `procedure`, `skill_candidate`, `structured_xml`, or other registered adapters. Ingestion permission does not imply every output class is authorized.

## Candidate Evidence

Knowledge Forge RD0.3A–RD0.5C provide existing evidence for source identity/rights envelopes, fail-closed authorization, source/policy ancestry, least-privilege derivation, multi-generation provenance, persistent registry integrity, human provenance review, deterministic governed packaging, package tamper detection, candidate Knowledge Base adaptation/import, idempotent exact re-import, read-only inspection, and receiving-store tamper detection.

The latest staged continuity references include:

- `stage-skills:knowledge-forge:rd0.5c:signalproof-knowledge:0.1.0-candidate`
- `milestone-closeout:knowledge-forge:rd0.5c`
- `artifact-bind:knowledge-forge:rd0.5c`

Artifact evidence previously recorded: `Signalproof-Knowledge-Forge-RD0.5C.zip`, SHA-256 `f07a5ae33d67f7ac28b571b91f634b58eb746d329e1cb10bf8274c858a4a70f9`, automated acceptance `54 PASS / 0 FAIL`, packaged retest `54 PASS / 0 FAIL`, public-boundary review `PASS`.

Build Ledger status remains **STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION** unless/until the live private ledger head and chain are verified.

## Promotion Gates

Promotion still requires at minimum an end-to-end authorized Skill Candidate scenario, final restricted-source negative test, overlap review against Learn, router/capability-registry review, public-boundary verification, owner approval, governed closeout, and chain-safe Build Ledger ingestion where applicable.

## STOP Conditions

STOP when rights are unknown/blocked; source bytes change under a reused identity; ancestry or registry integrity fails; derivation/output would broaden permissions; a package fails checksum/provenance validation; a package is repurposed for a different output without reauthorization; candidate import is being treated as activation; private/restricted material would cross a public boundary; or generated Skills are being promoted without lifecycle governance.

## Completion Criteria

Coordinator work is complete when source/rights, applicable specialist route, provenance integrity, transformation/output authorization, candidate/activation boundary, evidence, and remaining governance gates are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-knowledge`
- **Version:** `0.2.0-candidate`
- **Maturity:** Candidate
- **Status:** Not Active
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Governed knowledge transformation coordination
- **Created by:** Doc Reo / Signalproof
