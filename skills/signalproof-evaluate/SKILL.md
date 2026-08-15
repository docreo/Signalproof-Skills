---
name: signalproof-evaluate
description: Evaluate researched options against explicit decision criteria, constraints, strategic fit, technical fit, licensing, cost, security, readiness burden, reversibility, integration effort, provenance, uncertainty, and alternatives. Use when deciding what should be adopted, rejected, deferred, tested, isolated, or investigated further after evidence has been gathered. Evaluation recommends disposition; it does not silently authorize implementation, purchase, installation, release, or destructive change.
---

# Signalproof Evaluate

## Purpose

`signalproof-evaluate` is the evidence-to-decision specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

Its central rule is:

> **Evaluate against explicit criteria, constraints, and reversible decision paths—and preserve uncertainty instead of hiding it inside a score.**

Research establishes what the evidence supports. Evaluate determines what that evidence means for a specific decision.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, smallest effective action, verification, review, readiness, recovery, security, release, milestone closeout, STOP conditions, public/private boundaries, proof, and continuity.

Evaluation does not automatically authorize adoption, purchase, installation, execution, integration, migration, security exceptions, release, deployment, or canonical Build Ledger mutation.

## Evaluation Contract

1. **Define the decision before scoring options.** State what decision must be made and what outcomes are possible.
2. **Use explicit criteria.** Strategic fit, technical fit, licensing, cost, security, readiness burden, reversibility, integration effort, supportability, provenance, performance, privacy, or other criteria must be visible.
3. **Separate hard gates from weighted preferences.** A licensing prohibition, security blocker, unsupported platform, or missing authority cannot be averaged away by popularity or performance.
4. **Bind every judgment to evidence.** Distinguish direct facts, researched claims, target-environment evidence, assumptions, inference, and owner/design authority.
5. **Preserve uncertainty.** Unknowns stay unknown. Missing evidence should not receive an invented neutral score.
6. **Compare alternatives consistently.** Apply the same criteria and evidence bar across candidates unless a documented reason requires different treatment.
7. **Evaluate the status quo and build-from-scratch option when materially relevant.** Adoption is not the only possible disposition.
8. **Include reversibility and exit cost.** Prefer decisions that preserve recovery and optionality when benefits are otherwise similar.
9. **Include readiness burden.** A technically attractive option may still be poor if it requires fragile dependencies, unsupported hardware, excessive privilege, or major environment changes.
10. **Include security/provenance/licensing boundaries.** Do not postpone known blockers merely because the feature fit is strong.
11. **Avoid precision theater.** Weighted scores are decision aids, not evidence. Small numeric differences must not imply certainty the evidence does not support.
12. **Return a disposition, rationale, confidence, unresolved gates, and next smallest action.**
13. **Do not self-execute the decision.** Hand off implementation to Plan/Build, validation to Readiness/Verify, security to Security, rollback to Recovery, or release to Release.

## Evaluation Workflow

### 1. Define the Decision

Capture:

- decision question;
- candidates/options;
- current/status-quo option;
- build-from-scratch option when relevant;
- intended users/environment;
- non-negotiable constraints;
- decision authority;
- acceptable dispositions.

Possible dispositions include:

- **ADOPT**
- **ADAPT**
- **INTEGRATE**
- **PILOT / TEST IN ISOLATION**
- **DEFER**
- **RESEARCH MORE**
- **REJECT**
- **BUILD FROM SCRATCH**
- **REPLACE LATER / WATCHLIST**

### 2. Establish the Evidence Package

Identify the evidence basis for each option:

- Research findings and freshness;
- official documentation/repository identity;
- license and dependency evidence;
- architecture/runtime requirements;
- Windows/target-platform support;
- target-machine readiness evidence when available;
- security/provenance findings;
- cost/pricing evidence when relevant;
- maintenance/community/project health evidence;
- benchmark/performance evidence;
- reversibility/migration evidence;
- owner/project design authority.

If the evidence package is materially incomplete, Evaluate may return **RESEARCH MORE** rather than manufacture a decision.

### 3. Define Hard Gates

Hard gates are requirements that cannot be compensated for by another metric.

Examples:

