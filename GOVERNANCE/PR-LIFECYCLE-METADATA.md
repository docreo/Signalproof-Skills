# Pull Request Lifecycle Metadata

## Purpose

Use a small machine-readable metadata block in pull requests when a change represents a Candidate, Test, Approval, Activation, Deprecation, Retirement, supersession, or blocked workstream state.

This does not replace the narrative PR body. It makes lifecycle reconciliation and backlog review less ambiguous.

## Canonical fields

```yaml
lifecycle_state: CANDIDATE
successor_pr: null
blocked_by: []
review_due: null
promotion_gate: null
evidence_status: PARTIAL
```

## Field contract

### `lifecycle_state`

Allowed values:

- `DISCOVERED`
- `CANDIDATE`
- `TESTED`
- `APPROVED`
- `ACTIVE`
- `DEPRECATED`
- `RETIRED`
- `BLOCKED`
- `SUPERSEDED`
- `NOT_APPLICABLE`

This field records lifecycle state only. It does not itself authorize promotion or activation.

### `successor_pr`

Use the full repository-relative PR reference such as `docreo/Signalproof-Skills#123` when another PR supersedes the current work. Otherwise use `null`.

### `blocked_by`

List exact issue/PR/dependency identifiers that prevent progression. Use `[]` when there is no known blocker.

### `review_due`

Optional ISO date (`YYYY-MM-DD`) for a planned lifecycle review. Use `null` when no date is assigned.

### `promotion_gate`

State the remaining exact gate required before lifecycle advancement, or `null` when not applicable.

### `evidence_status`

Allowed values:

- `NONE`
- `PARTIAL`
- `SUFFICIENT_FOR_CURRENT_STATE`
- `STALE`
- `NOT_APPLICABLE`

## Safety rules

- Do not infer `APPROVED` or `ACTIVE` merely because CI passes.
- Do not mark a PR `SUPERSEDED` without identifying the successor when one exists.
- Do not silently close ambiguous Candidate work to reduce backlog count.
- Candidate volume is not itself a defect; unresolved lifecycle meaning is the reconciliation problem.
- Preserve historical PR discussion even when a newer PR supersedes the work.
