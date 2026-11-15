---
name: signalproof-hermes-vps-builder
description: Build, harden, verify, document, back up, and recover a Hermes Agent VPS through a human-operated terminal while preserving least privilege, pinned authority, known-error controls, private access, reproducible evidence, and novice-readable instructions.
---

# Signalproof Hermes VPS Builder

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0  
**Parent:** `signalproof` 0.1.1+  
**Primary collaborators:** `signalproof-build`, `signalproof-build-spawn-debug`, `signalproof-known-errors`, `signalproof-security`, `signalproof-recovery`, `signalproof-document`, `signalproof-build-capsule`

## Purpose

This Skill captures the reusable operating method developed while building a governed Hermes Agent VPS with a human who may not be comfortable with Linux, PowerShell, terminals, service managers, or command-line debugging.

Its core outcome is not merely "install Hermes." It is:

> **A human can build and recover a private, least-privilege Hermes VPS by executing small labeled command blocks, returning evidence, and allowing the AI builder to localize and correct failures without surrendering human authority.**

The Skill is provider-neutral where possible. Hostinger was the first validated target, but the method should generalize to ordinary Ubuntu VPS providers when their recovery and firewall controls are understood.

## Operating Model

```text
HUMAN OPERATOR
  -> receives ONE clearly labeled shell context + bounded command block
  -> executes locally or on VPS
  -> returns exact output / screenshot

AI BUILDER
  -> reconciles current Git + Known Errors
  -> explains what the block changes and what it must not change
  -> interprets returned evidence
  -> localizes failures before changing the plan
  -> produces the smallest materially changed next block

SIGNALPROOF GOVERNANCE
  -> protects secrets, recovery, least privilege, network boundary,
     pinned source authority, evidence honesty, and stop conditions
```

The human is not treated as a remote shell. The AI does not assume commands ran merely because they were proposed.

## Shell-Context Rule

Every executable block must identify the exact environment before the block, for example:

- `WINDOWS POWERSHELL — local PC`
- `VPS LINUX — spadmin`
- `VPS LINUX — hermes`
- `VPS LINUX — root`

Never paste Bash into Windows PowerShell or PowerShell into Linux without an explicit translator step.

For novice operators, prefer one complete copy/paste block over fragmented commands when the operation is safely atomic. Keep secrets out of pasted output and explicitly warn when a prompt expects a password/passphrase.

## Build Sequence

### Gate 0 — Authority + Known Errors

Before consequential mutation:

1. resolve the exact Hermes repository/release/tag/commit;
2. check Signalproof Known Errors and current upstream issues/releases;
3. classify relevant failures and mitigations;
4. establish protected state and rollback;
5. record the exact target OS/resources and whether Docker is actually part of the accepted design;
6. STOP rather than silently following a stale design when actual runtime choices differ.

### Gate 1 — Clean VPS Baseline

Capture before mutation:

- OS release and kernel;
- CPU/RAM/disk/swap;
- current listeners;
- current SSH policy;
- provider snapshot/recovery capability;
- firewall state;
- package baseline.

Create a provider snapshot or equivalent recovery point before hardening when available.

### Gate 2 — Human Admin Path

Create and verify a non-root administrative account before weakening root/password access.

Required properties:

- dedicated SSH key path documented on the operator machine;
- second administrative path proven before password login is disabled;
- root retained only as emergency recovery according to the accepted policy;
- no private SSH key copied to the VPS or Git;
- explicit recovery route if SSH hardening locks out the operator.

### Gate 3 — Host Hardening

Typical Ubuntu baseline:

- patch OS;
- install required build/runtime tools;
- configure swap if justified;
- UFW or equivalent deny-incoming policy with only intended ports;
- Fail2Ban or equivalent SSH brute-force protection where applicable;
- SSH public-key authentication; disable password and keyboard-interactive auth after alternate access is proven;
- verify listeners after every network-affecting change.

Do not confuse provider firewall state with host firewall state. Treat them as separate layers.

### Gate 4 — Dedicated Hermes Runtime Identity

Create a dedicated unprivileged service account for Hermes.

Required invariants:

