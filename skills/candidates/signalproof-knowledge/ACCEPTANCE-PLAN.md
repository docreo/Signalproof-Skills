# signalproof-knowledge Candidate Acceptance Plan — RD0.6E

**Status:** CANDIDATE / NOT ACTIVE / PROMOTION PACKAGE PREPARED

## Evidence now available

- Source identity and rights-envelope gates.
- Derived least-privilege policy and multi-generation provenance.
- Persistent provenance registry and integrity-aware review.
- Governed knowledge-package compilation.
- Verified Knowledge Base adapter handoff.
- Isolated candidate-only Knowledge Base import and inspection.
- Governed Skill Candidate compilation from purpose-bound `skill_candidate` packages.
- Final compiler independently re-checks `skill_candidate` authorization and blocks restricted policy that permits only `knowledge_base`.
- Restricted source cannot be compiled into a governed package for `skill_candidate`.
- Knowledge/Learn scope boundary reviewed and resolved against Active `signalproof-learn`.
- Candidate remains non-routable under the current Active-only router contract.
- RD0.6D promotion-readiness gate model and chain-safe Build Ledger ingestion plan completed.
- RD0.6E promotion-execution preflight completed without applying canonical promotion changes.
- Package-level version identity corrected to match `pyproject.toml`: `0.6.0`.
- Read-only local helpers prepared to discover and inventory current raw `ledger.jsonl` + `ledger.sqlite3` pair candidates without claiming chain/projection verification.
- Full RD0.6E suite: **82 PASS / 0 FAIL**.
- Exact packaged-artifact retest: **82 PASS / 0 FAIL**.
- Public-boundary scan: **PASS**.
- Bound RD0.6E artifact SHA-256: `9ef5b932aaf437b26a1fdc7a68b99b9936ebd5b6330b6191a9c71f10a939ff04`.

## Private Build Ledger evidence boundary

Private Build Ledger Git currently preserves a highest verified recovered historical anchor at event **403**, head `e7b445bc5f1c3cc611fcf41764a808eb3c273dbe45995167c69633d9d20671a5`, but its canonical-head record explicitly states that this does **not** prove the current live head. Canonical append remains blocked until the actual current raw JSONL/SQLite pair is recovered and verified.

## Staged Build Ledger linkage

- `stage-skills:knowledge-forge:rd0.6e:signalproof-knowledge:0.1.0-candidate`
- `milestone-closeout:knowledge-forge:rd0.6e`
- `artifact-bind:knowledge-forge:rd0.6e`

Ledger status remains **STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION**.

## Remaining promotion gates

1. Recover the latest raw `ledger.jsonl` and matching `ledger.sqlite3` pair from the owner-controlled environment.
2. Run approved Build Ledger chain + projection verification against that exact pair.
3. Determine the true current event count/head and whether canonical events exist after recovered event 403.
4. Deduplicate and chain-safely ingest only missing staged Knowledge Forge events through approved ledger tooling.
5. Re-run chain/projection verification after ingestion and preserve the resulting canonical-head evidence.
6. Owner explicitly approves the `signalproof-knowledge` name, scope, Active promotion, and merge.
7. Apply the separately authorized canonical skill/`SKILL-REGISTRY.md`/CHANGELOG/router promotion against current `main`.
8. Run repository consistency, routing, public-boundary, and acceptance checks on the exact promotion commit; verify `main` after merge.

## Current decision

**PROMOTION PACKAGE PREPARED — ACTIVE PROMOTION AND CANONICAL EXECUTION REMAIN BLOCKED PENDING VERIFIED CURRENT RAW LEDGER PAIR + OWNER AUTHORITY.**
