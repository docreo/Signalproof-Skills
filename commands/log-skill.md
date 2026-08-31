# `log-skill` — Active Operator Command V0.3 Candidate

**Status:** CANDIDATE CHANGE TO ACTIVE COMMAND  
**Version:** 0.3.0-candidate  
**Owner:** Doc Reo

## Purpose

`log-skill` is the Signalproof operator shorthand for preserving and synchronizing build, milestone, failure, recovery, verification, and reusable learning state. It coordinates Closeout, Learn, Verify, Document, Handoff, Router, project-repository build documentation, and the Signalproof Library architecture while preserving public/private evidence boundaries and Build Ledger chronology.

> **Logging does not reserve a canonical event number. Canonical chronology is assigned only by a verified chain-safe append.**

> **A Build Ledger summary is not a substitute for the project's durable build record. When a governed project repository exists, `log-skill` must preserve enough project-local documentation to reconstruct what was built, what failed, what changed, what fixed it, what remains unresolved, and how the current state was verified.**

## Forms

### `log-skill`

Preserve/synchronize current build milestone or learning state without claiming closure unless closure is established and authorized.

Required behavior:

- identify the work unit, project/repository, milestone, and evidence state;
- determine whether a governed project repository exists and identify its documentation destination;
- preserve a durable project build record when the repository is available and the write is authorized;
- record configuration and environment facts necessary to reproduce or understand the build, without exposing secrets;
- record exact versions, pins, commits, checksums, images, architectures, providers, and relevant dependency state when known;
- preserve commands/procedures that materially established the current state when safe to record;
- preserve failures, errors, warnings, blocked paths, false starts, and unsuccessful retries rather than rewriting them away after success;
- record known errors checked before or during the work, including source/reference and whether each was applicable, avoided, reproduced, fixed, mitigated, superseded, or still open;
- record the fix/workaround that actually changed the outcome, including verification evidence and rollback/recovery implications;
- distinguish observed facts from assumptions, projections, sandbox-only observations, and unverified state;
- record security/hardening decisions, permissions, exposure changes, and protected-state decisions that materially affect the build;
- record financial/provider constraints when they materially govern the implementation, without exposing account secrets or private billing data;
- preserve rollback/reference checkpoints and recovery paths where they exist;
- record current blockers, unresolved risks, deferred work, and next bounded step;
- deduplicate existing records where available;
- extract reusable learning under lifecycle governance;
- run the Skill Architecture Check when a Skill is created or materially changed;
- publish only public-safe records and preserve private evidence separately;
- stage when canonical append is unavailable/unnecessary/unauthorized;
- do not reserve a C-number or auto-activate a candidate.

## Project Build Record

When the work belongs to a governed software, infrastructure, model, media, service, or integration repository, `log-skill` must maintain or append a project-local build record unless the project explicitly routes build documentation elsewhere.

The project build record should be sufficient for another authorized builder to answer:

1. What was the starting state?
2. What exact environment/provider/runtime was used?
3. What was installed, configured, changed, or intentionally skipped?
4. Which versions, commits, checksums, images, or dependency locks matter?
5. What commands or procedures established the state?
6. What failed or behaved unexpectedly?
7. Which known errors/advisories were checked?
8. Which known errors were actually encountered?
9. What fix, workaround, or decision resolved each encountered problem?
10. What verification proved the fix or milestone?
11. What security, cost, privacy, permission, or network constraints governed the build?
12. What protected baseline/rollback point exists?
13. What remains incomplete, unresolved, or intentionally deferred?
14. What is the next bounded action?

### Minimum build-record sections

Use the project's established format where one exists. Otherwise preserve at least:

- identity / date / milestone / status;
- environment and architecture;
- source/version/pin/checksum state;
- configuration and intentional exclusions;
- build/change chronology;
- failures and errors;
- known-errors/advisory preflight;
- fixes/workarounds and why they changed the outcome;
- verification/evidence summary;
- security/hardening state;
- cost/provider constraints where material;
- rollback/recovery checkpoint;
- unresolved items / blockers / next step;
- related commits, branches, PRs, deployment records, and Build Ledger references where authorized.

### Failure preservation rule

A later PASS must not erase a prior failure.

Preserve at minimum:

`symptom -> context -> failed path -> discriminating evidence -> material change/fix -> verification -> residual risk`

When an attempted path is known-bad or provider-invalid, record it explicitly so another builder does not repeat it unchanged.

### Known-Errors rule

For consequential build/debug/update/recovery/deployment/package/release work, record the Known-Errors preflight result in the project build record:

