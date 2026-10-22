---
name: ghl-funnels-websites
description: Build, publish, and verify HighLevel funnels and websites while protecting existing pages and analytics.
---

# Funnels and Websites

## Purpose

Build, publish, and verify HighLevel funnels and websites while protecting existing pages and analytics.

## Procedure

1. Capture the existing site/funnel/step inventory before change; prefer a new draft step over overwriting working pages.
2. Bind every CTA to an explicit offer, checkout, application, booking, intake, or confirmation destination.
3. Verify mobile and desktop rendering, title/metadata, legal links, forms, calendars, products, tracking, and canonical domain.
4. Keep source-controlled HTML/CSS/assets and a manifest of target IDs, routes, publication state, and source commit when custom code is used.
5. Rollback by unpublishing the new step or restoring the last approved source; do not delete legacy assets during initial deployment.

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
- **Skill:** `ghl-funnels-websites`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
