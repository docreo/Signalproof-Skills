# Signalproof V0.2 Case 3 — Hermes Agent Source Review

**Status:** RESEARCH / SOURCE REVIEW IN PROGRESS  
**Case class:** agent framework / agent runtime  
**Target:** `NousResearch/hermes-agent`  
**Reviewed release:** `v2026.8.16` / Hermes Agent `0.20.2`  
**Annotated tag SHA:** `bbc20510676c48c6bfa0ef5c2eeefbf676449456`  
**Release commit:** `df4b65147d7ddd74dd449f9067aabbca5aef0ec7`  
**License:** MIT  

## Why Hermes is Case 3

The V0.2 intake matrix defined four case classes:

1. external AI skill collection;
2. capability inspection tooling;
3. **agent framework / agent runtime**;
4. model / runtime / connector.

Case 1 covered `mattpocock/skills`. Case 2 covered NVIDIA SkillSpector. Hermes is the natural Case 3 target because Signalproof already has a protected local Hermes installation and prior ecosystem plans describe Hermes as a worker/orchestrator rather than the owner of project truth.

## Current upstream identity

GitHub release metadata identifies the latest stable release as:

- tag: `v2026.8.16`
- release name: `Hermes Agent v0.20.2 (2026.8.16)`
- published: 2026-08-16
- annotated tag object: `bbc20510676c48c6bfa0ef5c2eeefbf676449456`
- release commit: `df4b65147d7ddd74dd449f9067aabbca5aef0ec7`

The annotated tag is unsigned. This is provenance evidence, not a claim of compromise.

## License

The reviewed release contains an MIT license from Nous Research.

## Runtime / dependency surface

`pyproject.toml` reports:

- package version `0.20.2`;
- Python `>=3.11,<3.14`;
- substantial exact-pinned core dependencies plus platform-specific dependencies;
- optional provider/search/media/cloud extras;
- native Windows support;
- agent terminal, gateway, browser, MCP, memory, scheduling, skill, and delegation surfaces.

The dependency surface is materially broader than SkillSpector and must be treated as an execution runtime rather than a passive library.

## Capability boundary

Upstream documentation describes Hermes as a self-improving agent with:

- terminal and file operations;
- browser automation;
- web/search tooling;
- persistent memory and session recall;
- scheduled cron jobs;
- subagent delegation;
- skills creation/improvement;
- messaging gateway integrations;
- MCP client integration;
- local, Docker, SSH, Singularity, Modal, Daytona, and Vercel Sandbox execution backends.

This creates a wide authority, filesystem, process, credential, network, and data-egress boundary.

## Security model observed upstream

Upstream security documentation describes layered controls including:

- user authorization;
- dangerous-command approval;
- file-write safety;
- container isolation;
- MCP credential filtering;
- context-file scanning;
- cross-session isolation;
- input sanitization.

The approval system can run in `smart`, `manual`, or `off` mode. `--yolo`, `/yolo`, and `HERMES_YOLO_MODE=1` bypass normal dangerous-command approval prompts, while a separate hardline blocklist remains always on.

Signalproof must therefore treat YOLO/off modes as an explicit authority-boundary hazard. They are not acceptable defaults for governed Signalproof operation.

## MCP boundary

Hermes can discover and invoke local stdio and remote HTTP MCP servers. Its curated catalog can execute manifest-directed acquisition/bootstrap commands and store API keys or OAuth-derived credentials. Tool selection can be filtered per server.

Presence in the upstream curated catalog is useful provenance context, but does not constitute Signalproof approval. Signalproof must separately inspect source, install/bootstrap behavior, auth, transport, tool exposure, data egress, and recovery/removal.

## Initial Signalproof disposition

**STUDY / ADAPT CANDIDATE — GOVERNED WORKER / ORCHESTRATOR**

Hermes should not become:

- Signalproof project truth;
- Build Ledger authority;
- permission authority;
- autonomous skill activation authority;
- uncontrolled software installer/updater;
- an unrestricted host shell;
- an unrestricted MCP broker.

The intended architectural role remains a replaceable worker/orchestrator behind Signalproof authority, policy, capability registration, verification, and recovery controls.

## Protected state

Prior Signalproof evidence records a known local Hermes installation. No local update, execution, reconfiguration, credential change, MCP install, provider call, gateway enablement, or skill activation is authorized by this source review.

The current upstream release differs from the previously observed local version, so source-review freshness must not be confused with local runtime state.

## Case 3 source-review questions

Before any runtime acceptance or integration disposition, Case 3 must answer:

1. What is the exact local protected Hermes version/commit/config state?
2. What authority can Hermes exercise under each enabled toolset/backend?
3. Which tools mutate filesystem, processes, repositories, services, credentials, or remote systems?
4. What network destinations/providers are reachable by default versus opt-in?
5. Where are secrets stored, inherited, forwarded, or filtered?
6. What persistent memory/session/skill data is written and where?
7. How does autonomous skill creation/improvement behave and how can Signalproof prevent automatic promotion/activation?
8. How do cron and headless execution paths fail closed or bypass interactive approval?
9. How do MCP acquisition/bootstrap and remote MCP auth affect trust boundaries?
10. What rollback/removal path exists without disturbing protected Signalproof state?
11. Can Signalproof expose only a bounded worker contract while keeping Granite/DIA, Core Runtime, Build Ledger, and human authority above Hermes?

## Initial hard gates

Until separately accepted:

- `approvals.mode: off` → **STOP**
- YOLO mode → **STOP**
- unrestricted local-terminal authority → **NOT APPROVED**
- autonomous skill activation/promotion → **STOP**
- unsupervised cron with mutating authority → **NOT APPROVED**
- unreviewed MCP install/bootstrap → **STOP**
- remote MCP/provider credential exposure without explicit boundary review → **STOP**
- self-update of protected Hermes installation during acceptance → **STOP**

## Next authorized research step

Perform a bounded **source-only authority map** of the exact release commit, covering:

- command approval and hardline controls;
- terminal/process/file-write backends;
- skill creation/improvement and persistence;
- cron/headless behavior;
- MCP install/auth/tool filtering;
- credential/environment handling;
- memory/session persistence;
- update/install behavior;
- Windows-specific runtime paths.

No local Hermes execution or protected-state mutation is authorized by this step.
