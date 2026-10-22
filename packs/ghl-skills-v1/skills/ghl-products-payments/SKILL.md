---
name: ghl-products-payments
description: Configure and verify HighLevel products, prices, payment links, order forms, subscriptions, and transaction evidence.
---

# Products and Payments

## Purpose

Configure and verify HighLevel products, prices, payment links, order forms, subscriptions, and transaction evidence.

## Procedure

1. Declare product name, description, currency, amount, one-time/recurring cadence, trial, tax, quantity, fulfillment, refund, and legal terms.
2. Verify the connector actually exposes product/price/payment-link mutation before promising creation.
3. Check rendered checkout pricing and cadence, payment provider state, success/cancel routes, receipts, and post-payment automation.
4. Use non-billable sandbox paths or an explicitly approved refundable transaction; never make an unapproved live purchase.
5. Product existence is not payment-path PASS; verify transaction, contact, opportunity, fulfillment, messages, and reconciliation.

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
- **Skill:** `ghl-products-payments`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
