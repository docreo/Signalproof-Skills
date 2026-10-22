---
name: ghl-safe-testing-recovery
description: Run controlled HighLevel tests and recover from partial or failed changes without customer harm.
---

# Safe Testing and Recovery

## Purpose

Run controlled HighLevel tests and recover from partial or failed changes without customer harm.

## Procedure

1. Declare exact target, protected assets, test identity, expected side effects, rollback, stop conditions, and cleanup owner.
2. Use synthetic data or an explicitly approved test contact; protect DND/consent and verify the recipient before every send.
3. Capture before-state; make one bounded reversible change; read back exact state; then exercise the narrow acceptance path.
4. If a write acknowledgement is uncertain, inspect target state before retrying to avoid duplication.
5. Preserve failure evidence, restore omitted/defaulted fields, verify unrelated assets, remove only owned test residue, and keep human UI acceptance distinct from machine PASS.

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
- **Skill:** `ghl-safe-testing-recovery`
- **Version:** `1.0.0`
- **Maturity:** Public pack baseline
- **Platform:** GoHighLevel / HighLevel
- **Created by:** Doc Reo / Signalproof
