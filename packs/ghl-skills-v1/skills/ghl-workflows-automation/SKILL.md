---
name: ghl-workflows-automation
description: Inspect, design, edit, test, publish, and recover HighLevel workflows safely.
---

# Workflows and Automation

## Purpose

Inspect, design, edit, test, publish, and recover HighLevel workflows safely.

## Procedure

1. Capture trigger, filters, re-entry, communication window, stop-on-response, waits, branches, goals, actions, senders, recipients, and publication state.
2. Keep edits Draft until controlled testing and human UI review pass.
3. Use explicit idempotency markers for creates and sends; define when markers are removed or expire.
4. Test the exact draft where the platform supports it; never count a manual message as workflow PASS.
5. Publish only the verified revision, read back the graph/state, monitor a controlled run, and retain a rollback route.

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
- **Skill:** `ghl-workflows-automation`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