- incompatible or prohibited license;
- unsupported required operating system;
- unresolvable security blocker;
- missing mandatory offline/local operation;
- required external data transfer prohibited by policy;
- dependency/runtime conflict with protected state;
- no acceptable recovery/exit path for a consequential integration;
- cost outside an explicit maximum;
- required authority unavailable.

A candidate that fails a hard gate should normally be REJECT, DEFER, or RESEARCH MORE until the gate changes.

### 4. Define Weighted Criteria

Only after hard gates are explicit may weighted criteria be used.

Possible criteria:

- strategic fit;
- capability coverage;
- technical architecture fit;
- Windows/local-first fit;
- integration complexity;
- runtime/dependency burden;
- maintainability;
- ecosystem maturity;
- performance/resource efficiency;
- extensibility;
- provenance/transparency;
- privacy/local-data fit;
- security posture;
- licensing fit;
- direct/ongoing cost;
- migration/exit cost;
- reversibility;
- testability;
- observability;
- recovery fit;
- long-term replacement risk.

Weights should reflect the declared decision, not generic preferences.

### 5. Score Carefully

If scoring is useful, use an explicit scale such as:

- **5 — strong fit / directly supported**
- **4 — good fit / minor caveat**
- **3 — acceptable / material tradeoff**
- **2 — weak fit / significant concern**
- **1 — poor fit / major disadvantage**
- **0 — fails criterion or hard blocker when applicable**
- **UNKNOWN — insufficient evidence**

Do not convert UNKNOWN to 0, 3, or another invented value merely to calculate a total.

### 6. Separate Evidence from Judgment

For every material criterion record:

- evidence;
- evidence class/source;
- judgment;
- confidence;
- unresolved question;
- whether it is a hard gate.

Example:

```text
Windows support
Evidence: official project documentation lists Linux/macOS; Windows path is community-supported only.
Evidence class: Artifact-backed external research.
Judgment: weak fit for Windows-first core runtime.
Confidence: medium-high.
Gate: potentially yes, depending on isolation strategy.
```

### 7. Evaluate Reversibility

Ask:

- Can it be tested in quarantine/staging?
- Can it be removed cleanly?
- Does it alter protected runtime state?
- Does it create proprietary lock-in?
- Is data export portable?
- Can the current working path remain available?
- Does the option introduce an irreversible schema/data migration?
- Can it be replaced later without rewriting the product?

Reversibility is often strategically valuable even when not the top feature metric.

### 8. Evaluate Readiness Burden

A candidate may look strong in Research but impose substantial readiness work.

Consider:

- runtime/version conflicts;
- GPU/provider requirements;
- model assets/storage;
- build toolchains;
- administrator privileges;
- background services;
- external APIs/credentials;
- internet dependence;
- packaging/installer complexity;
- target-machine support;
- logging/observability requirements;
- rollback preparation.

Use `signalproof-readiness` for target-specific proof when needed.

### 9. Evaluate Security / Provenance / Licensing

If material, include:

- canonical source and maintainer identity;
- dependency chain;
- installation/execution behavior;
- privileges;
- network/data flow;
- license and redistribution constraints;
- security advisories/findings;
- signature/hash/release provenance;
- update-channel trust.

Use `signalproof-security` for security-specific decisions and do not overstate Evaluation as a security audit.

### 10. Compare Options

Produce a comparison that makes tradeoffs visible.

Do not hide a hard-gate failure behind a high average score.

A useful output may include:

- candidate;
- disposition;
- hard-gate status;
- strongest advantages;
- strongest disadvantages;
- readiness burden;
- security/licensing/provenance notes;
- reversibility;
- confidence;
- unresolved evidence.

### 11. Make the Disposition

Return one of:

- **ADOPT** — evidence supports moving toward implementation within stated boundaries.
- **ADAPT** — useful foundation, but bounded modification is required.
- **INTEGRATE** — retain as a distinct component/service rather than absorb/rewrite it.
- **PILOT / ISOLATE** — promising but needs sandboxed/runtime validation before commitment.
- **DEFER** — not currently worth the burden or blockers; reconsider when a named condition changes.
- **RESEARCH MORE** — decision-critical evidence is missing or contradictory.
- **REJECT** — fails hard gates or is inferior to available alternatives for this decision.
- **BUILD FROM SCRATCH** — external candidates do not meet governing requirements and the capability is valuable enough to justify internal implementation.
- **WATCHLIST** — not actionable now but worth monitoring.

