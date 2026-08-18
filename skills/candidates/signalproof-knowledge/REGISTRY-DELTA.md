# Signalproof Skill Registry — Candidate Delta

**Status:** STAGED / CANDIDATE / NOT ACTIVE

This is a proposed registry entry only. It does not modify canonical `SKILL-REGISTRY.md`.

| Skill | Version | Maturity | Role | Status |
|---|---:|---|---|---|
| `signalproof-knowledge` | 0.1.0-candidate | Candidate | Governed source ingestion, knowledge transformation, persistent provenance, Knowledge Base handoff/import inspection, governed Skill Candidate compilation, rights-aware derivation, and skill-candidate governance | Candidate / Not Active |

## RD0.6B evidence added

- final Skill Candidate compiler independently requires `intended_output=skill_candidate`;
- effective policy is re-checked at the final compiler boundary;
- restricted policy permitting only `knowledge_base` is blocked;
- restricted source cannot be compiled into a governed package for `skill_candidate`;
- explicit `skill_candidate` permission remains a positive control;
- blocked negative candidate artifact is not created;
- **67 PASS / 0 FAIL** automated evidence;
- dedicated RD0.6B negative-boundary suite **4 PASS / 0 FAIL**;
- packaged-artifact retest **67 PASS / 0 FAIL**;
- public-boundary scan **PASS**.

## Staged Build Ledger linkage

- `stage-skills:knowledge-forge:rd0.6b:signalproof-knowledge:0.1.0-candidate`
- `milestone-closeout:knowledge-forge:rd0.6b`
- `artifact-bind:knowledge-forge:rd0.6b`

Bound artifact SHA-256: `04f2d562b5ac735d4400476b81f4a1fa3b6d71576b6230e1d05f3c5b2ae154b1`.

These ledger records remain **STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION** until the canonical Build Ledger head is verified.

Promotion remains unauthorized pending overlap/router review where applicable, owner approval, and chain-safe Build Ledger ingestion.
