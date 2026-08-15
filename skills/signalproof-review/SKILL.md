---
name: signalproof-review
description: Review completed or proposed work for scope fidelity, protected-state violations, architecture/contract drift, unnecessary complexity, dependency/provenance concerns, privacy/security hazards, recovery gaps, and mismatch with the governing plan. Use after implementation/debugging or before acceptance/release/closeout when the question is whether the work itself is sound—not merely whether a specific claim is proven.
---

# Signalproof Review

## Purpose

`signalproof-review` is the work-quality and change-integrity specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

Its central rule is:

> **Review the work against the approved intent, protected state, and governing contracts—not just whether the tests are green.**

A change can pass its stated tests and still be unsound because it expanded scope, altered protected behavior, weakened recovery, introduced an unjustified dependency, leaked private data, violated an interface contract, or created unnecessary complexity.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, bounded change, verification, recovery, milestone closeout, STOP conditions, public/private boundaries, proof, and continuity.

Review is primarily an inspection and decision-support discipline. It does not automatically authorize fixes, refactors, dependency replacement, release, merge, security clearance, or canonical Build Ledger mutation.

## Review Contract

1. **Recover the governing intent.** Identify the approved objective, plan, issue, acceptance criteria, protected state, and explicit out-of-scope boundaries.
2. **Inspect the actual change surface.** Review what changed, not what the author says changed.
3. **Compare scope to authority.** Flag material work that was not required, allowed, or separately authorized.
4. **Check protected-state fidelity.** Detect changes to protected files, behavior, APIs, data, security controls, rollback assets, or user-visible contracts.
5. **Check architecture and interface contracts.** Identify drift from accepted boundaries, ownership, layering, data flow, compatibility, or public APIs.
6. **Check complexity and maintainability proportionately.** Flag unnecessary abstraction, duplication, dead code, hidden coupling, avoidable indirection, or over-engineering that materially raises future cost or risk.
7. **Check dependencies and provenance.** New packages, runtimes, models, services, or external code should have a justified purpose and appropriate provenance/license/security handling for the project.
8. **Check privacy and security hazards without overstating review.** Surface exposed secrets, unsafe logging, excessive permissions, dangerous defaults, trust-boundary violations, or suspicious data flow. Do not call this a complete security audit unless the defined security review actually occurred.
9. **Check recovery and failure behavior.** Identify destructive paths without recovery, partial-state hazards, silent failure, error swallowing, or changes that invalidate rollback.
10. **Check evidence alignment.** Confirm that comments, PR text, docs, and acceptance claims do not exceed what was actually tested or observed.
11. **Prioritize findings.** Separate blockers/major findings from minor improvements and optional polish.
12. **Do not silently fix during review.** Recommend the smallest correction path; execute changes only when separately authorized.

## Review Workflow

### 1. Establish Review Basis

Collect the strongest available basis:

- objective / requirement;
- approved plan or bounded task;
- protected state;
- out-of-scope boundary;
- acceptance criteria;
- architecture/ADR/interface contracts;
- repository ref / commit / PR / artifact identity;
- prior verification results.

If no governing basis exists, state that limitation. Do not invent one merely to make review possible.

### 2. Inspect Actual Change Surface

Use the actual diff, changed-file inventory, package/manifest changes, migration/configuration changes, generated artifacts, permissions, or runtime effects that matter.

For each material change ask:

- Was this required?
- Was it allowed if needed?
- Was it out of scope?
- Does it touch protected state?
- What contract does it affect?
- What evidence proves the effect is acceptable?

### 3. Scope Fidelity

Classify material changes:

- **IN SCOPE** — required by the approved objective;
- **JUSTIFIED SUPPORTING CHANGE** — not directly requested but evidence shows it was necessary;
- **UNRESOLVED EXPANSION** — may be useful but lacks authority/evidence;
- **OUT OF SCOPE** — conflicts with the bounded task or explicit prohibition.

A useful improvement is not automatically authorized.

### 4. Protected-State Review

Check whether protected state changed intentionally or accidentally.

Examples:

- known-working subsystem modified during a narrow feature addition;
- public API signature changed without requirement;
- accepted UI behavior redesigned during a bug fix;
- dependency/runtime version altered without need;
- rollback target overwritten;
- persistent user data handling changed.

If protected state changed, require evidence and authority appropriate to that change.

### 5. Architecture / Contract Review

Check relevant project contracts such as:

- module boundaries;
- ownership/responsibility separation;
- local versus remote processing;
- API/interface compatibility;
- data/schema contracts;
- security/trust boundaries;
- storage/recovery rules;
- platform/runtime constraints;
- accepted ADRs.

Do not impose personal style preference as architecture policy.

### 6. Complexity / Maintainability Review

Review complexity only where it materially affects correctness, maintainability, recovery, or future change cost.

Potential findings:

- duplicated logic with divergent behavior;
- unnecessary framework or abstraction for a bounded feature;
- dead/unreachable code;
- hidden global state;
- broad coupling introduced by a narrow change;
- unclear ownership of new behavior;
- error paths that cannot be reasoned about;
- comments/docs that contradict implementation.

Avoid cosmetic nitpicking unless the project explicitly requires it.

### 7. Dependency / Provenance Review

