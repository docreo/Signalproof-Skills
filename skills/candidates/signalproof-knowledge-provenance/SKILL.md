---
name: signalproof-knowledge-provenance
description: Preserve and verify source/object ancestry, policy lineage, deterministic identities, provenance registry integrity, root-source relationships, and read-only human review for governed knowledge.
---

# Signalproof Knowledge Provenance

## Status

**CANDIDATE / NOT ACTIVE**

## Purpose

`signalproof-knowledge-provenance` governs traceability across knowledge generations.

> **A derived object is trustworthy only to the degree its ancestry can be reconstructed and verified.**

## Contract

1. Bind object identity to source identity/content fingerprint, not a local name alone.
2. Require parents to exist before child registration.
3. Preserve immediate parents and root-source/root-policy ancestry.
4. Keep effective permission distinct from policy-lineage identity.
5. Reject orphaned, ambiguous, or hash-mismatched ancestry.
6. Minimize provenance storage: store identities, fingerprints, policy metadata, and edges without automatically duplicating source bytes/paths.
7. Verify registry integrity before downstream trusted claims.
8. Keep provenance review read-only by default; review must not repair ancestry, change policy, activate candidates, or mutate transformation state.
9. Human-readable reports should expose only evidence needed for review and respect public/private boundaries.
10. Integrity failure changes trust to BLOCKED rather than being hidden by a friendly display.

## Review Output

Expose object identity/generation/status, content fingerprint, source locator where authorized, immediate and recursive ancestry, root source/policy identities, effective policy, lineage fingerprint, registry-integrity status, and findings.

## STOP Conditions

STOP when parent identity cannot be resolved, hashes conflict, root ancestry is lost, policy lineage is ambiguous, review would mutate evidence, or integrity failure is being represented as verified provenance.

## Completion Criteria

Complete when the selected object and its ancestry/policy lineage can be independently checked and the review boundary is explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-knowledge-provenance`
- **Version:** `0.1.0-candidate`
- **Maturity:** Candidate
- **Parent:** `signalproof-knowledge`
- **Domain:** Knowledge ancestry and provenance integrity
- **Created by:** Doc Reo / Signalproof
