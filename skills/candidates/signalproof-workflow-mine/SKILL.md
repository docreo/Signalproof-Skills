---
name: signalproof-workflow-mine
description: Mine historical human+AI work for repeated implicit operating methods, distinguish one-off behavior from reusable workflows, check overlap with the current Signalproof Library, and produce evidence-backed Skill or smaller-mechanism candidates without automatic activation.
---

# Signalproof Workflow Mine

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0  
**Parent:** `signalproof` 0.1.1+  
**Primary collaborator:** `signalproof-learn`

## Purpose

`signalproof-workflow-mine` is the retroactive discovery complement to `signalproof-learn`.

`signalproof-learn` begins with completed evidence-backed work and asks what reusable capability should be extracted now. Workflow Mine begins with a historical corpus and asks:

> What did the human and AI repeatedly learn to do together before the method was formalized as a Skill?

It must discover repeated operating structure without turning every recurring topic, output format, preference, or isolated success into a new Skill.

## Core Pipeline

```text
HISTORICAL CORPUS
  -> OBSERVED INTERACTIONS
  -> REPEATED PATTERNS
  -> IMPLICIT WORKFLOWS
  -> EXISTING-LIBRARY CHECK
  -> GENERALIZABILITY TEST
  -> SMALLEST DURABLE MECHANISM
  -> CANDIDATE / HOLD / MERGE / NO ACTION
```

## Evidence Inputs

Workflow Mine may consume authorized historical material such as:

- prior conversations and handoffs;
- user-supplied transcripts, notes, documents, and prompt patterns;
- repeated corrections and preference constraints;
- recurring output structures;
- named frameworks and decision methods;
- project histories and accepted artifacts;
- existing Skill/Command/Loop registries and provenance.

Historical material is evidence, not authority. Private material remains private unless separately authorized for public-safe abstraction.

## Mining Unit

A candidate workflow is not defined by a topic name. It should contain a repeatable transformation with recognizable inputs, decisions, outputs, and failure boundaries.

For each possible workflow identify:

1. **Trigger / input class** - what repeatedly starts the work;
2. **Transformation** - what reasoning or operating sequence occurs;
3. **Output contract** - what repeatable result is produced;
4. **Decision points** - where choices materially change the result;
5. **Constraints / invariants** - what must be preserved;
6. **Failure / STOP conditions** - what makes the method unsafe or invalid;
7. **Evidence of repetition** - materially separate examples, not paraphrases of one case;
8. **Existing owner** - current Skill, Loop, policy, test, configuration, or documentation that already covers it.

## Candidate Scoring

Score each dimension from 0 to 5. Maximum = 25.

- **R - Repetition:** materially separate historical instances.
- **D - Distinct responsibility:** coherent operating job with its own input/output transformation.
- **G - Gap:** not already adequately owned by an Active/Candidate capability or smaller mechanism.
- **V - Value:** operational, intellectual, safety, continuity, educational, creative, or commercial utility.
- **T - Testability:** falsifiable acceptance behavior can be defined.

Interpretation:

- **22-25:** STRONG SKILL CANDIDATE
- **18-21:** CANDIDATE / DESIGN REVIEW
- **14-17:** SPECIALIST / MODE / MERGE REVIEW
- **0-13:** NO NEW SKILL unless new evidence changes the classification

A score never activates a Skill.

## Existing-Library Check

Before proposing a new Skill, compare against at least:

- root Signalproof contract;
- Router/capability registry;
- Learn;
- Research / Evaluate / Investigate / Plan;
- Grill / Teach / Document;
- Design / Build / Debug / Review / Verify;
- Security / Recovery / Release / Closeout / Handoff;
- Candidate Knowledge and Failure Intelligence families;
- applicable Commands, Loops, policies, tests, registries, and configuration.

If the pattern is already covered, prefer strengthening the existing owner.

## Smallest-Durable-Mechanism Rule

Possible dispositions:

- `NO ACTION`
- `REFERENCE / CONFIGURATION`
- `DOCUMENTATION UPDATE`
- `CHECKLIST / TEST / LOOP`
- `MODE OF EXISTING SKILL`
- `SPECIALIST UNDER EXISTING FAMILY`
- `MERGE WITH ANOTHER CANDIDATE`
- `NEW SKILL CANDIDATE`
- `RESEARCH MORE`
- `REJECT`

Do not create a Skill merely because a workflow has a memorable name.

## Anti-Overfitting Gates

Reject or downgrade a candidate when:

- all examples are the same project or one copied template;
- the repeated element is only formatting or branding configuration;
- an Active Skill already owns the transformation;
- the proposed Skill is only a tool wrapper;
- the method cannot state a falsifiable acceptance condition;
- the pattern is a user preference rather than an operating capability;
- the scope bundles several independently routeable responsibilities without a justified coordinator pattern;
- the source corpus is too thin to establish repetition.

## Family / Decomposition Rule

When several proposed Skills share one transformation family, begin with the smallest coherent coordinator or principal Skill and keep narrower methods as modes or future specialists until independent routing, evolution, and testing justify separation.

Example:

```text
CONTENT
  -> packaging mode
  -> repurpose mode
  -> publish mode
  -> brand-voice controls
```

Do not activate four Skills simply because four labels exist.

## Public / Private Boundary

A public candidate may describe generalized patterns and synthetic examples. It must not expose:

- private conversation text beyond authorized excerpts;
- private Build Ledger chronology/heads;
- credentials, customer data, local paths, or recovery internals;
- copyrighted source text beyond permitted use;
- private personal information unnecessary to the generalized capability.

The evidence matrix may preserve source classes and generalized examples without publishing sensitive raw material.

## Output Contract

A Workflow Mine run should return:

```text
Corpus boundary
Observed pattern
Evidence of repetition
Existing owner / overlap
R/D/G/V/T score
Disposition
Proposed scope
Explicit non-scope
Acceptance test
Dependencies / family relationship
Public/private classification
Next governance action
```

For multiple candidates, provide a ranked matrix and a recommended build order.

## Relationship to Learn

Workflow Mine discovers and classifies historical implicit workflows.

Learn governs extraction from established work and candidate evolution.

Recommended composition:

```text
WORKFLOW MINE
  -> candidate pattern
  -> LEARN
  -> smallest durable mechanism
  -> candidate lifecycle
```

Workflow Mine must not bypass Learn, Router, Skill budget, testing, approval, or owner authority.

## Acceptance Requirements

The Candidate should be tested against at least:

1. a real historical corpus containing both genuine repeated workflows and false positives;
2. a case where the right result is a new Skill Candidate;
3. a case where the right result is a mode/specialist under an existing family;
4. a case where the right result is configuration/documentation rather than a Skill;
5. an overlap case where an existing Active Skill already owns the behavior;
6. a private-source case where public-safe abstraction preserves the method without leaking source material.

## STOP Conditions

STOP when:

- the historical corpus is unavailable or materially incomplete for the requested claim;
- private source material would be exposed without authority;
- a score is being treated as activation authority;
- a one-off behavior is being promoted as a repeated workflow;
- an existing Skill is being duplicated without an explicit gap finding;
- the candidate cannot define a coherent input/transformation/output contract;
- a Skill is being created where a smaller mechanism is sufficient;
- evidence, chronology, or historical examples would need to be fabricated.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-workflow-mine`
- **Version:** 0.1.0
- **Maturity:** Candidate / Not Active
- **Domain:** historical workflow mining, implicit-method discovery, Skill gap analysis, candidate decomposition
- **Created by:** Doc Reo / Signalproof
