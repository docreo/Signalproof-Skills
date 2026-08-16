# Signalproof V0.2 Case 3 — Hermes Agent Source Authority Map

**Status:** SOURCE AUTHORITY MAP COMPLETE / LOCAL PROTECTED-STATE INVENTORY CANDIDATE  
**Case class:** agent framework / agent runtime  
**Target:** `NousResearch/hermes-agent`  
**Reviewed release:** `v2026.8.16` / Hermes Agent `0.20.2`  
**Annotated tag SHA:** `bbc20510676c48c6bfa0ef5c2eeefbf676449456`  
**Release commit:** `df4b65147d7ddd74dd449f9067aabbca5aef0ec7`  
**License:** MIT  
**Inspection mode:** source/documentation only — no local Hermes execution, update, reconfiguration, provider call, MCP install, gateway enablement, or skill activation

## Case role

The V0.2 intake matrix defined four case classes:

1. external AI skill collection;
2. capability inspection tooling;
3. **agent framework / agent runtime**;
4. model / runtime / connector.

Case 1 covered `mattpocock/skills`. Case 2 covered NVIDIA SkillSpector. Hermes is the Case 3 target because Signalproof already has a protected local Hermes installation and prior ecosystem plans describe Hermes as a worker/orchestrator rather than the owner of project truth.

Signalproof therefore evaluates Hermes as a possible **replaceable worker/orchestrator behind Signalproof authority**, not as a new source of project truth, permission authority, Build Ledger authority, or automatic capability-activation authority.

## Current upstream identity

GitHub release metadata identifies the reviewed stable release as:

- tag: `v2026.8.16`;
- release name: `Hermes Agent v0.20.2 (2026.8.16)`;
- release commit: `df4b65147d7ddd74dd449f9067aabbca5aef0ec7`;
- annotated tag object: `bbc20510676c48c6bfa0ef5c2eeefbf676449456`;
- published: 2026-08-16.

The annotated tag is unsigned. This is provenance evidence, not a claim of compromise.

The reviewed release contains an MIT license from Nous Research.

## Runtime / dependency boundary

`pyproject.toml` at the exact release commit reports:

- package version `0.20.2`;
- Python `>=3.11,<3.14`;
- substantial exact-pinned core dependencies plus platform-specific dependencies;
- optional provider/search/media/cloud extras;
- native Windows dependencies and paths;
- agent terminal, gateway, browser, MCP, memory, scheduling, skill, plugin, and delegation surfaces.

This is an execution runtime with a materially broader authority and dependency boundary than the Case 2 scanner. It must not be evaluated like a passive package.

---

# Source authority map

## 1. Command approval and bypass authority

Primary source inspected: `tools/approval.py`.

Hermes has multiple command-control layers:

- a hardline blocklist for catastrophic operations;
- user-defined `approvals.deny` rules;
- dangerous-pattern detection;
- optional Tirith command-security findings;
- manual or smart approval;
- session/permanent approval persistence;
- CLI, gateway, and plugin approval transports.

### Always-before-YOLO controls

The exact source places the hardline blocklist and user-defined deny rules before the normal approval bypass. Those controls can therefore remain effective even when YOLO or approval-off state exists.

The hardline floor is intentionally narrow. Recoverable-but-costly operations remain in the ordinary approval layer and can be bypassed by YOLO/off state.

### Approval bypass sources

The exact source recognizes three ordinary approval-bypass sources:

- process-scoped `--yolo` / `HERMES_YOLO_MODE`;
- session-scoped gateway `/yolo`;
- `approvals.mode: off`.

`HERMES_YOLO_MODE` is frozen at module import so an in-process skill cannot simply set that environment variable later and bypass approvals.

### Manual vs smart approval

Approval mode accepts `manual`, `smart`, or `off`.

