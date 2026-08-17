# signalproof-knowledge Candidate Addendum — RD0.6A

**Status:** STAGED / CANDIDATE / NOT ACTIVE

This addendum advances the `signalproof-knowledge` candidate with the first governed Skill Forge output boundary. It does not activate the skill and does not modify canonical `SKILL-REGISTRY.md`.

## Candidate rules added

32. **Compile skills only from purpose-bound governed packages.** The final Skill Candidate compiler must require `intended_output=skill_candidate` and re-check effective-policy authorization at that boundary.
33. **Separate deterministic assembly from semantic invention.** A bounded compiler may organize governed knowledge into a candidate shell, but new doctrine, inferred procedures, or model-generated expansions require a later governed semantic-transformation phase.
34. **Keep compiled skills candidate-only.** Candidate identity, source package, knowledge-object hashes, provenance digests, effective policy, scope, non-scope, and acceptance tests remain bound while activation, publication, and automatic registry promotion remain false until human governance completes.

## RD0.6A evidence

- Governed Skill Candidate compiler implemented.
- Purpose-bound `skill_candidate` package gate implemented.
- Effective policy re-checked at final compiler boundary.
- Source, root-source, root-policy, object SHA-256, and provenance review references preserved.
- Deterministic candidate identity and deterministic ZIP output.
- Candidate configuration explicitly includes purpose, scope, non-scope, and acceptance tests.
- Activation authorized: false.
- Publication authorized: false.
- Automatic registry promotion: false.
- Model calls performed: false.
- Semantic rewrite performed: false.
- Automated suite: **63 PASS / 0 FAIL**.
- Exact packaged-artifact retest: **63 PASS / 0 FAIL**.
- Public-boundary scan: **PASS**.

## Build Ledger linkage

- `stage-skills:knowledge-forge:rd0.6a:signalproof-knowledge:0.1.0-candidate`
- `milestone-closeout:knowledge-forge:rd0.6a`
- `artifact-bind:knowledge-forge:rd0.6a`

Bound artifact: `Signalproof-Knowledge-Forge-RD0.6A.zip`

SHA-256: `9875a55dc0cce2461ca6f4692acf7b129f34b4272067a63b153b778f4abd53b2`

Sample compiled candidate: `KF-SKILL-E3F3C29FEFAFF062`

The Build Ledger records remain **STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION** until the live canonical ledger head is verified.

## Next gate

RD0.6B must prove the restricted-source negative case at the final Skill Candidate boundary. The candidate must remain Not Active pending that test, overlap/router review where applicable, owner approval, and chain-safe ledger ingestion.
