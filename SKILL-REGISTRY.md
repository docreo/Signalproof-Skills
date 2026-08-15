# Signalproof Skill Registry

This registry identifies public Signalproof skills and their current maturity.

| Skill | Version | Maturity | Role | Status |
|---|---:|---|---|---|
| `signalproof` | 0.1.1 | Active public baseline | Root governing contract plus mandatory meaningful-milestone closeout | Active |
| `signalproof-investigate` | 0.1.0 | Active public baseline | Root-cause investigation and failure localization | Active |
| `signalproof-plan` | 0.1.0 | Active public baseline | Governed planning, scope control, acceptance design, and execution handoff | Active |
| `signalproof-build` | 0.1.0 | Active public baseline | Governed implementation, bounded change, protected execution, and verification | Active |
| `signalproof-debug` | 0.1.0 | Active public baseline | Evidence-led debugging, bounded correction, and regression protection | Active |
| `signalproof-router` | 0.1.5 | Active public baseline | Active-skill selection plus Verify, Review, Recovery, Security, and Closeout routing | Active |
| `signalproof-closeout` | 0.1.0 | Active public baseline | Milestone closeout, Build Ledger continuity, phase-transition governance, and skill extraction | Active |
| `signalproof-verify` | 0.1.0 | Active public baseline | Claim verification, evidence grading, acceptance-gate separation, and non-regression proof | Active |
| `signalproof-review` | 0.1.0 | Active public baseline | Scope fidelity, change integrity, architecture/contract review, maintainability, provenance, privacy/security hazard, and recovery review | Active |
| `signalproof-recovery` | 0.1.0 | Active public baseline | Rollback selection, restore integrity, user-data protection, staged recovery, mixed-version prevention, and recovery verification | Active |
| `signalproof-security` | 0.1.0 | Active public baseline | Defensive security governance, trust boundaries, secrets, least privilege, dependency provenance, unsafe execution, network/data exposure, integrity evidence, and security STOP conditions | Active |

## Planned Specialist Lanes

- `signalproof-research`
- `signalproof-evaluate`
- `signalproof-readiness`
- `signalproof-release`
- `signalproof-document`
- `signalproof-learn`

Planned entries must not be represented as implemented or approved until their `SKILL.md`, tests, governance review, and acceptance state exist.

## Registry Rules

1. `main` is the canonical public state.
2. A branch or pull request represents candidate state only.
3. Active entries should identify version, maturity, role, and status.
4. Deprecated or retired skills remain traceable in version history.
5. Specialist skills inherit the root Signalproof contract.
