# Signalproof Operator Command Promotion RD1

**Status:** PUBLIC-SAFE PROMOTION RECORD  
**Date:** 2026-08-19  
**Owner:** Doc Reo

## Owner decision

Doc Reo explicitly directed that the Signalproof operator commands previously marked Candidate be promoted to Active and that newer compatible command updates already present in open repository work be reconciled before promotion.

## Promoted/consolidated command set

- `log-skill` 0.2.0 remains Active;
- `handoff-log` -> Active 0.2.0;
- `design-git` -> Active 0.2.0;
- `build-git` -> Active 0.2.2;
- `build-git this` -> Active 0.1.0;
- `build-git spawn` -> Active 0.1.0;
- `build-git-debug` -> Active 0.1.0;
- `log-build-git` -> Active 0.2.0;
- `log-build-git-debug` -> Active 0.1.0;
- `/authorized-log-build-git` -> Active 0.1.0;
- `signalproof-this-plan` -> Active 0.1.0;
- `signalproof-this-build` -> Active 0.1.0;
- `signalproof-teach` -> Active 0.1.0.

## Reconciled newer work

This promotion did not simply flip status labels. It reconciled the most material compatible command updates found in open repository work before promotion, including:

- `build-git` Known Failure Preflight retrieval from relevant current open/draft Signalproof candidate evidence without treating Candidate material as authority;
- PowerShell prevention for interactive statement boundaries, exact final staged parser checks, hash binding, JSON/dictionary compatibility, heterogeneous property access, native stream handling, console-output separation, path normalization, and same-delimiter here-string hazards;
- exact-final generated repair artifact validation and changed-condition retry discipline;
- Signalproof-controlled generated-output prohibition on Unicode em dash U+2014 except immutable/protected source evidence;
- `handoff-log` V0.2 fresh-chat bootstrap, current-Git doctrine retrieval, private/public continuity handling, exact next-gate freshness, and lean provenance transfer;
- `log-build-git` V0.2 handoff receipt/bootstrap before normal `log-skill -> design-git -> build-git` continuation;
- richer `signalproof-this-plan` composition through Grill + Design + Plan with a `THIS PLAN CONTRACT`;
- richer `signalproof-this-build` composition through approved-plan revalidation + Grill With Docs + Design + Build + verification;
- `build-git-debug` persisted-state inspection, failure-layer separation, exact-final artifact validation, and three-attempt STOP discipline;
- `log-build-git-debug` debug-state continuity and explicit exit to Review/Verify/Security/Closeout when Debug is complete.

## Important evidence boundary

Owner approval establishes the lifecycle authorization to promote these command contracts to Active once repository consistency/CI gates pass. It does not retroactively transform every historical candidate acceptance specification into executed runtime evidence.

Some historical command test scenarios remain useful regression/backlog cases. They must not be described as independently executed merely because the command is now Active.

Active command status means the command contract is approved governing operator doctrine on canonical `main` after merge. Runtime/product acceptance remains scoped to the evidence actually produced by each future invocation.

## Skill Architecture / context decision

These are operator commands, not additional specialist Skills. The promotion keeps them compositional and delegates detailed domain doctrine to existing Active Skills. The new command consistency test enforces file presence, Active status, core authority boundaries, key reconciled safeguards, and a 15,000-byte ceiling for command files in this registry.

The Candidate `signalproof-log-build-git-debug` Skill from prior experimental work is not promoted by this command milestone. Command activation does not automatically activate a separate Skill candidate.

## Recovery / supersession

This promotion is recoverable through ordinary Git history/revert. Earlier Candidate PRs and acceptance/evidence records remain historical provenance. Where their command text conflicts with the newer merged Active command definition, canonical `main` supersedes the older Candidate text without erasing its history.

## Build Ledger boundary

This public-safe `log-skill` promotion record does not claim a canonical private Build Ledger event, current private ledger head, chain hash, SQLite projection, or `C###` number. Any private canonical logging remains subject to live chain-safe verification and separate authorized tooling.
