# `possible` - Active Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`possible` is the canonical Dr. Signalproof command behind `/dsp possible`.

It performs an evidence-aware feasibility and failure-mode review of a proposed product, system, business model, architecture, workflow, feature, policy, integration, or plan before expensive implementation.

Canonical route:

`/dsp possible -> possible -> evidence preflight -> feasibility classification -> constraints/failure modes -> bounded recommendation`

Accepted forms include:

```text
/dsp possible
dsp possible
/dsp-possible
dsp-possible
possible
```

## Operator meaning

When invoked against the current idea/build/plan, `/dsp possible` means:

> Determine what can work, what is likely to work, what could work under stated conditions, what should not be done, what will probably not work, and what will not work under the current constraints. Establish the material assumptions and evidence, identify failure modes and hidden dependencies, and return the smallest defensible build/no-build/modify-first recommendation. Do not turn optimism, pessimism, novelty, or prior investment into evidence.

## Required classification

Every material subsystem or claim must receive the strongest supported classification:

- `CAN WORK` - technically/economically/operationally feasible under presently supportable conditions.
- `WILL LIKELY WORK` - evidence supports a high-probability path if stated prerequisites are satisfied.
- `COULD WORK` - plausible, but dependent on unresolved assumptions, design choices, scale, market behavior, law/policy, or evidence.
- `SHOULDN'T` - feasible in some sense but materially inferior, unsafe, legally/commercially problematic, misleading, unnecessarily expensive, or strategically unsound.
- `PROBABLY WON'T` - no impossibility proof, but current evidence makes success unlikely without material redesign or changed conditions.
- `WILL NOT WORK` - blocked by a demonstrated technical impossibility, incompatible requirement, binding legal/policy constraint, missing indispensable capability, or other hard contradiction in the stated design.
- `UNKNOWN / NOT YET PROVEN` - evidence is insufficient to place the item honestly into another class.

`WILL NOT WORK` must never be used merely to mean difficult, expensive, unconventional, or low-confidence.

## Required behavior

1. **Resolve the target.** Identify the exact idea/build/plan, intended user outcome, scale, geography/jurisdiction when material, and success definition.
2. **Current evidence preflight.** Reuse still-valid evidence. Check current Git/known-errors for repository-backed work. Use current external research only for material facts that can change or are not established.
3. **Decompose the system.** Separate product mechanics, technical architecture, economics, user behavior/adoption, operations, security/privacy, legal/regulatory/compliance, payments/tax/labor treatment, abuse/fraud, dependencies, scale, and recovery where applicable.
4. **Expose assumptions.** Mark each material assumption as PROVEN, SUPPORTED, PLAUSIBLE, CONTESTED, or UNKNOWN.
5. **Classify each material element** using the required classification above, with concise evidence/reasoning and confidence.
6. **Run failure-mode review.** Identify how the system fails even if its core idea is valid: incentive attacks, fraud, adverse selection, cost inversion, regulatory reclassification, dependency failure, market mismatch, quality collapse, moderation burden, security abuse, and scale effects where applicable.
7. **Separate prototype from production.** A feature may be prototype-feasible while production-infeasible under the same architecture.
8. **Separate labels from substance.** Calling labor a quest, money a token, gambling a game mechanic, or a financial instrument a credit does not determine its legal/economic treatment.
9. **Quantify where useful.** Use unit economics, rates, thresholds, capacity, break-even ranges, sensitivity bands, or scenario estimates when they materially affect feasibility. State assumptions explicitly.
10. **Return a decision.** End with one of: `BUILDABLE NOW`, `BUILDABLE WITH GUARDRAILS`, `PROTOTYPE ONLY`, `REDESIGN FIRST`, `DO NOT BUILD AS SPECIFIED`, or `BLOCKED / MORE EVIDENCE REQUIRED`.
11. **Identify the smallest next experiment.** When uncertainty is empirical, specify the cheapest bounded test that could move the decision.
12. Do not implement the reviewed system unless separately authorized by a build command.

## Output contract

```text
DSP POSSIBLE
Target: <idea/build/plan>
Success definition: <what must be true>
Evidence basis: <current Git/sources/tests/assumptions>

CLASSIFICATION
<element> - CAN WORK | WILL LIKELY WORK | COULD WORK | SHOULDN'T | PROBABLY WON'T | WILL NOT WORK | UNKNOWN / NOT YET PROVEN
Why: <concise basis>
Confidence: HIGH | MEDIUM | LOW
Required conditions: <if any>

FAILURE MODES
- <failure> -> <impact> -> <mitigation/test>

UNIT ECONOMICS / SCALE
<only when material>

DECISION
BUILDABLE NOW | BUILDABLE WITH GUARDRAILS | PROTOTYPE ONLY | REDESIGN FIRST | DO NOT BUILD AS SPECIFIED | BLOCKED / MORE EVIDENCE REQUIRED

Smallest next experiment: <bounded proof>
Hard stops: <conditions that invalidate the path>
```

## Relationship to other DSP commands

- Use `/dsp research` when the primary need is evidence gathering rather than feasibility judgment.
- Use `/dsp this-plan` when the decision is already sufficiently feasible and the primary need is an execution-ready plan.
- Use `/dsp design` when architecture/design is the primary unresolved problem.
- Use `/dsp complete` only after a bounded build objective exists; `possible` does not grant implementation authority.
- `/dsp possible` may invoke minimum necessary Research, Grill, Evaluate, Security, Design, or domain specialists to resolve material feasibility questions, but it remains a review command.

## Evidence discipline

Distinguish:

- observed fact;
- source-backed fact;
- calculation;
- inference;
- scenario assumption;
- owner preference;
- UNKNOWN.

Current law, regulation, platform policy, pricing, model/provider capability, market conditions, and security advisories must be checked when they materially affect the conclusion.

## Authority boundary

`possible` is analysis/review authority only. It does not authorize implementation, deployment, purchases, payments, employment classification, legal conclusions, credential use, destructive actions, publication, Candidate Skill activation, or canonical Build Ledger mutation.

## STOP conditions

STOP or classify `UNKNOWN / NOT YET PROVEN` when the target is materially undefined; required evidence is inaccessible; jurisdiction or operating model is indispensable but unknown; the conclusion would require fabricating legal/financial/technical certainty; source evidence materially conflicts without resolution; or a hard dependency cannot be tested or established.

## Signalproof principle

> **Ask whether it can survive reality before spending resources proving that it can be built.**
