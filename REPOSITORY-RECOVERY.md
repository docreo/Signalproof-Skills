# Repository Recovery Procedure

## Scope

This procedure covers recovery of Git repository contents and history for `Signalproof-Skills`. It does not by itself back up all GitHub-hosted metadata such as issues, pull-request discussions, rulesets, repository settings, security advisories, Actions history, or other service-side state.

## Safe authentication

Never embed a PAT, password, or other secret in a clone URL, shell history, script, log, or tracked file.

Use an already authorized credential manager, GitHub CLI authentication, or separately governed SSH credential path.

## Mirror and bundle

```bash
git clone --mirror https://github.com/docreo/Signalproof-Skills.git Signalproof-Skills.git
git -C Signalproof-Skills.git bundle create Signalproof-Skills.bundle --all
git bundle verify Signalproof-Skills.bundle
```

`git bundle verify` is the required bundle-integrity check. Do not substitute a partial `verify-pack` summary.

## Recovery test

Restore into a clean test path first:

```bash
git clone Signalproof-Skills.bundle recovery-test
cd recovery-test
git fsck --full
git log --oneline -n 10
```

Verify expected refs, protected commits, and required repository files before declaring the recovery artifact usable.

## Remote handling

A clone restored from a local mirror or bundle may contain a local-origin remote. Do not assume `git remote -v` will be empty. Inspect and intentionally set the desired GitHub remote only when reconnection is required and authorized.

## GitHub metadata boundary

A Git mirror/bundle preserves Git data, not the complete GitHub service state. Maintain a separate metadata record/export process when full service recovery is required, including as applicable:

- repository settings;
- rulesets/branch protections;
- issues and pull requests;
- labels and milestones;
- releases;
- security-advisory state;
- workflow configuration and external configuration references.

Do not describe a Git bundle alone as a complete GitHub backup.

## Destructive-action rule

Recovery testing must never overwrite the working repository or protected baseline. Restore to a separate location first. Any protected-main restoration requires separate authorization and verification.