- no sudo membership;
- locked password unless a documented exception exists;
- owned Hermes home with restrictive permissions;
- Hermes runtime does not install system packages through sudo;
- administrative dependencies are installed separately by the admin account.

### Gate 5 — Pinned Hermes Installation

Install from an exact release/commit rather than moving `main` when reproducibility matters.

Record:

- release/version;
- exact commit SHA;
- installer URL/path and SHA-256 when practical;
- Python/Node versions established by the installer;
- install method;
- clean Git status after install.

If the installer falls back from a locked dependency set to an unlocked resolver, treat that as a supply-chain condition requiring investigation and reconciliation before acceptance.

### Gate 6 — Locked Dependency Reconciliation

When upstream installation unexpectedly bypasses its lockfile:

1. preserve the installed environment as evidence;
2. do not regenerate upstream's lockfile locally;
3. verify the committed lock with the project's intended configuration;
4. resynchronize the venv from the accepted lock;
5. run dependency compatibility checks;
6. verify exact source commit again.

The first validated case used `uv lock --check` plus `uv sync --locked` after isolating ambient `uv` configuration while preserving project configuration.

### Gate 7 — Single Supervised Gateway

Before activation:

- prove no gateway process and no state DB writer exists;
- install exactly one service owner for the selected Hermes home;
- prefer user-level systemd for an unprivileged Hermes account when appropriate;
- enable linger only deliberately;
- inspect the generated unit before first activation;
- prevent unbounded restart loops with a bounded restart policy when upstream disables rate limiting;
- start once, verify PID, service state, listeners and state DB;
- perform one controlled restart and distinguish intentional supervised restart accounting from a crash loop;
- observe a stability window with unchanged PID/restart count afterward.

### Gate 8 — Accepted Core Snapshot

After the gateway is accepted:

- create a transaction-consistent SQLite backup rather than blindly copying a live WAL database;
- preserve config/service/drop-in/source identity needed for recovery;
- hash the archive;
- keep archive permissions restrictive;
- exclude or treat runtime sockets and ephemeral locks as non-restorable state;
- verify the gateway remained stable during snapshot creation.

Never commit live secrets, private keys, raw `.env`, session content, customer data, or provider credentials to Git.

### Gate 9 — Private Dashboard

Default to loopback-only dashboard access:

```text
VPS dashboard 127.0.0.1:9119
  <- SSH local port forward / private tunnel
  <- operator browser on local machine
```

Verify:

- web/PTY dependencies;
- port unused before start;
- one persistent dashboard service;
- exact loopback listener after start and restart;
- no new public listener;
- gateway identity/restart count unchanged;
- browser acceptance through the tunnel.

Do not bind `0.0.0.0` merely for convenience. Public dashboard exposure requires a separate authenticated/TLS design and authorization.

### Gate 10 — Kanban Safety + Persistence

Before creating any acceptance card, inspect current upstream Kanban issues and current configuration.

Do not use a status as a human-approval security boundary when a known issue shows that status may auto-promote. Use a state that cannot dispatch under the current dispatcher contract, or disable dispatch under an explicitly tested and reversible configuration before persistence testing.

Acceptance should prove:

- DB integrity;
- board visible in UI;
- disposable task survives dashboard/gateway restart as intended;
- no worker runs during a persistence-only test;
- task cleanup/archive is explicit and verified.

## Novice-Operator Delivery Contract

For each step, the AI should provide:

1. **Where to run it** — exact shell/device/account.
2. **What it does** — one plain-language paragraph.
3. **What it must not do** — protected state.
4. **The complete command block.**
5. **What success looks like** — exact PASS indicators.
6. **What to send back** — output/screenshot, never secrets.
7. **What not to do next** — especially when a service must remain stopped for inspection.

When a command can prompt interactively, explain the prompt in advance. When a line such as `Update available` is intentionally ignored because the build is pinned, say so explicitly so the operator does not "fix" the accepted state accidentally.

## Video / Teaching Mode

This Skill may be used with `signalproof-teach` and `signalproof-build-capsule` to produce a reproducible learning path for nontechnical operators.

Teaching material should:

- define Terminal, PowerShell, SSH, service, listener, PID, port, firewall, systemd, loopback, snapshot, hash, database/WAL, and Git pin in ordinary language;
- keep the exact command and the explanation adjacent;
- distinguish "copy this" from "read this";
- explain why a STOP occurred and what evidence changed the next attempt;
- preserve failed paths as learning, not embarrassment;
- never show real passwords, private keys, API tokens, or recoverable secrets on screen;
- use screenshots/capsules as orientation aids, not as authority over exact source/config files.

## Git Backup Tree Contract

Before the VPS can safely synchronize itself to Git, maintain a human-controlled repository tree that represents recoverable configuration and build doctrine without containing live secrets.

Suggested shape:

```text
signalproof-hermes-vps/
  README.md
  BUILD-STATE.md
  KNOWN-ERRORS.md
  RECOVERY.md
  manifests/
  systemd/
  config-examples/
  scripts/
  evidence-index/
  docs/
```

The Git tree is a **reconstruction and governance source**, not a byte-for-byte mirror of `~/.hermes`.

Store:

- accepted versions/commits/hashes;
- sanitized config examples;
- service units/drop-ins;
- backup/restore scripts that do not embed credentials;
- dependency and package manifests;
- network/SSH/firewall expectations;
- acceptance receipts and evidence indexes;
- known-error fingerprints and mitigations;
- recovery order.

Do not store:

- `.env` values;
- SSH private keys;
- raw state/session databases unless separately encrypted and explicitly governed;
- gateway pairing secrets;
- OAuth refresh/access tokens;
- customer/client data;
- provider account identifiers that are unnecessary for recovery.

## Relationship to Build / Build Spawn Debug

This Skill is a domain specialist, not a replacement for the generic builder.

`signalproof-build` continues to own bounded implementation, protected state, and incremental verification. `signalproof-build-spawn-debug` continues to own convergence, retry memory, and human UI acceptance. This Skill supplies the Hermes-VPS-specific gates, shell-context discipline, service/network invariants, and recovery artifacts those coordinators should load when the target is a Hermes VPS.

## Known Failure Classes from the First Validated Build

Initial reusable fingerprints include:

- wrong raw installer path / installer 404;
- optional installer sudo prompt under an intentionally non-sudo Hermes account;
- upstream lockfile rejected because project `uv` configuration was hidden, followed by unlocked PyPI fallback;
- confusing `NRestarts=1` after an intentional Hermes-mediated supervised restart;
- upstream service unit disabling systemd start-rate limiting;
- dashboard/Kanban security behavior that makes some status values unsuitable as approval gates;
- live Unix sockets and lock files appearing in filesystem snapshots;
- stale "update available" messaging on a deliberately pinned release.

Each future match must still compare exact version/conditions before reusing a mitigation.

## Acceptance Requirements

Before promotion, test this Skill against at least:

1. a clean Ubuntu VPS from a different provider or fresh Hostinger instance;
2. a novice operator who can complete the flow using only the labeled blocks and explanations;
3. one known-error recurrence where the Skill prevents repetition;
4. one unexpected installer/dependency failure requiring a materially changed next attempt;
5. gateway reboot/restart persistence;
6. loopback dashboard access through an SSH tunnel;
7. Git reconstruction from sanitized backup artifacts without committing secrets;
8. rollback/recovery from an accepted snapshot or reconstruction package.

## STOP Conditions

STOP when source authority is stale/unknown; rollback is absent before a high-risk mutation; no tested administrative recovery path exists; a command requires granting Hermes sudo/root; an unexpected public listener appears; a duplicate gateway/state writer exists; a lockfile must be regenerated locally to continue; a known unsafe Kanban approval path would be exercised; secrets would enter Git/evidence; the human cannot distinguish which shell/account should run a command; recovery cannot be verified; or success would require claiming an unobserved browser/runtime result.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-hermes-vps-builder`
- **Version:** 0.1.0
- **Maturity:** Candidate / Not Active
- **Domain:** Hermes VPS installation, hardening, supervision, private dashboard, Kanban safety, backup, recovery, novice operator guidance
- **Created by:** Doc Reo / Signalproof