In `smart`, an auxiliary LLM evaluates flagged commands and can return approve/deny/escalate. The smart-review prompt itself describes package installs and git operations as examples that may be safe. This makes smart mode a model-mediated authority layer rather than guaranteed human authorization.

**Signalproof candidate default: `approvals.mode: manual`.**

Smart approval remains a separately governable capability, not the default Signalproof authority boundary.

### Critical non-interactive fail-open behavior

The exact release preserves a historical behavior in both `_run_approval_gate` and the combined command guard:

- ordinary non-interactive;
- non-gateway;
- non-cron;
- non-single-query

contexts may return `approved: True` without a human approval surface after the hardline/user-deny floor.

The exact source comments identify this as the historical dangerous-command **fail-open** behavior. Plugin-escalated approvals can explicitly opt into fail-closed behavior, but the ordinary dangerous-command path does not universally do so.

**Signalproof conclusion:** absence of a human is not sufficient evidence that host command execution will fail closed. A bounded Signalproof worker must enforce authority outside Hermes as well as inside it.

### Cron and single-query

`approvals.cron_mode` defaults to `deny`; values such as `approve`, `off`, `allow`, or `yes` normalize to approval.

`approvals.single_query_mode` also defaults to `deny` and can be changed to auto-approve.

Signalproof candidate policy:

- `approvals.cron_mode: deny`;
- `approvals.single_query_mode: deny`.

## 2. Terminal, process, and file authority

Primary sources inspected:

- `tools/approval.py`;
- `website/docs/user-guide/features/tools.md`;
- `website/docs/user-guide/security.md`.

Hermes terminal backends include local, Docker, SSH, Singularity, Modal, Daytona, and Vercel Sandbox.

### Host execution

`local` executes as the host OS user and is not an isolation boundary.

`ssh` moves execution to a remote machine but remains host-reaching for that remote target.

Container/sandbox backends are treated as isolation boundaries and ordinarily skip dangerous-command prompting. Docker stops receiving that fast path when host bind mounts give the container host access.

### File write guard is not a host sandbox

`write_file` and `patch` protect selected credential/system paths and can be constrained with `HERMES_WRITE_SAFE_ROOT`.

However, upstream security documentation explicitly states that the terminal tool runs as the same OS user and can read or overwrite paths that the file tools deny. The file guard is defense in depth, not a hard containment boundary.

**Signalproof conclusion:** `HERMES_WRITE_SAFE_ROOT` is useful but insufficient by itself. Host filesystem protection requires an external execution boundary, filesystem permissions, a disposable sandbox, or another independently enforced control.

## 3. `execute_code` authority

Primary source inspected: `tools/code_execution_tool.py` and `tools/approval.py`.

`execute_code` runs arbitrary Python in a child process. The exact source explicitly recognizes that Python can call `subprocess`, `os.system`, `ctypes`, or file/process APIs without passing through terminal-string dangerous-command detection.

Hermes therefore applies `check_execute_code_guard` before spawning the script.

Important exact-release behavior:

- isolated backends receive the same isolation fast path as terminal execution;
- YOLO or `approvals.mode: off` bypasses the whole-script approval;
- single-query and cron modes block arbitrary code when their approval mode is `deny`;
- gateway/ask contexts can require one-shot whole-script approval;
- **purely local non-interactive non-gateway execution is documented as approved/trusted-by-config**, matching the terminal auto-approve contract.

On native Windows, local `execute_code` uses loopback TCP for its RPC transport because AF_UNIX is treated as unreliable across Windows configurations.

The sandbox receives an RPC-visible subset of Hermes tools. Runtime acceptance must verify the actual tool intersection and fail closed if no explicitly approved toolset was intended.

**Signalproof conclusion:** `execute_code` cannot be exposed to an autonomous local worker merely because terminal dangerous-pattern detection exists. It requires a bounded tool contract plus an independently enforced execution boundary.

## 4. Skills and self-improvement authority

Primary source inspected: `website/docs/user-guide/features/skills.md`.

