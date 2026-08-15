# signalproof-recovery V0.1 Promotion

## Promotion

`signalproof-recovery` is promoted from `0.1.0-rc1` Candidate to `0.1.0` Active public baseline.

## Acceptance basis

Behavioral Scenario 1 evaluated a recovery problem with several backup folders, one owner-accepted known-working rollback, a failed candidate, and protected persistent user data.

Result:

- **12/12 required behaviors PASS**
- **0 fail conditions**
- recovery target selected by verified identity/acceptance rather than newest timestamp
- backup existence kept separate from rollback trust
- rollback source verification required before destructive replacement
- failed-state evidence preserved
- persistent user data protected
- unexplained mixed-version recovery rejected
- staging preferred before destructive replacement
- destructive/elevation authority remained explicit
- post-restore verification required
- remaining rollback options preserved after failed recovery
- recovery success did not imply release or security authority

## Governing rule

> A backup is not a rollback until its identity, completeness, integrity, and recoverability are verified.

## Authority boundary

Promotion of the skill does not authorize destructive restore operations, privilege elevation, production deployment, signing, security clearance, deletion of failed evidence, or canonical Build Ledger mutation.

## Source candidate

Candidate PR: #26

Candidate head: `b2389d117eae629a71f4813a139b68575863b74b`

Candidate merge commit: `38ba4db60d8be774a873ba251553fed4b2cc074a`

## Outcome

Maturity: **Active public baseline**

Version: **0.1.0**
