# Signalproof Hermes VPS Builder V0.1 Acceptance

**Candidate:** `signalproof-hermes-vps-builder` 0.1.0  
**Status:** CANDIDATE / NOT ACTIVE  
**Evidence basis:** first governed Ubuntu 24.04 Hermes VPS build, 2026-08-27  
**Purpose:** preserve the reusable method without claiming that one successful deployment proves general portability.

## First Validated Build — Observed Gates

The first build established the following machine-observed sequence:

1. clean Ubuntu 24.04 VPS baseline captured before mutation;
2. provider snapshot created before hardening;
3. non-root `spadmin` administrative path proven through a dedicated ED25519 key;
4. password and keyboard-interactive SSH disabled only after alternate access worked;
5. UFW exposed SSH only; Fail2Ban enabled; 4 GiB swap configured;
6. dedicated `hermes` account created with no sudo authority and a locked password;
7. Hermes Agent pinned to v0.20.6 / commit `5fc308a70719a83cccdbba4c0e39c23f5a8239d5`;
8. installer source path error produced a safe failure with no install mutation, then was corrected from evidence;
9. upstream installer accepted the pin but its `uv --locked` tier failed and fell back to PyPI resolution;
10. the committed lockfile was subsequently verified without regeneration and the environment was reconciled through locked synchronization;
11. dependency compatibility check passed after reconciliation;
12. user-level systemd gateway service installed under the unprivileged Hermes identity;
13. Signalproof restart-rate guard added because upstream unit disabled systemd start limiting;
14. first gateway start produced exactly one writer and no new public listener;
15. deliberate Hermes-mediated restart changed PID and incremented systemd `NRestarts` once; a correction gate proved this was intentional supervisor behavior rather than a crash loop;
16. state SQLite integrity and single-writer stability were verified;
17. accepted Hermes state was backed up with SQLite online backup semantics and SHA-256 identity;
18. web/PTY dependencies verified before dashboard activation;
19. dashboard installed as a persistent user service bound only to `127.0.0.1:9119`;
20. dashboard restart preserved the Build-02 gateway PID/restart count and public TCP surface remained SSH-only;
21. Kanban DB existed and passed `PRAGMA integrity_check`; no non-archived tasks existed before dashboard activation.

## Known-Error Lessons Captured

### KE-HERMES-INSTALL-RAW-PATH-001

**Fingerprint:** installer raw URL/path returns 404 before install.  
**Lesson:** verify exact upstream installer path at the pinned ref before running the remote script. A failed download is not a failed Hermes installation if no installer executed.

### KE-HERMES-UV-LOCK-CONFIG-001

**Fingerprint:** installer reports lockfile needs update under `--locked`, then falls back to PyPI resolve.  
**Lesson:** do not accept the fallback as equivalent to the committed release lock. Preserve evidence, allow the project's intended `uv` configuration while isolating ambient config, run `uv lock --check`, then `uv sync --locked`. Never regenerate upstream's lock merely to make the gate green.

### KE-HERMES-SYSTEMD-NRESTARTS-INTENTIONAL-001

**Fingerprint:** `NRestarts` increments after an explicit `hermes gateway restart` even though service result is success and PID changes normally.  
**Lesson:** Hermes uses supervisor restart semantics for its intentional restart path. Acceptance must compare the count before and after the authorized restart, then prove it remains stable during an observation window. Do not classify the first expected increment as an automatic crash loop.

### KE-HERMES-SYSTEMD-UNBOUNDED-RESTART-001

**Fingerprint:** generated gateway unit contains `StartLimitIntervalSec=0` with `Restart=always`.  
**Lesson:** add a separate Signalproof drop-in that preserves automatic recovery while imposing a bounded start-rate policy. Keep the drop-in separate from the upstream-generated base unit.

### KE-HERMES-KANBAN-BLOCKED-GATE-001

**Fingerprint:** current upstream issue reports cards created directly in `blocked` may auto-promote and execute without the intended human approval.  
**Lesson:** do not treat `blocked` as a security/authorization boundary under affected conditions. Use a demonstrably non-dispatching state or explicitly disable dispatch through a separately verified reversible configuration.

### KE-HERMES-LIVE-BACKUP-EPHEMERAL-001

**Fingerprint:** live Hermes snapshot contains Unix socket and lock artifacts; tar ignores the socket.  
**Lesson:** runtime sockets are not backup payload. Restore procedures must treat sockets, PID/lock markers, and similar ephemeral ownership artifacts as rebuild/cleanup state, while state databases require consistent backup semantics.

## Novice-Operator Acceptance

The method passes the human-operability requirement only when each consequential step can be delivered with:

- exact shell/device/account label;
- plain-language purpose;
- protected-state statement;
- one bounded copy/paste block;
- expected PASS output;
- explicit instruction about what output to return;
- warning not to paste passwords, private keys, tokens, or `.env` contents;
- explanation of any expected warning that should *not* be acted on, such as an update notice on a deliberately pinned release.

The first build demonstrated this interaction pattern, but an independent novice-operator validation remains required before Active promotion.

## Git Backup Acceptance Contract

The candidate must support creation of a sanitized reconstruction tree before the VPS itself receives Git write authority.

The reconstruction tree must contain version/commit authority, service units/drop-ins, sanitized configuration examples, backup/restore scripts, firewall/network expectations, known errors, and evidence indexes. It must exclude live credentials, SSH private keys, raw `.env` values, OAuth tokens, pairing secrets, and unnecessary session/customer data.

## Promotion Gates Still Open

This candidate is **not ready for Active promotion** until:

1. the method is repeated on a fresh VPS or materially independent clean instance;
2. a novice/nontechnical operator can complete the essential flow from the labeled instructions;
3. backup reconstruction is exercised rather than merely documented;
4. reboot persistence is verified end-to-end for gateway and dashboard;
5. the private SSH-tunnel browser gate and Kanban persistence test complete;
6. the candidate receives normal Signalproof review, skill-budget check, registry/router integration review, and owner approval.

## Current Disposition

**CANDIDATE / LEARNING LOGGED / NOT ACTIVE.**

The first validated deployment supplies strong evidence for a reusable domain specialist, but does not justify bypassing the Signalproof lifecycle.