Hermes skills live primarily under `~/.hermes/skills/`. The agent can create, patch, edit, delete, add support files to, and remove support files from skills through `skill_manage`.

The documented self-improvement loop can create or update skills after:

- a non-trivial workflow;
- errors/dead ends followed by a working path;
- user corrections;
- background post-turn review.

### Default write behavior

`skills.write_approval: false` is documented as the default. With the gate off, skill writes can land directly, including background-review changes.

With `skills.write_approval: true`, writes are staged under the Hermes pending area for explicit approve/reject review.

`skills.guard_agent_created` is a content scanner, not a write-approval gate.

### External skill directories

External skill directories are not write-protection boundaries. If the Hermes process can write them, agent-managed skill operations can modify those external files.

### Skill-declared credential passthrough

Skills can declare required environment variables and credential files. Loaded skills may cause those approved/available secrets to be passed into terminal/`execute_code` sandboxes, including remote backends.

**Signalproof conclusion:** Hermes self-improvement must not map directly to Signalproof skill activation. Signalproof remains governed by:

**Discovered → Candidate → Tested → Approved → Active → Deprecated/Retired**

Candidate baseline:

- `skills.write_approval: true`;
- no writable shared Signalproof skill directory exposed as an ordinary Hermes external skill directory;
- agent-created skill changes are evidence/candidates only;
- Signalproof promotion remains external and human-governed.

## 5. Persistent memory and background learning

Primary source inspected: `website/docs/user-guide/features/memory.md`.

Hermes persists curated `MEMORY.md` and `USER.md` state under `~/.hermes/memories/` and injects a frozen snapshot into the system prompt at session start.

The agent can add, replace, and remove memory entries.

`memory.write_approval: false` is documented as the default. `true` gates/stages memory writes.

The background self-improvement review can save memory or update skills after a turn. Merely disabling memory-update notifications does not disable the review or its writes.

The background review can also be configured to run on a different model/provider. When that happens, a compact conversation digest may be replayed to that provider.

**Signalproof data-egress conclusion:** background review is a separate inference/data boundary from the primary chat model.

Candidate baseline:

- `memory.write_approval: true`;
- `auxiliary.background_review.enabled: false` during acceptance and initial bounded operation;
- any later background-review provider is separately reviewed for data egress and authority.

## 6. Session persistence / project data

Primary source inspected: `website/docs/user-guide/sessions.md`.

Hermes automatically persists sessions in `~/.hermes/state.db`. Stored material includes session metadata, source platform/user identity, model/configuration, system-prompt snapshot, full message history, tool calls, tool results, token counts, timestamps, and lineage.

Session search provides cross-session FTS5 retrieval.

**Signalproof conclusion:** `state.db` is potentially sensitive project/user data, not merely a disposable log. Backup, retention, privacy, migration, and removal controls must explicitly account for it.

## 7. Cron / headless authority

Primary source inspected: `website/docs/user-guide/features/cron.md` and `tools/approval.py`.

Hermes exposes cron management to the agent through the `cronjob` tool. Jobs can:

- run once or repeatedly;
- attach skills;
- run fresh agent sessions;
- use project workdirs;
- deliver results to local or messaging targets;
- run no-agent scripts with zero LLM involvement;
- chain output from other jobs.

Cron executions are persisted with job state and execution history.

Scheduled agents cannot manage cron recursively by default; `cron.allow_agent_scheduling: true` can opt into that capability.

Dangerous command behavior depends on `approvals.cron_mode`: default `deny`, but `approve` converts flagged headless actions into auto-approved execution.

No-agent mode can run scripts from the Hermes scripts area and deliver stdout. Its subprocess environment is sanitized, but it is still scheduled executable authority.

Candidate baseline:

- `cron.allow_agent_scheduling: false`;
- `approvals.cron_mode: deny`;
- cron tooling absent from the initial bounded worker contract;
- any future scheduled mutation requires its own acceptance and delivery/data-boundary review.

