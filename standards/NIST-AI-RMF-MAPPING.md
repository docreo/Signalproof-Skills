# Signalproof × NIST AI RMF Mapping

**Revision:** V1/RD1  
**Reference:** NIST AI RMF 1.0 (NIST AI 100-1)  
**Status note:** NIST states AI RMF 1.0 is being revised as of 2026.

NIST organizes the AI RMF Core around four functions: **GOVERN, MAP, MEASURE, MANAGE**. GOVERN is cross-cutting and informs the other functions; the functions are not a mandatory linear checklist.

Signalproof maps its existing human-control and evidence architecture to those functions as follows.

| NIST AI RMF function | Signalproof implementation concepts | Typical public evidence |
|---|---|---|
| **GOVERN** | Human authority; identity and permissions; policy; approvals; protected state; security boundaries; cost/economic authority; evidence classes; change control; release authority; recovery requirements | Root Skill contract, governance policy, permissions/security Skills, command authority rules, PR/release controls |
| **MAP** | Objective; intended use; context; environment; capabilities; model/agent route; dependencies; data/network boundaries; failure surface; known errors; affected actors; protected state | Research/readiness artifacts, design records, State Capsule, public boundary documentation, model/route documentation |
| **MEASURE** | Test execution; evaluation; benchmark comparison; exact-claim verification; acceptance criteria; non-regression checks; uncertainty; runtime evidence; security testing; cost/latency/resource metrics where applicable | Acceptance records, automated tests, verification reports, evidence manifests, benchmark results |
| **MANAGE** | Risk disposition; human approval/deny; readiness gate; routing; conditional deployment; monitoring; incident response; escalation; rollback/recovery; retirement | Release/Deploy/Recovery Skills, incident response, acceptance disposition, rollback evidence, post-deploy verification |

## Signalproof operating relationship

```text
NIST AI RMF
GOVERN ── MAP ── MEASURE ── MANAGE
   │        │         │          │
   └────────┴─────────┴──────────┘
                 │
                 ▼
        SIGNALPROOF FRAMEWORK
  authority + context + evidence + control
                 │
                 ▼
          ACCEPTANCE DECISION
 PASS / CONDITIONAL / DO NOT DEPLOY
```

## Important interpretation rules

- **GOVERN is continuous.** Signalproof treats authority, security, evidence integrity, and human approval as cross-cutting controls rather than a one-time first step.
- **MAP precedes meaningful measurement.** A benchmark without intended-use context is not sufficient for deployment judgment.
- **MEASURE is broader than one score.** Signalproof separates compilation, static analysis, unit tests, runtime tests, human observation, security evidence, and release evidence.
- **MANAGE consumes evidence; it does not manufacture it.** A deployment decision must remain bounded by the evidence and authority actually available.
- **UNKNOWN is not PASS.** Missing evidence remains missing evidence.
- **A map is not certification.** This crosswalk expresses conceptual and operational alignment only.

## Direct Signalproof public anchors

Relevant public Skills include:

- `signalproof`
- `signalproof-research`
- `signalproof-evaluate`
- `signalproof-readiness`
- `signalproof-build`
- `signalproof-verify`
- `signalproof-review`
- `signalproof-security`
- `signalproof-permissions`
- `signalproof-release`
- `signalproof-recovery`
- `signalproof-closeout`

## Source

- NIST AI RMF: https://www.nist.gov/itl/ai-risk-management-framework
- NIST AI RMF Core / AIRC: https://airc.nist.gov/airmf-resources/airmf/5-sec-core/
