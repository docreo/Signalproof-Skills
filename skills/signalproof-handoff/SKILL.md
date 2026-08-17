---
name: signalproof-handoff
description: Preserve project continuity across long AI work chats by monitoring context pressure, creating an evidence-bound handoff before continuity becomes unsafe, preserving protected state and failures, and giving the receiving chat an exact boot path. Use before a major new phase when a chat is already long, after repeated build/test/recovery cycles, when a trustworthy context meter reaches a conservative threshold, or whenever the user asks for a handoff, new chat, transfer, pause, or continuation in another session.
---

# Signalproof Handoff

## Purpose

`signalproof-handoff` is the conversation-boundary continuity specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

Its central rule is:

> **A chat boundary must not become a project-state boundary.**

A long conversation can become an operational failure mode even while the product itself is healthy. Protected baselines, failures, hashes, authority, repository state, Build Ledger state, and next-action intent must survive the session boundary.

## Handoff Contract

1. **Assess context pressure before loss occurs.** Do not wait until a chat is too compressed to produce a reliable transfer.
2. **Do not invent context-meter precision.** Report exact percentages only when the active platform exposes a trustworthy real meter.
3. **Start handoffs early.** Continuity preparation is part of the work, not an emergency afterthought.
4. **Preserve objective and phase.** State what is being built or evaluated and exactly where work stopped.
5. **Preserve protected state.** Record accepted baseline, rollback, source-of-truth paths, hashes, manifests, and forbidden-change boundaries.
6. **Preserve material failures.** Later success must not erase failed wrappers, partial mutations, rejected candidates, or unresolved uncertainty.
7. **Preserve evidence class.** Artifact-backed, runtime-verified, human-observed, design-authority, inference, proposal, and unknown states must not silently collapse.
8. **Preserve repository continuity.** Last-known GitHub state is a snapshot, not proof of current state. Refetch volatile state before a future write.
9. **Preserve Build Ledger boundaries.** Canonical and staged/noncanonical state must remain distinct. Never invent a future sequence or event hash.
10. **State prohibited actions and STOP conditions.** The receiver must know what must not be changed or repeated.
11. **State the exact next authorized action.** A handoff is incomplete if the receiver must guess where to resume.
12. **Create a receiving-chat boot instruction.** The user should not have to rewrite the project history.
13. **Hash handoff artifacts.** Use SHA-256 coverage where practical so transferred files can be verified.
14. **Distinguish handoff from milestone closeout.** A chat boundary can occur while the underlying development phase remains open.
15. **Stop opening major new work under RED context pressure.** Complete the transfer first unless the human authority explicitly overrides the boundary.

## Context Pressure

Context Pressure is a conservative operational state, not a fabricated token counter.

### GREEN

Continue normal work.

Use when objective, protected state, important failures, evidence, and next action remain compact and directly recoverable.

### YELLOW

Create or refresh the handoff now.

Use when one or more of these materially increase continuity load:

- several major build/test gates;
- multiple long logs;
- several source patches;
- repeated recovery/fix iterations;
- many uploaded artifacts;
- a major new phase is about to begin;
- the agent increasingly relies on summary rather than primary artifacts.

### RED

Stop opening major new work and switch chats after the handoff is finalized.

Use when:

- the human explicitly requests a handoff or new chat;
- continuity risk is already material;
- a trustworthy platform context meter reaches the configured RED threshold;
- the next phase is large enough that the current chat should not carry it safely;
- evidence or failure history is complex enough that another major cycle would create avoidable reconstruction risk.

## Numeric Thresholds When a Trustworthy Meter Exists

If the active platform exposes a real context-use meter, use these default safety thresholds unless a stricter project rule exists:

- by **50% used**, create or refresh the handoff;
- **60% used** = YELLOW;
- **70% used** = RED;
- do not intentionally drive complex governed work beyond **80% used**.

These thresholds do not claim a universal context-window size. If no trustworthy meter exists, do not estimate a fake percentage. Use the qualitative pressure rules.

## Mandatory Pressure Checkpoints

Assess Context Pressure:

1. after every meaningful milestone closeout;
2. before every new RD or major development phase;
3. after two consecutive large code + execution + failure/recovery cycles;
4. after major file, upload, or diagnostic-log accumulation;
5. when compressed summaries begin carrying load-bearing state;
6. on an explicit handoff, new-chat, transfer, pause, or continuity request.

## Handoff Workflow

### 1. Declare the Boundary

Record:

- current project;
- current phase;
- why the handoff is happening;
- Context Pressure;
- recommended new-chat title.

