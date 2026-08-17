# Signalproof Opportunity Detector V1 RD1 — Integration Candidate 1 R2 Acceptance

## Status

**OWNER-ACCEPTED INTEGRATION BASELINE / BUILD PASS / RUNTIME + VISUAL PASS**

## Product

Signalproof Opportunity Detector

Version line: `V1 RD1`

Accepted integration candidate: `Integration Candidate 1 R2`

## Objective

Connect the previously accepted branded Opportunity Detector shell to a Detector-native integration boundary without introducing a dependency on Signalproof Competition Radar implementation state.

## Evidence

The candidate workflow reported:

- full solution build: PASS;
- warnings: 0;
- errors: 0;
- original deterministic Opportunity Detector regression: PASS;
- Detector integration regression: PASS;
- development fixture evidence remained byte-identical after read;
- protected Core domain file unchanged;
- protected Decision Engine unchanged;
- protected original deterministic check unchanged;
- protected Signalproof logo and icon unchanged;
- Detector source boundary check found no Radar path, namespace, database, environment-variable, or CompetitionRadar implementation dependency.

Accepted R2 manifest SHA-256:

`FA514E6D7DFFFB417B4634C9F5E0A2EEB4511E7396A6DB0F16FBDBDC3D86E1C8`

## Runtime / visual acceptance

The owner launched the candidate and confirmed the expected runtime behavior.

Observed accepted runtime state included:

- `2 RECORDS` loaded;
- source state explicitly identified as `DEVELOPMENTFIXTURE` / `DEVELOPMENT_FIXTURE`;
- explicit warning that development fixtures are not live verified;
- one `APPLY` system recommendation;
- one `PARTNER` system recommendation;
- two `NEEDS REVIEW` records;
- populated Best Current Fits;
- Detector-native Development Fixture Adapter connection contract shown;
- accepted branded persistent navigation retained;
- owner/human authority reminder retained;
- Dashboard and panels operational.

Owner authority after runtime inspection:

> "Perfect. Panels work as said"

This is Human-Observed Fact plus owner acceptance for the defined integration baseline. It does not establish live-source ingestion, production datastore completion, capability-registry integration, security review, release readiness, signing, or commercial deployment.

## Product boundary

Opportunity Detector is the canonical product for grants, SBIR/STTR, contracts, procurement, solicitations, research opportunities, and related opportunity qualification.

Competition Radar is a separate product. The accepted Detector integration baseline owns its own adapter identity, data-root contract, development fixture data, runtime state, and future source-integration path.

Cross-product reuse must occur only through an explicit governed interface. Opportunity Detector must not inherit implementation identity from Competition Radar merely because both products perform analysis or scoring.

## Failure evidence preserved

The milestone retains two bounded failures:

1. Integration Candidate 1 initially failed compile because `MainWindow.xaml.cs` referenced `System.IO.Path` without importing `System.IO`.
2. The first resume wrapper failed PowerShell parsing before execution because of a malformed here-string terminator.

R2 corrected only the supported compile cause, verified wrapper parsing before execution, rebuilt the solution, reran both regression layers, and preserved the accepted baseline.

## Learning result

The earlier design acceptance posed a stronger future test: whether the shell-first information architecture would remain suitable after real data/tool integration without wholesale rewrite.

Integration Candidate 1 R2 satisfies the first material version of that test.

Current learning classification:

**PATTERN TESTED / NOT ACTIVE DOCTRINE**

Supported lesson:

> A substantial Signalproof product can establish and owner-accept a truthful shell first, then connect product-native adapters and real runtime data incrementally while preserving the accepted information architecture, provided product identity and data/runtime boundaries remain explicit.

This strengthens the existing `signalproof-design`, `signalproof-build`, `signalproof-debug`, and `signalproof-verify` evidence base. It does not by itself justify a new Active skill.

## Next authorized phase

Plan the first governed live Opportunity Detector source adapter while preserving this accepted integration baseline and the Detector / Competition Radar hard product boundary.
