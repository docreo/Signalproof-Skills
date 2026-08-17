# Opportunity Detector Shell-First Integration Learning

## Governance state

**CANDIDATE TESTED / NOT ACTIVE**

## Source milestone

Signalproof Opportunity Detector `V1 RD1 Integration Candidate 1 R2`.

## Triggering question

Can a substantial Signalproof product lock a truthful owner-accepted shell before live source integration and then connect product-native runtime/data capabilities without requiring a wholesale information-architecture rewrite?

## Evidence result

The Opportunity Detector milestone supplied a first material affirmative test:

- the branded shell had already received owner design acceptance;
- the integration candidate added a product-native adapter contract and product-specific data-root contract;
- the accepted Dashboard, Opportunities, Review, persistent navigation, evidence/state semantics, and owner-authority separation remained intact;
- two development fixtures populated the operational UI without fabricating live-source status;
- build and deterministic/integration regressions passed;
- owner runtime/visual acceptance followed;
- explicit checks rejected Competition Radar implementation associations from Detector source.

Accepted integration manifest SHA-256:

`FA514E6D7DFFFB417B4634C9F5E0A2EEB4511E7396A6DB0F16FBDBDC3D86E1C8`

## Candidate lesson

> Establish a durable product-specific information architecture with truthful empty/unknown states, then integrate product-native adapters and data behind that shell incrementally. Preserve product identity at the path, namespace, datastore, runtime-contract, and evidence boundaries; conceptual similarity to another product does not justify implementation coupling.

## Why this is useful

This pattern can reduce repeated shell redesign, protect owner-accepted workflows, and make capability integration easier to verify because presentation contracts and runtime/data contracts remain separable.

It also captures a negative lesson from the earlier naming/coupling confusion: shared concepts such as scoring, review, evidence, or analysis do not make two products the same implementation domain.

## Scope

Potentially applicable to substantial Signalproof products with:

- owner-facing workspaces;
- multiple future adapters or capabilities;
- explicit evidence/state semantics;
- stable product identity;
- incremental integration phases.

## Non-scope

This candidate does not require:

- every product to use the same shell;
- shell-first development when workflow semantics are still fundamentally unknown;
- duplicated infrastructure when a governed shared platform interface already exists;
- artificial separation of legitimately shared runtime services;
- rejection of cross-product reuse through explicit stable interfaces.

## Acceptance evidence

The candidate has passed one material product-specific test: Opportunity Detector retained its accepted information architecture through its first real runtime/data integration layer and received owner runtime acceptance.

## Remaining generalization gate

Before considering stronger doctrine, test the pattern through additional integration depth and/or another materially different Signalproof product. Useful future tests include:

- first live source adapter;
- production datastore introduction;
- capability-registry integration;
- evidence browser integration;
- another product whose information architecture differs materially from Opportunity Detector.

## Governance disposition

Keep as **CANDIDATE TESTED / PATTERN**.

Do not create a new Active skill from this case alone. Prefer strengthening acceptance/regression guidance inside existing Design/Build disciplines if the pattern survives additional material integrations.
