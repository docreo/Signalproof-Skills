# Signalproof Harness and Skill Streamlining Assessment

**Date:** 2026-09-12  
**Status:** Evidence-backed assessment and September update proposal  
**Repository basis:** `docreo/Signalproof-Skills` `main` at `19e58e3d71648b28a8c95450b37312cd60ed52eb`  
**Authority:** This document does not activate, deprecate, retire, merge, or delete any Skill or command.

## Executive conclusion

Signalproof should keep the operating principles and reduce the amount of prose required to enforce them.

The current suite is coherent and its deterministic checks pass, but it has grown faster than its normalized evidence of real runtime use. The public repository currently contains 39 Active Skills, 28 Active commands, 10 registered Loops, and 3 Candidate capability families containing 7 Candidate Skill definitions. The 39 Active `SKILL.md` files total 286,807 UTF-8 bytes. The 28 command bodies total approximately 130,000 bytes before the command registry is counted.

This does not mean the runtime loads all of that material. The current Router explicitly calls for lazy loading. It does mean there is now enough catalog size, naming overlap, nested coordination, compatibility surface, and governance repetition to create avoidable routing and maintenance cost.

The September objective should be:

> **Preserve the Signalproof standard. Shrink the default context. Measure actual use. Move deterministic rules into the harness. Retire only with evidence.**

The model is leased intelligence. The harness is institutional capability. The control plane is ownership. Skills should add durable capability only where the model plus harness does not already perform reliably.

## What the current evidence proves

### Artifact-backed facts

- Canonical public authority is `docreo/Signalproof-Skills/main`.
- Only Registry-Active Skills are routable.
- The complete current test lane passed locally: 102 consistency tests, 5 public-boundary security tests, suite consistency, Library consistency, Skill budget, and public-boundary checks.
- Five current Active Skills are in the repository's `REVIEW` byte band: `signalproof-release`, `signalproof-readiness`, `signalproof-known-errors`, `signalproof-review`, and `signalproof-router`.
- The current root plus Router is 21,533 bytes before a principal Skill, specialist, Loop, task evidence, tool schema, or project context is added.
- A possible nested debug route that loads the root, Router, Build Spawn Debug, Full Debug, Known Errors, and Verify bodies would exceed 67,000 bytes before task evidence. The current routing policy intends a smaller load, but nested coordinators make accidental expansion possible.
- `signalproof-build-spawn-debug` and `signalproof-full-debug` have the strongest textual and functional overlap in the Active suite. Both coordinate debugging, retry control, failure memory, verification, role separation, and acceptance boundaries.
- The repository currently has 39 open pull requests. Thirty-two were last updated before 2026-09-01, 18 are drafts, and 32 use candidate, log, log-skill, or agent branch families. Several open PRs concern capabilities that are already represented on `main` or have newer competing PRs.
- Private continuity records preserve substantial project history, but they do not currently provide a normalized, complete per-Skill invocation ledger from which a defensible "never used" claim can be calculated.

### What the evidence does not prove

The existence of a Skill in a registry, a promotion record, a test, a handoff, or a pull request does not prove that an active runtime selected and used that Skill. This is already captured by `KE-REGISTRY-NOT-RUNTIME-AUTHORITY-001` in the Active Known Errors catalog.

The reverse is also true. A narrow Skill with no visible operator invocation may still have been used implicitly by a Router, or it may be a rare safety control whose value is not measured by frequency.

Therefore this assessment does not label any Active Skill "never used" as a proven fact. It identifies Skills with insufficient normalized use evidence, functional overlap, or a better implementation form. Retirement decisions should follow measurement.

## The central efficiency rule

> **Skills should compensate for a demonstrated capability gap, preserve a Signalproof-specific invariant, or provide a specialized procedure. They should not restate intelligence the model already has.**

A stronger model can already research, plan, compare, diagnose, write, review, and summarize. Signalproof still needs rules about authority, evidence, protected state, recovery, current sources, exact artifacts, human acceptance, and STOP conditions. The efficient design is to keep those invariants once and let the model supply the general reasoning.

This changes the question from:

> Is this Skill well written?

to:

> Does this Skill produce a measurable improvement over the root contract plus the current model and harness?

## Harness architecture to preserve

The CLI is Harness Generation 1. It should become the lowest common interface into Signalproof, not another provider-specific chat client.

The intended abstraction is:

```text
Human intent
    -> Signalproof CLI
    -> identity + workspace + objective + authority + policy
    -> Signalproof Harness
    -> model adapter + tool adapter + institutional state
    -> plan / act / inspect / verify
    -> policy and approval
    -> evidence and learning
```

Provider logic should live behind adapters for OpenAI, Anthropic, OpenRouter, Hugging Face or local runtimes, and future providers. A provider change should require an adapter change, not a Signalproof rebuild.

Signalproof must keep these layers distinct:

| Layer | Governing question |
|---|---|
| Model | What intelligence reasons about the problem? |
| Harness | How can that intelligence interact with tools and state? |
| Control plane | What may the harness access or execute? |
| Governance | Under what conditions may authority expand? |
| Assurance | What proves what actually happened? |
| Institutional state | What remains Signalproof-controlled regardless of provider? |

Institutional state includes identity, knowledge, memory, files, Skills, workflows, policies, approvals, tool configuration, model routing, Known Errors, tests, benchmarks, Build Ledger evidence, and backups.

This also changes how local models should be developed. Granite does not need to imitate GPT or Claude in isolation. It needs to become increasingly reliable inside the Signalproof Harness. Teach the harness with better state, tools, tests, failure memory, and routing. Remove scaffolding only when acceptance results show that the model no longer needs it.

The economic question is not which model is smartest in the abstract. It is:

> **What is the smallest model that can complete this job reliably under this exact harness and Skill bundle?**

Routine jobs can then stay local or inexpensive while frontier models become escalation resources for difficult reasoning, planning, or recovery.

## Project to proven to global

New capability should no longer move directly from an interesting idea into the global Active catalog.

```text
DISCOVERED
    -> PROJECT-LOCAL
    -> REAL USE
    -> TESTED AGAINST BASELINE
    -> PROVEN REUSABLE
    -> PROMOTION REVIEW
    -> GLOBAL ACTIVE
```

Global should remain deliberately small. Project-specific capability preserves causality and blast-radius control. A rule learned in one UI, media tool, Windows host, or client environment should not silently alter every Signalproof build.

When a failure occurs, the harness should make it possible to classify Model, Harness, Skill, Tool, Policy, Context, State, and Organization failure separately. Without this separation, every failure is incorrectly blamed on the model or turned into another global Skill.

## Recommended capability disposition

These are proposed dispositions for the September audit. They are not lifecycle changes.

| Capability or family | Current issue | Proposed disposition |
|---|---|---|
| `signalproof` | Necessary doctrine, but it overlaps with other governance and identity Skills | Keep as the one compact inherited root. Remove repeated procedure that belongs in tools, schemas, or specialists. |
| `signalproof-router` | Correct role, but 12,621 bytes is large for a routing kernel | Keep and compress into compact metadata plus deterministic resolution. The Router should select Skills, not explain every Skill. |
| `signalproof-known-errors` | High value, but the Skill body has become a 13,413-byte catalog | Keep the preflight. Move error instances into machine-readable registries. Load only matched entries and their required prevention. |
| Research, Evaluate, Investigate, Plan, Review, and Document | General cognitive verbs now handled well by frontier models; separate long Skills repeat common governance | Convert to thin Signalproof work modes or checklists that inherit the root. Preserve only domain-specific gates and evidence formats. |
| `signalproof-readiness` | Important gate, but prose-heavy and in `REVIEW` | Convert prerequisites and acceptance fields into schemas and executable checks. Retain a thin interpretation Skill for unresolved cases. |
| Build, Debug, and Verify | Core operational capability with real value | Keep as the principal execution primitives. Reduce doctrine repeated from the root. |
| Full Debug and Build Spawn Debug | Nested coordinators duplicate Build, Debug, Verify, Known Errors, retry, and human acceptance behavior | Convert to Router-selected execution modes or Loop compositions. Do not maintain both as full standalone Skill bodies unless A/B evidence proves independent value. |
| Grill With Docs | Explicit composition of Grill plus Document | Replace the standalone Skill with a composition alias unless measured use shows unique behavior. |
| Design, UI Polish, and Accessibility | Useful domain separation, but UI Polish and Accessibility are narrow checks | Keep Design as principal. Deliver UI Polish and Accessibility as on-demand checklists or specialists, never default context. |
| Security coordinator and five security specialists | Rare but potentially high-impact; frequency is a poor retirement signal | Keep lazy and narrow. Convert deterministic rules into scanners or policy checks. Load the coordinator only for cross-domain security decisions. |
| Recovery coordinator and four recovery specialists | Rare but protects rollback and state | Keep lazy and narrow. Use exact state schemas and tools. Do not load the full family for a simple restore or cleanup. |
| Release | High-value authority boundary, but 14,178 bytes is near the ceiling | Keep the gate, compress the prose, and enforce exact-candidate, authorization, rollback, distribution, and post-deploy state in the CLI state machine. |
| Handoff, Closeout, and Learn | Their boundaries matter, but they repeat continuity doctrine | Create one Continuity family with distinct modes and schemas for open handoff, milestone closeout, and reusable lesson extraction. |
| Cut Chase and Cut Cost | Directly useful operator utilities | Keep as concise commands. Their full Skill bodies should survive only where they measurably outperform a short mode contract. |
| Teach and Grill | Useful human-development and decision-hardening modes | Keep on demand. Do not preload. Measure whether a thin template performs as well as the full Skill. |
| Build Capsule | Overlaps Git, State Capsule, Handoff, artifact pointers, and target-specific transfer packaging | Put on probation. Keep project-local or Candidate unless 30-day evidence shows repeated cross-system value that State Capsule plus Git cannot provide. |
| Candidate Failure Intelligence | Substantial overlap with Known Errors and retry registries | Merge the useful matching logic into the Known Errors service instead of activating another coordinator. |
| Candidate Workflow Mine | Directly relevant to monthly simplification, but not a daily runtime Skill | Use as an offline audit method. Do not activate globally unless repeated measured audits justify it. |
| Candidate Knowledge family | Strategically important to the Knowledge Plane, but separate from everyday build routing | Keep Candidate and project-scoped until the Knowledge Plane runtime, provenance, retrieval, and authority paths are proven. |

