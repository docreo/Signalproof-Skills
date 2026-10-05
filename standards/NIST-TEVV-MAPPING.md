# Signalproof × NIST TEVV Mapping

**Revision:** V1/RD1  
**Reference:** NIST AI 200-2 Initial Public Draft, TEVV-Athlon Framework  
**Draft status:** Initial Public Draft announced August 7, 2026; comments open through October 6, 2026.

NIST describes TEVV as **Test, Evaluation, Verification, and Validation** and presents TEVV-Athlon as a structured, adaptable approach for evaluating AI systems, including LLMs, multimodal systems, and agentic systems.

Signalproof already separates several of these responsibilities. This document makes those distinctions explicit.

## Working definitions in Signalproof

| TEVV element | Signalproof interpretation | Example |
|---|---|---|
| **Test** | Execute a defined procedure against a model, agent, tool chain, workflow, or control and capture the observed result. | Run 40 bounded jobs, injection cases, tool-call cases, recovery cases, latency/cost tests |
| **Evaluation** | Interpret evidence against explicit criteria, constraints, risks, intended use, and uncertainty. | Compare outcomes against acceptance thresholds and hard gates |
| **Verification** | Determine whether a specific requirement or claim is supported by the required evidence for the exact artifact/environment. | Verify “no silent fallback,” “human approval is required,” or “route digest matches selected model” |
| **Validation** | Determine whether the system is fit for its stated real-world purpose and deployment context. | Decide whether an agent is suitable for a customer-support deployment with the declared authority and data boundaries |

## Relationship to Signalproof

```text
MODEL / AGENT / AI SYSTEM
          │
          ▼
       TEST
          │
          ▼
      EVALUATE
          │
          ▼
       VERIFY
          │
          ▼
      VALIDATE
          │
          ▼
   EVIDENCE PACKAGE
          │
          ▼
PASS / CONDITIONAL / DO NOT DEPLOY
```

This diagram is a Signalproof operational simplification. It does not imply that NIST TEVV must always occur as one strict sequential pipeline.

## Signalproof AI Acceptance Protocol coverage

A system acceptance engagement may test and evaluate:

- accuracy and task completion;
- false confidence / unsupported claims;
- model or route identity;
- tool-use correctness;
- authority boundaries;
- escalation behavior;
- approval gates;
- prompt/instruction injection resistance where applicable;
- data exposure and network behavior;
- context/memory handling;
- failure containment;
- recovery and rollback behavior;
- cost/resource behavior;
- audit/evidence completeness;
- intended-use fit.

Not every category applies to every system. The acceptance plan must define scope before testing.

## Evidence rule

A TEVV label must not be used as decoration. Each claim should preserve:

- exact system/artifact identity;
- test/evaluation objective;
- method;
- environment;
- evidence source/class;
- result;
- limitations/uncertainty;
- disposition;
- reviewer/approval state when relevant.

## Draft-framework caution

Because NIST AI 200-2 is an Initial Public Draft, Signalproof should:

1. identify the cited draft version/date;
2. revalidate mappings when NIST publishes revisions;
3. avoid presenting draft text as final NIST policy;
4. preserve Signalproof's own evidence and authority model independently of future terminology changes.

## Source

NIST TEVV-Athlon: https://www.nist.gov/artificial-intelligence/ai-research/tevv-athlon-framework-evaluating-ai-systems
