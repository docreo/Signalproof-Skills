---
name: signalproof-knowledge-transform
description: Govern derived knowledge creation by validating parent evidence, derivation permission, least-privilege policy intersection, deterministic lineage, and downstream output authorization without silently broadening source rights.
---

# Signalproof Knowledge Transform

## Status

**CANDIDATE / NOT ACTIVE**

## Purpose

`signalproof-knowledge-transform` governs creation of derived/composed knowledge from registered governed objects.

> **Transformation may narrow permissions; it must not invent permissions absent from its ancestors.**

## Contract

1. Resolve and validate every parent object before derivation.
2. Verify transformation/derivation permission under each parent policy.
3. Compute effective policy as the least-privilege intersection of parent permissions.
4. Preserve the most restrictive redistribution/publication behavior.
5. Preserve immediate parents plus root-source/root-policy ancestry.
6. Bind derived content to deterministic content and lineage fingerprints.
7. Separate semantic confidence from provenance integrity.
8. Re-evaluate the requested output class independently after transformation.
9. Do not treat summary, merge, format conversion, model output, or repackaging as a rights reset.
10. Keep generated skill/procedure/training material candidate-only until its own governance completes.

## STOP Conditions

STOP when parent evidence fails, derivation is unauthorized, policy intersection is contradictory or unresolved, a downstream output is not allowed, lineage cannot be reproduced, or a derived artifact is being used to launder restrictions.

## Completion Criteria

Complete when parents, derivation method, effective policy, lineage, content fingerprint, output authorization, and candidate/activation boundary are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-knowledge-transform`
- **Version:** `0.1.0-candidate`
- **Maturity:** Candidate
- **Parent:** `signalproof-knowledge`
- **Domain:** Rights-aware derived knowledge transformation
- **Created by:** Doc Reo / Signalproof
