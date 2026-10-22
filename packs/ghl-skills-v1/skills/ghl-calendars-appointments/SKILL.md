---
name: ghl-calendars-appointments
description: Audit, normalize, repair, migrate, and test HighLevel calendars and appointment lifecycles.
---

# Calendars and Appointments

## Purpose

Audit, normalize, repair, migrate, and test HighLevel calendars and appointment lifecycles.

## Procedure

1. Protect calendar IDs, canonical booking links, timezone, duration, interval, buffers, notice, booking window, capacity, users/teams, meeting location, forms, payments, and notifications.
2. Treat slug, group, calendar type, and phone/meeting integrations as dependencies, not cosmetic fields.
3. Do not enable native reminders until workflow reminders are inspected for duplicates.
4. After partial API updates, read back omitted legacy fields because providers may replace them with defaults.
5. Verify free slots and rendered booking UI in the intended timezone; then run one authorized synthetic booking through confirmation, reschedule, cancel, no-show, and stop conditions as applicable.

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
- **Skill:** `ghl-calendars-appointments`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
