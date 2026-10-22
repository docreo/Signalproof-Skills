---
name: ghl-account-audit
description: Inventory a HighLevel account without assuming that visible assets are safe to change.
---

# Account Audit

## Purpose

Inventory a HighLevel account without assuming that visible assets are safe to change.

## Procedure

1. Declare agency/location scope, access route, account timezone, and read-only versus mutation authority.
2. Inventory contacts, companies, fields, tags, pipelines, opportunities, calendars, workflows, forms, surveys, funnels, websites, products, transactions, conversations, domains, users, integrations, content, memberships, reputation, and reporting where supported.
3. Mark unsupported or inaccessible asset classes UNKNOWN rather than absent.
4. Store only aggregate or synthetic evidence in public or shared repositories; keep customer rows and credentials out.
5. Refresh affected evidence immediately before consequential change.

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
- **Skill:** `ghl-account-audit`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
