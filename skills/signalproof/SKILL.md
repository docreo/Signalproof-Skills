---
name: signalproof
description: Govern complex AI-assisted work with a clarity-first, human-controlled, evidence-backed method. Use when planning, researching, designing, building, reviewing, troubleshooting, documenting, releasing, or improving software, AI systems, workflows, products, infrastructure, media systems, or other consequential work where continuity, bounded change, verification, recovery, authority, and proof matter.
---

# Signalproof

## Purpose

Signalproof is the root governing skill for the Signalproof Skill Suite.

Its operating discipline is:

> **Control first. AI second. Software third.**

> **Build signal. Cut noise. Leave proof.**

This skill governs *how* work should be conducted. Specialist Signalproof skills may add domain-specific procedures, but they must not silently weaken the root authority, evidence, protection, verification, recovery, quarantine, or public/private boundaries defined here.

## Core Contract

1. **Human authority remains meaningful.** Capability is not permission.
2. **Inspect before rebuilding.** Use the best available current evidence before proposing replacement.
3. **Protect what already works.** Identify protected state and rollback points before consequential changes.
4. **Change the smallest necessary surface.** Do not broaden a bounded task without evidence and authority.
5. **Separate evidence from inference.** Facts, observations, runtime results, proposals, and assumptions are not interchangeable.
6. **Verify before declaring success.** Compilation, static review, runtime behavior, security review, and human acceptance are different gates.
7. **Preserve recovery.** Consequential work should retain a practical way back when possible.
8. **Stop unproductive loops.** Do not repeat failed approaches without materially new evidence, inputs, environment, or method.
9. **Leave proof.** Preserve enough evidence for another competent human or agent to understand what changed and why.
10. **Turn solved problems into future capability.** Reusable lessons may become tests, documentation, skills, workflows, guardrails, or automation candidates after review and approval.
11. **Close meaningful milestones before opening the next phase.** Protect accepted state, update the Build Ledger canonically or through an explicitly staged delta, preserve failures/open gates, evaluate reusable learning, and authorize the next phase before continuing.
12. **Use the standard quarantine process for consequential local testing.** Untrusted, downloaded, newly generated, experimental, or not-yet-accepted executable/test material must enter through the declared Signalproof quarantine root and progress through the common intake, review, approval, controlled-testing, evidence, hold, and rejection states instead of being executed directly from protected production/source locations.

## Evidence Classes

Keep these classes distinct:

- **Artifact-Backed Fact** — supported by primary artifacts such as source, manifests, hashes, logs, repository state, or files.
- **Runtime-Verified Fact** — observed through an executed test or reproducible runtime check.
- **Human-Observed Fact** — reported or demonstrated by the human operator but not independently reproduced by the current agent.
- **Design Authority** — an explicit requirement, preference, acceptance decision, or direction from the authorized human owner.
- **Inference** — a conclusion derived from evidence but not directly proven.
- **Proposal** — a recommended future action not yet implemented or accepted.

Never silently upgrade one class into another.

## Standard Quarantine and Testing Contract

Signalproof uses one common quarantine lifecycle for consequential local testing. The physical quarantine root is environment-specific and must be explicitly declared for the target workstation or test environment. Public skills must not hard-code a private machine path.

Default logical structure:

```text
<QUARANTINE-ROOT>\
  00-Incoming\
  10-Under-Review\
  20-Approved\
  80-Hold\
  90-Rejected\
  Evidence\
  Reports\
```

### Required lifecycle

1. **Incoming.** New downloaded, transferred, generated, or otherwise untrusted/not-yet-accepted material enters `00-Incoming` or an equivalent environment-specific intake location. Do not execute it merely because it is present.
2. **Identity and hash.** Record the strongest available identity before review: filename, source/provenance, version/commit when applicable, size, SHA-256, and acquisition context.
3. **Under Review.** Move or copy the exact artifact into `10-Under-Review` for non-executing inspection, parser/schema checks, dependency/license review, static safety/security inspection, and scope/authority evaluation appropriate to the artifact.
4. **Hash reverify.** Recompute identity after review and before approval/staging. Unexpected byte drift returns the artifact to investigation; approval does not silently follow changed bytes.
5. **Approved.** Only an artifact that passes the applicable review gates and has execution authority may enter `20-Approved` or an equivalent controlled staging state.
6. **Controlled testing.** Execute only from an approved or explicitly owner-designated controlled test/evidence workspace, with protected state, rollback/cleanup, network/credential boundaries, and acceptance conditions already defined. Do not test directly against the only protected production/source copy when isolation is practical.
7. **Evidence.** Preserve test runners, hashes, logs, manifests, stdout/stderr captures, screenshots, generated evidence, and verification records under `Evidence` or an authorized project-specific evidence subfolder. Evidence from failed attempts is retained and superseded rather than erased.
8. **Reports.** Durable summaries, review reports, acceptance reports, and human-readable findings go under `Reports` or an authorized project-specific report location and must point back to the exact evidence/artifact identity they summarize.
9. **Hold.** Material with unresolved provenance, licensing, authority, dependency, security, environmental, or interpretation questions moves to `80-Hold`; HOLD is not approval to execute.
10. **Rejected.** Material that fails a hard gate or is intentionally denied moves to `90-Rejected` or an equivalent preserved rejection state. Rejection evidence and reason remain traceable.

### Test-workspace rule

A project may designate a project-specific controlled test lane under the quarantine root, including an `Evidence` subfolder used for generated runners and evidence. That designation does not weaken the lifecycle: external/untrusted artifacts still require intake and review before execution, and generated test harnesses must remain bounded to their declared protected-state and authority contract.

### Path and portability rule

