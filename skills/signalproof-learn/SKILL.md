---
name: signalproof-learn
description: Convert completed evidence-backed work into governed reusable lessons, regression tests, policy candidates, documentation updates, and skill candidates without automatically promoting every observation into doctrine. Use after meaningful work or closeout when deciding what should be remembered, generalized, tested, governed, activated, deprecated, or intentionally left as local context.
---

# Signalproof Learn

## Purpose

`signalproof-learn` is the institutional-learning specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

Its central rule is:

> **Extract reusable capability from proven work, but do not promote an observation into doctrine until its scope, evidence, tests, and authority justify it.**

Learning exists so solved problems do not have to be solved from scratch again. It also exists to prevent the opposite failure: turning one anecdote, one workaround, one environment-specific fix, or one successful run into a universal rule.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, verification, review, recovery, security, release, documentation, milestone closeout, STOP conditions, public/private boundaries, proof, and continuity.

Learning does not automatically modify an Active skill, root contract, policy, router, Build Ledger, protected baseline, or production system.

## Learning Contract

1. **Start from completed evidence-backed work.** Prefer accepted milestones, verified defects, closed investigations, reviewed releases, research/evaluation outcomes, recovery events, and documented decisions.
2. **Identify the actual lesson before generalizing it.** State what problem was solved, why the solution worked, what failed, and what evidence supports the conclusion.
3. **Separate local workaround from reusable principle.** Environment-specific details may be preserved as context without becoming suite-wide doctrine.
4. **Test generalizability.** Ask whether the lesson survives changes in product, model, vendor, runtime, version, machine, operator, and surrounding architecture.
5. **Preserve counter-evidence and failures.** A lesson that only works under specific conditions must retain those conditions.
6. **Classify the learning output.** Not every lesson needs a new skill. Valid outputs include no action, documentation update, regression test, checklist, policy candidate, skill candidate, router candidate, deprecation candidate, or research question.
7. **Prefer the smallest durable intervention.** A regression test may be better than a new skill; a documentation clarification may be better than a new policy.
8. **Create a falsifiable acceptance condition.** Reusable capability needs a test that can fail, not only an explanation that sounds reasonable.
9. **Protect public/private boundaries.** Generalize the lesson without leaking secrets, private paths, customer data, proprietary internals, or private reasoning.
10. **Govern activation.** Follow `DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`.
11. **Do not silently rewrite history.** New learning may supersede an old rule, but the old rule and the reason for replacement remain traceable.
12. **Feed future work deliberately.** Approved learning should change future routing, testing, documentation, planning, readiness, review, or skill behavior only through the correct governed change path.

## Learning Workflow

### 1. Select the Learning Source

Identify the completed work and its evidence boundary:

- milestone or incident;
- exact product/version/commit/environment;
- problem or decision;
- accepted result;
- failures and rejected approaches;
- human authority/acceptance;
- supporting evidence and provenance.

If the work itself is not sufficiently established, route first to `signalproof-verify`, `signalproof-review`, `signalproof-document`, or `signalproof-closeout` as appropriate.

### 2. Extract Candidate Lessons

Ask:

1. What problem was solved?
2. What observation changed the outcome?
3. What was initially misunderstood?
4. What failed or wasted time?
5. What protected state mattered?
6. What authority mattered?
7. What evidence proved the final result?
8. What would we want the next competent human or agent to know before repeating this work?
9. What should cause STOP next time?
10. What can be generalized without carrying private or product-specific baggage?

### 3. Apply the Generalizability Test

For each candidate lesson test whether it remains meaningful across:

- another product or project;
- another version;
- another machine/environment;
- another model or AI provider;
- another vendor/framework;
- another competent operator;
- a different implementation language/toolchain where the principle should still hold.

Classify:

- **LOCAL ONLY** — useful context but not reusable doctrine;
- **PATTERN** — likely reusable but needs broader evidence/testing;
- **GENERALIZABLE** — principle survives material context changes;
- **UNKNOWN** — more evidence required.

### 4. Determine the Smallest Durable Output

Choose one or more:

- **NO ACTION** — already covered or not worth preserving;
- **DOCUMENTATION UPDATE** — clarity/procedure/state representation;
- **REGRESSION TEST** — prevent recurrence of a specific failure;
- **CHECKLIST / ACCEPTANCE GATE** — recurring bounded verification;
- **POLICY CANDIDATE** — governance/safety/authority rule;
- **SKILL CANDIDATE** — reusable operating discipline;
- **ROUTER CANDIDATE** — recurring objective should dispatch differently;
- **DEPRECATION / RETIREMENT CANDIDATE** — existing guidance is obsolete or harmful;
- **RESEARCH QUESTION** — evidence is too weak to govern yet.

Do not create a new skill when a smaller durable mechanism solves the recurrence risk.

### 5. Define the Candidate Precisely

For a reusable candidate record:

- candidate ID/name;
- triggering problem;
- proposed rule/change;
- intended scope;
- explicit non-scope;
- evidence class/source;
- protected-state implications;
- authority implications;
- public/private review;
- expected benefit;
- failure/abuse risk;
- acceptance test;
- reversion/deprecation path where applicable.

### 6. Preserve Negative Learning

Failures are learning assets when they identify:

- a misleading symptom;
- an ineffective repair loop;
- a dangerous shortcut;
- a false success signal;
- a missing prerequisite;
- a recovery hazard;
- a security or authority boundary;
- a test that should exist.

