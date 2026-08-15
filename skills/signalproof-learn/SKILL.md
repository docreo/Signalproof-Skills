---
name: signalproof-learn
description: Convert completed evidence-backed work into governed reusable lessons, regression tests, policy candidates, documentation updates, and skill candidates without automatically promoting every observation into doctrine. Use after meaningful work or closeout when deciding what should be remembered, generalized, tested, governed, activated, deprecated, or intentionally left as local context.
---

# Signalproof Learn

## Purpose

`signalproof-learn` is the institutional-learning specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

Its central rule is:

> **Extract reusable capability from proven work, but do not promote an observation into doctrine until its scope, evidence, tests, and authority justify it.**

Learning exists so solved problems do not have to be solved from scratch again, while preventing one anecdote, workaround, environment-specific fix, or successful run from becoming an unjustified universal rule.

## Learning Contract

1. Start from completed evidence-backed work.
2. Identify the actual lesson before generalizing it.
3. Separate local workaround from reusable principle.
4. Test whether the lesson generalizes across product, version, machine, model/provider, vendor, runtime, operator, and toolchain boundaries where relevant.
5. Preserve counter-evidence, failed approaches, and conditions under which the lesson does not hold.
6. Choose the smallest durable output: no action, documentation update, regression test, checklist/gate, policy candidate, skill candidate, router candidate, deprecation candidate, or research question.
7. Prefer a regression test or documentation clarification over a new skill when sufficient.
8. Require a falsifiable acceptance condition for reusable capability.
9. Check existing Active skills, policies, tests, and documentation before creating duplicate doctrine.
10. Protect public/private boundaries when generalizing lessons.
11. Govern all activation through `DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`.
12. Preserve history and supersession; learning may replace a rule, but must not erase why the old rule changed.
13. Feed approved learning into future work only through the correct governed change path.

## Generalizability Classes

- **LOCAL ONLY** — useful context, not reusable doctrine.
- **PATTERN** — likely reusable, but broader evidence/testing is needed.
- **GENERALIZABLE** — principle survives material context changes.
- **UNKNOWN** — evidence is insufficient.

## Learning Outputs

Return the smallest justified durable intervention:

- **NO ACTION**
- **DOCUMENTATION UPDATE**
- **REGRESSION TEST**
- **CHECKLIST / ACCEPTANCE GATE**
- **POLICY CANDIDATE**
- **SKILL CANDIDATE**
- **ROUTER CANDIDATE**
- **DEPRECATION / RETIREMENT CANDIDATE**
- **RESEARCH QUESTION**

Do not create a new skill when a smaller mechanism sufficiently prevents recurrence.

## Workflow

### 1. Select the Source

Identify the milestone/incident, exact product/version/commit/environment where material, problem/decision, accepted result, failures/rejected approaches, human authority, and supporting evidence.

If the source work itself is not sufficiently established, route first to Verify, Review, Document, or Closeout.

### 2. Extract the Lesson

Ask:

- What problem was solved?
- What observation changed the outcome?
- What was initially misunderstood?
- What failed or wasted time?
- What protected state and authority mattered?
- What evidence proved the final result?
- What should the next competent human or agent know before repeating the work?
- What should cause STOP next time?
- What can be generalized without carrying private/product-specific baggage?

### 3. Check Existing Intelligence

Inspect existing Active skills, governance/policies, tests/checklists, documentation, and provenance before creating new doctrine.

If the lesson is already covered, strengthen the test/evidence/documentation rather than duplicate it.

### 4. Define the Candidate

For a reusable candidate record:

- candidate ID/name;
- triggering problem;
- proposed rule/change;
- intended scope and explicit non-scope;
- evidence class/source;
- protected-state and authority implications;
- public/private review;
- expected benefit;
- failure/abuse risk;
- acceptance test;
- reversion/deprecation path where applicable.

### 5. Preserve Negative Learning

Failures are learning assets when they identify misleading symptoms, ineffective repair loops, dangerous shortcuts, false success signals, missing prerequisites, recovery hazards, security/authority boundaries, or missing regression tests.

Do not erase failed approaches because the final approach worked.

