# Skill Candidate — Build-Git / Log-Skill Execution Loop

**Stable ID:** `SP-ROUTER-BUILD-GIT-LOG-SKILL-LOOP-20260817`

**Affected skills:**

- `signalproof-router`
- `signalproof-build`
- `signalproof-learn`
- `signalproof-closeout`

**Lifecycle:** `CANDIDATE`

**Status:** NOT ACTIVE

## Problem

Long-running Signalproof development work often alternates between two different responsibilities:

1. continuing the actual bounded product build;
2. extracting and governing reusable lessons discovered during that build.

If the learning/governance step is treated as a separate project, the active product build can lose continuity, stall, or drift into documentation work instead of returning to the exact next execution gate.

If learning is skipped until the very end, high-value recovery lessons, acceptance patterns, and authority rules may be forgotten or lose their evidence context.

## Candidate command semantics

### `/build-git`

A user-facing execution mode meaning:

> Load and follow the current Git-backed Active Signalproof build/router doctrine, continue the authorized product-development workflow from the strongest current evidence state, and generate the next bounded operator-verifiable action.

`/build-git` is not permission to bypass planning, authority, verification, recovery, closeout, or human execution gates.

### `log-skill`

A user-facing governance command meaning:

> At the current evidence-backed milestone, evaluate whether the work produced a reusable lesson; if so, preserve it through the Signalproof learning/governance lifecycle at the strongest justified state, without auto-promoting it to Active doctrine.

`log-skill` is not a command to stop product development indefinitely.

## Candidate execution loop

When a product build is already in `/build-git` mode, the preferred loop is:

1. **Build** — continue the smallest authorized implementation/verification/recovery step using current Git-backed Signalproof doctrine.
2. **Human execution** — when workstation actuation is consequential or cannot be directly performed by the assistant, prepare a bounded PowerShell or equivalent operator artifact and have the human run it.
3. **Evidence return** — treat the real transcript, screenshots, hashes, runtime state, and persisted results as the next source of truth.
4. **Recover in place** — if a step fails after partial actuation, inspect persisted state first; do not blindly rerun, rebuild, restore, or overwrite an intended candidate.
5. **Milestone recognition** — when a meaningful reusable lesson becomes evidence-backed, invoke `log-skill` at that point rather than waiting for the entire product to finish.
6. **Govern learning** — route the lesson through existing-intelligence checks and `DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE` governance. Preserve private/public boundaries and do not claim a stronger lifecycle state than the evidence supports.
7. **Return immediately to build** — after the skill/logging action completes, resume `/build-git` at the exact next authorized product gate. Do not make the learning lane the new default objective unless the user explicitly changes goals.
8. **Close meaningful milestones** — when a development milestone is complete, run governed closeout before authorizing the next development phase. `log-skill` may occur before, during, or after closeout depending on evidence maturity, but it does not substitute for closeout.

## Central rule

> `log-skill` is an interruptible governance checkpoint inside `/build-git`, not a detour that replaces the product build.

## Human / AI execution boundary

This loop supports an evidence-producing human-machine workflow:

### Assistant responsibilities

- load current Git-backed Active doctrine;
- reason about the exact current product state;
- define the smallest authorized next action;
- generate bounded scripts/artifacts where appropriate;
- preserve rollback and protected-state rules;
- classify failures from actual execution order;
- record reusable lessons at meaningful milestones;
- return to the next authorized build gate after logging.

### Human operator responsibilities

- execute consequential workstation actions when required;
- inspect visual/runtime behavior that requires owner acceptance;
- provide real transcripts, screenshots, and observed results;
- make explicit authority decisions at protected write/release/closeout boundaries.

The assistant must not replace real operator evidence with assumed success.

## Routing implications

If this Candidate is promoted, `signalproof-router` should recognize the following behavior:

- an active `/build-git` product workflow remains routed primarily through Build/Debug/Verify/Review/Recovery/Closeout as evidence requires;
- `log-skill` temporarily routes to Learn/governance when a material reusable lesson exists;
- after the learning action resolves, routing returns to the previously active product objective and next authorized gate;
- the router should not require the user to restate `/build-git` after every `log-skill` checkpoint unless the prior build objective is no longer recoverable from evidence;
- Closeout remains mandatory for meaningful completed milestones and is not replaced by `log-skill`.

## Build implications

If this Candidate is promoted into `signalproof-build`, Build should preserve an explicit continuation pointer across learning checkpoints:

- current objective;
- exact phase/milestone;
- protected state;
- accepted candidate/source heads;
- last evidence result;
- next authorized action;
- prohibited actions;
- open recovery/closeout requirement.

After `log-skill`, Build resumes from that pointer rather than reconstructing the workflow from scratch.

## Learn implications

If this Candidate is promoted into `signalproof-learn`, Learn should:

- distinguish an in-build learning checkpoint from a user-requested standalone learning project;
- log only the reusable lesson and evidence needed for governance;
- avoid broad repository redesign unless separately authorized;
- return control to the active build objective after the logging action completes.

## Evidence from Competition Radar RD2 C1-E

The pattern was exercised repeatedly during a governed Radar build:

- product development proceeded through bounded Build 3B / Build 3C phases;
- real PowerShell execution produced evidence for each acceptance/recovery gate;
- failed validation harnesses were inspected rather than blindly rerun;
- reusable WPF theme-state behavior was logged as a Candidate without blocking the correction workflow;
- a one-shot live-append pattern was logged as a Candidate after runtime evidence and later strengthened with independent persisted-state evidence;
- after each `log-skill` action, work returned directly to the next Radar `/build-git` gate;
- milestone closeout remained distinct from skill logging.

This workflow materially reduced continuity loss while preserving evidence and governance boundaries.

## Acceptance criteria before promotion

Promotion beyond Candidate requires successful use in at least two additional development efforts or materially distinct phases demonstrating that:

1. `log-skill` can occur mid-build without losing the active product continuation point;
2. build execution resumes at the exact next authorized gate without unnecessary rediscovery;
3. logged lessons do not auto-promote beyond supported lifecycle state;
4. milestone closeout still occurs when required;
5. failures after partial actuation still route to persisted-state inspection/recovery rather than blind rerun;
6. private evidence and public skill content remain correctly separated;
7. the loop works from a fresh conversation/session using Git-backed skills rather than relying only on prior chat memory;
8. the user can execute operator artifacts and return evidence without the assistant skipping or inventing runtime proof.

## Anti-patterns

Do not promote this Candidate into behavior that:

- logs a skill after every trivial step;
- interrupts active development for broad governance work with no material reusable lesson;
- treats `log-skill` as milestone closeout;
- treats closeout as optional because a lesson was logged;
- auto-promotes Candidate learning to Active doctrine;
- loses the product continuation pointer after repository work;
- reruns mutating scripts simply to regain context;
- substitutes Git repository state for real workstation/runtime evidence;
- assumes `/build-git` grants mutation authority beyond the current approved scope.

## Intended lifecycle

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE`

This document records the Candidate stage only.

## Current status

`CANDIDATE / NOT ACTIVE`
