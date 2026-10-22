---
name: ghl-contacts-companies
description: Safely create, update, deduplicate, export, and protect HighLevel contact and company records.
---

# Contacts and Companies

## Purpose

Safely create, update, deduplicate, export, and protect HighLevel contact and company records.

## Procedure

1. Choose a stable identity strategy: contact ID first, then normalized email/phone only under an explicit merge policy.
2. Preserve DND, consent, source, attribution, owner, tags, custom fields, and company associations.
3. Before bulk mutation, obtain a supported export, reconcile counts/pagination, encrypt it outside Git, test decryption, and retain a redacted manifest.
4. Use an approved synthetic or designated test contact; verify the recipient immediately before communication.
5. Do not delete or merge records merely because names look duplicated or old.

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
- **Skill:** `ghl-contacts-companies`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