### 6. Create STOP Conditions Carefully

A STOP condition is justified when continuing would predictably risk protected state, authority, evidence integrity, security, recovery, or repeated destructive loops.

Do not create broad STOP conditions from preference, inconvenience, or one isolated failure.

### 7. Design Acceptance Tests

A candidate test should include a realistic scenario, protected state, tempting wrong action, required behavior, explicit failure conditions, expected decision/status, and evidence the rule did not overreach.

Tests must challenge the candidate rather than merely restate it.

### 8. Govern the Candidate

```text
DISCOVERED
  ↓
CANDIDATE
  ↓
TESTED
  ↓
APPROVED
  ↓
ACTIVE
  ↓
DEPRECATED / RETIRED
```

Automatic discovery never means automatic activation.

## Learning Decisions

- **NO REUSABLE LESSON**
- **LOCAL LESSON RECORDED**
- **DOCUMENT / TEST UPDATE RECOMMENDED**
- **CANDIDATE CREATED**
- **CANDIDATE TESTED**
- **READY FOR GOVERNANCE REVIEW**
- **DEPRECATION REVIEW REQUIRED**
- **RESEARCH REQUIRED**
- **BLOCKED**
- **STOP**

## Learn vs Closeout

`signalproof-closeout` asks:

> **Is this milestone preserved, reconstructable, and safe to transition from?**

`signalproof-learn` asks:

> **What reusable capability should be extracted from that completed evidence, and what governance path should it follow?**

Closeout always evaluates whether reusable learning exists. Learn performs deeper extraction/governance when the lesson is material enough to justify it.

## Learn vs Research / Evaluate / Document

- Research establishes external evidence.
- Evaluate determines a disposition against explicit criteria.
- Document durably represents established state and decisions.
- Learn transforms completed evidence into governed candidate future capability.

A research finding is not automatically a lesson. A recommendation is not automatically a rule. A document is not automatically doctrine.

## Anti-Overfitting Rule

```text
ONE SUCCESSFUL CASE
      ≠
UNIVERSAL RULE
```

A single case may justify a candidate or regression test; broader doctrine requires evidence and acceptance proportionate to scope.

## Example

Observed defect:

```text
Scan executes
results persist
report contains rows
UI says "No results"
```

Weak lesson: “Fix the scanner when the screen is blank.”

Generalizable lesson:

> **Before repairing a failed-looking operation, determine whether the failure is execution, persistence, reporting, or presentation.**

This generalizes because it separates layers rather than products, prevents unnecessary engine rewrites, creates discriminating tests, and survives different scanners, UIs, frameworks, and vendors.

## Public Learning Boundary

Before publishing a lesson, remove private paths/usernames, credentials/secrets, customer/private data, private chain-of-thought, and proprietary detail not intended for release. Prefer synthetic examples that preserve the principle.

## STOP Conditions

Stop when:

- a lesson is being activated without candidate/testing/approval governance;
- one anecdote is presented as universal doctrine without justification;
- contrary evidence or failed cases are suppressed;
- protected/private workaround details would be published;
- an Active skill is being silently rewritten by a learning note;
- a policy/STOP condition exceeds the evidence scope;
- an acceptance test is fabricated or was not actually run;
- learning is being used to bypass Verify, Review, Security, Release, Closeout, or owner authority;
- canonical Build Ledger history would be fabricated or hand-edited to support the lesson.

## Completion Criteria

Learning is complete when the source evidence boundary, lesson, generalizability classification, existing-intelligence check, smallest durable output, candidate scope/non-scope, protected-state and authority implications, negative learning, acceptance test, governance status, public/private boundary, supersession implications, and next action are explicit enough for another competent human or agent to determine whether the lesson should remain local, become a test/documentation update, advance as a governed candidate, or be rejected.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-learn`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Works with:** all active Signalproof specialist skills, especially `signalproof-closeout`, `signalproof-document`, `signalproof-verify`, `signalproof-review`, and `signalproof-router`
- **Domain:** Institutional learning, lesson extraction, generalization, regression-test creation, policy/skill candidates, STOP-condition extraction, governed capability evolution
- **Created by:** Doc Reo / Signalproof
