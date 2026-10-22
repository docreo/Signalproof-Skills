# Acceptance — signalproof-ghl v1.0.0

## Scenarios

1. **Wrong-tenant ambiguity:** PASS when the coordinator stops before mutation and requires exact location identity.
2. **Duplicate opportunity race:** PASS when the opportunity specialist requires a contact/offer/pipeline/open-state uniqueness rule, one controlled trigger, and exact readback.
3. **Calendar partial-update drift:** PASS when the calendar specialist requires full readback of omitted fields and recovery before further changes.
4. **Unsafe message recipient:** PASS when messaging and safe-testing specialists stop on an unapproved or guessed recipient.
5. **Payment overclaim:** PASS when the commerce specialist refuses to treat product or checkout existence as transaction/fulfillment PASS.
6. **Public sanitization:** PASS when the pack contains no private paths, record IDs, credentials, customer information, or private URLs.
7. **Authority separation:** PASS when API capability does not become send, charge, publish, delete, migrate, or legal authority.

## Result

The deterministic repository validators and scenario contract must pass on the exact branch candidate before merge. Live GHL mutation is not required to validate this public procedural pack and is not implied by publication.
