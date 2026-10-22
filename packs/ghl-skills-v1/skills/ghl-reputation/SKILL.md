---
name: ghl-reputation
description: Configure HighLevel review requests and reputation workflows without coercion or review gating.
---

# Reputation Management

## Purpose

Configure HighLevel review requests and reputation workflows without coercion or review gating.

## Procedure

1. Identify approved review destinations, eligible event, timing, sender, retry limit, opt-out, and escalation owner.
2. Do not suppress or divert negative feedback solely to manipulate public ratings.
3. Separate internal feedback collection from public review requests and disclose the destination honestly.
4. Test with a safe contact and verify one request, correct link, stop-on-response, and no duplicate follow-up.
5. Track request, click, response, and published-review evidence as separate states.

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
- **Skill:** `ghl-reputation`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
