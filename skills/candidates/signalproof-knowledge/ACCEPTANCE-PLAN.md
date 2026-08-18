# signalproof-knowledge Candidate Acceptance Plan — RD0.6D

**Status:** CANDIDATE / NOT ACTIVE / READY FOR OWNER GOVERNANCE

## Evidence now available

- Source identity and rights-envelope gates.
- Derived least-privilege policy and multi-generation provenance.
- Persistent provenance registry and integrity-aware review.
- Governed knowledge-package compilation.
- Verified Knowledge Base adapter handoff.
- Isolated candidate-only Knowledge Base import and inspection.
- Governed Skill Candidate compilation from purpose-bound `skill_candidate` packages.
- Final compiler independently re-checks `skill_candidate` authorization and blocks restricted policy that permits only `knowledge_base`.
- Restricted source cannot be compiled into a governed package for `skill_candidate`.
- Knowledge/Learn scope boundary reviewed and resolved against Active `signalproof-learn`.
- Candidate remains non-routable under the current Active-only router contract.
- RD0.6D promotion-readiness gate model and chain-safe Build Ledger ingestion plan completed.
- Full RD0.6D suite: **77 PASS / 0 FAIL**.
- Exact packaged-artifact retest: **77 PASS / 0 FAIL**.
- Public-boundary scan: **PASS**.
- Bound RD0.6D artifact SHA-256: `c3d7890913a398b41caeca083d787999564f347413fb664792152cc396b6c719`.

An initial bare pytest invocation failed during collection because the source-layout package was not installed/on `PYTHONPATH`. That harness failure is preserved as evidence; the correct source-layout invocation then produced the 77/77 acceptance result.

## Staged Build Ledger linkage

- `stage-skills:knowledge-forge:rd0.6d:signalproof-knowledge:0.1.0-candidate`
- `milestone-closeout:knowledge-forge:rd0.6d`
- `artifact-bind:knowledge-forge:rd0.6d`

Ledger status remains **STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION** until the live canonical Build Ledger head is verified.

## Remaining promotion gates

1. Owner explicitly approves skill name, scope, and Active-promotion intent.
2. Verify the actual canonical Build Ledger identity/head/chain/projection.
3. Deduplicate and chain-safely ingest staged Knowledge Forge events using approved ledger tooling.
4. Re-verify canonical ledger chain/projection after ingestion and preserve the resulting head evidence.
5. Prepare a separately authorized canonical promotion commit for skill state/path, `SKILL-REGISTRY.md`, changelog, and `signalproof-router`.
6. Run repository consistency/routing/public-boundary/acceptance checks on the exact promotion commit.
7. Merge/designate Active only with explicit owner merge/activation authority; verify `main` afterward.

## Current decision

**TECHNICAL CANDIDATE READY FOR OWNER GOVERNANCE — ACTIVE PROMOTION NOT YET AUTHORIZED.**
