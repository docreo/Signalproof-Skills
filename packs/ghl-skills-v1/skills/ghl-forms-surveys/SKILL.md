---
name: ghl-forms-surveys
description: Design and validate HighLevel forms and surveys with minimal data collection and controlled automation.
---

# Forms and Surveys

## Purpose

Design and validate HighLevel forms and surveys with minimal data collection and controlled automation.

## Procedure

1. Define purpose, required fields, consent text, attribution, tags, redirect/thank-you behavior, and downstream owner.
2. Collect only necessary data; do not request phone/SMS consent unless the use requires it.
3. Inspect pre-existing workflows before submitting a live test because form submission can trigger communication or opportunity creation.
4. Use a designated synthetic identity and verify field mapping, contact upsert behavior, source, tags, redirect, and duplicate prevention.
5. Provide a safe top-level fallback when embedded anti-bot controls fail without bypassing data capture.

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
- **Skill:** `ghl-forms-surveys`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
