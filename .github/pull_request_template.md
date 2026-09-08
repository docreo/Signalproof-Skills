## What changed

Describe the bounded change.

## Why

State the problem, requirement, evidence, or approved candidate that justifies the change.

## Scope boundary

Identify what this change intentionally does not modify.

## Evidence class

Select or describe the strongest applicable evidence:

- Artifact-Backed Fact
- Runtime-Verified Fact
- Human-Observed Fact
- Design Authority
- Inference
- Proposal

## Verification

Describe tests, checks, inspection, or acceptance evidence used to verify the change.

## Protected state / recovery

Describe protected behavior, compatibility considerations, and rollback or reversion path where practical.

## Lifecycle metadata

Use this block when lifecycle reconciliation applies. See `GOVERNANCE/PR-LIFECYCLE-METADATA.md`.

```yaml
lifecycle_state: NOT_APPLICABLE
successor_pr: null
blocked_by: []
review_due: null
promotion_gate: null
evidence_status: NOT_APPLICABLE
```

## Governance checklist

- [ ] The change is bounded to the stated scope.
- [ ] Facts and inferences are distinguished.
- [ ] No credentials, secrets, private customer data, or unnecessary private infrastructure details are included.
- [ ] Relevant tests/checks were run or the absence of a test is explicitly documented.
- [ ] Documentation does not claim more than the evidence establishes.
- [ ] Skill lifecycle/registry/changelog/provenance updates are included when applicable.
- [ ] Lifecycle metadata is completed when Candidate/promotion/supersession/blocking state applies.
- [ ] A meaningful milestone will be closed out before the next development phase when applicable.
