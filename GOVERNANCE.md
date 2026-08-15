# Signalproof Skills Governance

## Purpose

Signalproof Skills is a governed public skill suite. The repository is not a prompt dump. Skills and skill updates are expected to be versioned, reviewable, evidence-aware, reversible where practical, and consistent with the Signalproof root contract.

## Canonical Branch

`main` is the protected canonical branch.

Normal changes should be developed on a non-main branch and proposed through a pull request.

The main branch ruleset is intended to:

- require pull-request flow;
- require review-thread resolution;
- block branch deletion;
- block force pushes;
- keep the bypass list empty;
- avoid requiring status checks that do not yet exist.

A status check should become required only after the corresponding CI workflow exists and has successfully run.

## Skill Lifecycle

Signalproof skill learning follows this maturity path:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED -> RETIRED`

### Discovered
A potentially reusable lesson or rule has been identified.

### Candidate
The lesson has been translated into a proposed skill addition or modification with scope and rationale.

### Tested
The candidate has evidence showing that it works for its intended acceptance condition and does not knowingly violate protected behavior.

### Approved
An authorized human owner or maintainer has accepted the change for the suite.

### Active
The approved change is present in a released or accepted suite version.

### Deprecated
The rule remains available for compatibility or history but should not be preferred for new work.

### Retired
The rule is no longer active and has a documented successor or retirement reason where applicable.

## Update Intake

A build, incident, test, research finding, or agent observation does not automatically change a public skill.

Candidate updates should record, as appropriate:

- candidate ID;
- affected skill;
- proposed change;
- problem or lesson that triggered it;
- evidence class and source;
- test or verification performed;
- protected-state considerations;
- public/private review;
- approval status;
- target version;
- superseded rule, if any;
- rollback or reversion path where practical.

## Evidence Discipline

Signalproof uses distinct evidence classes:

- Artifact-Backed Fact
- Runtime-Verified Fact
- Human-Observed Fact
- Design Authority
- Inference
- Proposal

A lower or different evidence class must not be silently reported as a stronger one.

## Root Contract

Specialist skills inherit the root `skills/signalproof/SKILL.md` contract.

Specialists may impose stricter safety, verification, or authority requirements. They may not silently weaken the root contract.

## Public Safety Boundary

Public skills must not include:

- credentials, tokens, secrets, or private keys;
- private account or customer data;
- hidden prompts or private conversation history;
- unnecessary personal identifiers;
- unreleased security details that would create avoidable risk;
- proprietary implementation detail that is not intended for release;
- private filesystem or infrastructure details unless explicitly approved and necessary.

Synthetic examples should be preferred where they preserve the lesson without exposing private material.

## Change Control

The root `signalproof` skill should change less frequently than specialist skills.

Changes to root principles should receive heightened review because they affect suite-wide behavior.

Specialist skills may evolve faster when supported by repeated evidence and approved through the same lifecycle.

## Release Principle

A skill being present in a branch does not make it an approved Signalproof standard.

Only accepted changes merged into the protected canonical branch and identified in the registry/changelog should be treated as active public suite state.
