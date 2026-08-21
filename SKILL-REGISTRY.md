# Signalproof Skill Registry

This registry identifies public Signalproof skills and their current maturity. `main` is canonical public state; branch/PR entries are candidate state until merged through governance.

| Skill | Version | Maturity | Role | Status |
|---|---:|---|---|---|
| `signalproof` | 0.1.1 | Active public baseline | Root governing contract and meaningful-milestone continuity | Active |
| `signalproof-router` | 0.2.3 | Active public baseline | Registry-driven minimal-context routing kernel | Active |
| `signalproof-known-errors` | 0.1.0 | Active public baseline | Repeatable-error lookup and prevention preflight | Active |
| `signalproof-research` | 0.1.0 | Active public baseline | External evidence and source-grounded research | Active |
| `signalproof-evaluate` | 0.1.0 | Active public baseline | Evidence-to-disposition evaluation | Active |
| `signalproof-investigate` | 0.1.0 | Active public baseline | Root-cause investigation and state localization | Active |
| `signalproof-plan` | 0.1.0 | Active public baseline | Bounded execution planning and acceptance design | Active |
| `signalproof-grill` | 0.1.0 | Active public baseline | Decision hardening and ambiguity reduction through evidence-aware frontier interviewing | Active |
| `signalproof-grill-with-docs` | 0.1.0 | Active public baseline | Decision hardening with governed glossary and ADR capture | Active |
| `signalproof-teach` | 0.1.0 | Active public baseline | Mission-grounded source-backed teaching and durable skill development | Active |
| `signalproof-cut-chase` | 0.1.0 | Active public baseline | Salience compression, decision-load reduction, and action extraction without cutting evidence or authority | Active |
| `signalproof-design` | 0.2.0 | Active public baseline | Product information architecture and state communication | Active |
| `signalproof-ui-polish` | 0.1.0 | Active public baseline | UI readability, wrapping, responsive finish and micro-interactions | Active |
| `signalproof-accessibility` | 0.1.0 | Active public baseline | Accessible interaction and presentation | Active |
| `signalproof-readiness` | 0.1.0 | Active public baseline | Target-environment prerequisites and capability readiness | Active |
| `signalproof-build` | 0.1.1 | Active public baseline | Bounded implementation and protected execution | Active |
| `signalproof-debug` | 0.1.1 | Active public baseline | Evidence-led defect correction and regression protection | Active |
| `signalproof-full-debug` | 0.1.0 | Active public baseline | High-governance debug coordinator combining bounded authorization, persistent failure memory, debug continuity, spawn role separation, verification, and STOP controls | Active |
| `signalproof-build-spawn-debug` | 0.1.0 | Active public baseline | Build-to-user-acceptance coordinator with spawn challenge, debug convergence, governed learning, automated PASS, and human UI gate | Active |
| `signalproof-verify` | 0.1.0 | Active public baseline | Claim verification and evidence grading | Active |
| `signalproof-review` | 0.1.0 | Active public baseline | Scope fidelity and change-integrity review | Active |
| `signalproof-recovery` | 0.2.0 | Active public baseline | Cross-cutting recovery coordinator | Active |
| `signalproof-rollback` | 0.1.0 | Active public baseline | Rollback target selection and identity verification | Active |
| `signalproof-restore` | 0.1.0 | Active public baseline | Bounded restoration execution and verification | Active |
| `signalproof-cleanup` | 0.1.0 | Active public baseline | Partial-operation ownership and cleanup | Active |
| `signalproof-recovery-continuity` | 0.1.0 | Active public baseline | Recovery journals, ownership state and remaining options | Active |
| `signalproof-security` | 0.2.0 | Active public baseline | Cross-cutting defensive security coordinator | Active |
| `signalproof-secrets` | 0.1.0 | Active public baseline | Credentials, tokens, keys and secret exposure | Active |
| `signalproof-permissions` | 0.1.0 | Active public baseline | Identity, authorization, privilege and least privilege | Active |
| `signalproof-supply-chain` | 0.1.0 | Active public baseline | Dependency provenance, licensing, integrity and update trust | Active |
| `signalproof-network` | 0.1.0 | Active public baseline | Network exposure, transport and external data flow | Active |
| `signalproof-execution-security` | 0.1.0 | Active public baseline | Untrusted input and execution boundaries | Active |
| `signalproof-release` | 0.1.0 | Active public baseline | Exact-artifact promotion and distribution governance | Active |
| `signalproof-document` | 0.1.0 | Active public baseline | Durable evidence-bound documentation | Active |
| `signalproof-learn` | 0.1.0 | Active public baseline | Governed institutional learning and candidate extraction | Active |
| `signalproof-handoff` | 0.1.0 | Active public baseline | Conversation-boundary continuity | Active |
| `signalproof-closeout` | 0.2.0 | Active public baseline | Milestone closeout, Build Ledger continuity, and Skill/library architecture governance | Active |

## Planned Specialist Lanes

No untested specialist names are declared as planned Active capability here. Future additions must follow the governed lifecycle before they enter the Active table.

## Registry Rules

1. `main` is canonical public state; a branch or pull request is candidate state only.
2. Active entries identify version, maturity, role, and status.
3. Every Active specialist inherits the root Signalproof contract.
4. `signalproof-known-errors` remains a mandatory preflight for consequential or materially failure-prone work.
5. The Router selects the minimum applicable Active capability set and must not create authority.
6. Active `SKILL.md` files must remain below 15,000 exact UTF-8 bytes. Files at 12,000–14,999 bytes require decomposition/conciseness review before material expansion.
7. New or decomposed skills follow `DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`.
8. Deprecated or retired capability remains traceable through history/provenance.
9. External skill collections are inspiration/evidence only until selectively adapted and promoted through Signalproof governance; upstream runtime invocation is not implied by provenance.
10. The public `Signalproof-Skills` registry is the `/dsp` Skill Library authority after governed promotion; private Build Ledger mirrors are continuity evidence, not public capability authority.
