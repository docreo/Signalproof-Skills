---
name: signalproof-recovery
description: Restore a known-good system state after failed, corrupted, unsafe, or rejected change without confusing a backup with a verified rollback. Use when deciding what to restore, validating rollback artifacts, preserving user data and evidence, isolating failed candidates, ordering recovery safely, verifying the recovered state, or stopping when no trustworthy recovery path exists.
---

# Signalproof Recovery

## Purpose

`signalproof-recovery` is the rollback and restoration specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

Its central rule is:

> **A backup is not a rollback until its identity, completeness, integrity, and recoverability are verified.**

Recovery exists to return a system to a known, accepted, usable state without destroying evidence, user data, or the last trustworthy baseline.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, smallest effective change, verification, milestone closeout, STOP conditions, public/private boundaries, proof, and continuity.

Recovery may require destructive replacement, privilege elevation, service interruption, or data migration. Those actions require explicit authority appropriate to the environment. Technical ability to restore does not itself grant permission to overwrite.

## Recovery Contract

1. **Identify the failure boundary.** Know what failed, what still works, and what must remain untouched.
2. **Identify the intended recovery target.** Prefer an owner-accepted or otherwise verified known-good baseline over the newest available copy.
3. **Distinguish recovery artifacts by status.** Backup, snapshot, candidate, previous version, accepted rollback, installer, package, and source tree are not interchangeable labels.
4. **Verify the rollback source before replacement.** Confirm identity, completeness, hashes/manifests where available, dependency/runtime assumptions, and required persistent state.
5. **Preserve the failed state when useful.** Quarantine or snapshot evidence before replacement when safe and proportionate.
6. **Protect user/persistent data separately from application binaries.** Do not assume reinstalling the application should erase data, models, projects, configuration, or credentials.
7. **Avoid mixed-version recovery.** Restore a coherent tree/configuration rather than combining arbitrary files from multiple baselines unless a migration plan explicitly requires it.
8. **Stage before destructive replacement when practical.** Validate the recovery candidate in isolation before switching it into service.
9. **Recover in dependency order.** Restore prerequisites, configuration, services, application state, then higher-level integrations in the order required by the system.
10. **Verify the recovered state.** Recovery is incomplete until the target identity and required behavior are proven at the appropriate evidence level.
11. **Preserve a path forward.** Record what was restored, what remained untouched, what failed, what evidence supports success, and what remains open.
12. **Stop when the recovery source is ambiguous or untrustworthy.** Do not overwrite a failing system with an unverified artifact merely because it is labeled “backup.”
13. **Preserve uncertain ownership after failed cleanup.** If a resource was created or controlled by the current operation and cleanup cannot be verified, retain enough identity/ownership state for explicit later recovery. Do not erase the record merely to make the failure look closed.

## Recovery Workflow

### 1. Declare the Recovery Objective

Capture:

- failed or rejected state;
- desired known-good state;
- user-visible/system-visible success condition;
- data/configuration that must survive;
- maximum acceptable disruption when known;
- authority currently granted.

Do not begin by copying files.

### 2. Establish Current / Failed State

Record the strongest available evidence for:

- current version/build/commit;
- failure symptoms;
- services/processes still running;
- persistent data locations/state;
- current configuration;
- logs/evidence worth preserving;
- any partial installation or migration state;
- security/permission boundary.

If the failure cause is unclear and matters to safe recovery, route through `signalproof-investigate` before destructive action.

When a prior attempt partially actuated a process/service/resource, explicitly distinguish:

- resource proven absent;
- resource proven present and owned;
- resource present but externally owned;
- ownership uncertain/unverifiable.

Do not collapse these into a generic “cleanup failed” label.

### 3. Inventory Recovery Candidates

For each available candidate record:

- identity/version/build;
- source/path/repository/package identity;
- whether it was ever accepted as working;
- completeness;
- manifest/hash/signature status where available;
- required runtime/dependencies;
- data/schema compatibility;
- whether it contains user data or only application payload;
- evidence class supporting its status.

Classify candidates as:

- **VERIFIED ROLLBACK** — known-good and recovery evidence is sufficient for the intended scope;
- **PROMISING CANDIDATE** — may be usable but requires verification;
- **BACKUP ONLY** — bytes exist, but recoverability/identity is not established;
- **REJECTED / FAILED CANDIDATE** — known failed or not suitable as rollback;
- **UNKNOWN** — insufficient evidence.

Never select solely by newest timestamp.

### 4. Protect Current Evidence and Persistent State

Before replacement, determine whether to preserve:

