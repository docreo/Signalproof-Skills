---
name: signalproof-ghl
description: Coordinate safe, evidence-backed GoHighLevel work across account audit, CRM, automation, messaging, sites, commerce, documents, content, integrations, migration, reporting, testing, and recovery. Use for any GHL or HighLevel request that needs the minimum applicable public GHL Skills specialist without exposing private account data.
---

# Signalproof GHL

## Purpose

`signalproof-ghl` is the Active public coordinator for the **GHL Skills** pack. It inherits the root `signalproof` contract and routes GoHighLevel work to the smallest applicable specialist in `packs/ghl-skills-v1/`.

> **Inspect the exact location, protect customer state, change the smallest surface, and verify the real customer journey.**

## Core contract

1. Identify the exact agency/location, environment, owner objective, access route, and current authority.
2. Load `signalproof-known-errors` before consequential work.
3. Inventory the affected records and dependencies; inaccessible classes remain `UNKNOWN`.
4. Keep credentials, customer data, private URLs, IDs, screenshots, and internal infrastructure out of public artifacts.
5. Separate read, write, send, charge, publish, delete, legal, and production authority.
6. Select one principal GHL pack specialist and at most two additional specialists by default.
7. Establish before-state, protected assets, test identity, expected side effects, recovery, and STOP conditions.
8. Prefer Draft, inactive candidates, synthetic records, new pages/steps, and reversible batches over in-place replacement.
9. Verify every external write by reading back the exact target. Verify end-to-end behavior at the layer claimed.
10. Machine PASS cannot substitute for human UI or legal acceptance.

## Specialist routing

- account inventory/readiness -> `ghl-account-audit`
- agency/location/SaaS boundaries -> `ghl-agency-locations`
- users, teams, access -> `ghl-users-permissions`
- contacts, companies, backup -> `ghl-contacts-companies`
- fields, custom values, tags -> `ghl-custom-fields-values`
- opportunities and pipelines -> `ghl-opportunities-pipelines`
- calendars and appointments -> `ghl-calendars-appointments`
- workflows and automation -> `ghl-workflows-automation`
- email, SMS, calls, conversations -> `ghl-conversations-messaging`
- forms and surveys -> `ghl-forms-surveys`
- funnels, websites, domains -> `ghl-funnels-websites`
- products, checkout, payments -> `ghl-products-payments`
- proposals, documents, contracts -> `ghl-documents-contracts`
- blogs and social publishing -> `ghl-content-social`
- review requests -> `ghl-reputation`
- courses, communities, memberships -> `ghl-memberships-courses`
- integrations and webhooks -> `ghl-integrations-webhooks`
- snapshots, imports, migrations -> `ghl-snapshots-migrations`
- dashboards, attribution, revenue -> `ghl-reporting-attribution`
- controlled tests, rollback, cleanup -> `ghl-safe-testing-recovery`

## Universal STOP conditions

STOP when the selected location/tenant is uncertain; required customer-state protection is absent; a real recipient, payment, publication, deletion, number/domain transfer, or legal action lacks exact authorization; connector capability is being mistaken for permission; a workflow/funnel dependency is unknown; a retry could duplicate external state; secrets or PII would enter public evidence; rollback is unproven for a high-impact change; or the requested completion claim exceeds the evidence available.

## Completion criteria

Return scope, selected specialist(s), access/capability boundaries, protected state, actions, exact readback, end-to-end test result, remaining human checks, side effects, recovery status, and unresolved unknowns. Do not collapse `configured`, `published`, `sent`, `delivered`, `paid`, `signed`, and `converted` into one status.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-ghl`
- **Version:** `1.0.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Pack:** `packs/ghl-skills-v1`
- **Domain:** GoHighLevel / HighLevel operations and public specialist routing
- **Created by:** Doc Reo / Signalproof
