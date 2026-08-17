# Signalproof Skill Registry — Candidate Delta

**Status:** STAGED / CANDIDATE / NOT ACTIVE

This is a proposed registry entry only. It does not modify canonical `SKILL-REGISTRY.md`.

| Skill | Version | Maturity | Role | Status |
|---|---:|---|---|---|
| `signalproof-knowledge` | 0.1.0-candidate | Candidate | Governed source ingestion, knowledge transformation, persistent provenance, integrity-aware review, governed packaging, policy-preserving Knowledge Base handoff/import, and skill-candidate handoff | Candidate / Not Active |

## RD0.5C evidence added

- isolated candidate-only Knowledge Base receiving store;
- pre-import archive, member-checksum, bundle-identity, policy, and provenance validation;
- persisted row/content integrity verification after import;
- exact re-import idempotence and conflicting-evidence rejection;
- read-only candidate inspection preserving effective policy, provenance references, and root ancestry;
- direct store tamper detection changes trusted review to `BLOCKED`;
- no activation, embeddings, model calls, content rewriting, or publication at the import/inspection boundary;
- **54 PASS / 0 FAIL** automated evidence;
- packaged-artifact retest **54 PASS / 0 FAIL**;
- public-boundary scan **PASS**.

Staged Build Ledger linkage:

- `stage-skills:knowledge-forge:rd0.5c:signalproof-knowledge:0.1.0-candidate`
- `milestone-closeout:knowledge-forge:rd0.5c`
- `artifact-bind:knowledge-forge:rd0.5c`

Bound artifact SHA-256: `f07a5ae33d67f7ac28b571b91f634b58eb746d329e1cb10bf8274c858a4a70f9`.

Promotion remains unauthorized pending the acceptance plan, owner governance, and chain-safe Build Ledger ingestion.
