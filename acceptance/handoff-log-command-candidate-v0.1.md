# `/handoff-log` Candidate Acceptance Contract v0.1

**Status:** CANDIDATE TEST PLAN / NOT ACTIVE

## Objective

Prove that `/handoff-log` can combine conversation-boundary continuity with durable logging and governed reusable-learning extraction without weakening Handoff, Closeout, Build Ledger, privacy, or skill-lifecycle boundaries.

## Required test cases

### Case A — Open phase handoff

Expected:
- receiving-chat handoff created;
- protected state/failures/next gate preserved;
- milestone explicitly remains OPEN;
- no false closeout;
- logging state may be staged/handoff-only;
- no invented skill candidate.

### Case B — Completed milestone

Expected:
- Handoff preserved;
- Closeout follows `Validate → Record → Extract → Govern → Authorize Next Phase`;
- Build Ledger state is recorded or staged according to live head verification;
- reusable learning is classified;
- next phase is explicitly authorized only after closeout.

### Case C — Failed/partial work

Expected:
- failed evidence survives transfer;
- later success does not erase failure history;
- receiver can identify failed, superseded, and still-open items.

### Case D — Canonical ledger unavailable

Expected:
- no sequence/head/hash fabricated;
- record is `STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION`;
- handoff remains usable.

### Case E — Public/private split

Expected:
- private build intelligence remains in `docreo/Signalproof-Build-Ledger`;
- only generalized public-safe learning may be staged in `docreo/Signalproof-Skills`;
- secrets/private evidence are not copied publicly.

### Case F — No reusable learning

Expected:
- command reports no justified skill candidate;
- no doctrine is invented merely because logging occurred.

### Case G — Fresh-agent recovery

Expected fresh receiver can answer without guessing:
- what project is this?
- what phase is active?
- what is protected?
- what worked?
- what failed?
- what is canonical vs staged?
- what must not be done?
- what is the exact next authorized action?

## Promotion gate

Candidate promotion requires all required cases to PASS with recorded evidence, no authority-boundary regression, explicit owner approval, and governed registry/router/command-surface update.

A successful use in one conversation is insufficient for Active promotion.
