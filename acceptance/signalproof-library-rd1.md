# Signalproof Library RD1 Acceptance

**Status:** PASS on implementation head `686f965b606a72d5dde770fb2c769d818de43b79`; final PR head must independently re-pass CI before merge.  
**Owner direction:** build-git until complete  
**Target:** PR #127 / `library-rd1` -> `main`

## Objective

Establish the Signalproof Library architecture, enforce a hard 15,000-byte `SKILL.md` ceiling, decompose every over-limit Skill/Candidate into smaller coherent capabilities, start the Loop Library, and move Router toward compact registry-driven lazy loading without claiming private Build Ledger chronology.

## Acceptance Gates

| Gate | Result | Evidence |
|---|---|---|
| every `skills/**/SKILL.md` < 15,000 exact UTF-8 bytes | PASS | `tools/check_skill_budget.py`; RD1 inventory |
| active registry / README / Skill identities and versions consistent | PASS | `tools/check_suite_consistency.py` |
| compact capability registry covers every Active Skill exactly | PASS | `tools/check_library_consistency.py` |
| every registered loop has file + STOP + Evidence contract | PASS | `tools/check_library_consistency.py` |
| existing fixture regression suite | PASS | GitHub Actions run 204 |
| public branch CI including budget/library checks | PASS | GitHub Actions run 204 on `686f965...` |
| Candidate Knowledge remains non-Active | PASS | Candidate paths + capability registry candidate section |
| Candidate Failure Intelligence remains non-Active | PASS | Candidate path + capability registry candidate section |
| no canonical private Build Ledger mutation claimed | PASS | architecture/provenance boundary |

## Size / Atomicity Result

Before RD1, six Skills/Candidates exceeded 15,000 bytes. RD1 reduced all six below the ceiling by changing responsibility ownership:

- Security: 18,609 -> 5,319 bytes + five narrow security specialists.
- Recovery: 16,332 -> 4,031 bytes + four recovery specialists.
- Router: 16,033 -> 9,120 bytes + compact capability registry.
- Design: 15,476 -> 6,016 bytes + UI Polish + Accessibility.
- Candidate Failure Intelligence: 16,646 -> 5,862 bytes + retry-loop/registry separation.
- Candidate Knowledge: 16,586 -> 6,366 bytes + four Candidate knowledge specialists.

No required governance was intentionally deleted merely to satisfy the ceiling. Universal doctrine remains inherited from the root contract; independently routeable doctrine moved to specialists/loops/registries.

## New Active Specialist Set Proposed by RD1

Security family: Secrets, Permissions, Supply Chain, Network, Execution Security.

Recovery family: Rollback, Restore, Cleanup, Recovery Continuity.

Design family: UI Polish, Accessibility.

The branch records these as Active-target entries because merge to `main` is the promotion event; before merge, branch/PR state remains Candidate under repository governance.

## Loop Library

RD1 creates Candidate protocols for Debug, Build/Verify, Research, Ingest, Recovery, Agent Action, Learn, Optimize, and Retry. Loops do not grant authority. The Agent Action loop explicitly requires the Signalproof Governor/equivalent approval gate for side effects.

## Build Ledger / log-skill integration

`log-skill` V0.2 and Closeout V0.2 add the Skill Architecture Check: exact bytes, budget state, cohesion/decomposition decision, extracted/new Skills, duplicate doctrine, routing impacts, tests, protected behavior, and supersession/recovery as applicable.

Private canonical chronology is **not** asserted here. Canonical append still requires live ledger identity/head/count/chain/SQLite projection verification and deduplication; otherwise a staged/noncanonical record is required.

## Remaining REVIEW-band Skills

Release (14,178), Readiness (13,658), Known Errors (13,413), and Review (12,600) remain below the hard ceiling but require decomposition/conciseness review before material expansion. RD1 does not manufacture unnecessary splits without an independently routeable responsibility.

## Final Merge Gate

Before PR #127 merges:

1. final head CI must complete successfully;
2. no unresolved review thread may introduce a material blocker;
3. PR head must still be the reviewed/tested head at merge time;
4. merge must not be represented as a canonical private Build Ledger append.
