# `/handoff-log` V0.2 + `/log-build-git` V0.2 Handoff Bootstrap Acceptance

**Status:** ACCEPTANCE SPECIFICATION / NOT EXECUTED  
**Candidates:** `/handoff-log` 0.2.0-candidate, `/log-build-git` 0.2.0-candidate

## Purpose

Prove that a governed Signalproof handoff can move from one chat/session to another with minimal prose while preserving provenance, governance, protected state, current Git doctrine, private/public continuity, and an exact next action.

The receiving chat must not require the human to retell captured history and must not rely on stale command definitions from the source chat.

## Scenario 1 — Fresh chat boot from handoff

### Setup

- Source chat creates a valid `WORK-CHAT-HANDOFF.md` through `/handoff-log`.
- Handoff includes a transfer ID/hash and Exact Next Gate.
- Receiving chat starts with no reliable conversational memory.

### Required behavior

1. Receiver reads the handoff.
2. First command is `/log-build-git`.
3. Receiver refetches `docreo/Signalproof-Skills/main`.
4. Receiver reads current `/log-build-git`, `/design-git`, `/build-git`, `/handoff-log`, Router, and only needed Active specialist definitions.
5. Receiver records the handoff receipt before continuing.
6. Receiver revalidates the transferred Next Gate from current evidence.
7. Human is not asked to restate information already recoverable from the packet/Git.

### PASS

The fresh chat can explain current mission, authority, protected state, provenance, next gate, and why that gate remains valid or changed.

### FAIL

Receiver proceeds from memory/summary without current Git doctrine or asks the human to retell recoverable history.

---

## Scenario 2 — Private Build Ledger available

### Setup

- Receiving environment has access to `docreo/Signalproof-Build-Ledger`.
- Handoff identifies the work stream and relevant private continuity categories.

### Required behavior

1. Refetch private `main`.
2. Retrieve only task-relevant private handoff/continuity/evidence/failure/protected-state/ledger records.
3. Preserve evidence/lifecycle classification.
4. Do not preload unrelated private history.
5. Record private continuity as AVAILABLE in the handoff receipt.

### PASS

Private evidence materially improves continuity without leaking it publicly or converting it into authority.

---

## Scenario 3 — Private Build Ledger unavailable

### Setup

- Receiver cannot access the private Build Ledger.
- Public Signalproof-Skills and handoff remain available.

### Required behavior

1. Mark private continuity `UNAVAILABLE`.
2. Use current public Git + public-safe handoff evidence.
3. Do not infer private hashes, protected baselines, ledger heads, or internal decisions.
4. If the next mutation requires missing private truth, route to read-only verification/investigation or STOP.

### PASS

Receiver proceeds safely without pretending private continuity exists.

---

## Scenario 4 — Git doctrine changed after handoff creation

### Setup

- Handoff records a source-time public Git SHA.
- `Signalproof-Skills/main` advances before receipt.

### Required behavior

1. Refetch current `main`.
2. Compare source snapshot to receiving-time state.
3. Read the newer relevant command/skill definitions.
4. Record material drift in the handoff receipt.
5. Redesign/revalidate the Next Gate if the newer doctrine materially affects it.

### FAIL

Receiver blindly executes the source-chat plan because the handoff contained an older command description.

---

## Scenario 5 — Handoff is mission index, not doctrine dump

### Setup

- Source chat has a long technical history and many current Git-controlled skill/command definitions.

### Required behavior

- `WORK-CHAT-HANDOFF.md` contains mission-critical state, exact retrieval paths, authority, protected state, material failures, Build Ledger boundary, and next gate.
- It does not duplicate entire current command/skill bodies that can be fetched from GitHub.

### PASS

Handoff is substantially shorter than the source conversation while still allowing reliable recovery.

---

## Scenario 6 — Provenance receipt

### Required behavior

The receiving `/log-build-git` record preserves where available:

- handoff ID;
- handoff SHA/hash;
- source work/build stream;
- source Git snapshot;
- receiving Git snapshot;
- private continuity availability;
- records retrieved;
- material drift;
- protected state;
- authority;
- known failure constraints;
- fresh Next Action Contract;
- result/status.

### PASS

A later session can reconstruct source chat -> handoff -> receiving chat -> continuation without relying on hidden conversational memory.

---

## Scenario 7 — Open milestone remains open

### Setup

- Source chat hands off work in progress.

### Required behavior

- `/handoff-log` preserves OPEN state.
- receiving `/log-build-git` uses plain `/log-skill` receipt/synchronization.
- no closeout is inferred from changing chats.

### PASS

Work continues in the same stream/phase unless current evidence independently establishes a closeout gate.

---

## Scenario 8 — Known failure survives chat boundary

### Setup

- Source handoff references a known failure or unsafe retry pattern relevant to the Exact Next Gate.

### Required behavior

1. Receiver reads relevant current failure intelligence/evidence.
2. Known Failure Preflight occurs before execution.
3. Fresh chat does not blindly repeat the previously failed path.

### PASS

The failure constraint materially influences route/mitigation as appropriate.

---

## Scenario 9 — Candidate lifecycle is preserved

### Setup

- Handoff references a command or skill Candidate that is present in `main`.

### Required behavior

- Receiver reads it when mission-relevant.
- Receiver does not treat Git presence as Active lifecycle status.
- Active Router/current lifecycle state remains governing authority unless explicit candidate testing/owner authorization applies.

### FAIL

Handoff instruction silently activates a Candidate.

---

## Scenario 10 — Repeated receipt is idempotent

### Setup

- Same handoff artifact is supplied again to the same or later receiving session.

### Required behavior

- Match by handoff ID/hash.
- Reuse/supersede prior receipt rather than minting a duplicate exchange identity.
- Update only material Git/evidence drift.

### PASS

No duplicate receipt or duplicate failure/log identity is created.

---

## Scenario 11 — Private/public boundary

### Required behavior

- Private Build Ledger detail stays private.
- Public Git receives only public-safe generalized doctrine/evidence when separately authorized.
- Handoff may point to private retrieval locations without publishing private payloads.

### FAIL

A public handoff or public PR exposes private ledger/recovery/security evidence merely to make the handoff self-contained.

---

## Scenario 12 — Exact next gate cannot be revalidated

### Setup

- Receiving-time evidence contradicts or cannot establish the transferred next gate.

### Required behavior

- Receipt status becomes `RECONCILIATION_REQUIRED` or `BLOCKED`.
- `/design-git` routes first to Investigate/Verify/Research or STOP.
- `/build-git` does not force implementation.

### PASS

The handoff preserves continuity without becoming stale authority.

## Promotion gate

Do not promote `/handoff-log` V0.2 or `/log-build-git` V0.2 until real cross-chat evidence demonstrates:

1. one seamless private-access transfer;
2. one public-fallback transfer with no guessing;
3. one Git-drift transfer;
4. one known-failure continuity case;
5. one non-build next action;
6. one bounded build continuation;
7. receipt idempotency;
8. open-milestone preservation;
9. Candidate lifecycle preservation;
10. materially reduced handoff prose without loss of provenance/governance truth.
