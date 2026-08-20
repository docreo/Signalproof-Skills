# Build 8A D4 Post-Activation Full Debug

**Status:** FULL DEBUG VERIFIED / PRODUCTION ACTIVE / CLOSEOUT READY  
**Main basis:** `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`  
**Branch:** `candidate/build8a-d4-postactivation-20260820`

## Spawn truth

The environment did not provide true independent subagents. `build-git spawn` was executed as clearly separated logical Builder, Design, and Governor lanes under the main Signalproof Orchestrator, per the Active command contract.

## Builder lane

Findings:

- RD1.1 material failure was a live redirected-log file-sharing harness defect, not a Governor product defect.
- RD1.2 recovery verification proved failed privileged production state cleanly removed while preserving the prepared normal-user cryptographic key and protected Core.
- RD1.2.1 privileged install passed: accepted Governor/Workbench identities exact, ACL boundaries exact, Local Service ServiceAccount task with one AtStartup trigger, runtime identity Local Service, DPAPI signing key present, protected Core unchanged.
- RD1.2.1 final-user verification then failed only at standard-user `Get-ScheduledTask` visibility.
- RD1.3 changed the verification evidence class rather than replaying the install: installed normal-user Workbench authenticated to the live production Governor and received `ALLOW`; runtime identity remained Local Service; DPAPI key remained present; protected Core remained exact.
- RD1.4 finalization then moved activation metadata from pending to `PRODUCTION_ACTIVE`, set `production_activation=true`, bound the exact RD1.3 proof, wrote final Quarantine evidence/report, and preserved canonical Build Ledger append as false.

Implementation decision: no further production correction required.

## Design lane

State/architecture challenge:

- Split user/admin/user architecture was necessary because the Workbench private key belongs to the normal user's CurrentUser CSP while privileged installation belongs to the elevated phase.
- The accepted production boundary remains coherent: Workbench authenticates as the prepared user; Governor runs as Local Service; Governor signs through DPAPI state under the production data root; protected Core is separate and unchanged.
- Standard-user scheduler enumeration is not part of the product contract and should not outrank stronger privileged registration/runtime evidence plus direct Workbench-to-Governor protocol proof.
- The final acceptance claim is now tied to the real boundary that matters: the installed Workbench can authenticate to the live production Governor and receives `ALLOW`.

Design decision: no redesign required.

## Governor lane

Authority/protected-state challenge:

- Production activation authorizations were exact and were renewed after material failures as required.
- Final RD1.4 authorization was limited to metadata/evidence finalization only.
- No canonical Build Ledger append authority was inferred or exercised.
- No protected-main mutation was performed by this post-activation operation.
- Protected Core remained exact throughout final proof and finalization.
- The new standard-user Scheduled Task visibility lesson is preserved only as Candidate failure intelligence and is not silently promoted to Active prevention authority.

Governor decision: `PASS / CLOSEOUT READY`.

## Full Debug result

Workstream: Build 8A D4 Governor production activation.

Failure classes carried forward:

1. `HARNESS_LIVE_REDIRECTED_LOG_FILE_SHARING` - corrected and recovered.
2. `HARNESS_PRIVILEGE_VISIBILITY` - corrected by evidence-class-appropriate final-user proof.
3. staging/path/security-prompt incidents - classified as harness/operator transport only; did not invalidate product evidence.

Known-error result:

- existing Active PowerShell failure registry remains applicable;
- new Candidate `KE-PS-SCHEDULED-TASK-VISIBILITY-001` recorded for governance;
- no remaining known-bad retry is required.

Persisted state:

- production activation metadata: `PRODUCTION_ACTIVE`;
- production activation: true;
- Workbench -> Governor auth: PASS;
- Governor decision: ALLOW;
- Governor runtime identity: Local Service;
- DPAPI signing key: present;
- protected Core: unchanged;
- canonical Build Ledger append: false.

Correction result: no further production change required.

Exact-final validation truth: final production runtime and protocol evidence observed PASS; RD1.4 finalization evidence observed PASS. The pasted transcript omitted the literal printed `$LASTEXITCODE` value after the command line, but RD1.4 reached its terminal PASS block and its runner contract exits 0 from that branch.

Original-failure retest: superseded by stronger changed-condition evidence; no unchanged expensive replay required.

Protected-state regression result: PASS.

Final status: `FULL DEBUG VERIFIED / PRODUCTION ACTIVE / CLOSEOUT READY`.

## Next action

Route through Signalproof milestone closeout: Validate -> Record -> Extract -> Govern -> Authorize Next Phase.

Canonical Build Ledger append remains separately authorized and must not be inferred from this result.
