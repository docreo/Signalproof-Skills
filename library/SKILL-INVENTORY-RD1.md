# Signalproof Skill Inventory — RD1

**Baseline before refactor:** `main` at `f2f89ca4dcc4c3b42e0786178257d53ea00e31ae`  
**RD1 measurement source:** `library-rd1` tree after atomic decomposition  
**Measurement:** exact Git blob / UTF-8 byte size of each `SKILL.md`  
**Hard ceiling:** 15,000 bytes

## Result

**PASS — every Active and Candidate `SKILL.md` in RD1 is below 15,000 bytes.**

The six previously over-limit files were reduced by decomposition rather than by deleting required governance:

| Skill / Candidate | Before | RD1 | Result |
|---|---:|---:|---|
| signalproof-security | 18,609 | 5,319 | coordinator + 5 narrow security specialists |
| signalproof-recovery | 16,332 | 4,031 | coordinator + rollback/restore/cleanup/continuity specialists |
| signalproof-router | 16,033 | 9,120 | registry-driven routing kernel |
| signalproof-design | 15,476 | 6,016 | design core + UI polish + accessibility |
| signalproof-failure-intelligence (Candidate) | 16,646 | 5,862 | compact recurrence coordinator + retry loop / registry model |
| signalproof-knowledge (Candidate) | 16,586 | 6,366 | coordinator + 4 Candidate knowledge specialists |

## Active Skill Budget Inventory

| Skill | Bytes | State |
|---|---:|---|
| signalproof | 8,912 | HEALTHY |
| signalproof-router | 9,120 | HEALTHY |
| signalproof-known-errors | 13,413 | REVIEW |
| signalproof-research | 8,524 | HEALTHY |
| signalproof-evaluate | 9,858 | HEALTHY |
| signalproof-investigate | 8,153 | HEALTHY |
| signalproof-plan | 8,997 | HEALTHY |
| signalproof-design | 6,016 | HEALTHY |
| signalproof-ui-polish | 3,102 | HEALTHY |
| signalproof-accessibility | 3,071 | HEALTHY |
| signalproof-readiness | 13,658 | REVIEW |
| signalproof-build | 10,864 | WATCH |
| signalproof-debug | 9,534 | HEALTHY |
| signalproof-verify | 9,650 | HEALTHY |
| signalproof-review | 12,600 | REVIEW |
| signalproof-recovery | 4,031 | HEALTHY |
| signalproof-rollback | 2,708 | HEALTHY |
| signalproof-restore | 2,739 | HEALTHY |
| signalproof-cleanup | 2,375 | HEALTHY |
| signalproof-recovery-continuity | 2,650 | HEALTHY |
| signalproof-security | 5,319 | HEALTHY |
| signalproof-secrets | 3,267 | HEALTHY |
| signalproof-permissions | 2,596 | HEALTHY |
| signalproof-supply-chain | 2,562 | HEALTHY |
| signalproof-network | 2,363 | HEALTHY |
| signalproof-execution-security | 2,791 | HEALTHY |
| signalproof-release | 14,178 | REVIEW |
| signalproof-document | 10,566 | WATCH |
| signalproof-learn | 9,557 | HEALTHY |
| signalproof-handoff | 10,456 | WATCH |
| signalproof-closeout | 6,309 | HEALTHY |

## Candidate Skill Budget Inventory

| Candidate | Bytes | State |
|---|---:|---|
| signalproof-failure-intelligence | 5,862 | HEALTHY / Candidate |
| signalproof-knowledge | 6,366 | HEALTHY / Candidate |
| signalproof-knowledge-ingest | 2,276 | HEALTHY / Candidate |
| signalproof-knowledge-provenance | 2,389 | HEALTHY / Candidate |
| signalproof-knowledge-transform | 2,119 | HEALTHY / Candidate |
| signalproof-knowledge-package | 2,679 | HEALTHY / Candidate |

## RD1 Specialist Families

### Security

`signalproof-security` coordinates only cross-cutting decisions. Independently routeable work is assigned to Secrets, Permissions, Supply Chain, Network, and Execution Security.

### Recovery

`signalproof-recovery` coordinates multi-part recovery. Rollback selection, restore execution, owned-resource cleanup, and recovery continuity are separately routeable.

### Design

`signalproof-design` owns product information/state architecture. UI Polish owns wrapping/readability/responsive finish. Accessibility owns accessible interaction/presentation.

### Knowledge — Candidate family

Knowledge remains Candidate. Ingest, Provenance, Transform, and Package are separate Candidate responsibilities. Their existence does not activate Knowledge or authorize source transformation/output.

### Failure Intelligence — Candidate

Failure Intelligence now owns recurrence matching/decision logic. Detailed failure instances belong in a registry/evidence layer and retry mechanics live in `SP-LOOP-RETRY` rather than growing the Skill.

## Remaining REVIEW Skills

The following are below the hard limit but must receive decomposition/conciseness review before material expansion:

- signalproof-release — 14,178
- signalproof-readiness — 13,658
- signalproof-known-errors — 13,413
- signalproof-review — 12,600

RD1 does not force an unnecessary split merely because a file is in REVIEW. The next material expansion must decide whether the capability remains cohesive or should be decomposed first.

## CI Enforcement

`.github/workflows/suite-consistency.yml` runs `tools/check_skill_budget.py`. A pull request or push fails if any `skills/**/SKILL.md` is invalid UTF-8 or reaches/exceeds 15,000 bytes.

## Non-goal

The budget must not be met by deleting authority, evidence, STOP, recovery, security, or lifecycle semantics. The objective is smaller context through better ownership boundaries.
