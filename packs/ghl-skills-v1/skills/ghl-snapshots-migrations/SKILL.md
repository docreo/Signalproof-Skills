---
name: ghl-snapshots-migrations
description: Plan and validate HighLevel snapshots, copies, imports, and tenant migrations.
---

# Snapshots and Migrations

## Purpose

Plan and validate HighLevel snapshots, copies, imports, and tenant migrations.

## Procedure

1. Inventory exactly what the snapshot/export includes and excludes; do not call a partial export a full backup.
2. Preserve source and destination separation, ownership, consent, phone/email domains, users, integrations, payments, and external dependencies.
3. Use a mapping for IDs, fields, tags, pipelines, calendars, workflows, forms, products, and domains.
4. Import into an isolated destination first; compare counts/configuration and test critical journeys before cutover.
5. Define freeze window, delta reconciliation, DNS/domain/number transfer, rollback, and post-cutover monitoring.

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
- **Skill:** `ghl-snapshots-migrations`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
