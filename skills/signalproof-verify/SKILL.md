---
name: signalproof-verify
description: Verify whether a specific claim is actually supported by the available evidence without silently upgrading static, compile, automated, runtime, human-observed, security, signing, or release evidence. Use after builds, fixes, tests, reviews, or before acceptance/release/closeout when claims need explicit PASS, PARTIAL, FAIL, BLOCKED, or UNVERIFIED status.
---

# Signalproof Verify

## Purpose

`signalproof-verify` is the evidence-verification specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

Its central rule is:

> **Verify the claim that was made—not a weaker substitute, and not a stronger conclusion than the evidence supports.**

Verification is about claim/evidence alignment. A compile PASS does not prove runtime behavior. A runtime PASS does not prove security readiness. A human observation is valid evidence at its own class, but it is not silently converted into independent reproduction.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, bounded change, recovery, milestone closeout, STOP conditions, public/private boundaries, proof, and continuity.

Verification may inspect or execute authorized tests. It does not create authority to modify systems, release software, change security policy, or promote a candidate merely because evidence was evaluated.

## Verification Contract

1. **State the exact claim.** Do not verify a vague approximation.
2. **Identify the required evidence class.** Match the verification method to the claim.
3. **Inventory the evidence actually available.** Separate artifacts, runtime observations, human observations, design authority, inference, and proposals.
4. **Check evidence provenance and relevance.** Evidence must apply to the actual artifact/version/environment being claimed.
5. **Check protected state where the claim depends on non-regression.** Verify hashes, behavior, manifests, or regression tests where proportionate.
6. **Do not infer untested gates.** Compile, unit, integration, runtime, visual, security, signing, packaging, deployment, owner acceptance, and production readiness remain distinct.
7. **Reproduce when required and authorized.** If the claim requires runtime evidence and runtime testing is available, run the appropriate test rather than substituting static inspection.
8. **Preserve conflicting evidence.** A newer PASS may supersede operational state but must not erase earlier failures or unresolved contradictions.
9. **Return a bounded status.** PASS, PARTIAL, FAIL, BLOCKED, or UNVERIFIED must describe the exact claim.
10. **State what remains unverified.** Verification is incomplete if the reader cannot tell what the evidence does not prove.

## Verification Workflow

### 1. Claim

Rewrite the claim into a testable statement.

Examples:

- “The project compiles on .NET 8.”
- “The transport no longer overwrites an active user seek.”
- “The installer preserves user data during repair.”
- “The application is production-ready.”

If the claim contains multiple gates, split it into separate claims.

### 2. Required Evidence

Determine the minimum evidence needed.

| Claim type | Typical required evidence |
|---|---|
| File/config exists | Artifact-backed inspection |
| Source compiles | Compile execution |
| Unit behavior works | Automated test execution |
| Integrated feature works | Runtime/integration execution |
| UI appears/behaves correctly | Runtime + visual/human observation as appropriate |
| Protected bytes unchanged | Hash/manifest comparison |
| Rollback works | Recovery execution against the applicable candidate/baseline |
| Security-ready | Defined security gates, testing/review appropriate to the claim |
| Signed | Signature verification |
| Production-ready | All project-defined production acceptance gates, not one substitute gate |

Project-specific acceptance authority outranks generic examples.

### 3. Evidence Inventory

For each item, record:

- evidence class;
- source/artifact;
- version/build/commit/environment identity;
- date/time when materially relevant;
- test/result;
- limitations.

Reject evidence that applies to the wrong artifact or environment unless the difference is explicitly justified.

### 4. Evidence Integrity

Where relevant, check:

- artifact SHA-256 or immutable identity;
- manifest coverage;
- repository ref/commit;
- test fixture identity;
- whether logs/results correspond to the same run/artifact;
- whether evidence was generated before or after the claimed change;
- whether a cached/stale result is being reused incorrectly.

### 5. Execute Missing Verification

When authorized and practical, run the smallest test that can prove or disprove the claim.

