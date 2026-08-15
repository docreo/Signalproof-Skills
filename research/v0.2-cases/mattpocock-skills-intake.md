# Signalproof Skills V0.2 Intake Case — mattpocock/skills

**Case class:** External AI skill collection  
**Research status:** Bounded static/documentary intake review complete  
**Disposition:** **STUDY / REFERENCE — selective ADAPT candidates; execution remains QUARANTINED**  
**Authority:** Research/Evaluate only. This record does not authorize installation, execution, activation, wholesale adoption, or skill promotion.

## 1. Evidence boundary

This review used GitHub repository/API source inspection only. No third-party code, installer, plugin, shell script, skill, package, or template from `mattpocock/skills` was installed or executed during this V0.2 case.

The review is intentionally bounded. It is sufficient to establish provenance, material capability surfaces, overlap/gap evidence, and a research disposition. It is **not** a full security audit of every current skill or executable surface.

## 2. Source identity and frozen research snapshot

- Repository: `mattpocock/skills`
- Owner/publisher: Matt Pocock / GitHub user `mattpocock`
- Default branch: `main`
- Frozen current-main commit inspected: `068b6e0c62393147daf03530149cdce209c93da8`
- Current-head commit message at freeze: `Stop skills from calling other user-invoked skills`
- Repository license metadata: MIT
- `LICENSE` blob at frozen head: `f1dd2c09108dde1a5f56097cee8461b3ea834499`
- `LICENSE` copyright: Copyright (c) 2026 Matt Pocock
- Plugin/package version declared at frozen head: `1.2.3`
- Latest GitHub release observed: `v1.2.3`
- Annotated tag object: `835450ef244ab7335f75d95b83e7d979eae22a6d`
- Release tag points to commit: `6acc160e4e0cd062dbbbd7a1b26ae92855edf07e`
- Tag signature state observed: unsigned

The current `main` commit is later than the latest `v1.2.3` release commit while the plugin/package manifests still declare version `1.2.3`. For this reason, this case binds its findings to the exact frozen commit above rather than treating the release name alone as exact identity.

## 3. Prior Signalproof quarantine snapshot versus current upstream

Prior Signalproof quarantine work referenced commit:

`84fdeffd12f2ee307994d1eb6feb48173b6e0502`

That commit resolves upstream and was a verified GitHub merge commit dated 2026-08-06.

Comparison from the prior quarantine commit to the V0.2 frozen current-main commit reports:

- status: `ahead`
- ahead by: `17`
- behind by: `0`
- total commits: `17`

Therefore the earlier Signalproof static review is useful historical evidence but **cannot be silently upgraded into current approval**. The exact current snapshot requires its own review before any stronger disposition.

## 4. Current distribution and update paths

The repository documents two primary consumer routes:

### Claude Code plugin

- installs the whole collection as a managed read-only bundle;
- documentation states updates arrive automatically through the official Claude Code marketplace;
- the plugin manifest declares 25 current skills.

### skills.sh / other agents

- `npx skills@latest add mattpocock/skills` copies selected skill files into a project;
- copied files are editable by the consumer;
- updates are explicit through the skills installer/update route.

### Signalproof intake implication

The managed auto-updating plugin route is **not suitable for direct Signalproof approval as a frozen reviewed artifact** because content may change after review without a new Signalproof hash/commit gate.

The copy/select route is more compatible with frozen-version review, but using the installer itself is a separate executable/dependency boundary and is not authorized by this research record.

## 5. Current skill surface

At the frozen commit, `.claude-plugin/plugin.json` declares 25 plugin skills.

### Engineering

- `ask-matt`
- `diagnosing-bugs`
- `grill-with-docs`
- `triage`
- `improve-codebase-architecture`
- `setup-matt-pocock-skills`
- `tdd`
- `to-spec`
- `to-tickets`
- `wayfinder`
- `implement`
- `prototype`
- `research`
- `domain-modeling`
- `codebase-design`
- `code-review`
- `resolving-merge-conflicts`
- `wizard`

### Productivity

- `grill-me`
- `grilling`
- `handoff`
- `teach`
- `to-questionnaire`
- `wait-what`
- `writing-for-agents`

The repository tree also contains `skills/in-progress/`, `skills/misc/`, repository scripts, shell templates, and other support files that are not all part of the official plugin manifest.

## 6. Executable and consequential surfaces

The collection is not correctly described as “prompt text only.” The frozen tree includes executable or executable-adjacent content such as:

- `scripts/link-skills.sh`
- `scripts/list-skills.sh`
- `scripts/sync-plugin-version.mjs`
- `skills/engineering/diagnosing-bugs/scripts/hitl-loop.template.sh`
- `skills/engineering/wizard/template.sh`
- `skills/misc/git-guardrails-claude-code/scripts/block-dangerous-git.sh`

Some skills also instruct the hosting agent to use ambient tools or mutate the target workspace.

### `setup-matt-pocock-skills`

Observed behavior includes:

