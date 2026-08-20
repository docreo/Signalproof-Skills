# Build 8A D4 PA RD1.3 Final-User Visibility Debug

**Status:** DEBUG CORRECTION GENERATED / NORMAL-USER RUNTIME PROOF PENDING  
**Current main basis:** `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`  
**Branch:** `candidate/activation-gate-20260820`

## Observed failure

The privileged PA RD1.2.1 admin phase passed the production install contract, including exact Governor/Workbench installation, explicit ACL checks, Local Service ServiceAccount task registration, one AtStartup trigger, production runtime identity, DPAPI signing-key presence, and protected-Core postflight.

The subsequent non-elevated final-user phase failed when `Get-ScheduledTask -TaskName "Signalproof Governor"` returned no visible task to the standard user.

## Classification

`HARNESS_PRIVILEGE_VISIBILITY`

The standard-user ScheduledTasks view is not accepted as evidence that the Local Service task disappeared. The previous admin-phase evidence already established the task and runtime readiness from the privileged context.

The stronger final-user authority is the actual production protocol proof: installed Workbench cryptographic authentication to the live Governor and Governor decision `ALLOW`.

## RD1.3 correction

RD1.3 is read-only with respect to production finalization.

It does not query Scheduled Tasks, alter task/service state, install/uninstall files, change ACLs, change production activation metadata, or append the canonical Build Ledger.

It consumes the existing:

- RD1.1 USER-PREP evidence and normal-user CSP identity;
- RD1.2 recovery-clean evidence;
- RD1.2.1 admin-install evidence.

It requires:

- final execution under the prepared non-elevated Workbench user;
- admin-install target SID and public-key identity exact;
- accepted Governor and Workbench identities exact;
- persisted runtime-identity artifact still proving Local Service SID;
- non-empty production DPAPI signing key;
- production activation metadata still pending final user verify;
- protected Core exact before protocol proof;
- installed Workbench production auth-test exit 0;
- live Governor decision `ALLOW`;
- Local Service runtime identity and DPAPI signing key remain present after `ALLOW`;
- protected Core exact after protocol proof.

Successful RD1.3 debug proof exits 13 and writes only Quarantine evidence. It does not write production-final activation metadata.

## Authorization

The prior production-activation authorization is treated as consumed by the material RD1.2.1 final-phase failure. RD1.3 is a bounded read-only debug proof and therefore does not reuse production actuation authority.

If RD1.3 proves live production `ALLOW`, a fresh exact production-activation authorization is required only for the final metadata/evidence finalization step.

## Exact-final validation

The generated RD1.3 artifact passed 19 Full Debug checks and the current executable known-error preflight with zero findings.

No production activation PASS is claimed until runtime evidence completes and separately authorized finalization occurs.