Do not rebuild unrelated components merely to verify one bounded claim.

If the required environment, credential, hardware, human observation, or external service is unavailable, mark the claim BLOCKED or UNVERIFIED rather than manufacturing certainty.

### 6. Non-Regression Check

If the claim includes “fixed without breaking X,” verify both:

- the target behavior; and
- the named protected behavior/state.

A target PASS with protected-state regression is not a verification PASS for the combined claim.

### 7. Classify Result

Use:

- **PASS** — required evidence supports the exact claim and no material contradictory evidence remains open.
- **PARTIAL** — some subclaims/gates pass, but the full claim is not established.
- **FAIL** — evidence disproves the claim or a required acceptance condition fails.
- **BLOCKED** — the required verification cannot currently be executed because a necessary environment/input/authority is unavailable.
- **UNVERIFIED** — no adequate evidence establishes the claim, even if no failure is known.

Do not use PASS to mean “probably.”

### 8. Verification Report

Return:

- **Claim**
- **Required evidence**
- **Evidence found**
- **Evidence class**
- **Protected-state result** when applicable
- **Status**
- **What is proven**
- **What is not proven**
- **Conflicts / limitations**
- **Next verification** only if genuinely required

## Multi-Gate Claims

Claims such as “production-ready,” “secure,” “release-ready,” or “fully fixed” usually contain multiple gates.

Break them down rather than allowing one successful test to stand in for the whole claim.

Example:

```text
PRODUCTION READY?
├── compile          PASS
├── unit tests       PASS
├── integration      PASS
├── target runtime   UNVERIFIED
├── installer        UNVERIFIED
├── recovery         UNVERIFIED
├── security         UNVERIFIED
├── signing          UNVERIFIED
└── owner acceptance PENDING

OVERALL: UNVERIFIED / NOT ESTABLISHED
```

The exact gates depend on the project.

## Evidence Conflict Rule

When evidence conflicts:

1. confirm whether the artifacts/environments are actually the same;
2. prefer direct primary evidence over summaries;
3. preserve both results if they represent different times or conditions;
4. identify which evidence controls the current claim;
5. do not average contradictions into a false PASS.

## Human Observation Rule

Human-observed evidence is legitimate.

Use it accurately:

- “Owner observed transport working on Windows” may be Human-Observed Fact.
- It is not automatically “independently runtime-reproduced by this verifier.”

If human acceptance is itself the required gate, an authorized owner's acceptance can satisfy that gate without pretending it is another evidence class.

## Verification Is Not Review

`signalproof-verify` asks:

> **Is this claim proven by the required evidence?**

A future `signalproof-review` specialist asks a different question:

> **Is the work itself sound, scoped correctly, maintainable, safe, and consistent with the governing architecture?**

A change may verify its stated test while still deserve review for design or maintainability concerns.

## Verification Is Not Release Authority

A PASS does not automatically:

- merge a pull request;
- promote a baseline;
- replace a rollback;
- publish externally;
- declare security clearance;
- sign software;
- authorize production deployment.

Those actions remain governed by their own authority and acceptance gates.

## Anti-Patterns

Fail this skill when the verifier:

- calls runtime behavior proven because code compiled;
- calls production-ready because unit tests passed;
- treats a screenshot as proof of backend execution;
- ignores a protected-state regression because the target test passed;
- uses evidence from a different version without saying so;
- converts Human-Observed Fact into independent runtime verification;
- treats absence of a known failure as PASS;
- hides contradictory evidence;
- invents a missing test result;
- adds release authority to a verification result.

## Completion Criteria

Verification is complete when the exact claim, required evidence, available evidence, evidence class, artifact/environment identity, protected-state result, conflicts/limitations, and bounded status are explicit enough that another competent human or agent can tell both what has been proven and what remains unproven.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-verify`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Claim verification, evidence grading, acceptance gates, non-regression proof, evidence conflict resolution
- **Created by:** Doc Reo / Signalproof
