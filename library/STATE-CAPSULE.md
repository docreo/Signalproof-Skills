# Signalproof State Capsule V0.1

## Purpose

The State Capsule is the minimum sufficient continuity object for an active Signalproof workstream.

> **Carry proof forward, not the whole conversation.**

It is compact routing/evidence context, not a Build Ledger replacement and not authority by itself.

## Runtime rule

At a stage transition or fresh-chat continuation, prefer one current capsule plus the current stage's principal Skill and only the specialists/Loops actually required.

Do not reload full historical logs, handoffs, registries, or prior-stage doctrine unless a current claim cannot be resolved without them.

## Capsule

```yaml
workstream: <stable id/name>
objective: <one sentence>
stage: <RESEARCH|PLAN|DESIGN|READINESS|BUILD|DEBUG_VERIFY|HUMAN_QC|DEPLOY_READY|DEPLOY|POST_DEPLOY_VERIFY|CLOSEOUT>
status: <current strongest supported state>
git:
  repo: <owner/repo or N/A>
  ref: <branch/tag>
  head: <verified sha or UNKNOWN>
candidate:
  id: <version/build/artifact or NONE>
  digest: <sha256 or N/A/UNKNOWN>
protected_state:
  - <must remain true>
acceptance:
  machine: <PASS|FAIL|OPEN|N/A>
  human_qc: <PASS|FAIL|OPEN|N/A>
  deploy: <PASS|OPEN|N/A>
proof_refs:
  - <smallest durable evidence pointer>
open_failure:
  fingerprint: <id or NONE>
  attempts: <integer>
  changed_condition: <what changed or NONE>
authority:
  current: <bounded authority state>
  excluded: <material exclusions>
recovery: <rollback/recovery ref or UNKNOWN>
compliance:
  law_license_tos: <PASS|OPEN|UNKNOWN|N/A>
next_gate: <exact next gate>
user_action: <NONE or exact human action>
```

## Evidence compression rules

1. Preserve evidence identity or pointer, not verbose evidence replay.
2. Preserve a material failure fingerprint and attempt count; do not summarize it away.
3. Preserve exact candidate identity when acceptance or deployment depends on it.
4. Preserve `UNKNOWN`; never compress uncertainty into PASS.
5. A later change invalidates only evidence materially affected by that change.
6. Reuse still-valid proof instead of rerunning or restating it.
7. The capsule may link to a durable handoff or report when deeper reconstruction is required.

## Stage transition update

Update only fields whose truth changed. Typical transition output:

```text
STAGE UPDATE
Stage: BUILD -> HUMAN_QC
Result: AUTOMATED PASS
Proof: <candidate + compact refs>
Next gate: HUMAN QC
User action: test <minimum exact behavior>
```

Routine intermediate chatter is unnecessary when no stage, blocker, authority, candidate, or required human action changed.

## Fresh-chat bootstrap

A receiving chat should:

1. refetch current public Signalproof routing/command authority when consequential work will continue;
2. read the current capsule;
3. validate Git/candidate identities that may have changed;
4. load the principal Skill for `stage` plus at most the required narrow specialists/Loops;
5. continue at `next_gate` rather than reconstructing the project from narrative history.

## Boundaries

The capsule does not:

- create authorization;
- prove facts without referenced evidence;
- replace canonical Build Ledger chronology;
- replace exact release/deployment evidence;
- erase failed attempts;
- carry secrets or private material into public artifacts;
- permit skipping law, license, Terms of Service, security, recovery, or human authority gates.

## Cost objective

The capsule succeeds when a competent fresh session can safely continue the work using materially less context than replaying the full prior conversation while preserving the evidence, failure memory, authority, recovery, and acceptance state needed for the next decision.