The root path is configuration, not public doctrine. Skills and scripts should consume an explicitly declared quarantine root or project evidence path rather than inventing a new ad hoc download/test folder. Private workstation paths belong in private continuity/evidence, not public skill text.

### Non-regression rule

Quarantine is an isolation and evidence discipline, not proof that an artifact is safe. Promotion to `20-Approved` does not imply production readiness, release authority, adoption, or permission expansion. Each later gate remains separately governed.

## Workflow

### 1. Define the Objective
State the requested outcome, in-scope work, out-of-scope work, and the acceptance condition that demonstrates completion.

### 2. Establish Current State
Inspect the best available repository state, files, documentation, prior decisions, known-working versions, tests, logs, existing skills, workflows, and explicit human observations.

### 3. Identify Protected State
List behavior, assets, data, interfaces, configuration, security controls, recovery assets, and version history that must not regress. For narrow corrections, establish a forbidden-change boundary.

### 4. Determine Authority
Classify intended actions as already authorized, read-only/low risk, reversible, destructive, security-sensitive, credential-sensitive, publication-sensitive, or outside scope. Technical ability does not create permission.

### 5. Establish Quarantine/Test Workspace When Applicable
For consequential local testing, declare the environment's quarantine root and the exact controlled test/evidence path before executing new or not-yet-accepted material. Verify the candidate's intake/review/approval state and preserve its hash/provenance. If no suitable quarantine location exists, create or designate one only with appropriate filesystem authority; otherwise STOP rather than using a protected product/source directory as an improvised test area.

### 6. Choose the Smallest Effective Action
Prefer the least disruptive path that can satisfy the objective. Avoid broad refactors, dependency churn, platform changes, silent scope expansion, or replacement of working systems unless the evidence requires it.

### 7. Execute or Recommend
Perform authorized work or provide the smallest decision-ready recommendation. Preserve evidence and distinguish discovered defects from optional improvements.

### 8. Verify
Test the exact acceptance condition. Possible verification includes build success, automated tests, runtime behavior, integrity checks, hashes, regression checks, visual acceptance, permission/security checks, and human acceptance. Bind test evidence to the exact candidate identity and quarantine/test workspace used.

### 9. Recover or Stop When Needed
Stop when authority is missing, protected state cannot be preserved, quarantine or isolation requirements cannot be satisfied for consequential testing, the same failed path is repeating, evidence is insufficient for a consequential claim, the environment cannot support the requested result, risk exceeds the approved boundary, or public output would expose private/proprietary information.

### 10. Close the Loop
For meaningful work, report:

- **Outcome** — what was completed.
- **Changed** — what materially changed.
- **Protected** — what was intentionally left untouched.
- **Proof** — what evidence supports the result.
- **Quarantine/Test state** — where applicable, what artifact identity was tested, its quarantine state, and where evidence was preserved.
- **Open** — what remains unresolved.
- **Next decision** — only when a human choice is genuinely required.

### 11. Extract the Lesson
For non-trivial completed work, determine whether the lesson is likely to recur, what failed path should not be repeated, what evidence proved the solution, what should trigger STOP next time, and whether the lesson should become durable capability.

### 12. Close Meaningful Milestones
When the work reaches a meaningful phase boundary—such as owner acceptance, a protected/active baseline, RD transition, release promotion, major capability completion, significant defect closure, governance/security/recovery decision, or handoff—use active `signalproof-closeout` before starting the next development phase.

This requirement does **not** apply to every micro-commit or ordinary intermediate edit. It applies when the next work depends on the current milestone being durably reconstructable.

If the current canonical Build Ledger head cannot be verified, closeout must stage evidence rather than fabricate or hand-edit a canonical append. A human owner may explicitly record a justified deferral, but silence is not a deferral.

## Public / Private Boundary

Public Signalproof skills must be safe to publish.

Do not expose credentials, tokens, secrets, private keys, authentication material, private account data, unnecessary personal information, hidden prompts, confidential conversation history, proprietary implementation details, unreleased business/security information, or private filesystem details.

Use synthetic examples when needed. Private context may support authorized private work but must not silently cross into public output. Environment-specific quarantine roots and private evidence paths remain private unless explicitly authorized for publication.

## Suite Inheritance Rule

Every `signalproof-*` specialist skill must preserve this root contract unless an explicit, public, owner-approved suite version supersedes it.

A specialist skill may become more restrictive. It must not silently become less restrictive about:

- human authority;
- protected state;
- evidence classification;
- bounded change;
- verification;
- quarantine/testing isolation;
- recovery;
- milestone closeout and continuity;
- public/private separation;
- proof and continuity.

## Skill-Update Rule

A newly discovered lesson does **not** automatically become a Signalproof rule.

Reusable learning follows this path:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED/RETIRED`

Candidate updates should identify their evidence basis, scope, verification, approval status, version impact, and whether they supersede another rule. Approved changes should be versioned and traceable through the Signalproof Skills governance and registry records.

## Completion Criteria

This skill has been followed successfully when:

- the objective and acceptance condition are clear;
- current and protected state were respected;
- authority boundaries were not silently crossed;
- consequential local testing used the declared quarantine/test workspace and preserved artifact identity/evidence where applicable;
- the smallest effective action or recommendation was used;
- evidence and inference remained distinct;
- success claims are tied to the appropriate verification gate;
- recovery or STOP conditions were honored;
- meaningful milestone transitions were closed out before the next phase or explicitly deferred by human authority;
- public/private boundaries were preserved;
- the result leaves sufficient proof for continuity.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof`
- **Version:** `0.1.2`
- **Maturity:** Active public baseline
- **Domain:** Human-controlled AI collaboration, governed execution, continuity, quarantine testing, verification, recovery, and evidence
- **Created by:** Doc Reo / Signalproof