- inspecting repository state such as Git remotes/configuration and agent instruction files;
- configuring GitHub, GitLab, or local issue-tracker conventions;
- writing or editing `CLAUDE.md` or `AGENTS.md`;
- writing `docs/agents/issue-tracker.md`;
- writing `docs/agents/domain.md`;
- optionally writing `docs/agents/triage-labels.md`;
- using `gh` or `glab` according to configured tracker behavior.

The skill explicitly describes itself as prompt-driven rather than a deterministic script and requires user confirmation before writing, but it still exercises host filesystem/tool authority when invoked.

### `to-tickets`

Observed behavior includes:

- converting a plan/spec/conversation into tracer-bullet vertical-slice tickets;
- assigning explicit blocking edges;
- asking the user to approve granularity and dependencies;
- publishing one issue per ticket to a configured tracker or writing local ticket files;
- using native blocker/sub-issue relationships where supported;
- applying a `ready-for-agent` label unless otherwise instructed;
- treating the “frontier” as tickets whose blockers are satisfied.

Its OpenAI metadata explicitly sets `allow_implicit_invocation: false`.

### `code-review`

Observed behavior includes two independent parallel review axes:

- Standards;
- Spec fidelity.

The skill intentionally keeps these subagent reviews separate and aggregates them without collapsing one axis into the other.

### `grill-with-docs`

Observed behavior directs the harness to invoke two other model-invoked skills, `grilling` and `domain-modeling`, demonstrating explicit cross-skill orchestration.

### `wizard`

Observed behavior is security-sensitive and intentionally human-facing. The skill generates an interactive Bash setup wizard for procedures such as infrastructure provisioning, credentials, CI secrets, third-party dashboards, migrations, or cutovers.

Its template can:

- open URLs using platform helpers;
- capture visible values;
- capture hidden secret input;
- write/upsert values into an `.env` file;
- set GitHub Actions secrets through `gh secret set`;
- set GitHub repository variables through `gh variable set`.

The skill itself instructs the agent **not** to run generated wizards end-to-end automatically and to statically verify them before human handoff. That is a positive authority boundary, but the generated artifact still touches credentials, filesystem state, network/browser workflows, and repository secrets and therefore requires a stronger Signalproof security/authority gate before adaptation.

## 7. Dependency surface

Top-level `package.json` at the frozen commit declares:

- package version `1.2.3`;
- MIT license;
- package manager `npm@10.9.4`;
- development dependencies on `@changesets/changelog-github` and `@changesets/cli`;
- version/synchronization scripts.

This is the repository maintenance package surface, not proof that every skill is dependency-free at runtime. Individual skills may depend on ambient host tools, CLIs, browsers, issue trackers, agents, shell environments, or third-party services.

## 8. Permission / network / data / credential boundary

### Verified from inspected surfaces

The collection contains skills that may request or use:

- repository filesystem read/write access;
- Git command access;
- GitHub/GitLab issue-tracker tooling;
- external tracker/network access;
- subagent dispatch;
- browser opening;
- shell execution;
- `.env` file mutation;
- GitHub secret/variable mutation;
- credential/secret entry in generated human-driven setup flows.

### Important distinction

These permissions are largely supplied by the **hosting agent/harness and local tools**, not by a single declared permission manifest in the skill collection. Therefore a Signalproof intake decision cannot infer safety merely because a skill file is Markdown.

### Not established in this case

This review did not prove:

- every network endpoint any current skill could contact;
- telemetry behavior of external installer/marketplace tooling;
- sandbox behavior of the Claude Code plugin installer;
- runtime behavior of `skills@latest`;
- complete behavior of all 25 plugin skills;
- behavior of every `misc` or `in-progress` skill;
- absence of future upstream changes.

## 9. Duplication versus Signalproof

Several current upstream skills substantially overlap existing Signalproof Active disciplines:

| Upstream capability | Signalproof overlap | Intake interpretation |
|---|---|---|
| `ask-matt` | `signalproof-router` | Strong conceptual duplication: both choose an appropriate flow/skill. Signalproof adds explicit authority/evidence-state routing. |
| `research` | `signalproof-research` | Strong duplication. Signalproof already governs source quality, freshness, evidence classification, contradiction, provenance, and handoff. |
| `diagnosing-bugs` | `signalproof-debug` | Strong overlap in disciplined reproduce/localize/fix/regression loops. |
| `code-review` | `signalproof-review` | Strong overlap in change-quality/spec fidelity review; parallel independent axes are a potentially reusable pattern. |
| `implement` / `tdd` | `signalproof-build` + `signalproof-debug` + verification flow | Substantial overlap; upstream provides implementation methodology patterns, not an obvious missing governance lane. |
| `setup-matt-pocock-skills` | Signalproof governance/configuration practices | Some useful setup conventions, but direct adoption would impose external tracker/domain-document assumptions not proven necessary for Signalproof. |

No duplicate above justifies replacing an existing Active Signalproof skill.

## 10. Genuinely novel / materially distinct capability candidate

### `to-tickets` — tracer-bullet dependency graph and publication frontier

Current `signalproof-plan` creates a bounded execution contract with objective, evidence, protected state, scope, authority, dependencies, acceptance, recovery, STOP conditions, and execution handoff.

