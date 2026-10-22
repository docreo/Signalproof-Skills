---
name: ghl-conversations-messaging
description: Operate HighLevel email, SMS, calling, voicemail, and conversation channels with consent and recipient safety.
---

# Conversations and Messaging

## Purpose

Operate HighLevel email, SMS, calling, voicemail, and conversation channels with consent and recipient safety.

## Procedure

1. Verify contact, channel, sender, recipient, template, merge fields, opt-out language, quiet hours, and DND before send.
2. Separate test, transactional, marketing, internal, and support messages.
3. Prevent duplicate sends with workflow ownership and durable sent markers.
4. After send, verify provider/GHL message ID, status, recipient, timestamp, and conversation association; delivery is not reply or conversion.
5. Never use an unapproved alias, guessed address, or real customer for testing.

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
- **Skill:** `ghl-conversations-messaging`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
