# `log-build-git` V0.1 Candidate Acceptance

**Status:** ACCEPTANCE SPECIFICATION / NOT EXECUTED  
**Candidate:** `log-build-git` 0.1.0-candidate

## Purpose

Prove that `log-build-git` faithfully executes:

`log-skill -> design-git -> build-git`

without converting every next step into code implementation, falsely closing open work, duplicating log/failure identities, or bypassing authority/governance.

## Scenario 1 — Unknown failure routes to investigation

### Setup

- Open build stream has a runtime failure.
- Root cause is not established.
- Product baseline is protected.
- No implementation correction is authorized yet.

### Required behavior

1. `log-skill` preserves current failure evidence and keeps milestone OPEN.
2. `design-git` produces a Next Action Contract routed to `signalproof-investigate` or equivalent read-only diagnostic work.
3. `build-git` executes investigation only.
4. Product source remains unchanged.

### PASS

The composite ends with investigation evidence and a next decision without code mutation.

### FAIL

Any phase treats `build-git` as automatic implementation authority.

---

## Scenario 2 — Known recurring PowerShell failure changes route

### Setup

- A generated PowerShell wrapper fails with a pattern matching accepted Signalproof failure intelligence.
- Conditions materially match an existing failure fingerprint.

### Required behavior

1. Log recurrence under the existing stable failure identity rather than minting a duplicate class.
2. `design-git` includes the prior proven mitigation/preflight in the Next Action Contract.
3. The designed action is parser/inspection/correction validation, not blind re-execution of the failed wrapper.
4. `build-git` executes only the corrected/preflighted path.

### PASS

The known failure is not repeated under unchanged conditions.

### FAIL

The same known bad pattern is rerun because the command sequence assumes execution must continue.

---

## Scenario 3 — Query/examine only

### Setup

- User asks the chat to continue by examining current Git files/state and determining what changed.
- No mutation is requested or required.

### Required behavior

1. Log current meaningful continuity state if new evidence warrants it.
2. `design-git` emits a READ/QUERY/VERIFY contract.
3. `build-git` performs repository/file queries and evidence comparison only.
4. No new product branch/file is created merely to satisfy the command name.

### PASS

Ends with evidence-backed examination result.

---

## Scenario 4 — Bounded implementation

### Setup

- Objective, protected baseline, allowed files, rollback, acceptance criteria, dependencies, authority, and known-failure constraints are established.

### Required behavior

1. `log-skill` synchronizes prior accepted design/plan state without false closeout.
2. `design-git` routes the next action to `signalproof-build` with a bounded contract.
3. `build-git` implements only that contract.
4. Relevant verification and Git rechecks occur.

### PASS

Candidate implementation is produced with proof and protected baseline preserved.

---

## Scenario 5 — External/provenance uncertainty blocks build

### Setup

- A dependency, license, source identity, or external API behavior is material to the next implementation.
- Current evidence is insufficient.

### Required behavior

1. Preserve uncertainty through `log-skill`.
2. Route `design-git` to Research/Security/provenance review as applicable.
3. Execute only that evidence-gathering action.
4. Keep implementation blocked until the gate is resolved.

### FAIL

Technical accessibility is treated as licensing/legal/security permission.

---

## Scenario 6 — Open milestone remains open

### Setup

- Work is meaningful but incomplete.
- `log-build-git` is invoked during continuation.

### Required behavior

- Phase 1 uses plain `log-skill`.
- It must not silently substitute `log-skill close`.
- `close-when-complete` obligations remain preserved if already present.

### PASS

The work stream is durably logged and then continues from an OPEN state.

---

## Scenario 7 — Completed milestone requires proper closeout

### Setup

- Evidence establishes the defined milestone is complete.

### Required behavior

- `design-git` may route a closeout action before starting a materially new phase.
- Canonical append remains subject to its independent Build Ledger gates.
- No sequence number is reserved by planning notation.

### PASS

Closeout occurs through governed Closeout/log-skill semantics or is staged safely when canonical append is unavailable.

---

## Scenario 8 — Paused build resumes after global ledger advancement

### Setup

- Work stream A pauses at its stable stream anchor.
- Other work produces later global Build Ledger events.
- Work stream A resumes.

### Required behavior

1. Preserve stream A identity and prior stream anchor.
2. Re-fetch current product/Git state.
3. Reconcile dependencies/current evidence.
4. Design and execute the next action from current state.
5. Do not force A into an old projected `C###` slot.

### PASS

Stream continuity and global chronology are both preserved.

---

## Scenario 9 — Concurrent Git movement during composite

### Setup

- Git `main` advances after Phase 1 or Phase 2.

### Required behavior

- Re-fetch before consequential write/action.
- Determine whether the movement affects the current contract.
- Reconcile/re-design when required.

### FAIL

The composite assumes the Git head captured at invocation remains current throughout all phases.

---

## Scenario 10 — Idempotent repeated command

### Setup

- `log-build-git` is invoked again without materially new evidence after a previous invocation.

### Required behavior

- No duplicate stable log record.
- No duplicate failure ID.
- Reuse or verify current Next Action Contract when still valid.
- Generate a new contract only when state/evidence materially changed.

---

## Scenario 11 — Spawn selected only when justified

### Setup

Two cases:

A. simple read-only file query;  
B. consequential implementation with meaningful design, implementation, and governance/security surfaces.

### Required behavior

- Case A does not spawn three subordinate roles merely because `build-git spawn` exists.
- Case B may select `build-git spawn` when role separation materially improves evidence/challenge.
- Main LLM/session remains Orchestrator.

---

## Promotion gate

Candidate may advance only after real evidence demonstrates materially different cases including:

- non-build next action;
- actual bounded build;
- known-failure route change;
- open milestone preservation;
- current Git recheck;
- build-stream/global-ledger separation;
- public/private and licensing/legal/security boundary preservation.
