---
name: signalproof-research
description: Conduct evidence-controlled research by defining the question, scope, freshness, source quality, factual versus inferential claims, contradictions, citations/provenance, uncertainty, stopping conditions, and handoff into evaluation or planning. Use when researching technologies, tools, standards, competitors, models, claims, products, or external evidence without turning discovery into automatic recommendation or implementation.
---

# Signalproof Research

## Purpose

`signalproof-research` is the evidence-controlled research specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

> **Research establishes what the evidence supports; it does not silently turn discovery into recommendation, adoption, or implementation.**

Research produces a traceable, current, bounded evidence base for later evaluation or action. It does not itself authorize purchases, installs, adoption, deployment, dependency changes, credential use, publication, or canonical Build Ledger mutation.

## Research Contract

1. Define the question, downstream decision, scope, exclusions, freshness need, and evidence standard before searching.
2. Prefer primary/official sources for technical specifications, standards, licenses, security advisories, releases, APIs, and policy; use strong independent sources when external assessment is needed.
3. Separate **SOURCE-BACKED FACT**, **CROSS-SOURCE FACT**, **VENDOR/PROJECT CLAIM**, **INFERENCE**, **PROPOSAL**, and **UNKNOWN / CONFLICTED**.
4. Bind material claims to their supporting sources and preserve date/version context when unstable facts are involved.
5. Preserve credible contradictions instead of forcing certainty.
6. Do not count mirrors, syndicated copies, or repeated vendor material as independent confirmation.
7. Treat popularity, stars, downloads, citations, or marketing claims as signals—not proof of suitability.
8. Resolve project/product identity before drawing conclusions: canonical source, maintainer, version, fork/upstream, package identifier, archived/deprecated state where relevant.
9. Search proportionately and stop when the declared question is sufficiently answered for its decision boundary.
10. Track unresolved questions, inaccessible evidence, stale material, unclear licensing, missing benchmarks, or conflicting claims explicitly.
11. Do not install, clone, run, purchase, adopt, deploy, or modify protected state merely because research discovered something promising.
12. Produce a decision-ready handoff to Evaluate, Readiness, Security, Plan, Verify, or another appropriate discipline.

## Workflow

### 1. Define the objective

Capture the exact research question, intended downstream decision, scope/exclusions, freshness boundary, comparison baseline, evidence standard, and prohibited assumptions.

### 2. Decompose the question

Break it into answerable subquestions such as identity, maintainer, current version, documented capabilities, runtime/system requirements, license, dependencies, security/privacy boundaries, performance evidence, known limitations, and differences from alternatives.

Do not let decomposition silently expand project scope.

### 3. Build a source strategy

Use sources appropriate to the claim: official documentation, canonical repositories and release notes, standards bodies, vendor security advisories, license text, research papers/datasets, regulators/government sources, independent benchmarks/reviews, reputable reporting, and first-hand community evidence when operational experience materially matters.

A marketing page establishes what the vendor claims; it does not independently establish that the claim is true.

### 4. Check freshness and identity

For unstable claims, establish current version/date/status. Avoid reusing stale compatibility, pricing, security, ownership, platform-support, or policy information without checking for newer authoritative evidence.

### 5. Evaluate source strength

Consider authority, directness, recency, reproducibility, conflicts of interest, whether the source supports the precise claim, and whether apparently multiple sources are genuinely independent.

### 6. Preserve contradictions

When credible evidence conflicts, state the disputed claim, each source position, version/date/context differences, what evidence could resolve the conflict, and leave the result **CONFLICTED** if necessary.

### 7. Separate research from later decisions

Research may identify license risk, unsupported platforms, dependency conflicts, hardware burden, maintenance concerns, security advisories, data-flow issues, vendor lock-in, redistribution uncertainty, or missing rollback/update support. It surfaces those facts and routes them onward; it does not silently decide adoption.

### 8. Produce the output

For consequential research return:

- **Question**
- **Scope / exclusions**
- **Freshness boundary**
- **Key findings**
- **Evidence class for material claims**
- **Source/provenance references**
- **Contradictions**
- **Unknowns / missing evidence**
- **Risks requiring another specialist**
- **Research conclusion**
- **Recommended handoff**

## Research Status

- **SUFFICIENT EVIDENCE** — enough credible evidence exists for the declared question.
- **SUFFICIENT WITH CAVEATS** — answerable, but material limitations remain.
- **CONFLICTED** — credible sources materially disagree and the conflict is unresolved.
- **INSUFFICIENT EVIDENCE** — evidence is too weak or incomplete.
- **STALE / RESEARCH REFRESH REQUIRED** — evidence is too old for the decision.
- **BLOCKED** — required source/access/data is unavailable.
- **STOP** — continuing would require unauthorized access, unsafe execution, protected-data exposure, or another prohibited boundary crossing.

## Specialist Boundaries

`signalproof-research` asks: **What does the best available evidence establish?**

`signalproof-evaluate` should ask: **Given the evidence and our criteria, what option or disposition best fits the objective?**

Use `signalproof-investigate` when the central problem is what is actually happening in a specific system/runtime. Use `signalproof-verify` when a specific claim must be adjudicated. Use `signalproof-readiness` to determine whether discovered requirements are satisfied on the exact target. Use `signalproof-security` when research surfaces material trust/security concerns.

## Source Integrity Rules

Do not cite sources for claims they do not support, quote selectively to reverse meaning, treat snippets or AI summaries as original evidence, fabricate citations, erase contradictions, imply independence where sources share an origin, or use stale material for unstable current claims without checking freshness.

## STOP Conditions

Stop when continuing research would require unauthorized/private access, unsafe execution of untrusted code, credential exposure, protected-data disclosure, destructive testing, or a boundary that belongs to a separately authorized specialist.

## Anti-Patterns

Fail this skill when Research begins before defining the question; returns only links without synthesis; promotes vendor claims to verified fact; treats popularity as suitability; ignores date/version context; suppresses contradictions; makes adoption decisions without evaluation criteria; runs code without authority; claims completeness because initial results agree; turns availability into approval; hides unknowns; or gives recommendations without traceable evidence.

## Completion Criteria

Research is complete when the question, scope, freshness requirement, source strategy, findings, evidence classes, provenance, contradictions, unknowns, limitations, research status, and handoff are explicit enough that another competent human or agent can understand what the evidence establishes and what it does not without repeating the research from scratch.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-research`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-investigate`, `signalproof-plan`, `signalproof-verify`, `signalproof-review`, `signalproof-readiness`, `signalproof-security`, `signalproof-recovery`, `signalproof-release`, `signalproof-closeout`
- **Domain:** Evidence-controlled research, source quality, freshness, contradiction handling, claim classification, provenance, research handoff
- **Created by:** Doc Reo / Signalproof
