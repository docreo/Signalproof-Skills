---
name: ghl-integrations-webhooks
description: Design and verify HighLevel private integrations, OAuth apps, webhooks, and external automation.
---

# Integrations and Webhooks

## Purpose

Design and verify HighLevel private integrations, OAuth apps, webhooks, and external automation.

## Procedure

1. Declare tenant, scopes, endpoint, event types, data classes, secret storage, retry/idempotency, rate limits, and owner.
2. Use least privilege and never place tokens or webhook secrets in browser code, Git, logs, screenshots, or examples.
3. Verify webhook signatures where available and treat payloads as untrusted input.
4. Use event IDs/idempotency keys, bounded retries, dead-letter evidence, and read-after-write verification.
5. A connected integration is not an end-to-end PASS; test one synthetic event through destination and reconciliation.

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
- **Skill:** `ghl-integrations-webhooks`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
