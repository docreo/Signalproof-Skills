# signalproof-knowledge 0.1.0-candidate — Acceptance Plan

**Status:** CANDIDATE / NOT ACTIVE  
**Evidence milestone:** Signalproof Knowledge Forge RD0.5A  
**Governance:** `DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE`

## Objective

Determine whether `signalproof-knowledge` is sufficiently bounded, evidence-backed, non-overlapping, and safe to promote from Candidate toward Active status. Presence on a branch is not activation.

## Current Evidence

- RD0.5A automated tests: **37 PASS / 0 FAIL**.
- Public-boundary review: **PASS**.
- Governed package compilation preserves provenance and least-privilege policy.
- Unauthorized `skill_candidate` packaging from restricted material is blocked.
- Bound RD0.5A artifact SHA-256: `33c3bc5298986be13da2d511853d8b2911ec2f828ee294910d952c582e2b863a`.
- Staged Build Ledger stable event IDs:
  - `stage-skills:knowledge-forge:rd0.5a:signalproof-knowledge:0.1.0-candidate`
  - `milestone-closeout:knowledge-forge:rd0.5a`
  - `artifact-bind:knowledge-forge:rd0.5a`

Build Ledger status remains **STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION** until the live canonical head is verified.

## Protected State

- Existing Active Signalproof skills and their semantics.
- `signalproof-learn` ownership of institutional learning from completed Signalproof work.
- Public/private boundary and existing repository governance.
- Canonical `SKILL-REGISTRY.md` until promotion is authorized.
- Canonical Build Ledger until chain-safe ingestion is possible.

## Acceptance Matrix

| Requirement | Verification | Pass Condition | Current State |
|---|---|---|---|
| Source identity and rights gating | Regression tests | Unknown/blocked rights fail closed; changed bytes cannot silently reuse source version | PASS evidence |
| Provenance preservation | Multi-generation tests | Root source/policy ancestry remains traceable and tamper detection works | PASS evidence |
| Least-privilege derivation | Mixed-policy tests | Derived permissions never broaden parent permissions | PASS evidence |
| Persistent provenance | Registry tests | Orphans, ambiguity, hash drift, and bounded tampering are rejected/detected | PASS evidence |
| Human review trust | Review tests | Registry failure produces BLOCKED, not VERIFIED | PASS evidence |
| Governed packaging | Package tests | Only verified objects compile; intended output is explicitly authorized; deterministic package identity | PASS evidence |
| Knowledge Base scenario | End-to-end adapter test | Governed package ingests while preserving identity, provenance, and restrictions | PENDING |
| Skill Candidate scenario | End-to-end compilation test | Authorized source can produce a governed candidate without automatic activation | PENDING |
| Restricted Skill Candidate negative | End-to-end negative test | Restricted source remains blocked from unauthorized skill output | Partial PASS; end-to-end pending |
| Overlap with `signalproof-learn` | Human/architecture review | Responsibilities are distinct with no contradictory routing | PENDING |
| Router integration | Router review/tests | Correct tasks route to Knowledge vs Learn without weakening existing routes | PENDING |
| Public/private review | Static review | No private paths, credentials, private data, or restricted program-specific content | PASS for RD0.5A candidate |
| Owner approval | Human authority | Owner explicitly approves scope/name/promotion | PENDING |
| Canonical registry promotion | Governed merge | Registry changes only after approval and required evidence | NOT AUTHORIZED |

## Required Promotion Gates

1. Complete RD0.5B Knowledge Base Adapter end-to-end scenario.
2. Complete an authorized Skill Candidate end-to-end scenario.
3. Repeat the restricted-source negative scenario at the final adapter boundary.
4. Review scope against `signalproof-learn`.
5. Review/update `signalproof-router` only if routing evidence justifies it.
6. Run repository consistency and public-boundary checks.
7. Obtain owner approval for the skill name, scope, and activation.
8. Close the milestone through Signalproof Closeout.
9. Verify the canonical Build Ledger head and ingest staged evidence chain-safely.
10. Only then update canonical registry/changelog and merge as Active.

## STOP Conditions

Stop promotion if a downstream adapter can broaden source permissions; source or policy ancestry can be lost or silently rewritten; the skill materially conflicts with `signalproof-learn`; restricted/private content crosses the public boundary; evidence is overstated; owner approval is absent; or canonical Build Ledger/registry state would need to be fabricated or bypassed.

## Current Decision

**CANDIDATE EVIDENCE ADVANCED — NOT READY FOR ACTIVE PROMOTION.**