For new external dependencies, ask:

- Is it actually needed?
- Is a built-in/existing dependency already sufficient?
- Is the source/version identifiable?
- Does the license fit project policy?
- Does it expand privileges, network access, or attack surface?
- Is it pinned/verified where required?
- Does it create an environment conflict or deployment burden?

A review finding may require `signalproof-investigate`, `signalproof-plan`, or a future `signalproof-security` specialist before acceptance.

### 8. Privacy / Security Hazard Review

Surface obvious or material hazards such as:

- secrets/tokens/credentials in source, logs, fixtures, examples, or public output;
- unsafe permission broadening;
- untrusted code execution;
- sensitive data sent to a new external service;
- disabled validation/authentication;
- insecure defaults;
- public/private boundary leakage.

Label the result accurately as review findings. Do not call absence of findings a security certification.

### 9. Recovery / Failure Review

Check whether the change:

- preserves or invalidates rollback;
- can leave partial/corrupt state;
- hides failures;
- retries destructively;
- overwrites the only good copy;
- makes recovery dependent on an unverified artifact;
- changes persistence without migration/recovery consideration.

### 10. Evidence / Claim Review

Compare implementation evidence with what the PR, changelog, docs, or author claims.

Examples:

- tests pass but target runtime was not executed;
- screenshot shows UI but does not prove backend action;
- static scanner shows no known finding but PR says “secure”;
- one fixture passes but documentation says “works on all supported hosts.”

Use `signalproof-verify` when the central question becomes whether a specific claim is actually proven.

### 11. Findings

Use these severities:

- **BLOCKER** — should prevent acceptance because it violates authority/protected state, creates serious correctness/privacy/security/recovery risk, or makes the stated objective unreliable.
- **MAJOR** — material defect, scope/architecture problem, unjustified dependency, maintainability risk, or evidence gap that should normally be corrected before acceptance.
- **MINOR** — real but bounded issue that does not invalidate the current objective.
- **NOTE** — useful observation or optional improvement, not a required change.

Do not inflate stylistic preferences into blockers.

For each finding state:

- severity;
- evidence;
- affected file/component/contract;
- why it matters;
- smallest recommended correction;
- whether correction is authorized or requires a new plan/decision.

### 12. Review Decision

Return one of:

- **PASS** — no material review finding blocks acceptance within the reviewed scope.
- **PASS WITH NOTES** — no blocker/major finding; minor or informational findings remain.
- **CHANGES REQUIRED** — one or more blocker/major findings should be resolved before acceptance.
- **BLOCKED** — insufficient artifacts, governing basis, or access to perform a responsible review.
- **STOP** — proceeding would knowingly violate authority, protected state, public/private boundaries, or recovery requirements.

PASS means “no material issue found within this review scope.” It does not mean universal correctness or security certification.

## Review vs Verify

`signalproof-review` asks:

> **Is the work itself sound and consistent with the governing intent and constraints?**

`signalproof-verify` asks:

> **Is a particular claim proven by the required evidence?**

Examples:

- A new exporter may pass its behavioral test (**Verify PASS**) while the implementation unnecessarily rewrites a protected CSV engine (**Review CHANGES REQUIRED**).
- A clean review may find no architectural problem (**Review PASS**) while target Windows runtime remains untested (**Verify UNVERIFIED** for the runtime claim).

Neither result silently substitutes for the other.

## Review Is Not Automatic Repair

When review finds a problem:

- use `signalproof-debug` for a reproducible defect that can be corrected within a bounded defect scope;
- use `signalproof-plan` when the correction materially changes scope/architecture/dependencies;
- use `signalproof-build` for an already bounded authorized correction;
- use `signalproof-investigate` when the finding's cause or impact is unclear;
- use `signalproof-verify` after correction when a material claim needs proof.

Do not silently edit the work merely because review identified a better design.

## Anti-Patterns

Fail this skill when the reviewer:

- approves solely because tests are green;
- reviews only the PR description and not the actual change surface;
- ignores out-of-scope changes because they seem useful;
- treats personal style as an architectural requirement;
- misses a new dependency or external-service boundary;
- overlooks secrets/private data in public or logged material;
- calls the work secure because no obvious hazard was noticed;
- recommends a broad rewrite when a bounded correction is sufficient;
- silently performs fixes without authority;
- erases earlier failures or contradictory evidence;
- treats Review PASS as proof of unexecuted runtime/release/security gates.

## Completion Criteria

Review is complete when the governing intent, actual change surface, scope fidelity, protected-state effects, relevant architecture/contracts, dependency/provenance changes, privacy/security hazards, recovery behavior, evidence alignment, prioritized findings, bounded review decision, and smallest responsible correction path are explicit enough for another competent human or agent to decide whether the work should be accepted, corrected, re-planned, or stopped.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-review`
- **Version:** `0.1.0-rc1`
- **Maturity:** Initial public release candidate
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-plan`, `signalproof-build`, `signalproof-debug`, `signalproof-verify`, `signalproof-closeout`
- **Domain:** Scope review, change integrity, architecture/contract fidelity, maintainability, dependency/provenance review, privacy/security hazard review, recovery review
- **Created by:** Doc Reo / Signalproof
