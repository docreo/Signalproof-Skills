# KE-CORE-ACTIVITY-LOCK-STALE-001

**Status:** CANDIDATE  
**Class:** Signalproof Core Runtime / private-data activity lock / harness evidence  
**Discovered:** Workbench Core E3 RD1

## Failure fingerprint

A harness successfully stops the live Core process, verifies the original Core PID is dead, then treats continued existence of `runtime/core-activity.lock.json` with that dead PID as a stop failure.

## Native Core semantics

Recovered Core source shows `acquireStoreActivityLock(root, command)` reads any existing activity lock, checks whether `existing.owner_pid` is alive, and:

- fails closed when the owner PID is alive;
- deletes the stale lock when the owner PID is dead;
- then creates a new exclusive lock for the current Core command.

Therefore lock-file existence alone does not prove the private-data store remains actively owned.

## Prevention candidate

- Classify activity-lock state by owner PID liveness and lock identity, not file existence alone.
- After an accepted stop, if the old Core PID is dead and the persisted lock still identifies that exact old PID/instance, classify it as stale/reclaimable rather than active ownership.
- Let the Core-native next command reclaim its own stale lock unless a separate recovery contract requires preserving/moving it.
- Do not manually delete an activity lock merely to satisfy harness expectations.
- After the next Core command, verify the resulting lock/state belongs to the expected live process or that the transient command released its own lock.
- Preserve harness failure separately from product stop success.

## E3 evidence

E3 RD1:

- Core stop worker exit 0;
- Core stop result `succeeded` / exit code 0;
- original Core PID stopped;
- harness then failed only because the persisted lock still identified the original PID;
- automatic recovery subsequently restored Core online.

E3 Recovery Check RD1 then proved `RECOVERED_BASELINE`: protected Core unchanged, `clients.json` bytes/ACL at prestate, Workbench Core client/token absent, Core online on `127.0.0.1:43119`, and the current activity lock matched the new live Core PID.

## Governance

Candidate only. This does not change Active doctrine, authorize production retries, modify Core, or append the canonical Build Ledger. Promotion requires normal Learn/Known Errors governance and regression coverage.
