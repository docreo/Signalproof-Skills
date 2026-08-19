---
name: signalproof-knowledge-package
description: Compile, verify, adapt, and import governed portable knowledge packages bound to one authorized intended output while preserving checksums, provenance, effective policy, deterministic identity, and candidate-only receiving state.
---

# Signalproof Knowledge Package

## Status

**CANDIDATE / NOT ACTIVE**

## Purpose

`signalproof-knowledge-package` governs the output boundary where selected knowledge objects move into another system or workflow.

> **A portable package must carry its evidence and policy with it; portability is not permission expansion.**

## Contract

1. Compile only from verified persistent evidence.
2. Resolve selected objects exactly and require verified provenance for each.
3. Derive package policy from selected object policies using least privilege.
4. Bind the package to one declared intended output class.
5. Require that output class to be authorized before writing the package.
6. Bind selected identities, content hashes, policy identities/lineage, provenance evidence, and intended output into deterministic package identity.
7. Include a member checksum manifest and reject unsafe archive member names.
8. Verify archive structure, checksums, policy, selected objects, and provenance before adaptation/import.
9. Do not silently repurpose a package for another output class.
10. Import into receiving systems as candidate state unless separate activation authority exists.
11. Exact re-import may be idempotent; conflicting evidence under the same identity must STOP.
12. Receiving-state inspection remains read-only and integrity-aware by default.

## Candidate Boundary

Knowledge Base preparation/import does **not** authorize activation, embeddings, model calls, semantic rewriting, training, or publication. The carried effective policy remains enforceable at the consumer boundary.

## STOP Conditions

STOP when package checksums/evidence fail, intended output is unauthorized, package identity conflicts with different bytes/evidence, an archive path escapes the intended boundary, import is being treated as activation, or receiving-state integrity fails.

## Completion Criteria

Complete when package identity, member checksums, selected objects, effective policy, intended output, provenance evidence, import status, receiving-store integrity, and activation boundary are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-knowledge-package`
- **Version:** `0.1.0-candidate`
- **Maturity:** Candidate
- **Parent:** `signalproof-knowledge`
- **Domain:** Governed knowledge packaging and candidate import
- **Created by:** Doc Reo / Signalproof
