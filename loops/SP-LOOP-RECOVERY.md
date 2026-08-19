# SP-LOOP-RECOVERY

**Status:** RD1 Candidate  
**Principal:** `signalproof-recovery`

## Purpose

Bound restoration attempts so recovery protects the last trustworthy state and does not become repeated destructive overwrite.

## Cycle

`CONTAIN WRITES -> PRESERVE DATA/EVIDENCE -> VERIFY ROLLBACK -> CLEANUP OWNED STATE -> RESTORE -> VERIFY IDENTITY/FUNCTION -> ACCEPT / FALLBACK / STOP`

## Contract

- Identify protected user data and the last trustworthy rollback before actuation.
- Verify target identity before replacement.
- Destructive steps require authority and a remaining fallback.
- Default maximum: **2 failed restoration attempts against the same target/approach** before Investigate/Plan/human decision.
- Cleanup must use verified ownership identity.
- Success requires restored identity plus required functional/data verification.

## STOP

STOP if the only known-good state would be destroyed, target identity is ambiguous, persistent data is endangered, ownership is unknown, authority is missing, or the same failed recovery is repeating without new evidence.

## Evidence

Per attempt: target, hashes/identity, restore boundary, protected state, cleanup ownership, actions, verification, fallback state, next decision.
