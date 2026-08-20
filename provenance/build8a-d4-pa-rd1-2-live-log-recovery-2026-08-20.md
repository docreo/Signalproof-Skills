# Build 8A D4 PA RD1.2 Live-Log Recovery Correction

**Status:** DEBUG CORRECTION GENERATED / RECOVERY VERIFY RUNTIME PENDING  
**Current main basis:** `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`  
**Branch:** `candidate/activation-gate-20260820`

## Observed failure

During PA RD1.1 privileged installation, the accepted Governor and Workbench copied successfully, both production ACL boundaries validated, both wrappers parsed, and the production Local Service AtStartup task registered correctly.

The harness then failed while attempting to read the live redirected Governor stdout file using an exclusive-unaware whole-file read. The active production process still owned the redirected stream.

Failure class: `HARNESS_LIVE_REDIRECTED_LOG_FILE_SHARING`.

This is not accepted evidence of a Governor product failure.

## Recovery state

The RD1.1 failure handler attempted to stop/unregister the production task, stop exact production processes, remove the newly-created production data/product roots, and then reverified protected Core anchors. The console evidence proves Core recovery verification PASS, but it does not prove every privileged cleanup mutation completed. Therefore persisted production state must be inspected before any retry.

The normal-user Workbench cryptographic preparation remains intentionally preserved. No second client key should be generated.

## RD1.2 correction

RD1.2 uses a fresh evidence lane and consumes the preserved RD1.1 USER-PREP record/key.

Its first normal-user execution is recovery verification only. It requires:

- production product root absent;
- production data root absent;
- production task absent;
- production service absent;
- exact production processes absent;
- prepared normal-user Workbench CSP key still present;
- prepared public-key identity unchanged;
- protected Core unchanged.

No production retry is performed by that first execution.

For the later privileged retry, live Governor stdout/stderr are no longer read while the production process owns those redirected streams. Production readiness is instead bounded to:

- scheduled task state `Running`;
- runtime identity proving Local Service SID;
- non-empty DPAPI signing-key artifact.

The final normal-user installed Workbench authentication proof remains the authoritative production protocol test and must receive Governor `ALLOW`.

## Authorization

The prior explicit production-activation authorization is treated as consumed by the material RD1.1 admin failure. RD1.2 recovery verification does not require renewed production actuation authority. A fresh exact production-activation authorization is required before the privileged RD1.2 retry.

## Governance

No canonical Build Ledger append is claimed. No Candidate activation or protected-main mutation is performed by this record.
