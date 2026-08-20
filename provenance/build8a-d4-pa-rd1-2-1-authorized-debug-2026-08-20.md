# Build 8A D4 PA RD1.2.1 Authorized Full Debug Readiness

**Status:** AUTHORIZED / FULL DEBUG STATIC PASS / PRIVILEGED RUNTIME PENDING  
**Current main basis:** `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`  
**Branch:** `candidate/activation-gate-20260820`

## Authorization envelope

Target: `production-activation`.

Scope: corrected PA RD1.2.1 privileged production install followed by the final normal-user Workbench authentication proof only.

Authority source: explicit owner `/dsp authorize production-activation` after RD1.2 recovery-clean runtime PASS.

Status: `AUTHORIZED`.

Consumption: successful final production activation, or the next material activation failure/change.

Excluded: unrelated workstreams, canonical Build Ledger append, protected-main mutation, future production actions after this envelope is consumed, security-control weakening, and any authority expansion beyond the accepted Build 8A D4 production activation contract.

## Recovery basis

Observed RD1.2 recovery verification completed with exit 12 and proved:

- failed RD1.1 production product root absent;
- failed RD1.1 production data root absent;
- production task absent;
- production service absent;
- exact production processes absent;
- prepared normal-user Workbench CSP key preserved;
- prepared public-key identity exact;
- protected Core count and anchor identity unchanged;
- production activation inactive.

## Full Debug continuity

Prior material failure fingerprint: `HARNESS_LIVE_REDIRECTED_LOG_FILE_SHARING`.

Same-failure unsuccessful attempt count: 1.

The later RD1.2 admin-first stop is classified as an expected operator-context state-machine guard, not another same-failure attempt.

Independent subagents were unavailable; Full Debug used logical Builder, Design, and Governor lanes under the primary orchestrator.

## RD1.2.1 correction

RD1.2.1 makes no production-logic change from RD1.2.

It corrects stale forward-facing RD1.1 success/failure/next-step labels that could otherwise direct the operator back to a retired runner after a successful admin phase.

Historical references to RD1.1 are preserved where they intentionally identify the prior failed runner, preserved PF evidence, or preserved USER-PREP evidence.

## Exact-final validation

The exact final RD1.2.1 artifact passed 25 Full Debug critical checks.

The current Git-backed executable known-error preflight rules produced `PASS` with zero findings.

Validated properties include:

- no live `ReadAllText` of production stdout/stderr;
- runtime readiness remains Scheduled Task Running + Local Service runtime identity + DPAPI signing key;
- final normal-user installed Workbench authentication must still return Governor `ALLOW`;
- recovery-clean evidence is consumed rather than replayed;
- preserved RD1.1 USER-PREP/key is consumed without creating a second client key;
- registered-client record remains public-key-only with `private_key_persisted=false` and `production_registration=false`;
- Local Service AtStartup task remains required;
- admin failure rollback remains present;
- protected-Core final verification remains present;
- no self-elevation is added;
- no stale forward instruction tells the operator to run RD1.1.

Runtime truth remains pending until Windows PowerShell parser validation and the authorized privileged/final-user executions occur.

## Governance

No canonical Build Ledger append is claimed by this checkpoint. Production is not yet claimed active.
