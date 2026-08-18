# Acceptance Scenarios — `log-skill` Command Contract V0.1

**Status:** CANDIDATE TEST PLAN / NOT ACTIVE

## Scenario 1 — Plain `log-skill` stages without reserving chronology

Given:

- a meaningful milestone has reusable learning;
- public/private records do not yet exist;
- canonical Build Ledger append is not authorized.

When:

`log-skill`

Then:

- public-safe candidate/documentation evidence may be staged;
- private staged/noncanonical evidence may be staged;
- no canonical sequence is assigned or reserved;
- no skill becomes Active;
- status is `STAGED / NONCANONICAL` or `CANDIDATE CREATED`.

**FAIL** if a future C-number is assigned as though canonical.

## Scenario 2 — Repeated `log-skill` is idempotent

Given:

- the same stable milestone/candidate identity is already logged;
- no materially new evidence exists.

When:

`log-skill`

Then:

- existing public/private state is verified;
- no duplicate record is created;
- status is `ALREADY LOGGED / NO DUPLICATE CREATED`.

**FAIL** if duplicate stable identities are created.

## Scenario 3 — `log-skill close` with verified canonical authority

Given:

- the milestone is actually complete;
- acceptance gates pass;
- canonical ledger identity/head/chain/projection verify;
- deduplication passes;
- owner authority permits canonical closeout.

When:

`log-skill close`

Then:

- full closeout runs;
- the ledger assigns the next sequence at append time;
- native/original verification passes after append;
- no sequence was reserved beforehand.

**FAIL** if the requested close bypasses verification or hand-edits canonical state.

## Scenario 4 — `log-skill close` when canonical append is unavailable

Given:

- the milestone is complete;
- canonical head cannot be verified or canonical authority is absent.

When:

`log-skill close`

Then:

- the milestone may be closed as staged evidence;
- status is `CLOSEOUT COMPLETE / STAGED PENDING INGESTION`;
- no canonical sequence/hash is fabricated.

**FAIL** if a fake C-number/hash is assigned.

## Scenario 5 — `log-skill close-when-complete`

Given:

- a milestone is still open;
- explicit acceptance criteria are known.

When:

`log-skill close-when-complete`

Then:

- the milestone remains open;
- closeout-required state and acceptance criteria are preserved;
- no background task is implied;
- no canonical sequence is reserved;
- status is `OPEN / CLOSEOUT REQUIRED WHEN ACCEPTANCE PASSES`.

When the operator later declares/establishes completion, the route becomes `log-skill close`.

**FAIL** if the command marks the milestone complete immediately.

## Scenario 6 — Numbered close succeeds only on exact predecessor

Given:

- operator requests `log-skill close C500`;
- verified canonical current sequence is C499;
- all other closeout/authority/dedup gates pass.

Then:

- conditional append may proceed;
- post-append verification must prove the result is C500.

**FAIL** if C500 is treated as reserved before append.

## Scenario 7 — Numbered close stops when chronology moved

Given:

- operator requests `log-skill close C500`;
- verified canonical current sequence is C500 or greater, or any event already occupies C500.

Then:

- status is `STOP`;
- no overwrite occurs;
- no silent renumbering to C501 occurs;
- operator must explicitly choose a new close strategy if desired.

## Scenario 8 — Preview/projection is not canonical

Given:

- a validated preview labels proposed events `C405-C415`;
- actual canonical head later advances independently.

Then:

- preview evidence remains historical evidence;
- the old projected C-numbers are not treated as reserved;
- any future ingestion preview is regenerated from the new verified head.

**FAIL** if the implementation forces events into stale projected numbers.

## Scenario 9 — Public/private boundary

Given:

- private ledger identity, head hashes, local paths, or recovery evidence exist;
- a public candidate record is being created.

Then:

- public output uses only public-safe abstractions/evidence;
- private details remain private unless explicitly authorized for publication.

**FAIL** if private recovery/ledger internals leak into public Git.

## Scenario 10 — No new specialist skill required

Given:

- Closeout + Learn + Router can express the command behavior after a tested contract update.

Then:

- do not create a new Active `signalproof-log-skill` specialist solely for syntax convenience.

**PASS TARGET:** the command contract is implemented through the smallest governed change surface.
