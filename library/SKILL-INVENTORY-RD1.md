# Signalproof Skill Inventory — RD1

**Source:** repository `main` tree at `f2f89ca4dcc4c3b42e0786178257d53ea00e31ae`  
**Measurement:** exact Git blob byte size for each `SKILL.md`  
**Ceiling:** 15,000 UTF-8 bytes

## Active Skills

| Skill | Bytes | Budget state | RD1 disposition |
|---|---:|---|---|
| signalproof | 8,912 | HEALTHY | preserve root as compact universal contract |
| signalproof-build | 10,864 | WATCH | remove repeated doctrine before growth; identify build-loop extraction |
| signalproof-closeout | 10,097 | WATCH | preserve; consider ledger/extraction helpers if growth continues |
| signalproof-debug | 9,534 | HEALTHY | preserve; extract reusable retry/debug loop rather than enlarge |
| signalproof-design | 15,476 | OVER LIMIT | refactor required; split design core from UI polish/interface mechanics |
| signalproof-document | 10,566 | WATCH | preserve; route format-specific work separately if it grows |
| signalproof-evaluate | 9,858 | HEALTHY | preserve |
| signalproof-handoff | 10,456 | WATCH | preserve; move templates/reference prose out if needed |
| signalproof-investigate | 8,153 | HEALTHY | preserve |
| signalproof-known-errors | 13,413 | REVIEW | separate registry/query contract from domain-specific error knowledge |
| signalproof-learn | 9,557 | HEALTHY | preserve; integrate atomicity/decomposition decision logic |
| signalproof-plan | 8,997 | HEALTHY | preserve |
| signalproof-readiness | 13,658 | REVIEW | split environment/system readiness from specialized readiness domains when independently routeable |
| signalproof-recovery | 16,332 | OVER LIMIT | refactor required; separate recovery coordination from backup/restore/state-cleanup specialties |
| signalproof-release | 14,178 | REVIEW | split packaging/signing/distribution when responsibilities become independently routeable |
| signalproof-research | 8,524 | HEALTHY | preserve; use loops/connectors rather than enlarge |
| signalproof-review | 12,600 | REVIEW | separate code/change review from specialized review domains if necessary |
| signalproof-router | 16,033 | OVER LIMIT | refactor required; convert to compact registry-driven routing kernel |
| signalproof-security | 18,609 | OVER LIMIT | refactor required; decompose into narrow security specialists |
| signalproof-verify | 9,650 | HEALTHY | preserve; extract reusable verification patterns rather than enlarge |

## Candidate Skills

| Candidate | Bytes | Budget state | RD1 disposition |
|---|---:|---|---|
| signalproof-failure-intelligence | 16,646 | OVER LIMIT | must be decomposed before promotion; separate matching/query contract from failure-domain records |
| signalproof-knowledge | 16,586 | OVER LIMIT | must be decomposed before promotion; separate acquisition, normalization/transformation, provenance, retrieval/serving as warranted by acceptance evidence |

## First decomposition wave

### `signalproof-security`

Target architecture:

- `signalproof-security` — compact coordinator/common security decision contract
- `signalproof-secrets` — credentials, tokens, secret storage/redaction/exposure
- `signalproof-permissions` — identity, authorization, privilege, least privilege
- `signalproof-supply-chain` — dependency/source/version/integrity/license/provenance review
- `signalproof-network` — endpoints, ports, transport, telemetry, external data flow
- `signalproof-execution-security` — untrusted input, scripts, plugins, dynamic execution, sandbox boundaries

No child is Active merely because this map exists.

### `signalproof-router`

Target architecture:

- retain `signalproof-router` as compact routing kernel;
- move per-skill routing metadata into a machine-readable capability registry;
- remove repeated full descriptions of specialist doctrine;
- route lazily to one principal Skill plus only necessary specialists/loops.

### `signalproof-recovery`

Target architecture candidates:

- `signalproof-recovery` — coordinator / recovery decision contract
- `signalproof-rollback` — known-good baseline rollback and acceptance
- `signalproof-restore` — backup/data/config restore
- `signalproof-cleanup` — partial actuation/process/service/task cleanup
- `signalproof-continuity` — continuity/reconstructability planning where distinct

Final split requires review of the current Recovery contract and acceptance evidence.

### `signalproof-design`

Target architecture candidates:

- `signalproof-design` — product/interaction/information/state architecture
- `signalproof-ui-polish` — text wrap, spacing, radii, optical alignment, hit targets, motion restraint, high-contrast details
- optional future `signalproof-accessibility` if accessibility becomes broad enough to warrant independent routing and testing

### `signalproof-failure-intelligence`

Target architecture candidates:

- `signalproof-failure-intelligence` — search/match/decision coordinator
- deterministic failure registry/schema outside SKILL prose
- domain records in data/provenance rather than embedded examples
- reusable retry behavior in `SP-LOOP-RETRY`

### `signalproof-knowledge`

Do not promote while over budget. Candidate decomposition should distinguish executable responsibility from explanatory/reference material and preserve its existing RD0.6 acceptance lineage.

## Second-wave review

Review before material growth:

- `signalproof-release`
- `signalproof-readiness`
- `signalproof-known-errors`
- `signalproof-review`

## Non-goal

RD1 does **not** shrink files by deleting required authority, evidence, STOP, recovery, or safety semantics. The objective is to preserve behavior while assigning each responsibility to the smallest correct owner.