### 2. Identify Sources of Truth

Use the strongest available current evidence:

- current source;
- accepted manifests;
- protected rollback;
- runtime logs and tests;
- owner acceptance;
- Build Ledger or staged deltas;
- repository state;
- existing handoffs and governance artifacts.

Do not reconstruct exact hashes, versions, or failure states from vague memory when stronger artifacts exist.

### 3. Preserve Protected State

Record:

- protected baseline;
- rollback targets;
- immutable files or trees;
- current install/runtime/data roots where relevant;
- whether upgrade or mutation is authorized.

### 4. Preserve Failure History

For each material failure capture:

- identity;
- FAIL/PARTIAL/BLOCKED classification;
- whether mutation occurred;
- cause;
- superseding correction;
- why the failed evidence must remain.

### 5. Preserve Repository State

Record last-known repository, branch/main SHA, PR, checks, and merge state where relevant.

Explicitly instruct the receiver to refetch current protected state before a future write.

### 6. Preserve Build Ledger State

State:

- last verified canonical identity/head if known;
- staged/noncanonical records;
- whether canonical append is authorized;
- chain-safe ingestion requirements.

Never assign a future sequence number from a stale handoff.

### 7. State the Next Gate

The receiver must know:

- exact next action;
- forbidden changes;
- required verification;
- rollback;
- completion criteria for the next gate.

### 8. Produce the Package

Minimum:

- `WORK-CHAT-HANDOFF.md`;
- `START-HERE-NEW-CHAT.txt`;
- `SHA256SUMS.txt`.

Add a staged ledger delta, protocol update, skill candidate, or transfer ZIP when appropriate.

### 9. Run the Fresh-Agent Test

A handoff passes only if a fresh agent can answer without guessing:

- What are we doing?
- Where are we?
- What is protected?
- What worked?
- What failed?
- What remains uncertain?
- What is canonical versus staged?
- What must not be done?
- What happens next?
- What proof closes the next gate?
- When should the next handoff begin?

## Relationship to Closeout

A chat boundary and a milestone are different.

Use `signalproof-closeout` when meaningful phase state is actually being closed.

Use `signalproof-handoff` whenever conversation continuity itself requires transfer, even when the underlying phase remains open.

Typical sequences include:

- `build/debug -> verify/review -> closeout when applicable -> handoff -> fresh chat`;
- `work in progress -> handoff -> fresh chat -> continue same phase`.

## Public / Private Boundary

Private handoffs may include safe local paths, hashes, version identities, and internal operational state needed for continuity.

Public skill artifacts must not include secrets, credential values, private customer data, raw private transcripts, private memory, or protected evidence not necessary for the public method.

## STOP Conditions

Stop new major work and complete the handoff when:

- Context Pressure is RED;
- the human asks to switch chats;
- exact protected state cannot be recovered confidently;
- a major new phase would begin on top of an already overloaded conversation;
- failure history is becoming ambiguous;
- source-of-truth authority cannot be distinguished from summary;
- the handoff cannot state the exact next authorized action.

## Handoff Status

Return one of:

- **GREEN / CONTINUE**
- **YELLOW / HANDOFF REFRESH REQUIRED**
- **RED / SWITCH CHAT**
- **HANDOFF COMPLETE**
- **BLOCKED**
- **STOP**

## Acceptance Criteria

The skill passes when it:

- detects a handoff boundary before loss;
- does not fabricate remaining-context precision;
- preserves protected state and recovery;
- preserves failures;
- preserves evidence classes;
- preserves repository and Build Ledger boundaries;
- produces a boot prompt and hashes;
- states the exact next gate;
- distinguishes handoff from milestone closeout;
- gives the receiving chat enough information to continue without asking the human to retell captured history.

## Provenance

This Signalproof-native skill is derived from repeated Signalproof work-chat transfer experience and the prior Signalproof Chat-Boundary Handoff Protocol v0.1.

The broader concept of compacting a long agent conversation into a resumable handoff was also studied through Matt Pocock's public `handoff` work under Signalproof's existing upstream-learning and provenance process. Signalproof's implementation adds proactive context-pressure governance, evidence classes, protected-state requirements, failure preservation, Build Ledger continuity, repository continuity, STOP conditions, and phase-authority boundaries.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-handoff`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-document`, `signalproof-closeout`, `signalproof-learn`, `signalproof-verify`, `signalproof-investigate`
- **Domain:** Conversation-boundary continuity, context-pressure control, evidence-preserving project transfer
- **Created by:** Doc Reo / Signalproof