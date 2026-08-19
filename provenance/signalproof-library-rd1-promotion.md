# Signalproof Library RD1 Promotion Provenance

**State:** promotion candidate pending final PR #127 merge gate  
**Branch:** `library-rd1`  
**Base:** `main` at `f2f89ca4dcc4c3b42e0786178257d53ea00e31ae`

## Origin

The owner established a Signalproof architecture constraint that `SKILL.md` files must remain below 15 KB and that growth should be handled through more precise, independently routeable Skills rather than indefinitely expanding major category files. The same architecture also requires efficient token/context use through lazy loading, not loading every related Skill.

## Architecture decision

Adopt **Skill Atomicity and Context Budget**:

- exact UTF-8 measurement;
- 15,000-byte hard ceiling;
- 12,000–14,999 REVIEW band before material expansion;
- decomposition based on responsibility cohesion as well as size;
- compact capability registry;
- one principal Skill plus up to two specialists/loops by default;
- universal doctrine inherited from the root contract;
- loops, registries, schemas, tests, policies, and evidence used when they are better owners than Skill prose.

Core rule: **Grow the library, not the file.**

## Superseded Active architecture on promotion

If PR #127 is merged after final acceptance:

- Router 0.1.13 is superseded by Router 0.2.0 registry-driven kernel.
- Security 0.1.0 is superseded by Security 0.2.0 coordinator plus Secrets, Permissions, Supply Chain, Network, and Execution Security 0.1.0.
- Recovery 0.1.1 is superseded by Recovery 0.2.0 coordinator plus Rollback, Restore, Cleanup, and Recovery Continuity 0.1.0.
- Design 0.1.0 is superseded by Design 0.2.0 plus UI Polish and Accessibility 0.1.0.
- Closeout 0.1.0 is superseded by Closeout 0.2.0 with Skill Architecture Check.
- `log-skill` command 0.1.0 is superseded by 0.2.0 with Skill Architecture Check.

Candidate Failure Intelligence and Knowledge are refactored but remain Candidate / not Active.

## Loop Library origin

RD1 formalizes repeatable iteration already present across Debug, Build, Research, Recovery, Learn, agent governance, ingestion, and optimization as small bounded Loop protocols. Loops do not grant authority; side-effecting Agent Action requires the Signalproof Governor/equivalent authority gate.

## Evidence

- initial over-limit inventory preserved in repository history;
- post-refactor inventory: `library/SKILL-INVENTORY-RD1.md`;
- acceptance: `acceptance/signalproof-library-rd1.md`;
- deterministic budget checker: `tools/check_skill_budget.py`;
- capability/loop consistency checker: `tools/check_library_consistency.py`;
- existing suite consistency checker and fixture regression tests remain in CI;
- implementation head `686f965b606a72d5dde770fb2c769d818de43b79` passed GitHub Actions run 204 before the acceptance/provenance-only commits.

## Private Build Ledger boundary

This public provenance record is not a canonical Build Ledger event and does not reserve a C-number. Private canonical append requires verification of the live ledger identity, event count/head, hash chain, SQLite projection, and stable-ID deduplication through approved tooling. If unavailable, preserve a staged/noncanonical milestone record instead.

## Promotion condition

The proposed Active versions/specialists become canonical public state only when the final PR head re-passes CI and PR #127 is owner-authorized and merged to protected `main`. History remains the rollback/supersession record.