Do not erase a failed approach merely because the final approach worked.

### 7. Convert Lessons into STOP Conditions Carefully

A STOP condition should be used when continuing would predictably risk protected state, authority, evidence integrity, security, recovery, or repeated destructive loops.

Do not create broad STOP conditions from inconvenience, preference, or one isolated failure.

### 8. Design Acceptance Tests

A learning candidate should have a test that distinguishes correct from incorrect future behavior.

Good acceptance tests contain:

- realistic scenario;
- protected state;
- tempting wrong action;
- required behavior;
- explicit failure conditions;
- expected decision/status;
- evidence that the rule did not overreach.

Tests should challenge the candidate, not merely restate it.

### 9. Check Existing Intelligence First

Before creating a new candidate:

- inspect existing Active skills;
- inspect governance/policies;
- inspect tests/checklists;
- inspect documentation;
- inspect known lessons/provenance.

If the lesson is already covered, update evidence/tests/documentation rather than duplicate doctrine.

### 10. Govern the Candidate

Use:

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

Automatic discovery must never equal automatic activation.

Human/project authority remains required for approval and promotion.

### 11. Learning Decision

Return one of:

- **NO REUSABLE LESSON** — no durable change justified;
- **LOCAL LESSON RECORDED** — useful only in bounded context;
- **DOCUMENT / TEST UPDATE RECOMMENDED** — smaller intervention is sufficient;
- **CANDIDATE CREATED** — reusable rule is defined but not yet tested/approved;
- **CANDIDATE TESTED** — acceptance evidence exists, still awaiting approval/promotion;
- **READY FOR GOVERNANCE REVIEW** — candidate/test/evidence package is ready for owner decision;
- **DEPRECATION REVIEW REQUIRED** — existing active guidance may need replacement;
- **RESEARCH REQUIRED** — evidence insufficient to generalize;
- **BLOCKED** — source evidence or authority is insufficient;
- **STOP** — learning would fabricate evidence, leak protected material, erase contrary history, or bypass skill governance.

## Learn vs Closeout

`signalproof-closeout` asks:

> **Is this milestone preserved, reconstructable, and safe to transition from?**

`signalproof-learn` asks:

> **What reusable capability should be extracted from that completed evidence, and what governance path should it follow?**

Closeout always evaluates whether reusable learning exists. Learn performs the deeper extraction/governance work when the lesson is material enough to justify it.

## Learn vs Research / Evaluate / Document

`signalproof-research` gathers and synthesizes external evidence.

`signalproof-evaluate` decides disposition against explicit criteria.

`signalproof-document` durably represents established state and decisions.

`signalproof-learn` transforms completed evidence into candidate future capability.

A research finding is not automatically a lesson. A recommendation is not automatically a rule. A document is not automatically doctrine.

## Anti-Overfitting Rule

```text
ONE SUCCESSFUL CASE
      ≠
UNIVERSAL RULE
```

A single case may justify a candidate or regression test, but broader doctrine requires evidence and acceptance proportionate to its scope.

## Example Learning Pattern

Observed defect:

```text
Scan executes
results persist
report file contains rows
UI says "No results"
```

Weak lesson:

> “Fix the scanner when the screen is blank.”

Generalizable lesson:

> **Before repairing a failed-looking operation, determine whether the failure is execution, persistence, reporting, or presentation.**

Why it generalizes:

- it separates layers rather than products;
- it prevents unnecessary engine rewrites;
- it creates discriminating tests;
- it survives different scanners, UIs, frameworks, and vendors.

## Public Learning Boundary

Before publishing a lesson:

- remove private paths and usernames;
- remove credentials/secrets;
- remove customer/private data;
- remove private chain-of-thought;
- replace proprietary details with synthetic examples when possible;
- retain only the evidence/provenance needed to support the reusable principle.

## STOP Conditions

Stop when:

- a lesson is being activated without candidate/testing/approval governance;
- one anecdote is being presented as universal doctrine without justification;
- contrary evidence or failed cases are being suppressed;
- a private workaround is being published with protected details;
- an existing Active skill is being silently rewritten by a learning note;
- a policy/STOP condition would exceed the evidence scope;
- an acceptance test is fabricated or never actually run;
- learning is being used to bypass Review, Verify, Security, Release, Closeout, or owner authority;
- canonical Build Ledger history would be fabricated or hand-edited to support the lesson.

## Completion Criteria

Learning is complete when the source milestone, evidence boundary, extracted lesson, generalizability classification, existing-intelligence check, smallest durable output, candidate scope/non-scope, protected-state and authority implications, negative learning, acceptance test, governance status, public/private boundary, supersession implications, and next action are explicit enough that another competent human or agent can determine whether the lesson should remain local, become a test/documentation update, advance as a governed candidate, or be rejected.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-learn`
- **Version:** `0.1.0-rc1`
- **Maturity:** Initial public release candidate
- **Parent:** `signalproof` 0.1.1+
- **Works with:** all active Signalproof specialist skills, especially `signalproof-closeout`, `signalproof-document`, `signalproof-verify`, `signalproof-review`, and `signalproof-router`
- **Domain:** Institutional learning, lesson extraction, generalization, regression-test creation, policy/skill candidates, STOP-condition extraction, governed capability evolution
- **Created by:** Doc Reo / Signalproof