## 8. MCP acquisition, execution, and auth boundary

Primary source inspected: `website/docs/user-guide/features/mcp.md`.

Hermes can connect to local stdio and remote HTTP MCP servers.

The curated MCP catalog can run manifest-directed behavior including repository acquisition, bootstrap commands (`pip install`, `npm install`, etc.), and ultimately the MCP server code. Upstream documentation explicitly tells operators to inspect manifest source/bootstrap/transport even for catalog entries reviewed by Nous.

Catalog installation can store API keys under Hermes environment state or acquire OAuth credentials. Remote OAuth tokens are cached under the Hermes MCP token directory.

Remote HTTP MCP supports static headers, OAuth, mTLS, client secrets/keys, and optional caller-identity headers.

Per-server tool include/exclude filtering is supported, but an install-time probe can fail while installation still completes using manifest defaults or no filter. Therefore successful install is not proof that the complete effective tool surface was observed.

**Signalproof conclusion:** upstream catalog approval is provenance context, not Signalproof authorization.

Candidate baseline:

- no MCP servers enabled by default;
- unreviewed MCP acquisition/bootstrap → STOP;
- local stdio preferred for any future bounded test;
- remote HTTP/OAuth MCP requires separate transport, credential, data-egress, tool-surface, and removal review;
- explicit tool allowlist required before agent exposure.

## 9. Secrets / environment / credential propagation

Primary sources inspected:

- `website/docs/user-guide/security.md`;
- `website/docs/reference/environment-variables.md`;
- skill/MCP documentation.

Hermes supports a broad provider/tool/gateway credential surface and commonly stores user-managed secrets under `~/.hermes/.env` plus provider-specific auth/token files.

Terminal and `execute_code` perform secret filtering, but explicit passthrough mechanisms exist:

- skill-declared required environment variables;
- `terminal.env_passthrough`;
- skill-declared credential files;
- terminal credential-file configuration;
- MCP server env/headers/OAuth tokens.

Therefore “Hermes filters secrets” is not a sufficient global claim. A loaded skill or explicit configuration can intentionally widen the credential boundary.

**Signalproof candidate baseline:** empty/default-deny passthrough except for individually reviewed variables/files, with every skill credential declaration treated as intake evidence.

## 10. Plugin authority

Primary source inspected: `website/docs/user-guide/features/plugins.md`.

Hermes plugins can register tools, hooks, slash commands, CLI commands, bundled skills, gateway platforms, media/model/context/memory providers, approval transports, host-owned LLM calls, and MCP calls.

General/user third-party plugins are normally opt-in through `plugins.enabled`. Project-local plugins are disabled unless `HERMES_ENABLE_PROJECT_PLUGINS=true` is set.

Pinned full-commit plugin installs are supported.

Some bundled infrastructure plugin categories are auto-discovered/loaded by design and are selected through their own provider/platform settings.

Candidate baseline:

- explicit plugin allowlist only;
- no project plugins during acceptance;
- `HERMES_ENABLE_PROJECT_PLUGINS` absent/false;
- future third-party plugin pinned to exact immutable commit and separately reviewed.

## 11. Runtime dependency mutation / lazy install

Primary source inspected: `website/docs/user-guide/security.md`.

Hermes can lazily install optional dependencies on first use. `security.allow_lazy_installs` is documented as enabled by default. The mechanism restricts installs to in-tree allowlisted package specs and the active venv, but it still performs runtime dependency mutation and network acquisition.

Candidate baseline:

- `security.allow_lazy_installs: false` during acceptance and managed Signalproof operation unless a separately authorized capability requires it.

## 12. Update / rollback authority

Primary source inspected: `website/docs/getting-started/updating.md`.

`hermes update` is a broad mutation operation. It can:

- snapshot selected state;
- pull current code from the configured branch (default `main`);
- update submodules;
- reinstall dependencies;
- migrate config;
- seed new bundled skills unless opted out;
- restart gateways.

The quick pre-update snapshot skips individual files over 1 GiB, so a large session database may not be covered by that quick snapshot.

The update path supports branch selection and has syntax-validation/rollback behavior, but the ordinary command is branch/main-oriented rather than a Signalproof pinned-release promotion process.

Messaging surfaces can also expose `/update`.

**Signalproof conclusion:** Hermes must not own its own update authority inside a governed deployment. Workstation Manager/Core Runtime or another Signalproof-controlled updater should pin, verify, stage, test, and promote the worker version.

Self-update of the protected Hermes install during Case 3 remains **STOP**.

## 13. Windows-native authority boundary

Primary sources inspected:

- `website/docs/user-guide/windows-native.md`;
- `tools/code_execution_tool.py`;
- update documentation.

The reviewed Hermes release supports native Windows.

Important Windows-specific surfaces include:

- installer-managed Python/venv;
- Node and browser dependencies;
- PortableGit/Git Bash for shell command execution;
- `HERMES_GIT_BASH_PATH` shell selection;
- local `execute_code` RPC over loopback TCP;
- gateway startup through Windows Scheduled Tasks with Startup-folder fallback;
- detached `pythonw.exe` gateway process handling;
- Windows-specific update/venv file-lock and transactional recreation behavior.

A Signalproof runtime acceptance therefore must test the native Windows execution image and shell/process boundaries, not infer behavior from Linux-only paths.

---

# Signalproof candidate authority baseline

The following is a **candidate acceptance baseline**, not a live configuration change and not operational approval:

```yaml
approvals:
  mode: manual
  cron_mode: deny
  single_query_mode: deny

skills:
  write_approval: true

memory:
  write_approval: true

auxiliary:
  background_review:
    enabled: false

security:
  allow_lazy_installs: false

cron:
  allow_agent_scheduling: false
```

Additional Signalproof rules:

- YOLO absent and prohibited;
- `approvals.mode: off` prohibited;
- local/unrestricted host terminal not accepted for autonomous worker operation;
- initial worker backend should be disposable/isolated with no host bind mounts;
- `execute_code` omitted or separately bounded until its exact tool-RPC surface is accepted;
- `HERMES_WRITE_SAFE_ROOT` may supplement but never replace an isolation boundary;
- env/credential passthrough default-deny and individually reviewed;
- no MCP server by default;
- no project plugins;
- explicit plugin allowlist only;
- gateway, if ever enabled, requires explicit allowlist/pairing and no global allow-all;
- no autonomous Signalproof skill promotion/activation;
- no autonomous modification of shared/canonical Signalproof skill directories;
- no `/update` or `hermes update` from the bounded worker;
- Signalproof external governance owns version pinning, activation, rollback, and recovery.

## Architectural role

Candidate contract:

```text
SIGNALPROOF / HUMAN AUTHORITY
            ↓
GRANITE / DIA + BUILD LEDGER + CORE RUNTIME
            ↓
CAPABILITY / PERMISSION / POLICY BOUNDARY
            ↓
BOUNDED HERMES WORKER
            ↓
EXPLICITLY ALLOWED TOOLS / DATA / NETWORK / WORKSPACE
```

Not:

```text
HERMES
  ↓
SELF-SELECTS AUTHORITY
  ↓
MUTATES CANONICAL SIGNALPROOF STATE
```

Hermes can be valuable precisely because it is capable. That capability must remain subordinate to Signalproof authority.

---

# Falsifiable runtime acceptance requirements

No runtime acceptance has yet been performed for this release. A future disposable test must falsify, not merely assume, these boundaries:

