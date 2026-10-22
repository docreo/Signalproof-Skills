---
name: ghl-memberships-courses
description: Build and verify HighLevel memberships, communities, courses, offers, and access automation.
---

# Memberships and Courses

## Purpose

Build and verify HighLevel memberships, communities, courses, offers, and access automation.

## Procedure

1. Define product/offer, content hierarchy, access duration, enrollment source, login delivery, roles, revocation, and support owner.
2. Keep draft content and access groups separate from production learners.
3. Test purchase or grant, welcome message, login, content access, progress, cancellation/refund, and revocation with a synthetic learner.
4. Do not infer access from payment alone; verify the learner record and actual portal experience.
5. Protect licensed content, member PII, credentials, and private community material.

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
- **Skill:** `ghl-memberships-courses`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
