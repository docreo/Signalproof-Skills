# Workbench Core E3 RD1.1 - Fresh Production Authorization

**Status:** AUTHORIZED / TARGET EXECUTION READY  
**Work stream:** Signalproof Workbench governed Core access  
**Git basis:** `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**Branch:** `candidate/wb-core-e3-rd1`

## Owner authorization

Owner invocation immediately preceding `/dsp build-spawn-debug`:

`/dsp authorize production Core integration`

The authorization is bound to the exact corrected production Core-side candidate:

`B8A-E3-RD1.1.ps1`

SHA-256:

`1C6AFC4013347FC60070B770659F2C11A022F0205FDA977E6443102C2AE953FB`

## Basis

- E2 RD1.2 isolated Governor-to-Core adapter contract: PASS.
- E3 PF RD1: `READY_FOR_ORDERED_PRODUCTION_INTEGRATION`.
- E3 RD1 first actuation: Core stop succeeded; harness then misclassified the persisted dead-PID activity-lock record.
- E3 Recovery Check RD1: `RECOVERED_BASELINE`; protected Core unchanged; Core online at `127.0.0.1:43119`; current activity lock matches the live recovered Core PID; `clients.json` bytes and ACL exactly at pre-client state; Workbench Core client/token absent.
- Core source semantics: stale dead-PID activity locks are reclaimed by the next Core-native private-data command.
- E3 RD1.1 corrects only the post-stop activity-lock interpretation and binds the recovered-baseline evidence.

## Authorized RD1.1 scope

- stop Core through the accepted operation worker;
- issue exactly `signalproof.llm-workbench` with `models:invoke` only;
- harden exact `clients.json` ACL;
- grant Local Service read and no write on the exact Workbench Core token file;
- restart Core on the original loopback port;
- verify protected Core remains byte-identical;
- recover to pre-client state if the bounded phase fails after mutation begins.

## Excluded from RD1.1

- Governor source patch/restart;
- model or Hermes execution;
- direct Workbench-to-Core route;
- protected Core program mutation;
- protected-main mutation;
- Candidate activation;
- canonical Build Ledger append;
- unrelated production work.

## Authorization consumption

This authorization is consumed when RD1.1 completes, materially fails, or its evidence/scope changes enough to invalidate the owner decision. A successful RD1.1 does not silently authorize a later materially distinct production action outside the already bounded Core-integration stream; the next Governor patch phase must remain within the explicit production Core-integration target and its current evidence basis.

## Build Spawn Debug continuation

The owner then invoked `/dsp build-spawn-debug`.

The coordinator must reuse the exact accepted candidate/evidence rather than rebuild or replay prior gates. The next unavailable-to-chat machine gate is execution of the exact hash-bound RD1.1 artifact on the owner Windows machine. On failure, preserve the exact output and resume Full Debug with the new failure fingerprint. On PASS, continue the same bounded integration workstream to the next evidence-supported gate.
