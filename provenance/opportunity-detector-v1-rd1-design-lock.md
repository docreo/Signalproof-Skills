# Opportunity Detector V1 RD1 Design Lock Provenance

## Product

Signalproof Opportunity Detector

## Accepted design baseline

`V1 RD1 Design Candidate 2 R1`

## Owner authority

Owner explicitly accepted the shell direction and instructed that it be locked and used as the layout into which future Opportunity Detector tools and data capabilities are integrated.

## Protected design state

- persistent left navigation;
- Operational Dashboard;
- central Opportunity Review;
- separate Capability Match, Decisions, Evidence, Technical, and Settings workspaces;
- explicit truthful empty/unknown states;
- BUILD / APPLY / PARTNER / WATCH / PASS decision semantics;
- system recommendation separate from owner decision;
- owner-supplied Signalproof branding coded through application assets.

## Product build evidence

Design Candidate 2 R1 reported:

- build PASS;
- 0 warnings;
- 0 errors;
- deterministic regression PASS;
- protected core domain unchanged;
- protected decision engine unchanged;
- protected deterministic test program unchanged;
- Candidate 1 preserved;
- wrapper-level branding failure preserved and corrected through R1.

Accepted candidate manifest SHA-256:

`EEC2745119420626A698247DE34E2F233ED68DD5C7C2BC02A5C54C9D5A722053`

## Build Ledger boundary

The live private Build Ledger head is not available for verification through this repository operation.

Therefore this provenance record does not claim a canonical Build Ledger append, event sequence, or event hash.

The product milestone must remain `STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION` until the actual private ledger identity, current event count/head, chain integrity, and SQLite projection are verified and the milestone is deduplicated/appended through approved Build Ledger tooling.

## Learning boundary

The layout-first integration observation remains a governed learning candidate/pattern. It does not modify the Active `signalproof-design` skill contract merely by existing in this provenance record.