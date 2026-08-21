# Workbench Core E3 Recovery Check RD1

**Status:** BUILD SPAWN DEBUG / READ-ONLY RECOVERY CHECK READY  
**Work stream:** Signalproof Workbench governed Core access  
**Git basis:** `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**Branch:** `candidate/wb-core-e3-rd1`

## Trigger

E3 RD1 production Core-side integration reached a successful Core stop through the accepted operation worker and proved the original Core PID stopped. The runner then failed because it required the persisted `core-activity.lock.json` record to no longer reference the stopped PID.

The transcript proves the stop operation itself succeeded. The failure is localized to `HARNESS / EVIDENCE / POST-STOP LOCK-STATE INTERPRETATION`, not to protected Core program bytes or the stop operation.

The prior production authorization is consumed by this material failure. `/dsp build-spawn-debug` authorizes bounded diagnosis/build/debug work but does not authorize another production mutation.

## Build Spawn Debug envelope

Objective: determine the exact recovered production state and prepare the smallest corrected E3 candidate without replaying production actuation.  
Protected state: protected 39-file Core program, production Governor, Workbench cryptographic boundary, rollback evidence.  
Current failure fingerprint: persisted Core activity-lock record after a successful stop.  
Attempt count for this fingerprint: 1.  
Allowed current action: read-only recovery verification and candidate correction design.  
Excluded: client issuance, ACL mutation, Core stop/start, Governor patch/restart, model/Hermes execution, protected-main mutation, Candidate activation, canonical Build Ledger append.

## Artifact

Artifact: `B8A-E3-RC-RD1.ps1`

SHA-256:

`2469F9BD13F6D137F30B82BBC298538B9D72B867A10FB344331B7FAB8CCB3019`

The checker:

- runs only as the normal non-elevated owner;
- verifies the protected Core count and eight anchors;
- compares current `clients.json` bytes to the pre-client rollback backup;
- compares current `clients.json` ACL SDDL to the pre-client rollback SDDL;
- checks whether the Workbench Core client exists;
- checks whether the deterministic Workbench Core token exists without reading token contents;
- checks `service-state.json`, the recorded PID, process liveness, host, and port;
- checks `core-activity.lock.json`, its command, owner PID, and owner-PID liveness;
- distinguishes a lock matching a live recovered Core from a stale dead-PID lock;
- performs no process start/stop, client issuance, ACL mutation, token-content read, task query, production mutation, or canonical Build Ledger append.

Possible dispositions:

- `RECOVERED_BASELINE`
- `CORE_OFFLINE_STALE_LOCK / RECOVERY_REQUIRED`
- `PARTIAL_MUTATION / INVESTIGATE`
- `CORE_ONLINE_LOCK_MISMATCH / INVESTIGATE`
- `UNRESOLVED_STATE / INVESTIGATE`

## Next

Execute the exact recovery checker once. If `RECOVERED_BASELINE`, use the result to build the corrected E3 candidate and request a fresh bounded production authorization. If any other disposition is returned, preserve it and route to the indicated Recovery/Investigation path rather than replaying E3 RD1.
