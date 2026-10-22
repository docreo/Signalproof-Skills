# GHL Skills

**Version:** 1.0.0  
**Status:** OWNER-AUTHORIZED PUBLIC BASELINE  
**Created by:** Doc Reo / Signalproof

A sanitized, tool-agnostic GoHighLevel skill pack derived from governed implementation, audit, recovery, funnel, calendar, workflow, CRM, and publication experience. It contains no credentials, customer records, private account identifiers, or internal infrastructure paths.

## Skills

- [`ghl-account-audit`](skills/ghl-account-audit/SKILL.md) - Inventory a HighLevel account without assuming that visible assets are safe to change.
- [`ghl-agency-locations`](skills/ghl-agency-locations/SKILL.md) - Operate across HighLevel agency and sub-account boundaries without crossing tenant authority.
- [`ghl-users-permissions`](skills/ghl-users-permissions/SKILL.md) - Review HighLevel user access, ownership, assignment, and least-privilege boundaries.
- [`ghl-contacts-companies`](skills/ghl-contacts-companies/SKILL.md) - Safely create, update, deduplicate, export, and protect HighLevel contact and company records.
- [`ghl-custom-fields-values`](skills/ghl-custom-fields-values/SKILL.md) - Design and govern HighLevel custom fields, custom values, tags, and naming taxonomies.
- [`ghl-opportunities-pipelines`](skills/ghl-opportunities-pipelines/SKILL.md) - Build lifecycle pipelines and idempotent opportunity automation without duplicates.
- [`ghl-calendars-appointments`](skills/ghl-calendars-appointments/SKILL.md) - Audit, normalize, repair, migrate, and test HighLevel calendars and appointment lifecycles.
- [`ghl-workflows-automation`](skills/ghl-workflows-automation/SKILL.md) - Inspect, design, edit, test, publish, and recover HighLevel workflows safely.
- [`ghl-conversations-messaging`](skills/ghl-conversations-messaging/SKILL.md) - Operate HighLevel email, SMS, calling, voicemail, and conversation channels with consent and recipient safety.
- [`ghl-forms-surveys`](skills/ghl-forms-surveys/SKILL.md) - Design and validate HighLevel forms and surveys with minimal data collection and controlled automation.
- [`ghl-funnels-websites`](skills/ghl-funnels-websites/SKILL.md) - Build, publish, and verify HighLevel funnels and websites while protecting existing pages and analytics.
- [`ghl-products-payments`](skills/ghl-products-payments/SKILL.md) - Configure and verify HighLevel products, prices, payment links, order forms, subscriptions, and transaction evidence.
- [`ghl-documents-contracts`](skills/ghl-documents-contracts/SKILL.md) - Design, send, sign, track, and automate HighLevel documents and contracts.
- [`ghl-content-social`](skills/ghl-content-social/SKILL.md) - Operate HighLevel blogs, categories, authors, social accounts, posts, and publication schedules.
- [`ghl-reputation`](skills/ghl-reputation/SKILL.md) - Configure HighLevel review requests and reputation workflows without coercion or review gating.
- [`ghl-memberships-courses`](skills/ghl-memberships-courses/SKILL.md) - Build and verify HighLevel memberships, communities, courses, offers, and access automation.
- [`ghl-integrations-webhooks`](skills/ghl-integrations-webhooks/SKILL.md) - Design and verify HighLevel private integrations, OAuth apps, webhooks, and external automation.
- [`ghl-snapshots-migrations`](skills/ghl-snapshots-migrations/SKILL.md) - Plan and validate HighLevel snapshots, copies, imports, and tenant migrations.
- [`ghl-reporting-attribution`](skills/ghl-reporting-attribution/SKILL.md) - Build verifiable HighLevel acquisition, sales, delivery, and revenue reporting.
- [`ghl-safe-testing-recovery`](skills/ghl-safe-testing-recovery/SKILL.md) - Run controlled HighLevel tests and recover from partial or failed changes without customer harm.

## Installation

Copy the complete `packs/ghl-skills-v1/skills/` directory into the skill directory supported by your agent host. Keep the files together. The Active Signalproof coordinator is [`signalproof-ghl`](../../skills/signalproof-ghl/SKILL.md).

## Boundary

These skills provide procedures, checks, and STOP conditions. They do not provide HighLevel credentials, API access, paid features, legal advice, production authority, or permission to contact, charge, publish, delete, or migrate customer state.