## Skills with weak direct-use evidence

The current repositories do not contain reliable normalized invocation counts. The following groups deserve use measurement before another material expansion:

1. **Composition and coordinator candidates:** `signalproof-grill-with-docs`, `signalproof-full-debug`, and `signalproof-build-spawn-debug`.
2. **Transfer candidate:** `signalproof-build-capsule`.
3. **Generic cognitive Skills:** Research, Evaluate, Investigate, Plan, Review, Document, and Learn.
4. **Narrow specialists with little direct invocation evidence:** UI Polish, Accessibility, Rollback, Restore, Cleanup, Recovery Continuity, Secrets, Permissions, Supply Chain, Network, and Execution Security.

The fourth group should not be retired simply for low frequency. These are mostly specialist controls created through decomposition. Their first audit question is whether they can become small checklists, policies, schemas, or deterministic tools while remaining available on demand.

## Cross-skill duplication observed in the current builder environment

The public `signalproof` root and the current `doc-reo` collaboration Skill materially overlap in operating principles, workflow, evidence classes, protected-state handling, verification, recovery, and closeout. Loading both full bodies repeats doctrine without adding equivalent capability.

The Build Ledger Skill also repeats universal governance before reaching its unique ledger procedure. Its unique value is real, but the efficient form is a procedural adapter that inherits the Signalproof root rather than restating it.

Recommended rule:

> **One root contract per session. Identity, repository, document, platform, and evidence Skills inherit it by reference and add only their delta.**

This rule should apply equally to ChatGPT/Codex, Rico, Granite, Hermes workers, and future provider models.

## What Rico and future builders actually need

A builder does not become stronger by preloading every Skill. A builder becomes stronger by receiving the same institutional capability:

- the current objective and acceptance condition;
- current Git and exact candidate identity;
- protected state and recovery target;
- the applicable authority boundary;
- a compact State Capsule;
- Known Error matches, not the full catalog;
- the minimum relevant tool and Skill set;
- deterministic tests before expensive reasoning;
- permission to keep building within the bounded assignment;
- a verification loop that distinguishes static, runtime, human, and release evidence;
- durable failure fingerprints and changed-condition checks;
- a concise closeout with result, open risk, and next move.

The correct learning strategy is:

> **Carry the mentality. Retrieve the knowledge.**

For builder parity, preserve the following public-safe operating mentality:

1. Think from the owner and mission level before choosing technology.
2. Protect money, time, security, law, Terms of Service, licenses, clients, and accepted work.
3. Research what can be resolved independently.
4. Build, test, repair, and finish within the approved boundary.
5. Ask only when missing information materially changes the result or authority is required.
6. Bring back a working result, the remaining risks, and the recommended next move.
7. Turn repeated failures into tests, registries, or Known Errors before creating another general Skill.

This is how Rico can approach frontier-builder quality without copying a model's personality or absorbing a 300,000-byte prompt library.

## Recommended command surface

The current 28-command registry exposes implementation details and compatibility routes as if they were equally important operator choices. `/dsp` should remain the front door, with a small primary menu and secondary utilities.

### Keep prominent

- `/dsp help`
- `/dsp research`
- `/dsp plan`
- `/dsp design`
- `/dsp complete`
- `/dsp debug`
- `/dsp qc`
- `/dsp authorize`
- `/dsp deploy`
- `/dsp handoff`
- `/dsp git-check`

`qc`, `authorize`, and `deploy` must remain distinct because human acceptance, authorization, and external actuation are different gates.

### Keep as utilities

- `/dsp known-errors`
- `/dsp download`
- `/dsp cut-chase`
- `/dsp cut-cost`
- `/dsp teach`
- `/dsp print` after its one canonical candidate is accepted
- `/dsp capsule` only if Build Capsule survives measurement

### Internalize or retain only as temporary compatibility aliases

| Current command | Proposed operator route |
|---|---|
| `signalproof-this-plan` | `/dsp plan` |
| `signalproof-this-build` | `/dsp complete` or `/dsp build` |
| `design-git` | `/dsp design`; Git behavior remains internal |
| `build-git this` | `build-git` with the current work unit inferred from state |
| `build-git spawn` | Internal independent-challenge mode selected only when justified |
| `build-git-debug` | `/dsp debug` |
| `full-debug` | `/dsp debug`; Router selects full mode when justified |
| `build-spawn-debug` | Internal `/dsp complete` execution strategy |
| `log-build-git` | Internal continuity step behind `/dsp handoff` or `/dsp complete` |
| `log-build-git-debug` | Internal debug continuity step |
| `/authorized-log-build-git` | Deprecate after compatibility evidence confirms no active consumer |
| `signalproof-teach` | `/dsp teach` |

`build-git` should remain as a power-user compatibility route during the CLI transition because it has established operator use. The CLI should eventually expose intent while the harness selects the implementation path.

## Put stable behavior in the harness, not prose

The following belong in deterministic code, schemas, registries, or tests wherever practical:

- command and Skill discovery;
- exact command aliases;
- lifecycle status;
- context byte budgets;
- active versus Candidate routing;
- Known Error fingerprints and matching;
- retry counts and changed-condition requirements;
- Git repository, ref, head, and worktree checks;
- artifact hashes and exact-candidate identity;
- protected-state manifests;
- prerequisite/readiness checks;
- permission and authorization state;
- release gates;
- State Capsule validation;
- public/private boundary checks;
- result and evidence classes.

The model should interpret ambiguous evidence and make bounded judgments. It should not spend tokens remembering exact state-machine fields or registry rows that the CLI can validate directly.

## Required usage telemetry

The Signalproof CLI and Harness should record privacy-minimized Skill selection evidence for each meaningful task:

```yaml
task_class: <stable category>
model: <provider/model>
harness_version: <version or commit>
command: <canonical command>
principal_skill: <name@version or NONE>
specialists: []
skill_bundle_hash: <digest>
context_bytes_loaded: <integer>
tool_calls: <integer>
corrections: <integer>
elapsed_ms: <integer>
result: <PASS|FAIL|PARTIAL|STOP>
human_rework: <NONE|LOW|MATERIAL>
verification: <evidence class and compact refs>
```

Do not record raw prompts, completions, secrets, customer data, private source, or arbitrary personal prose. The purpose is capability measurement, not surveillance.

## Capability decay and retirement test

Every material Skill should be tested in three conditions on representative real work:

1. current model plus harness, without the Skill;
2. root contract plus a thin mode/checklist;
3. root contract plus the full Skill.

Measure:

- correct outcome;
- false confidence;
- tool-choice correctness;
- authority and escalation behavior;
- correction count;
- elapsed time;
- tokens and context bytes;
- human rework;
- regression rate.

Disposition rule:

- **KEEP** when the full Skill materially improves reliability, safety, quality, or cost.
- **THIN** when a compact checklist performs equivalently.
- **MERGE** when the value appears only as part of another capability.
- **CONVERT** when deterministic code, a schema, a registry, or a test can enforce it better.
- **LOCALIZE** when the capability is useful only for one project or runtime.
- **DEPRECATE** when compatibility is still needed but the Skill is no longer preferred.
- **RETIRE** when representative testing shows no material value and no safety exception applies.

Rare high-impact safety controls may remain available without frequent use, but they must stay lazy and narrow.

## Proposed `LIFECYCLE.yaml` fields

Each governed capability should carry a small machine-readable lifecycle record:

```yaml
id: signalproof-example
type: skill
scope: global
status: ACTIVE
created_at: 2026-08-15
last_verified: 2026-09-12
last_invoked: UNKNOWN
invocations_30d: UNKNOWN
tested_models: []
context_bytes: 0
success_rate: UNKNOWN
human_rework_rate: UNKNOWN
baseline_without_skill: NOT_TESTED
supersedes: []
review_interval_days: 30
retirement_test_required: true
```

`UNKNOWN` must remain honest. It is better than a fabricated usage count.

## September execution plan

### Stage 1: Freeze taxonomy growth

For the audit window, do not add another global Skill unless it addresses an urgent, independently routeable gap that cannot be handled by a test, registry, tool, thin checklist, project-local Skill, or existing capability.

### Stage 2: Add measurement before retirement

Instrument the CLI/Harness with privacy-minimized command and Skill selection receipts. Bind each receipt to model and harness versions so model capability can be separated from harness capability.

### Stage 3: Create a clean vNext map

Prepare one Candidate branch that maps every current command and Skill to KEEP, THIN, MERGE, CONVERT, LOCALIZE, DEPRECATE, or RETIRE. Do not edit 39 definitions independently before the map is accepted.

### Stage 4: Resolve obvious composition overlap

Test these first because they offer the clearest likely savings:

1. Full Debug plus Build Spawn Debug as execution modes instead of standalone coordinator Skills.
2. Grill With Docs as a composition alias.
3. Handoff, Closeout, and Learn as one Continuity family with separate modes.
4. Known Errors as a thin matcher over registries.
5. Readiness and Release as state machines plus thin interpretation layers.
6. `doc-reo`, `signalproof`, and Build Ledger root-doctrine inheritance.

### Stage 5: Triage the open PR queue

For each of the 39 open PRs, compare its exact head with current `main` and classify:

- active candidate;
- blocked but still relevant;
- superseded by `main`;
- superseded by a newer PR;
- historical evidence only;
- safe to close.

Do not merge candidate branches merely to reduce the count. Close or preserve them according to current evidence and authority.

### Stage 6: Run model and harness A/B acceptance

Use the same representative job set across GPT/Codex, Rico's runtime, Granite, and other intended workers. Record the model, harness version, Skill bundle, tools, context, result, corrections, time, and human rework. The goal is to find the smallest reliable capability package for each job class.

### Stage 7: Promote one bounded simplification

After owner review, promote the smallest high-confidence change first. Recommended first candidate: convert Full Debug and Build Spawn Debug into one bounded execution composition while preserving all existing tests, failure memory, STOP rules, automated PASS, and human QC boundaries.

## Target operating architecture

```text
HUMAN OBJECTIVE
    -> SIGNALPROOF CLI
    -> ROOT CONTRACT, ONCE
    -> COMPACT ROUTER METADATA
    -> KNOWN-ERROR MATCHES ONLY
    -> ONE PRINCIPAL CAPABILITY
    -> ZERO TO TWO NARROW SPECIALISTS OR LOOPS
    -> TOOLS + CURRENT STATE + TASK EVIDENCE
    -> PLAN / ACT / INSPECT / VERIFY
    -> POLICY / AUTHORITY GATE
    -> BUILD LEDGER EVIDENCE
    -> RESULT + MEASURED LEARNING
```

Skills should be replaceable capability modules inside this architecture. They are not the architecture itself.

## Decision requested

Approve this assessment as the September simplification basis, then create one governed Candidate change set. No Active Skill or command should be removed until the usage instrumentation, A/B comparison, compatibility review, and owner approval support that disposition.

The objective is not fewer Skills for appearance. The objective is less context, less ambiguity, fewer duplicate routes, faster building, stronger evidence, and equal or better human control.