1. exact protected/local Hermes identity is inventoried before change;
2. ordinary non-interactive local dangerous-command behavior is observed and classified;
3. cron `deny` versus `approve` behavior is observed without weakening the production candidate baseline;
4. single-query `deny` versus `approve` behavior is observed;
5. YOLO/off bypass behavior is demonstrated only in a disposable harness and remains externally prohibited;
6. user deny/hardline rules remain effective across bypass states where source claims they should;
7. `write_file`/`patch` path guard is contrasted with terminal reachability so no false sandbox claim survives;
8. `HERMES_WRITE_SAFE_ROOT` enforcement is tested without treating it as terminal containment;
9. `execute_code` whole-script guard and Windows loopback RPC behavior are verified;
10. the actual `execute_code` RPC-visible tool surface is enumerated and constrained;
11. skill writes are staged when `skills.write_approval: true` and not promoted into Signalproof automatically;
12. memory writes are staged when `memory.write_approval: true`;
13. background review performs no write/provider egress when disabled;
14. unreviewed env and credential passthrough remain absent;
15. lazy optional dependency installation is blocked when disabled;
16. project/general third-party plugins remain disabled unless explicitly allowed;
17. no MCP server/tool is exposed unless separately configured and allowlisted;
18. cron tooling is absent/blocked from the initial worker contract;
19. gateway/user-authorization remains disabled or explicitly allowlisted;
20. protected local Hermes state remains unchanged by acceptance;
21. cleanup/removal returns the disposable environment to the defined pre-state.

## Protected local state

Prior Signalproof evidence records a known local Hermes installation. The reviewed upstream 0.20.2 release is newer than that prior observation.

This source review does **not** claim the protected local installation is 0.20.2 and does not authorize upgrading it.

No local update, execution, reconfiguration, credential change, MCP install, provider call, gateway enablement, plugin activation, scheduled job, memory write, or skill activation was performed by this source review.

## Source-review disposition

**ADAPT CANDIDATE — BOUNDED GOVERNED WORKER ONLY**

Hermes is not rejected. The source review shows useful orchestration, memory, skill, scheduling, MCP, plugin, and cross-platform capabilities, but also demonstrates that those capabilities materially widen authority and persistence boundaries.

The governing integration principle is:

> **Hermes may execute delegated work, but it must not decide what authority it has.**

## Reusable lessons

1. **Agent-runtime approval systems must be evaluated in non-interactive contexts, not only interactive demos.** A human-approval feature can still have a deliberate fail-open headless path.
2. **Tool-specific write guards are not equivalent to process isolation.** If another tool can reach the same resource as the OS user, the resource is not protected by the first tool's denylist alone.
3. **Self-improvement is a state-mutation capability.** Memory and skill learning need the same governance discipline as code/config mutation when they alter future agent behavior.
4. **Credential filtering is conditional, not absolute.** Skills, MCP, plugins, and explicit passthrough can intentionally widen secret exposure.
5. **Runtime package acquisition is authority.** Lazy dependency installation, MCP bootstrap, plugin installation, and self-update all belong inside capability governance.
6. **A capable external agent is safest as a replaceable worker beneath a separate authority plane.** Execution capability and permission authority should remain distinct.

## Next authorized step

After this source-review evidence passes repository governance and is merged to protected `main`, the next Case 3 step is a **read-only protected local Hermes inventory**.

That inventory may establish, without printing secrets or modifying state:

- exact installed Hermes version/commit;
- install/launcher path and executable identity;
- governance-relevant configuration fields only;
- active terminal backend/toolsets;
- approval modes;
- skill/memory write-approval state;
- background-review state;
- lazy-install state;
- cron governance fields;
- configured MCP server names/enabled states only;
- enabled plugin names/project-plugin state;
- update branch/method where observable;
- relevant file/artifact identities/hashes where useful.

The inventory must not print `.env`, auth tokens, API keys, MCP tokens, credential files, or private session content.

**No runtime acceptance, local mutation, or protected Hermes upgrade is authorized until that inventory is closed and the next bounded test plan is separately approved.**
