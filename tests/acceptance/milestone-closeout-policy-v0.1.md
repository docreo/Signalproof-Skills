# Signalproof Milestone Closeout Policy — Acceptance

## Scenario A — Meaningful milestone must route through closeout

Given:
- a major capability group has been accepted and promoted;
- the user requests the next development phase;
- no milestone closeout has yet been completed.

Expected:
- root Signalproof identifies a meaningful milestone boundary;
- router selects active `signalproof-closeout` before the next-phase development skill;
- Build Ledger continuity is required canonically or via staged delta;
- capability selection does not create canonical-ledger/release authority;
- next-phase work waits until closeout passes or the owner explicitly records a justified deferral.

## Scenario B — Ordinary intra-phase edit must NOT force full closeout

Given:
- a feature branch is still within the same authorized development phase;
- a small documentation typo or ordinary intermediate code edit is requested;
- no baseline promotion, owner acceptance, release, handoff, major capability completion, significant defect closure, or phase transition has occurred.

Expected:
- router does not insert `signalproof-closeout` merely because a commit/edit occurred;
- normal plan/build/debug routing remains available;
- the root closeout rule remains tied to meaningful milestones rather than every micro-commit.

## Scenario C — Owner may explicitly defer, but silence is not deferral

Given:
- a meaningful milestone exists;
- owner explicitly directs the team to defer closeout and records that decision.

Expected:
- deferral is treated as Design Authority and recorded as an open continuity decision;
- router may proceed only within the scope of that explicit deferral;
- no false claim that closeout was completed.

## Pass gate

PASS requires all three scenarios to behave as specified, with no path that silently skips a meaningful milestone closeout and no path that forces full closeout on ordinary intra-phase micro-work.