- canonical/internal known-error source checked;
- relevant vendor/upstream advisories/issues checked where authorized;
- applicable known errors;
- avoided known-bad paths;
- encountered known errors;
- fixes/workarounds used;
- unresolved known errors;
- evidence that a retry materially differed from a previously failed path.

Do not fabricate an authoritative known-error catalog or claim a source was checked when it was unavailable.

### Project repo vs Build Ledger

The two records have different jobs:

- **Project repository build record:** durable, project-specific technical reconstruction and operating knowledge.
- **Private Build Ledger:** governed chronology, provenance, evidence linkage, authorization state, recovery/protected-state context, and canonical/staged event handling.

`log-skill` should synchronize them when both are available, but neither automatically supersedes the other.

If the project repository is temporarily unavailable, unauthenticated, or unsafe to mutate, preserve the build record as staged/private evidence and mark project-repository synchronization as pending. Do not create a divergent replacement history merely to make the record appear published.

## Build Documentation Continuity

`log-skill` is cumulative. A long-running build should not be documented only at final completion.

At meaningful milestones, preserve newly learned state so that session loss, builder handoff, machine failure, or context truncation does not erase:

- successful procedures;
- failure history;
- known-error findings;
- fixes and workarounds;
- protected decisions;
- verification evidence;
- current blockers;
- next-step state.

Repeated `log-skill` runs should update or append by stable build/work identity rather than creating contradictory duplicate histories.

### `log-skill close`

Request full immediate closeout for work that is actually complete.

Route:

`Validate -> Record -> Extract -> Govern -> Closeout -> Verify`

Before closure, synchronize the project build record through the final verified state where applicable.

Before canonical append, verify actual ledger identity/head/chain/projection, deduplicate stable identities, use approved chain-safe tooling, and run native/original verification after append. Otherwise preserve a staged/noncanonical closeout.

### `log-skill close-when-complete`

Latch the current milestone as closure-required before phase transition while leaving it open. Preserve acceptance criteria and project build-documentation state; when complete, route through `log-skill close`. Never reserve a future sequence.

### `log-skill close C###`

Strict conditional close. The requested number is an assertion, never a reservation. Proceed only when verified canonical chronology makes it the next valid sequence and all normal gates pass; otherwise STOP.

## Skill Architecture Check

When the work creates or materially changes a `SKILL.md`:

1. measure exact UTF-8 bytes before and after where a prior version exists;
2. classify the new file using the Signalproof Skill Budget;
3. check responsibility cohesion and duplicate doctrine, not size alone;
4. prefer root inheritance, registries, loops, schemas, tests, policies, or separate routeable specialists over repeated prose;
5. at **12,000–14,999 bytes**, require decomposition/conciseness review before material expansion;
6. at **15,000+ bytes**, block promotion/material expansion until the Skill is refactored below the ceiling;
7. verify Router/registry/test effects of any split.

Record when applicable:

- `skill_bytes_before` / `skill_bytes_after`;
- budget status before/after;
- atomicity/decomposition decision;
- extracted/new Skill candidates;
- duplicate doctrine removed;
- routing changes;
- tests and protected behavior;
- supersession/rollback path.

A small Skill can still require decomposition if it contains independently routeable responsibilities. A large Skill must not be shortened by deleting required governance merely to satisfy the budget.

## Preview / Idempotency

Projected C-labels remain **PROJECTION / PREVIEW / NOT CANONICAL** until native append assigns them. Repeated `log-skill` verifies/synchronizes stable identities rather than creating duplicates.

Project build records should likewise use stable work/milestone identity and append/update deterministically rather than silently replacing prior failure history.

## Public/private boundary

Public Signalproof-Skills may contain public-safe lessons, tests, governance records, and candidate changes. Project repositories may contain project-appropriate technical build records according to their visibility and governance. Private Build Ledger evidence may contain internal chronology, hashes, recovery, and staged closeout details.

Never leak private ledger heads, private infrastructure identifiers, local secret paths, credentials, customer/private data, auth material, billing secrets, or recovery internals into a less-protected repository without authority.

Sanitize project build records while preserving enough technical detail to reproduce and debug the build.

## Lifecycle

Outputs are not automatically Active:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`

A project build record may establish evidence for a Skill Candidate but does not itself activate that Skill.

## STOP conditions

STOP when chronology cannot be verified, a projection is treated as canonical, a duplicate would be appended, completion is falsely claimed, failure history would be erased, a known-error check is falsely claimed, private evidence would leak publicly, a project repository write would create unsafe/divergent history, an output is auto-promoted, a changed Skill violates the 15,000-byte ceiling, or command scope would expand into unauthorized canonical mutation.
