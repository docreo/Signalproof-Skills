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

1. Define the decision before scoring options.
2. Use explicit decision criteria and visible constraints.
3. Separate hard gates from weighted preferences; a licensing, security, platform, authority, or policy blocker cannot be averaged away.
4. Bind material judgments to evidence and preserve evidence class/source.
5. Preserve uncertainty; UNKNOWN is not an invented neutral score.
6. Compare candidates consistently and include status quo/build-from-scratch when materially relevant.
7. Evaluate reversibility, exit cost, readiness burden, integration effort, security, provenance, licensing, and long-term replacement risk.
8. Avoid precision theater: weighted scores are aids, not evidence or authority.
9. Return a disposition, rationale, confidence, unresolved gates, and smallest next action.
10. Do not self-execute the decision; hand off to the appropriate active specialist.

## Workflow

### 1. Define the Decision

Capture the decision question, candidates, status quo, build-from-scratch option when relevant, intended users/environment, non-negotiable constraints, decision authority, and acceptable dispositions.

Valid dispositions include:

- **ADOPT**
- **ADAPT**
- **INTEGRATE**
- **PILOT / ISOLATE**
- **DEFER**
- **RESEARCH MORE**
- **REJECT**
- **BUILD FROM SCRATCH**
- **WATCHLIST**

### 2. Establish the Evidence Package

Use the strongest available Research, official documentation/repository identity, license/dependency evidence, architecture/runtime requirements, target-platform support, readiness evidence, security/provenance findings, cost evidence, maintenance/project-health evidence, benchmarks, reversibility/migration evidence, and owner/design authority.

If decision-critical evidence is missing, return **RESEARCH MORE** rather than manufacture certainty.

### 3. Define Hard Gates

Hard gates cannot be compensated for by another score. Examples include prohibited/incompatible license, unsupported required platform, unresolved security blocker, prohibited external data transfer, dependency/runtime conflict with protected state, unacceptable recovery/exit path, explicit cost ceiling, or unavailable required authority.

A hard-gate failure normally produces REJECT, DEFER, or RESEARCH MORE until the governing condition changes.

### 4. Define Weighted Criteria

Only after hard gates are explicit, evaluate relevant preferences such as strategic fit, capability coverage, architecture fit, Windows/local-first fit, integration complexity, runtime burden, maintainability, ecosystem maturity, performance, extensibility, privacy, security posture, licensing fit, cost, migration/exit cost, reversibility, testability, observability, recovery fit, and replacement risk.

Weights must reflect the declared decision rather than generic preferences.

### 5. Score Carefully

When useful, use an explicit scale such as 5 strong fit, 4 good fit, 3 acceptable tradeoff, 2 weak fit, 1 poor fit, 0 failed criterion, and **UNKNOWN** for insufficient evidence.

Do not convert UNKNOWN to a fabricated numeric value merely to create a total.

### 6. Separate Evidence from Judgment

For each material criterion preserve evidence, evidence class/source, judgment, confidence, unresolved questions, and hard-gate status.

Research claims and target-machine readiness are different evidence layers.

### 7. Evaluate Reversibility

Ask whether the candidate can be tested in isolation, removed cleanly, preserve the working path, avoid irreversible schema/data migration, export data portably, limit lock-in, and remain replaceable later.

### 8. Evaluate Readiness Burden

Consider runtime/version conflicts, GPU/provider requirements, model assets, build toolchains, privileges, services, external APIs/credentials, internet dependence, installer complexity, target-machine support, observability, and rollback preparation.

Use `signalproof-readiness` for target-specific proof.

### 9. Evaluate Security / Provenance / Licensing

Include canonical source/maintainer identity, dependency chain, install/execution behavior, privileges, network/data flow, license/redistribution terms, security findings, integrity/provenance, and update-channel trust when material.

Use `signalproof-security` for the defined security assessment rather than overstating Evaluate as a security audit.

### 10. Compare and Disposition

Make tradeoffs visible. Do not hide a hard-gate failure behind an average score. Return the disposition, strongest advantages/disadvantages, readiness burden, security/licensing/provenance notes, reversibility, confidence, unresolved evidence, and next action.

### 11. Confidence

Use **HIGH**, **MEDIUM**, or **LOW** based on the quality and completeness of decision-critical evidence. A high numeric score does not automatically mean high confidence.

### 12. Handoff

- missing external evidence -> `signalproof-research`
- target prerequisites/compatibility -> `signalproof-readiness`
- security-sensitive blocker -> `signalproof-security`
- adoption path design -> `signalproof-plan`
- bounded implementation -> `signalproof-build`
- exact claim proof -> `signalproof-verify`
- recovery/rollback -> `signalproof-recovery`
- release decision -> `signalproof-release`

Evaluation itself does not perform those actions.

## Research vs Evaluate

`signalproof-research` asks: **What does the available evidence support?**

`signalproof-evaluate` asks: **Given that evidence, our explicit criteria, and our constraints, what disposition best serves this decision?**

Research should not secretly choose the winner. Evaluate should not invent missing research.

## Scores Are Not Authority

Weights are design choices, scores contain judgment, UNKNOWN is not neutral, hard gates remain separate, and small numeric differences may not be meaningful.

```text
HIGHEST SCORE
    ≠
AUTOMATIC ADOPTION
```

## Evaluation Is Not Execution Authority

An ADOPT/ADAPT/INTEGRATE disposition does not authorize cloning/downloading, installation, runtime modification, elevation, credentials/API use, spending, migration, security exceptions, deployment/release, or canonical Build Ledger mutation.

## STOP Conditions

Stop when criteria are materially undefined/contradictory; candidate identity is ambiguous; decisive evidence is missing; hard-gate evidence is being ignored because another metric scores highly; incompatible options are scored as equivalent; security/licensing/provenance blockers are averaged away; scores are fabricated for unknown evidence; evaluation expands into unauthorized execution/purchase; or a disposition would bypass Security/Recovery/authority STOP conditions.

## Anti-Patterns

Fail this skill when it recommends a tool because it is popular; picks a benchmark winner without target/integration context; averages failed license/security gates into a favorable score; treats UNKNOWN as a middle score; changes weights after seeing the winner without explanation; ignores status quo/build-from-scratch when relevant; confuses Research with target Readiness; hides lock-in/reversibility costs; executes adoption without authority; or presents recommendation as objective fact rather than evidence-backed judgment.

## Completion Criteria

Evaluation is complete when the decision, options, evidence package, hard gates, criteria, assumptions, uncertainties, readiness/security/provenance/licensing implications, reversibility, comparison, disposition, confidence, unresolved gates, authority limits, and next smallest action are explicit enough that another competent human or agent can reconstruct why the recommendation was made and what would change it.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-evaluate`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-research`, `signalproof-readiness`, `signalproof-plan`, `signalproof-build`, `signalproof-verify`, `signalproof-review`, `signalproof-security`, `signalproof-recovery`, `signalproof-release`, `signalproof-closeout`
- **Domain:** Evidence-to-decision evaluation, technology disposition, explicit criteria, hard gates, weighted tradeoffs, reversibility, strategic/technical fit, licensing/security/readiness implications
- **Created by:** Doc Reo / Signalproof
