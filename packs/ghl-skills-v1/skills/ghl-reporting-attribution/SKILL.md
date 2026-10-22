---
name: ghl-reporting-attribution
description: Build verifiable HighLevel acquisition, sales, delivery, and revenue reporting.
---

# Reporting and Attribution

## Purpose

Build verifiable HighLevel acquisition, sales, delivery, and revenue reporting.

## Procedure

1. Define each metric, source record, time basis, attribution model, inclusion/exclusion, currency, and owner.
2. Reconcile visitor, lead, form, booking, show/no-show, opportunity, order, transaction, refund, and recognized revenue as distinct events.
3. Do not infer revenue from product, opportunity value, or checkout existence.
4. Use stable campaign/source/medium/offer identifiers and preserve unknown attribution rather than fabricating it.
5. Validate totals against underlying records and disclose lag, pagination, deleted data, and connector limitations.

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
- **Skill:** `ghl-reporting-attribution`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
