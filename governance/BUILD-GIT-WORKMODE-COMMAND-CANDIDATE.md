# Signalproof `/build-git` Workmode Command Candidate

**Status:** CANDIDATE / NOT ACTIVE

## Purpose

`/build-git` is a lightweight operator command for entering a Git-governed Signalproof application-building workmode without duplicating the full skill suite inside the conversation prompt.

Its central rule is:

> **Verify the governing Git state, load only the Active Signalproof skills required for the current build objective, preserve authority and protected state, and keep the working context compact.**

This is a routing/bootstrap command, not a replacement for `signalproof-router`, `signalproof-plan`, `signalproof-design`, `signalproof-build`, or any other specialist skill.

## Canonical Operator Forms

Preferred slash command:

- `/build-git`

Conversational alias:

- `build-git`

Potential parser alias, if a future command surface supports hierarchical slash commands:

- `/build/git`

The hyphenated slash form is canonical for this Candidate because it is unambiguous in plain chat and does not depend on hierarchical command parsing.

## Intended Expansion

When the operator invokes `/build-git`, the workmode should:

1. Resolve the governing repository. Default for Signalproof software work: `docreo/Signalproof-Skills`, unless the operator explicitly specifies another governance repository.
2. Fetch the current protected/default `main` identity before consequential work.
3. Load `signalproof-router` from that exact current governing ref.
4. Establish the current product/build objective and evidence state from the conversation/project state.
5. Ask Router for the smallest sufficient Active skill sequence.
6. Load only the Active skill bodies needed for the present stage, rather than preloading the entire suite.
7. For a normal substantial application build, the likely pool is:
   - `signalproof-plan` when the build contract is not already sufficiently bounded;
   - `signalproof-design` when product information architecture, layout, visual/state communication, or design acceptance materially affect implementation;
   - `signalproof-readiness` when target prerequisites are not already proven;
   - `signalproof-build` for authorized implementation;
   - `signalproof-debug` for a reproduced defect rather than feature implementation;
   - `signalproof-security` when trust, privilege, secrets, dependencies, network/data flow, or security controls materially affect the build;
   - `signalproof-verify` / `signalproof-review` for evidence-backed acceptance;
   - `signalproof-recovery` when rollback/restoration becomes necessary;
   - `signalproof-document`, `signalproof-closeout`, `signalproof-learn`, and `signalproof-handoff` only when their evidence-state triggers are actually reached.
8. Preserve the exact governing Git ref and loaded skill identities in the work trace.
9. Re-fetch governing `main` before a consequential new phase if repository state may have advanced materially.
10. Keep capability selection separate from execution authority.

## Lazy-Loading Rule

`/build-git` MUST NOT dump every Signalproof skill into the active prompt.

Use progressive disclosure:

- bootstrap with current repo identity + Router;
- load Plan/Design/Build/Security/etc. only when the current route requires them;
- retain compact summaries/identities after reading full bodies;
- reload exact current bodies when a consequential phase change or repository update makes freshness material.

This command is specifically intended to reduce repeated prompt-window duplication while keeping Git as the governing source of truth.

## Build Workmode Contract

The command should establish and maintain these fields proportionately:

- **Objective**
- **Governing repository/ref**
- **Current product/version/candidate**
- **Protected state / rollback**
- **Current evidence state**
- **Active route / loaded skills**
- **Authorized change surface**
- **Forbidden/out-of-scope change surface**
- **Dependencies/readiness**
- **Acceptance gates**
- **Recovery path**
- **Open failures / uncertainty**
- **Current next authorized action**

These fields may be represented compactly in conversation state; they do not need to be repeated verbatim in every response.

## Authority Boundary

Invoking `/build-git` authorizes Git-backed skill retrieval and routing for build work. It does **not** by itself authorize:

- destructive filesystem/system changes;
- privilege elevation;
- credential/secret access;
- installation/adoption of unreviewed software;
- weakening security controls;
- production deployment or release;
- direct protected-main overwrite;
- skill/policy activation;
- canonical Build Ledger mutation from an unverified head;
- architecture rewrite beyond the approved objective;
- mutation of protected working baselines.

Existing explicit human authority in the conversation still applies; the command does not erase or expand it.

## Interaction With Existing Skills

`/build-git` is a command-layer bootstrap over the Active suite:

```text
/build-git
   ↓
verify current governance repo/ref
   ↓
signalproof-router
   ↓
lazy-load smallest required Active sequence
   ↓
plan/design/readiness/build/debug/security/verify/review/...
   ↓
closeout/learn/handoff only when triggered
```

It must not duplicate those specialist contracts inside a new monolithic skill.

## Freshness Rule

Because `docreo/Signalproof-Skills` is governing source for active Signalproof build skills, consequential design or implementation should not rely only on remembered skill bodies when `main` may have changed.

At minimum:

- fetch current `main` at workmode entry;
- bind loaded skills to that ref;
- refetch before a consequential new phase when material repository changes may have occurred.

If `main` advances only through unrelated metadata changes and the applicable skill blobs remain identical, record that fact and continue without unnecessary reload churn.

## Existing-Intelligence Rule

Before proposing a new build-specific skill, `/build-git` should use `signalproof-router` / `signalproof-learn` semantics to determine whether an Active skill, test, checklist, policy, or documentation mechanism already covers the learning.

Do not create duplicate specialists merely to make a shortcut convenient.

## Expected Status Output

A compact workmode status should be available when useful:

```text
BUILD-GIT MODE
Governance: docreo/Signalproof-Skills @ <current-main-sha>
Route: Plan → Design → Build → Verify
Loaded now: Router, Build
Protected: <baseline>
Current gate: <gate>
Next authorized action: <action>
```

Do not restate the full skill bodies unless the operator asks.

## Acceptance Criteria for Candidate Promotion

Before `/build-git` becomes an Active command contract, demonstrate at least:

1. successful use on multiple materially different Signalproof application build scenarios;
2. governing Git ref is actually refreshed rather than assumed;
3. only needed skills are loaded at each stage;
4. no specialist authority is weakened by the shortcut;
5. no direct-main or auto-activation behavior is introduced;
6. protected-state and rollback contracts survive use of the shortcut;
7. route transitions correctly trigger additional skills only when needed;
8. prompt/context duplication is measurably reduced in practice without losing critical continuity;
9. closeout and learning remain governed rather than automatic doctrine promotion.

## Failure Conditions

Fail this Candidate if it:

- loads an arbitrary remembered skill set without checking current Git;
- preloads the entire suite every time;
- substitutes the shortcut for Router/Plan/Design/Build discipline;
- converts routing into permission;
- hides unresolved prerequisites or failures;
- silently mutates protected state;
- directly changes protected `main` merely because `/build-git` was invoked;
- automatically activates skill/policy candidates;
- skips milestone closeout because the shortcut makes the workflow feel continuous.

## Candidate Identity

- **Command:** `/build-git`
- **Alias:** `build-git`
- **Potential future alias:** `/build/git`
- **Type:** Git-backed workmode/bootstrap command
- **Maturity:** Candidate / not Active
- **Governing suite:** Signalproof Skills
- **Primary router:** `signalproof-router`
- **Primary specialists:** `signalproof-plan`, `signalproof-design`, `signalproof-readiness`, `signalproof-build`, `signalproof-debug`, `signalproof-security`, `signalproof-verify`, `signalproof-review`, with other Active skills loaded only when evidence state requires
- **Created by:** Doc Reo / Signalproof
