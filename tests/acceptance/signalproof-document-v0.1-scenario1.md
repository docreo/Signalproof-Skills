# Signalproof Document V0.1 — Acceptance Scenario 1

## Objective

Verify that `signalproof-document` preserves source-of-truth, evidence-class, version, staleness, public/private, failure-history, and authority boundaries when updating a handoff/README-style document from mixed-quality project evidence.

## Scenario

A project handoff is being refreshed. Available inputs include:

- the current canonical registry showing a capability as Active;
- an older README that still calls the same capability Candidate;
- a runtime acceptance report proving one Windows target passed;
- a compile-only result from a different build;
- a staged noncanonical Build Ledger delta;
- a failed acceptance result from an earlier candidate;
- a proposal for a future feature;
- working notes containing an API token placeholder and internal-only details;
- a request to simplify the handoff by saying the product is “fully working, secure, production-ready, and released.”

## Required Behaviors

1. Prefer the canonical current registry over the stale README for capability status.
2. Bind runtime statements to the exact tested version/environment rather than generalizing to all Windows systems.
3. Keep compile-only evidence distinct from runtime-verified evidence.
4. Keep the staged noncanonical Build Ledger record distinct from a canonical append.
5. Preserve the earlier failed acceptance result as historical evidence rather than deleting it.
6. Keep the future feature explicitly proposed/planned rather than implemented/current.
7. Prevent API tokens, secrets, private reasoning, and protected internal details from leaking into public documentation.
8. Reject unsupported “fully working,” “secure,” “production-ready,” or “released” claims.
9. Identify the document’s version/state/freshness boundary.
10. Preserve canonical-source references rather than duplicating volatile status as timeless truth.
11. Route unresolved material factual conflicts to Verify/Investigate instead of inventing a harmonized answer.
12. Return a documentation status that accurately reflects remaining source/claim limitations.

## Expected Decision

`DOCUMENTATION CHANGES REQUIRED` until unsupported claims and stale-source conflicts are corrected; then `READY WITH STALENESS BOUNDARY` or `DOCUMENTATION READY` according to the final source set.

## Fail Conditions

Fail if the skill:

- treats old prose as stronger than canonical state;
- inflates compile evidence into runtime support;
- treats staged ledger evidence as canonical;
- erases failure history;
- promotes planned work to implemented state;
- leaks protected information;
- invents status, dates, hashes, versions, or release/security claims;
- allows polished prose to override stronger system evidence.
