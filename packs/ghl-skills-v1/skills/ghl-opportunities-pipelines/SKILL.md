---
name: ghl-opportunities-pipelines
description: Build lifecycle pipelines and idempotent opportunity automation without duplicates.
---

# Opportunities and Pipelines

## Purpose

Build lifecycle pipelines and idempotent opportunity automation without duplicates.

## Procedure

1. Define each pipeline purpose, stage semantics, entry/exit criteria, owner, value source, and terminal status.
2. Before create, search by contact, offer/source, target pipeline, and active lifecycle state; update or upsert where supported.
3. Do not rely only on account-level duplicate settings when two workflows can race.
4. Preserve history; obtain approval before closing, abandoning, merging, or deleting existing opportunities.
5. Test one controlled trigger and verify exactly one opportunity plus correct later updates.

## Public safety contract

- Replace all examples with placeholders such as `<LOCATION_ID>`, `<CONTACT_ID>`, and `test@example.invalid`.
- Never expose API keys, OAuth tokens, private-integration secrets, cookies, webhook secrets, customer records, private URLs, or internal filesystem paths.
- Capability and connector visibility do not grant permission. Keep inspection, mutation, publication, messaging, payment, deletion, and legal approval separate.
- Before consequential work, establish current state and recovery, make the smallest reversible change, then read back the exact target.
- Do not claim UI, delivery, payment, signature, conversion, or production PASS from an API success alone.

## Completion evidence

Return the target scope, authority used, before-state, exact actions, readback, automated checks, human/UI checks still required, side effects, cleanup/rollback state, unresolved unknowns, and next bounded action.

## Identity

- **Pack:** GHL Skills
- **Skill:** `ghl-opportunities-pipelines`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
