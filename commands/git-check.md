# `git-check` - Active Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`git-check` is the deterministic, read-only Git state preflight for the current bounded workstream.

> **Identify the exact repository, verify current ref/HEAD/worktree/upstream state, expose divergence or stale evidence, and return a compact Git Check without changing Git state.**

It answers whether repository-backed work may safely rely on the current checkout. It does not design, build, commit, merge, pull, push, reset, stash, clean, checkout, switch, or grant authority for those actions.

## Accepted route

```text
/dsp git-check [optional repository or workstream]
/dsp git check [optional repository or workstream]
dsp-git-check [optional repository or workstream]
```

## Mandatory sequence

1. Resolve the exact relevant repository without guessing across materially different candidates.
2. Read repository root, current branch or detached HEAD, exact HEAD object, worktree/index status, remotes, configured upstream, and ahead/behind state where available.
3. Distinguish tracked modifications, staged changes, untracked files, conflicts, detached state, missing upstream, unreachable remote, and clean synchronized state.
4. Compare any claimed Git basis to live evidence; mark stale or contradictory claims explicitly.
5. Run only read-only Git/network operations. A remote fetch is not implicit because it mutates remote-tracking refs; use `git ls-remote` when current remote observation is required and authorized network access exists.
6. Emit the compact Git Check below.

## Output contract

```text
GIT CHECK
Repository: <absolute root>
Branch/ref: <branch, tag, or detached>
HEAD: <full object id>
Worktree: CLEAN / DIRTY / CONFLICTED
Index: CLEAN / STAGED
Untracked: <count or UNKNOWN>
Upstream: <remote/ref or NONE>
Ahead/behind: <A/B, UNKNOWN, or N/A>
Remote observation: <current evidence, NOT CHECKED, or UNREACHABLE>
Claimed basis: MATCH / STALE / NOT PROVIDED
Safe next route: <none, investigate, design-git, build-git, or explicit owner decision>
STOP reason: <none or exact blocker>
```

## Deterministic safety rules

- Never treat a clean worktree as proof that local HEAD equals the remote branch.
- Never treat cached remote-tracking refs as a current network observation without labeling their age/limits.
- Never hide staged, untracked, conflicted, detached, missing-upstream, submodule, or nested-repository state.
- Never normalize a repository identifier or object ID into a different value.
- Never run mutation commands under this command.
- If the directory is not a Git repository, return `STOP: NOT_A_REPOSITORY` rather than inventing Git state.
- If multiple repositories could govern the workstream, return `STOP: AMBIGUOUS_REPOSITORY` with the smallest disambiguation.

## Authority boundary

`git-check` grants read-only inspection only. It does not authorize file edits, Git mutation, publication, deployment, release, credential use beyond already-authorized read access, or canonical Build Ledger writes.

## Completion

Complete when the exact Git basis and any blocker are reported with live command evidence. Route implementation work to `design-git`, `build-git`, or another explicitly authorized command.
