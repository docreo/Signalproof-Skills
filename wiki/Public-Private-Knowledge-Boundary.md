# Public and Private Knowledge Boundary

Signalproof treats the public Wiki as the default destination for knowledge that is intentionally safe and useful to publish.

The guiding rule is:

> **If knowledge is suitable for public release, it belongs in the public Wiki. If it is private by nature, it remains in the private canonical system that owns it.**

## Public by default

Public Wiki material may include:

- public architecture explanations;
- public operating principles;
- public product concepts;
- public research summaries;
- public governance explanations;
- public terminology;
- public release information;
- public implementation patterns;
- public lessons that have cleared release and evidence review.

## Private when required

Material remains private when it contains or meaningfully exposes:

- credentials, tokens, secrets, or private keys;
- customer-specific information;
- private conversation history;
- private account information;
- internal-only infrastructure details that increase attack surface;
- unpublished proprietary implementation details;
- restricted operational telemetry;
- unreleased security findings;
- internal incident evidence;
- private contractual, financial, personnel, or legal material;
- candidate knowledge that has not cleared public release review.

## Canonical ownership

Private knowledge should stay with the system that owns it rather than being copied into a general-purpose private wiki merely for convenience.

Examples:

- build and recovery evidence → **Signalproof Build Ledger**;
- assurance and control evidence → **Signalproof Assurance Ledger**;
- runtime configuration and runtime facts → **Signalproof Core Runtime** or the owning deployment repository;
- product implementation state → the owning product repository;
- private research publication source → **Signalproof Research Archive**;
- command-system implementation → **Signalproof Command**;
- readiness-system implementation → **Signalproof Readiness**.

The public Wiki may explain these systems and their roles without exposing restricted contents.

## Promotion to public knowledge

A private fact or lesson may later become public when the owning source permits release and the public version can be stated without leaking restricted details.

A safe promotion path is:

```text
PRIVATE SOURCE
    ↓
VERIFY RELEASE BOUNDARY
    ↓
SANITIZE / ABSTRACT
    ↓
CHECK EVIDENCE AND ACCURACY
    ↓
PUBLISH TO PUBLIC WIKI
```

Publishing an explanatory page does not transfer canonical authority away from the source repository.

## No silent downgrade of evidence

A private runtime observation should not become a public universal claim merely because it was rewritten into clean prose.

Public Wiki claims should preserve the distinction between:

- verified fact;
- approved design;
- inference;
- proposal;
- current operational state;
- general explanatory guidance.

## Public Wiki source

The version-controlled public Wiki source is maintained under:

`docreo/Signalproof-Skills/wiki/`

That repository copy remains the reviewable Git source for public Wiki material. A rendered GitHub Wiki or another publication surface may mirror it, but should not become the only copy.
