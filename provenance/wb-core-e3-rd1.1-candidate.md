# Workbench Core E3 RD1.1 Candidate

**Status:** AUTOMATED CANDIDATE READY / FRESH PRODUCTION AUTHORIZATION REQUIRED  
**Work stream:** Signalproof Workbench governed Core access  
**Branch:** `candidate/wb-core-e3-rd1`

## Basis

E3 RD1 materially failed after a successful Core stop because the harness assumed the activity-lock file must disappear immediately. E3 Recovery Check RD1 subsequently proved `RECOVERED_BASELINE`: protected Core unchanged, Core back online on `127.0.0.1:43119`, current lock bound to the live recovered Core PID, `clients.json` bytes and ACL at prestate, and Workbench Core client/token absent.

Recovered Core source confirms native lock semantics: when a Core command encounters an existing activity lock whose owner PID is dead, `acquireStoreActivityLock()` removes that stale lock and acquires a new exclusive lock for the current command.

## Correction

Artifact: `B8A-E3-RD1.1.ps1`

SHA-256:

`1C6AFC4013347FC60070B770659F2C11A022F0205FDA977E6443102C2AE953FB`

RD1.1 changes only the failed lock-state interpretation and binds the recovered baseline:

- requires E3 Recovery Check status PASS and disposition `RECOVERED_BASELINE`;
- captures the original activity-lock instance token before stop;
- after successful stop, accepts the persisted lock only when it still identifies the exact old `serve-installed` PID/instance and that PID is dead;
- classifies that lock as stale/reclaimable by the next Core-native command;
- does not manually delete the activity lock;
- allows Core-native `issue-client` to reclaim stale ownership according to Core semantics;
- verifies any post-issue activity lock is not owned by a live unexpected process;
- preserves all prior client/token ACL, rollback, Core restart, protected-state, and evidence behavior;
- uses a fresh `B8A-E3-EV-RD1.1` evidence lane.

## Automated checks

Authoring-side static correction checks PASS:

- failed RD1 assertion removed;
- stale dead-PID verification present;
- recovered-baseline evidence bound;
- no self-elevation;
- no `ProcessStartInfo.ArgumentList` recurrence;
- no JavaScriptSerializer recurrence;
- no Scheduled Tasks query;
- no Core token content read;
- no Governor patch in this phase;
- rollback path preserved.

Exact Windows PowerShell parser/runtime execution has not occurred for RD1.1 because the prior production authorization was consumed by the material RD1 failure.

## Authority gate

`/dsp build-spawn-debug` may prepare and challenge this candidate but does not authorize another production Core stop/client issuance/ACL mutation/restart.

Fresh owner authorization is required before RD1.1 production actuation.

No canonical Build Ledger append, protected-main mutation, Candidate activation, Governor patch, model execution, or Hermes execution is authorized by this candidate record.
