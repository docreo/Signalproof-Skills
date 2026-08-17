# Signalproof Skill Registry — Candidate Delta

**Status:** STAGED / CANDIDATE / NOT ACTIVE

This is a proposed registry entry only. It does not modify canonical `SKILL-REGISTRY.md`.

| Skill | Version | Maturity | Role | Status |
|---|---:|---|---|---|
| `signalproof-knowledge` | 0.1.0-candidate | Candidate | Governed source ingestion, knowledge transformation, persistent provenance, Knowledge Base handoff/import inspection, governed Skill Candidate compilation, rights-aware derivation, and skill-candidate governance | Candidate / Not Active |

## RD0.6A evidence added

- governed Skill Candidate compiler implemented;
- final compiler requires `intended_output=skill_candidate`;
- effective policy is re-checked at the final skill boundary;
- candidate identity is deterministic and tamper-evident;
- source package identity, object hashes, provenance digests, root-source/root-policy ancestry, scope, non-scope, and acceptance tests are preserved;
- activation, publication, and automatic registry promotion remain false;
- no model calls or semantic rewriting occur at this compiler boundary;
- **63 PASS / 0 FAIL** automated evidence;
- packaged-artifact retest **63 PASS / 0 FAIL**;
- public-boundary scan **PASS**.

## Staged Build Ledger linkage

- `stage-skills:knowledge-forge:rd0.6a:signalproof-knowledge:0.1.0-candidate`
- `milestone-closeout:knowledge-forge:rd0.6a`
- `artifact-bind:knowledge-forge:rd0.6a`

Bound artifact SHA-256: `9875a55dc0cce2461ca6f4692acf7b129f34b4272067a63b153b778f4abd53b2`.

These ledger records remain **STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION** until the canonical Build Ledger head is verified.

Promotion remains unauthorized pending RD0.6B restricted-source negative testing, overlap/router review where applicable, owner approval, and chain-safe Build Ledger ingestion.
