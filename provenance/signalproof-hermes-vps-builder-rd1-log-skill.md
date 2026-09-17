# Signalproof Hermes VPS Builder — RD1 Log-Skill Record

Status: STAGED PUBLIC-SAFE LEARNING / NOT CANONICAL BUILD LEDGER  
Date: 2026-08-27  
Command intent: `/dsp log-skill complete`

## Work unit

Extract the reusable method from the first governed Hermes VPS build and place it into the Signalproof Library/build system without falsely promoting one deployment into Active doctrine.

## Evidence state

Machine-observed build evidence established:

- hardened Ubuntu 24.04 VPS baseline;
- verified human admin SSH path before disabling weaker SSH authentication;
- dedicated non-sudo Hermes runtime identity;
- exact pinned Hermes v0.20.6 commit;
- correction of a wrong installer path without destructive side effects;
- upstream dependency-lock fallback detected and reconciled back to the committed lock;
- one user-systemd gateway owner with bounded restart-loop protection;
- single-writer and restart-stability acceptance;
- SQLite-consistent accepted snapshot with SHA-256 identity;
- persistent dashboard bound only to loopback;
- dashboard restart persistence without disturbing gateway state;
- Kanban DB integrity with zero non-archived tasks before dashboard activation;
- current upstream warning that directly-created blocked Kanban tasks may bypass the intended human approval boundary.

## Reusable capability disposition

**Disposition:** NEW SPECIALIST SKILL CANDIDATE.

Reason: the workflow is more than a topic-specific runbook. It combines a repeatable transformation with distinct trigger, shell-context discipline, least-privilege service architecture, pinned supply-chain authority, Known-Error reconciliation, network exposure gates, live SQLite backup semantics, novice-operator delivery, and Git reconstruction boundaries.

It remains a specialist under the existing Build/Build Spawn Debug/Security/Recovery families rather than replacing those generic capabilities.

## New candidate

`signalproof-hermes-vps-builder` 0.1.0

Maturity:

`CANDIDATE / NOT ACTIVE`

Candidate path:

`skills/candidates/signalproof-hermes-vps-builder/SKILL.md`

Acceptance path:

`acceptance/signalproof-hermes-vps-builder-v0.1.md`

## Builder integration

No Active generic Build Skill was silently rewritten in this log. The domain-specific knowledge is captured as a Candidate specialist so the existing `signalproof-build` and `signalproof-build-spawn-debug` contracts can compose it after promotion.

The current live workstream also receives a Git reconstruction tree in the private `Signalproof-Core-Runtime` repository so Builder instructions, accepted state, Known Errors, service units, recovery doctrine, and novice teaching material are available before the VPS itself receives Git credentials.

## Public/private boundary

This record intentionally omits:

- passwords/passphrases;
- SSH private key material;
- API/provider/messaging credentials;
- `.env` contents;
- public VPS address;
- raw state/session databases;
- private Build Ledger chronology/head;
- protected backup archive bytes.

## Skill Architecture Check

- responsibility: coherent Hermes VPS domain specialist;
- parent capabilities: Build, Build Spawn Debug, Known Errors, Security, Recovery, Document, Build Capsule;
- duplicate doctrine: avoided by referencing generic responsibilities instead of reproducing their full contracts;
- activation: NOT performed;
- registry state: Candidate entry only;
- independent validation: still required;
- novice operator acceptance: still required on a materially independent run;
- restore/reconstruction acceptance: still required;
- human browser/Kanban Build-03 gates: still open at the time of this log.

## Closeout state

**LOGGED / CANDIDATE STAGED / WORKSTREAM CONTINUES.**

This is not a canonical Build Ledger append and does not claim the Hermes VPS is fully complete. Build-02 is accepted; Build-03 and later provider/model/messaging/Git-sync gates remain open.
