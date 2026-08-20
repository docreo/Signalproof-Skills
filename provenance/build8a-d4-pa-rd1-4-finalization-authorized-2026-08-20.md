# Build 8A D4 PA RD1.4 Authorized Finalization

**Status:** AUTHORIZED / STATIC PASS / RUNTIME FINALIZATION PENDING  
**Main basis:** `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`

## Authorization envelope

Target: `production-activation`.

Scope: final metadata/evidence finalization only, after RD1.3 proved the installed normal-user Workbench authenticated to the live production Governor and received `ALLOW`.

Status: `AUTHORIZED`.

Consumption: successful RD1.4 finalization, or any material finalization failure/change.

Excluded: reinstall, task/service mutation, key creation/change, ACL mutation, protocol replay, canonical Build Ledger append, protected-main mutation, unrelated workstreams, and future production operations.

## Accepted prerequisite evidence

RD1.3 runtime proof established:

- normal-user Workbench context exact;
- prepared cryptographic client identity exact;
- installed Workbench exact;
- accepted Governor manifest exact;
- live Governor runtime identity Local Service;
- DPAPI signing key present;
- activation metadata still `ADMIN_INSTALLED_PENDING_USER_VERIFY`;
- protected Core count/anchors exact before and after the protocol proof;
- production Workbench auth-test exit 0;
- live Governor decision `ALLOW`.

## RD1.4 finalization contract

RD1.4 runs under the normal prepared Workbench user and performs only the final state transition and evidence materialization.

It validates the existing USER-PREP, recovery-clean, admin-install, RD1.3 final proof, Workbench-auth artifact, installed binary identities, live runtime identity, signing-key presence, and protected Core.

It then changes only `F:\Signalproof\Governor Data\ACTIVATION.json` from pending final user verify to `PRODUCTION_ACTIVE` with `production_activation=true` and binds the exact RD1.3 proof hashes.

It writes final Quarantine evidence/report under `B8A-D4-PA-EV-RD1.4`.

It does not query Scheduled Tasks from the standard user, alter task/service state, change ACLs, create/change keys, reinstall software, replay the protocol proof, or append the canonical Build Ledger.

If a finalization failure occurs after activation metadata mutation, the prior activation metadata is restored and partial final evidence/report are removed.

## Exact-final static validation

RD1.4 passed 21 static checks and the current machine-checkable PowerShell known-error preflight with zero blocking findings.

Production activation PASS is not claimed until the Windows PowerShell exact-final parser and authorized RD1.4 runtime both pass.
