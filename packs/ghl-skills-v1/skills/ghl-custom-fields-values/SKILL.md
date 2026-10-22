---
name: ghl-custom-fields-values
description: Design and govern HighLevel custom fields, custom values, tags, and naming taxonomies.
---

# Custom Fields and Values

## Purpose

Design and govern HighLevel custom fields, custom values, tags, and naming taxonomies.

## Procedure

1. Inventory field name, key, object type, data type, options, usage, and duplicate-name/key conflicts.
2. Search forms, workflows, templates, funnels, APIs, reports, and integrations for dependencies before rename or retirement.
3. Use namespaced, stable keys; treat display labels as mutable presentation and keys as integration contracts.
4. Define tag lifecycle, owner, trigger, removal rule, and reporting meaning; avoid uncontrolled status-tag accumulation.
5. Add fields or values in small reversible batches and verify UI plus API serialization.

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
- **Skill:** `ghl-custom-fields-values`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
