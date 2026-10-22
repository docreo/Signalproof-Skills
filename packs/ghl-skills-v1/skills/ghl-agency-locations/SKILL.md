---
name: ghl-agency-locations
description: Operate across HighLevel agency and sub-account boundaries without crossing tenant authority.
---

# Agency and Location Boundaries

## Purpose

Operate across HighLevel agency and sub-account boundaries without crossing tenant authority.

## Procedure

1. Identify the exact agency and location before every read or write.
2. Never reuse a location ID, token, snapshot, domain, phone number, sender, or workflow assumption across tenants without explicit verification.
3. Separate agency-level SaaS, rebilling, snapshots, marketplace, and location provisioning from location-level CRM work.
4. For migration, record source and destination ownership, exclusions, identity mapping, and post-copy validation.
5. Stop when the connector scope or selected UI location is ambiguous.

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
- **Skill:** `ghl-agency-locations`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