It does **not** currently define:

- conversion of a plan/spec into tracker-native tracer-bullet tickets;
- explicit ticket-to-ticket blocking edges;
- dependency-order publication;
- a tracker “frontier” of work whose blockers are satisfied;
- native issue/sub-issue/blocking-link publication semantics.

Therefore `to-tickets` provides a **genuinely distinct operational pattern** worth selective study/adaptation.

This does not establish that Signalproof needs a new specialist. Research/Evaluate may determine that the durable output belongs in `signalproof-plan`, a shared planning-to-work schema, a workflow compiler, an external adapter, or a future automation layer.

## 11. Other selective ADAPT candidates

### Parallel independent review axes

`code-review` separates Standards and Spec review into parallel subagents and deliberately avoids allowing one axis to mask the other. This is a potentially useful review-architecture pattern for Signalproof without replacing `signalproof-review`.

### Human-driven wizard pattern

The `wizard` concept is potentially useful for operations only a human can complete. However, any Signalproof adaptation must redesign it around Signalproof authority, secrets handling, provenance, recovery, and least-privilege requirements rather than copying the credential-writing template wholesale.

## 12. Hard gates for this intake class

The following conditions should force **QUARANTINE / STOP** and, when unresolved or incompatible with intended use, **REJECT**:

1. source, exact version/commit, or relevant file identity cannot be established;
2. license/attribution is unclear or incompatible with intended use;
3. reviewed content can silently change after approval without a new integrity gate;
4. installation/inspection silently executes unreviewed code;
5. shell/filesystem/network/credential authority materially exceeds declared purpose;
6. installer or dependency resolution pulls unpinned/unverifiable code where a frozen artifact is required;
7. secrets are exposed, persisted, transmitted, or logged outside the explicitly approved boundary;
8. persistence/startup changes occur without explicit authority;
9. adverse findings are suppressed or a scanner/reviewer result is represented as trust certification;
10. a skill or installer attempts to self-authorize installation, activation, publication, or privilege expansion;
11. capability is materially duplicative and provides no justified benefit over existing governed Signalproof capability;
12. rollback/removal or exact-version recovery cannot be described for an operationalized component.

## 13. Proposed disposition

### Collection-wide

**STUDY / REFERENCE**

Keep execution/install state **QUARANTINED** pending any separately approved candidate-specific review.

### Selective candidates

- `to-tickets` dependency-graph/frontier pattern — **ADAPT CANDIDATE**
- `code-review` parallel independent review-axis pattern — **STUDY / ADAPT CANDIDATE**
- `wizard` human-driven procedural handoff — **STUDY ONLY until a Signalproof secrets/authority design exists**

### Not approved

- wholesale installation;
- wholesale plugin adoption;
- auto-updating managed bundle as a trusted frozen dependency;
- execution of current shell/templates;
- import of all 25 skills;
- promotion of any upstream skill into Signalproof Active state.

## 14. Falsifiable acceptance evidence for a future selective adaptation

A future `to-tickets`-derived Signalproof candidate should fail acceptance if any of the following are true:

- generated tickets do not preserve the governing plan’s objective, scope, protected state, authority, or acceptance constraints;
- a ticket introduces implementation scope absent from the approved plan without surfacing it as a new decision;
- blocker edges contain cycles without explicit detection;
- a ticket is marked ready while a declared blocker remains incomplete;
- publishing to an external tracker occurs without human authority;
- a failed publication leaves ambiguous partial state without an evidence/recovery record;
- tracker-specific behavior becomes a hidden dependency of the core planning contract.

A candidate would need controlled fixture tests covering at least:

- linear dependencies;
- branching dependencies;
- independent parallel tickets;
- cycle rejection;
- one blocked frontier transition;
- local/offline output;
- external-publication dry run or mock boundary;
- preservation of plan constraints into every generated work item.

## 15. Unresolved unknowns

- The 25 official plugin skills were not all deeply re-audited in this case.
- Repository `misc` and `in-progress` surfaces were not fully dispositioned.
- The current managed Claude plugin installer/update path was not runtime-tested.
- The `skills@latest` installer/update path was not sandbox-tested.
- Current snapshot was not scanned with SkillSpector during this phase.
- No claim is made that this static review proves absence of malicious or unsafe behavior in every current/future repository surface.

## 16. Research decision

**CASE COMPLETE FOR V0.2 CROSS-CASE RESEARCH PURPOSES**

The evidence is sufficient to:

- prove exact current provenance for the frozen snapshot;
- prove the prior quarantine review is stale by 17 upstream commits;
- establish MIT licensing for the frozen repository;
- demonstrate consequential filesystem/tool/network/credential-capable surfaces;
- identify substantial duplication with existing Signalproof skills;
- identify at least one genuinely distinct capability pattern (`to-tickets`);
- define intake hard gates and falsifiable selective-adaptation tests;
- support a bounded collection-wide **STUDY / REFERENCE** disposition without installation.

The next V0.2 case may proceed only after this research change passes repository governance and the milestone is closed.