- failed candidate binaries/config;
- logs/crash evidence;
- current data/config snapshot;
- user projects/content;
- models/assets;
- license/activation state;
- environment/runtime metadata;
- partial-operation ownership identities such as PID + process start identity, child handle, service identity, lock/token, transaction ID, or recovery journal where applicable.

Preservation must not itself overwrite the accepted rollback or consume the only safe recovery copy.

### 5. Verify the Recovery Source

Before restore, verify proportionately:

- expected file inventory;
- SHA-256/manifest coverage;
- package/archive integrity;
- version/build identity;
- required configuration schema;
- dependency/runtime compatibility;
- installer/restore script provenance;
- absence of known rejected files;
- rollback-specific acceptance evidence.

If a manifest is expected but incomplete, do not silently treat partial hash coverage as full-tree verification.

### 6. Define the Restore Boundary

State exactly what will be replaced and what will not.

Possible boundaries:

- application binaries only;
- configuration only;
- application + configuration;
- dependency/runtime environment;
- service registration;
- database/schema;
- complete product install tree.

Persistent user data should remain outside the replacement boundary unless the recovery plan explicitly requires a data restore and has authority to perform it.

### 7. Define Recovery Order

Use the smallest safe sequence. Example:

```text
STOP ACTIVE WRITES
   ↓
PRESERVE CURRENT EVIDENCE / DATA
   ↓
VERIFY ROLLBACK SOURCE
   ↓
STAGE RECOVERY CANDIDATE
   ↓
VERIFY STAGED IDENTITY
   ↓
REPLACE / SWITCH BOUNDED STATE
   ↓
RESTORE REQUIRED CONFIG / SERVICES
   ↓
VERIFY TARGET BEHAVIOR
   ↓
VERIFY PROTECTED DATA
   ↓
ACCEPT OR REVERT RECOVERY ATTEMPT
```

Project-specific dependency order controls when it differs.

### 8. Partial-Operation Cleanup and Ownership

When recovery follows a failed start, install, migration, registration, or other partial operation:

1. use the identity captured by the operation that created/owned the resource;
2. do not substitute a resource merely because it has the expected name, PID, path, port, or executable;
3. verify current identity again before destructive cleanup when reuse/drift is possible;
4. clear ownership/recovery state only after cleanup is verified;
5. if cleanup fails or cannot be verified, preserve the ownership record and return a partial/blocked status rather than pretending the resource is gone.

For process recovery specifically, PID alone may be insufficient. Pair it with process start identity, executable identity, child-handle ownership, ownership token, or equivalent evidence appropriate to the implementation.

### 9. Stage When Practical

Prefer restoring to an isolated staging location or alternate slot when feasible.

Check:

- expected files present;
- hashes/manifest match;
- executable/runtime identity;
- configuration can load;
- required dependencies are available;
- no persistent data was unexpectedly copied or overwritten.

A staged PASS reduces risk but does not replace post-switch runtime verification.

### 10. Execute Only With Authority

Before destructive replacement confirm:

- overwrite scope;
- service/process stop authority;
- privilege/elevation requirement;
- user-data boundary;
- accepted rollback target;
- fallback if this recovery attempt fails.

Do not silently elevate privileges or broaden the restore scope.

### 11. Verify Recovery

Recovery verification should include, as applicable:

- restored version/build identity;
- expected file/hash identity;
- process/service startup;
- API/health endpoint;
- representative functional path;
- persistent user data unchanged/present;
- configuration loaded;
- rollback/recovery controls still available;
- no mixed-version residue affecting operation;
- partially created resources from the failed attempt are either proven removed or still explicitly tracked for follow-up.

Use `signalproof-verify` when the exact claim needs formal evidence grading.

### 12. Accept or Contain

If recovery passes:

- mark the restored baseline current/accepted only with appropriate authority;
- preserve the failed candidate/evidence according to policy;
- record what changed and what remained untouched.

If recovery fails:

- do not repeatedly overwrite with the same unverified approach;
- preserve evidence;
- return to the last still-trustworthy state if possible;
- route to investigation/plan/human decision.

## Backup vs Rollback

A **backup** proves that some bytes were copied.

A **rollback** additionally requires enough evidence to establish:

- what the bytes are;
- whether the set is complete;
- whether it belongs to the intended version;
- whether dependencies/configuration match;
- whether persistent state is compatible;
- whether it can actually restore required behavior.

Therefore:

```text
BACKUP EXISTS
      ≠
ROLLBACK VERIFIED
```

## Recovery Target Selection

