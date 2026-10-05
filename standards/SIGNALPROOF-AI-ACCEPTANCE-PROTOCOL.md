# Signalproof AI Acceptance Protocol

**Revision:** V1/RD1  
**Status:** Candidate public methodology  
**Purpose:** Define a reusable, evidence-backed process for determining whether an AI model, agent, workflow, connector, MCP-based system, or other AI-enabled system is fit for a bounded intended use.

The **Signalproof AI Acceptance Protocol** is the methodology. A **Worker Acceptance Suite** or other test suite is an implementation of the methodology for a specific system.

## Decision output

Every bounded acceptance engagement ends with one of these dispositions:

- **PASS** — required acceptance evidence supports the defined intended use and no unresolved hard gate remains.
- **CONDITIONAL** — deployment/use may proceed only with explicitly documented limitations, compensating controls, monitoring, or restricted authority.
- **DO NOT DEPLOY** — a hard gate fails, evidence disproves suitability, or unresolved risk exceeds the authorized boundary.
- **UNVERIFIED** — required evidence could not be established. UNVERIFIED is not PASS.

## Protocol

### 1. Define intended use

Record:

- system identity and version;
- deployment/use case;
- users and affected actors;
- environment;
- data classes;
- tools/connectors;
- authority granted to the system;
- human approval points;
- cost/resource limits;
- prohibited actions;
- success criteria;
- rollback/recovery path.

### 2. Map risks and controls

Identify applicable failure surfaces, such as:

- factual/task error;
- false confidence;
- unsafe or unauthorized tool use;
- excessive authority;
- approval bypass;
- data leakage;
- injection;
- route/model substitution;
- context or memory contamination;
- unavailable escalation;
- runaway cost/resource use;
- incomplete audit evidence;
- failure to recover.

### 3. Build the acceptance matrix

Each acceptance case must define:

| Field | Requirement |
|---|---|
| Case ID | Stable identifier |
| Objective | Exact behavior/control being tested |
| Preconditions | Required system/environment state |
| Input | Test stimulus |
| Expected result | Machine- or human-verifiable condition |
| Evidence | Logs, artifact, runtime observation, human observation, hash, etc. |
| Severity | Consequence of failure |
| Hard gate | Yes/No |
| Result | PASS / FAIL / BLOCKED / UNVERIFIED |
| Notes | Limitations, uncertainty, anomaly |

### 4. Execute TEVV activities

Use the appropriate combination of:

- **Test** — execute cases;
- **Evaluation** — judge outcomes against criteria and risk;
- **Verification** — prove exact claims;
- **Validation** — determine fit for intended use.

### 5. Produce the evidence package

The package should contain enough information for an independent competent reviewer to reconstruct the decision without relying on model confidence.

### 6. Make the deployment/use disposition

```text
                 ACCEPTANCE EVIDENCE
                         │
                         ▼
              HARD GATES SATISFIED?
                 /               \
               NO                 YES
               │                   │
               ▼                   ▼
        DO NOT DEPLOY       INTENDED-USE FIT?
                                  /     \
                                NO       YES
                                │         │
                                ▼         ▼
                         CONDITIONAL     PASS
```

A material unknown that prevents the required decision produces **UNVERIFIED**, not an invented midpoint.

## Minimum acceptance domains

Select only those applicable to the intended use:

1. Capability / accuracy
2. False confidence / unsupported output
3. Tool behavior
4. Identity and model/route integrity
5. Authority boundaries
6. Human approval
7. Escalation
8. Data/network exposure
9. Security / injection
10. Context / memory
11. Cost / resource behavior
12. Failure containment
13. Recovery / rollback
14. Audit / evidence
15. Intended-use validation

## Re-test triggers

Re-test when materially relevant:

- model/version changes;
- system prompt/policy changes;
- tool or connector changes;
- authority increases;
- data class changes;
- deployment environment changes;
- meaningful dependency changes;
- new Known Error or incident;
- changed acceptance criteria;
- material NIST/framework revision affecting the mapped claim.

## Standards relationship

This protocol is informed by:

- NIST AI RMF 1.0: GOVERN / MAP / MEASURE / MANAGE;
- NIST AI 600-1 for generative-AI risks;
- NIST AI 200-2 Initial Public Draft / TEVV-Athlon concepts.

It is a Signalproof methodology, not a NIST certification program.