### 12. Declare Decision Confidence

Use:

- **HIGH** — decisive evidence for the material gates/criteria;
- **MEDIUM** — decision is reasonable but one or more material uncertainties remain;
- **LOW** — provisional recommendation; substantial evidence remains missing.

Do not use a high numeric score as a substitute for high confidence.

### 13. Handoff

Possible next routes:

- missing external evidence -> `signalproof-research`;
- target compatibility/prerequisites -> `signalproof-readiness`;
- security-sensitive blocker -> `signalproof-security`;
- adoption path design -> `signalproof-plan`;
- bounded implementation -> `signalproof-build`;
- exact claim proof -> `signalproof-verify`;
- recovery/rollback design -> `signalproof-recovery`;
- release decision -> `signalproof-release`.

Evaluation itself does not perform those actions.

## Research vs Evaluate

`signalproof-research` asks:

> **What does the available evidence support?**

`signalproof-evaluate` asks:

> **Given that evidence, our explicit criteria, and our constraints, what disposition best serves this decision?**

Research should not secretly choose the winner. Evaluate should not invent missing research.

## Scores Are Not Authority

A weighted score may summarize a comparison, but:

- weights are design choices;
- scores contain judgment;
- UNKNOWN is not neutral;
- hard gates remain separate;
- small score differences may be meaningless;
- owner authority still controls adoption/execution.

Therefore:

```text
HIGHEST SCORE
    ≠
AUTOMATIC ADOPTION
```

## Evaluation Is Not Execution Authority

An ADOPT/ADAPT/INTEGRATE disposition does not automatically authorize:

- cloning/downloading;
- installation;
- package/runtime modification;
- privilege elevation;
- credential/API use;
- purchase/spend;
- migration;
- security exceptions;
- release/deployment;
- canonical Build Ledger mutation.

## STOP Conditions

Stop when:

- the decision criteria are materially undefined or contradictory;
- a candidate's identity/version is ambiguous;
- decisive evidence is missing and would change the disposition;
- hard-gate evidence is being ignored because another metric scores highly;
- incompatible options are being scored as though they are equivalent;
- security/licensing/provenance blockers are being averaged away;
- scores are being fabricated for unknown evidence;
- evaluation scope is being expanded into unauthorized execution or purchase;
- a requested disposition would bypass an active Security/Recovery/authority STOP condition.

## Anti-Patterns

Fail this skill when Evaluate:

- recommends a tool because it is popular;
- picks the highest benchmark without considering target environment or integration burden;
- averages a failed license/security hard gate into a favorable score;
- treats UNKNOWN as an arbitrary middle score;
- changes weights after seeing the winner without documenting why;
- evaluates only new candidates and ignores the status quo/build-from-scratch option when relevant;
- confuses research claims with target-machine validation;
- hides reversibility/lock-in costs;
- converts recommendation into installation/adoption without authority;
- presents a recommendation as objective fact rather than evidence-backed judgment.

## Completion Criteria

Evaluation is complete when the decision, options, evidence package, hard gates, weighted criteria, assumptions, uncertainties, target/readiness implications, security/provenance/licensing boundaries, reversibility, comparison, disposition, confidence, unresolved gates, authority limitations, and next smallest action are explicit enough that another competent human or agent can reconstruct why the recommendation was made and what would cause it to change.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-evaluate`
- **Version:** `0.1.0-rc1`
- **Maturity:** Initial public release candidate
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-research`, `signalproof-readiness`, `signalproof-plan`, `signalproof-build`, `signalproof-verify`, `signalproof-review`, `signalproof-security`, `signalproof-recovery`, `signalproof-release`, `signalproof-closeout`
- **Domain:** Evidence-to-decision evaluation, technology disposition, explicit criteria, hard gates, weighted tradeoffs, reversibility, strategic/technical fit, licensing/security/readiness implications
- **Created by:** Doc Reo / Signalproof
