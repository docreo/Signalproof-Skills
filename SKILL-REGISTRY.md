# Signalproof Skill Registry

This registry identifies public Signalproof skills and their current maturity.

| Skill | Version | Maturity | Role | Status |
|---|---:|---|---|---|
| `signalproof` | 0.1.1-rc1 | Governance update candidate | Root governing contract plus mandatory meaningful-milestone closeout | Candidate |
| `signalproof-investigate` | 0.1.0 | Active public baseline | Root-cause investigation and failure localization | Active |
| `signalproof-plan` | 0.1.0 | Active public baseline | Governed planning, scope control, acceptance design, and execution handoff | Active |
| `signalproof-build` | 0.1.0 | Active public baseline | Governed implementation, bounded change, protected execution, and verification | Active |
| `signalproof-debug` | 0.1.0 | Active public baseline | Evidence-led debugging, bounded correction, and regression protection | Active |
| `signalproof-router` | 0.1.1-rc1 | Governance update candidate | Active-skill selection plus meaningful-milestone closeout routing | Candidate |
| `signalproof-closeout` | 0.1.0 | Active public baseline | Milestone closeout, Build Ledger continuity, phase-transition governance, and skill extraction | Active |

## Planned Specialist Lanes

The following are planned lanes, not active skills yet:

- `signalproof-review`
- `signalproof-research`
- `signalproof-evaluate`
- `signalproof-verify`
- `signalproof-security`
- `signalproof-readiness`
- `signalproof-recovery`
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