When multiple candidates exist, prefer in this order unless project authority says otherwise:

1. owner-accepted known-working rollback with verified identity;
2. previously runtime-verified baseline with complete recovery evidence;
3. promising candidate that can be safely verified before replacement;
4. unverified backup only as a last-resort candidate requiring explicit risk acceptance.

Do not automatically prefer:

- newest folder;
- highest version number;
- file named `backup`;
- file named `previous`;
- most recent failed candidate.

## Mixed-Version Rule

Avoid partial restores that leave incompatible files from multiple releases.

If a bounded file-level rollback is intentional, establish that:

- the file-level boundary is supported;
- interface/schema compatibility remains valid;
- the remaining tree is expected to work with that file version;
- regression evidence covers the mixed state.

Otherwise restore a coherent accepted tree.

## User Data Rule

By default, treat persistent user data as protected state.

Examples include:

- projects/documents/media;
- local databases;
- user-created presets;
- downloaded models/assets;
- credentials/tokens;
- settings/configuration intended to persist;
- audit/evidence logs.

Do not erase such state merely because application binaries are being restored.

If user data itself is corrupt and needs restoration, that is a separate explicit recovery boundary with its own backup/version/acceptance evidence.

## Recovery Verification Is Not Release Authority

A successful rollback proves the recovered state to the tested boundary. It does not automatically:

- promote that version as a new release;
- replace the historical rollback hierarchy;
- declare security clearance;
- sign software;
- deploy to other machines;
- delete failed artifacts/evidence;
- mutate the canonical Build Ledger without its own verified authority.

Those remain separately governed.

## Recovery Status

Return one of:

- **RECOVERY READY** — trustworthy target, scope, authority, and verification path are sufficient to execute.
- **RECOVERED / VERIFIED** — restore completed and required recovery verification passed.
- **RECOVERED / PARTIAL** — bounded recovery succeeded but one or more stated gates remain unverified.
- **INVESTIGATE FIRST** — failure/current state is too unclear for safe recovery.
- **AWAITING AUTHORITY** — destructive or privilege-sensitive restore action is not authorized.
- **NO VERIFIED ROLLBACK** — backups/candidates exist but none currently meet the recovery bar.
- **RECOVERY FAILED** — attempted restore did not meet required acceptance conditions.
- **STOP** — proceeding risks destroying the only good state, user data, evidence, or system recoverability.

## STOP Conditions

Stop recovery when:

- no trustworthy rollback identity can be established;
- the only known-good copy would be overwritten;
- required manifest/hash evidence is contradictory or incomplete for a supposedly verified tree;
- persistent user data would be erased without explicit authority;
- recovery would create an unexplained mixed-version state;
- the restore script/package provenance is unknown and execution would be consequential;
- required privilege/elevation is not authorized;
- current writes cannot be safely stopped and could corrupt restore state;
- cleanup of a partially created owned resource cannot be verified and destructive follow-up would risk an external/unowned resource;
- the same recovery attempt is failing repeatedly without new evidence;
- recovery success cannot be meaningfully verified.

## Anti-Patterns

Fail this skill when recovery:

- selects the newest backup instead of the known-good rollback;
- overwrites before verifying the recovery source;
- treats a folder name as proof of version/acceptance;
- deletes the failed state before preserving useful evidence;
- wipes user data during an application rollback without authority;
- copies arbitrary files from multiple versions into one tree;
- uses only “files copied successfully” as proof of recovery;
- calls a restore successful without testing required behavior;
- silently elevates privileges;
- drops ownership/recovery state after cleanup failure, making a potentially live resource untracked;
- kills/stops/deletes a resource based only on a reused identifier without verifying it is still the originally owned resource;
- repeatedly retries a destructive restore without changing evidence or approach;
- destroys the only remaining known-good rollback.

## Completion Criteria

Recovery is complete when the failed state, accepted recovery target, evidence for target identity, restore boundary, protected user/persistent state, recovery order, authority, staging/restore actions, verification results, failed-attempt evidence, partial-operation ownership/cleanup state where relevant, and remaining rollback options are explicit enough that another competent human or agent can reconstruct both why this target was chosen and why the recovered state should or should not be trusted.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-recovery`
- **Version:** `0.1.1`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-investigate`, `signalproof-plan`, `signalproof-verify`, `signalproof-review`, `signalproof-closeout`
- **Domain:** Rollback selection, restore integrity, data preservation, staged recovery, partial-operation ownership preservation, mixed-version prevention, recovery verification
- **Created by:** Doc Reo / Signalproof
