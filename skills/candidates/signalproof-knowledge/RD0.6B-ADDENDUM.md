# signalproof-knowledge Candidate Addendum — RD0.6B

**Status:** STAGED / CANDIDATE / NOT ACTIVE

RD0.6B proves the restricted-source negative case at the final Governed Skill Candidate boundary.

## Candidate rule added

35. **Re-check output authorization at the final Skill Candidate boundary.** Even when upstream governed-package validation has already run, the compiler must independently require `intended_output=skill_candidate` and an effective policy that explicitly authorizes `skill_candidate`; otherwise it must block before candidate creation.

## Evidence

- Restricted effective policy with `allowed_outputs=[knowledge_base]` is blocked when `skill_candidate` is requested.
- Restricted source cannot be compiled into a governed package for `skill_candidate`.
- Explicit `skill_candidate` permission remains an allowed positive control.
- Final compiler re-check remains fail-closed even when the upstream loader is stubbed in the test harness.
- Full suite: **67 PASS / 0 FAIL**.
- Dedicated RD0.6B negative-boundary tests: **4 PASS / 0 FAIL**.
- Exact packaged-artifact retest: **67 PASS / 0 FAIL**.
- Public-boundary scan: **PASS**.
- Blocked negative candidate artifact created: **false**.

## Build Ledger linkage

- `stage-skills:knowledge-forge:rd0.6b:signalproof-knowledge:0.1.0-candidate`
- `milestone-closeout:knowledge-forge:rd0.6b`
- `artifact-bind:knowledge-forge:rd0.6b`

Bound artifact: `Signalproof-Knowledge-Forge-RD0.6B.zip`

SHA-256: `04f2d562b5ac735d4400476b81f4a1fa3b6d71576b6230e1d05f3c5b2ae154b1`

The Build Ledger records remain **STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION** until the live canonical ledger head is verified.

## Next gate

RD0.6C should review the scope boundary between `signalproof-knowledge` and `signalproof-learn`, plus router implications, before any Active promotion.
