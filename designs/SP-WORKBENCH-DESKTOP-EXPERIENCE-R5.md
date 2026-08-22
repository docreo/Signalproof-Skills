# Signalproof Workbench Desktop Experience R5

**Status:** CANDIDATE / BUILDER-READY DESIGN / NO PRODUCTION MUTATION  
**Work stream:** Signalproof Workbench Desktop Experience R5  
**Owner:** Doc Reo  
**Design branch:** `candidate/workbench-desktop-experience-r5`  
**Parent design authority:** `candidate/workbench-bots-rd1`  
**Protected runtime baseline:** accepted Signalproof Workbench R6-OS1 RD1 candidate + persistent OS Runtime RD3  
**Governing public Skills main at design start:** `a1bf4633d1adc1a1229fc338daa45c57014d37c0`

## 1. Product Decision

Signalproof Workbench evolves into a Signalproof-owned desktop AI operating workspace that adopts the strongest interaction patterns demonstrated by Hermes Desktop and modern conversational AI clients without becoming a Hermes clone and without surrendering Signalproof state, governance, memory, identity, or authority.

Hermes is a replaceable governed adapter. Signalproof Workbench is the product.

The design target is:

```text
Human
  -> Signalproof Workbench UI
  -> Signalproof Governor
  -> Signalproof Core Runtime
  -> Signalproof Agent Runtime / Broker
  -> approved adapter / provider / tool / worker
```

The accepted direct governed Granite conversational path remains protected during migration.

## 2. Default Navigation

Top-level order is locked as:

```text
DASH -> SESSIONS -> BOTS -> COMMAND CENTER -> MEMORY -> SETTINGS
```

`DASH` is first and is the default landing surface.

### Dash
Operational awareness and attention.

### Sessions
Normal resumable human/AI conversations.

### Bots
Persistent named governed workers and Bot conversations.

### Command Center
Tasks, Runs, Delegations, approvals, schedules, blockers, failures, and operator intervention.

### Memory
Inspectable memory, context, skills, relationships, provenance, and lifecycle.

### Settings
Providers, models, gateways, tools, MCP, skills, memory, safety, voice, appearance, keyboard, and runtime configuration.

## 3. Persistent Desktop Shell

The existing three-column Workbench shell remains the migration base:

```text
+------------------------------------------------------------------------------------------------+
| SP  Signalproof Workbench | DASH | SESSIONS | BOTS | COMMAND CENTER | MEMORY | SETTINGS | ● |
+---------------------------+---------------------------------------------------+------------------+
| mode/list rail            | dominant center workspace                         | contextual      |
|                           |                                                   | right workpane  |
| Dash views                | dashboard                                         | Context         |
| Session history           | conversation                                      | Files           |
| Bot roster                | bot workspace                                     | Preview         |
| Task/run queues           | command center                                    | Terminal        |
| Memory filters            | memory graph/list                                 | Git             |
| Settings categories       | settings                                          | Artifacts       |
|                           |                                                   | Evidence        |
+---------------------------+---------------------------------------------------+------------------+
| HUD: Governor | Core | OS Runtime | Gateway | Model | Context | Runs | Approvals | Evidence      |
+------------------------------------------------------------------------------------------------+
```

Rules:

1. Center remains dominant.
2. Right workpane collapses before center becomes cramped.
3. Left rail changes by active top-level mode.
4. Composer remains persistent only where conversation/task input is relevant.
5. Technical telemetry is inspectable but does not flood ordinary assistant prose.
6. No visual state may imply a runtime capability that is not actually connected.

## 4. Visual Language

Preserve the accepted Signalproof identity:

- black / near-black application background;
- charcoal panel layers;
- Signalproof red primary accent;
- circular red SP product mark;
- white / near-white primary text;
- restrained gray secondary text;
- semantic colors only for real status;
- compact desktop chrome;
- strong typography hierarchy;
- minimal card chrome in Sessions and Bots;
- operational modules in Dash without turning the product into a card wall.

The current accepted Workbench screen is the visual continuity baseline, not something to discard.

## 5. Dash R5

Dash answers:

```text
WHAT IS RUNNING?
WHAT NEEDS MY ATTENTION?
WHAT CHANGED?
WHAT IS BLOCKED?
WHAT IS HEALTHY / DEGRADED / UNKNOWN?
WHAT SHOULD I OPEN NEXT?
```

Hierarchy:

1. Operator strip: Governor, Core, OS Runtime, Agent Runtime, gateway, model/locality, active runs, approvals.
2. Attention stream: approvals, blockers, failures, stale integrations, security/evidence exceptions.
3. Active work: Bots, Tasks, Runs with real state and elapsed time.
4. Today: routines, schedules, calendar, meetings where adapters exist.
5. Projects / applications: Signalproof app/runtime status backed by authoritative state.
6. Business widgets: GHL, Opportunity Detector, growth, etc. only after normalized adapters are actually connected.
7. Recent changes/evidence: concise summaries linking to exact source/evidence.

Unknown data renders `UNKNOWN`, not green/healthy.

## 6. Sessions R5

Sessions becomes the mature everyday LLM workspace.

Required interaction targets:

- streaming output where backend supports it;
- resumable Signalproof-owned Session history;
- pin/archive/search/rename/delete;
- drag/drop file and image attachments;
- transcript find and navigation;
- tabs for simultaneous conversations/work views;
- model selector: `Auto / Local / pinned model` with advanced details elsewhere;
- context usage meter with source breakdown;
- Stop / Interrupt / Steer / Retry;
- mature Markdown/code/table/link rendering;
- optional voice integration later;
- visible queued prompts only if the runtime genuinely supports queueing.

A displayed code block is never presented as executed unless exact Run evidence exists.

## 7. Bots R5

Bots are persistent governed workers, not presets.

Each Bot may have:

- avatar/icon;
- name;
- role;
- mission;
- instruction/SOUL policy;
- model policy;
- skills;
- tools;
- MCP access;
- memory policy;
- web/file permissions;
- execution environment;
- routines/schedules;
- delegation policy;
- approval policy;
- budget policy.

Bot configuration is versioned.

Required user experiences:

- Create Bot;
- Edit Bot;
- chat with Bot;
- assign task;
- `@BotName` delegation;
- Bot-to-Bot handoff;
- group chat / crew participation;
- visible delegation chain;
- explicit collaborator/context package;
- no silent inheritance of credentials, memory, tools, or authority.

A Bot may show `RUNNING` only while a real Run exists.

## 8. Command Center R5

Command Center is a first-class operator surface for:

- active Tasks;
- active Runs;
- delegation chains;
- approval requests;
- clarification requests;
- queued work;
- blocked work;
- failed work;
- schedules/routines;
- worker/environment state;
- Stop/Pause/Resume/Cancel/Reprioritize where supported.

Every status is bound to persisted Task/Run evidence.

No decorative activity animation is sufficient to claim work is running.

## 9. Memory R5

Memory is a user-inspectable Signalproof-owned surface.

Primary views:

- Graph;
- List;
- Timeline;
- Sources / provenance;
- Skills/context relationships;
- lifecycle state.

Memory node presentation should expose, as applicable:

- source;
- owner;
- created/updated timestamps;
- scope;
- provenance;
- retention state;
- Bot/Session/Project links;
- whether the item is canonical, derived, candidate, temporary, stale, or archived.

Hermes memory may be consumed through an adapter but does not become canonical Signalproof memory identity.

## 10. Contextual Right Workpane

The right workpane supports:

```text
CONTEXT | FILES | PREVIEW | TERMINAL | GIT | ARTIFACTS | EVIDENCE
```

### Context
Current Session/Bot/Task context and bounded sources.

### Files
Browse approved workspace roots only.

### Preview
Read-only file/image/document/web/tool preview.

### Terminal
Persistent governed shell tied to an approved execution environment. No UI bypass around Governor/Core.

### Git
Branch state, ahead/behind, changed files, diffs, and later governed stage/commit/push/PR actions.

### Artifacts
Searchable files/images/links generated by Runs with origin provenance.

### Evidence
Governor decision, Core enforcement, runtime/adapter/model/tool identities, approvals, delegation evidence, operational journal references, protected baseline/recovery where relevant.

## 11. HUD

A compact always-available HUD/status strip may show:

- Governor;
- Core;
- OS Runtime;
- Agent Runtime;
- active gateway;
- active/pinned model and locality;
- context usage;
- active Runs;
- pending approvals;
- evidence state.

HUD values must come from authoritative state and include `UNKNOWN`, `STALE`, `DEGRADED`, and `OFFLINE` semantics where applicable.

## 12. Quick Entry

Quick Entry is a lightweight command/message capture surface for:

- new prompt;
- new task;
- send to Bot;
- open Session;
- attach file/context;
- start governed command.

It does not bypass the normal Governor/Core authorization path.

## 13. Gateways and Runtime Connections

Workbench supports multiple runtime/gateway definitions as governed connections, including local and later remote/SSH/cloud profiles where approved.

Each gateway record includes:

- identity;
- endpoint/transport type;
- health;
- last verified time;
- locality;
- capabilities;
- authentication state without exposing secrets;
- policy scope;
- associated models/providers;
- recovery/disable controls.

No automatic cloud fallback is allowed when local/private execution is required.

## 14. Hermes Adapter

Hermes remains the first major external agent adapter target.

Disposition:

```text
ADAPT / INTEGRATE
```

Preferred rich integration surface remains the Hermes TUI gateway JSON-RPC/local controlled process boundary where it provides sessions, streaming, approvals, delegation, steering, interruption, model switching, and lifecycle state.

Signalproof owns:

- Bot identity;
- Session identity;
- Task/Run identity;
- schedules;
- memory policy;
- approvals;
- evidence;
- product history;
- operator UX.

Hermes supplies replaceable execution capability.

Direct Hermes-style YOLO/governor bypass is rejected.

## 15. Protected R6-OS1 Baseline

The newly accepted R6-OS1 bounded gate becomes the protected migration baseline for this design stream.

Preserve:

- governed Granite conversation path;
- Governor registered-client challenge-response;
- no direct Core route from Workbench;
- no direct Hermes route from Workbench;
- persistent OS Runtime independence from Workbench process lifecycle;
- read-only OS Runtime observability at the current gate;
- GHL disabled until its separate adapter/credential gate;
- production isolation during candidate work.

No R5 implementation may weaken those guarantees merely to obtain Hermes-like interaction parity.

## 16. Implementation Sequence

Do not attempt the entire product in one mutation.

### R5 Slice 1 — Shell and navigation migration

- Dash first/default;
- top-level order locked;
- preserve Sessions/Bots existing behavior;
- placeholder Command Center/Memory/Settings may exist only when clearly labeled as not yet live;
- right workpane frame expanded to the R5 tab contract;
- HUD frame using only existing authoritative runtime state;
- current Granite path preserved.

### R5 Slice 2 — Signalproof Agent Runtime foundation

- Bot Registry;
- Session Service normalization;
- Task/Run objects;
- operational journal;
- normalized runtime event stream;
- Command Center becomes live.

### R5 Slice 3 — Hermes adapter

- controlled Hermes process/gateway lifecycle;
- Session mapping;
- streaming events;
- approvals;
- steering/interrupt;
- delegation state;
- model provenance.

### R5 Slice 4 — Workpane execution surfaces

- Files/Preview;
- governed Terminal;
- Git read/diff;
- Artifacts;
- richer Evidence.

### R5 Slice 5 — Bots and collaboration

- Bot creation/edit;
- `@Bot` delegation;
- Bot-to-Bot messaging;
- group chats/crews;
- per-Bot routines;
- execution environments.

### R5 Slice 6 — Memory and skills

- Memory Graph;
- lifecycle/provenance inspection;
- skill visibility and governance state;
- context assembly meter.

### R5 Slice 7 — Quick Entry, gateways, connectors

- Quick Entry;
- multi-gateway registry;
- web/MCP broker;
- first business connector after separate authority gate.

## 17. Slice 1 Acceptance Target

Before the next owner UI test, Slice 1 must prove:

1. candidate is isolated from production;
2. accepted R6-OS1 baseline remains unchanged;
3. app opens as `Signalproof Workbench`;
4. Dash is first/default;
5. top-level order is `DASH / SESSIONS / BOTS / COMMAND CENTER / MEMORY / SETTINGS`;
6. Sessions still works as the current governed Granite conversation surface;
7. Bots existing truthful behavior is preserved;
8. right workpane can switch/collapse without losing center state;
9. Control/Evidence remains reachable;
10. HUD displays only authoritative existing status;
11. no placeholder surface implies live backend capability;
12. resize/focus behavior does not regress;
13. closing Workbench still does not terminate persistent OS Runtime RD3;
14. machine acceptance passes before owner UI testing.

## 18. Complete Authorization Envelope for This Workstream

```text
COMPLETE AUTHORIZATION ENVELOPE
Workstream: Signalproof Workbench Desktop Experience R5
Objective: evolve the accepted Workbench toward the planned Signalproof-owned Hermes-inspired desktop operating experience
Git basis: docreo/Signalproof-Skills main a1bf4633d1adc1a1229fc338daa45c57014d37c0 + candidate/workbench-bots-rd1 design authority
Protected state: accepted R6-OS1 Workbench/OS Runtime behavior and Governor/Core governance boundaries
Acceptance target: R5 Slice 1 machine PASS -> exact owner UI test
Allowed authority: owner-authorizable design/build/debug/test/verify/recovery work inside isolated candidate lanes
Known failure memory: preserve current PowerShell registry and prior Workbench failure identities; no unchanged retry
Recovery: non-production candidate; accepted R6-OS1 remains rollback/protected baseline
Excluded authority: production deployment, protected-main bypass, canonical Build Ledger append, credentials/secrets acquisition, security weakening, unrelated products/workstreams
Consumption: owner ACCEPTED, material workstream change, envelope invalidation, or real STOP
Status: AUTHORIZED-PENDING-LOCAL-BUILD-EXECUTION
```

## 19. Builder Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Workbench Desktop Experience R5 / Slice 1
Git basis: current protected main + candidate/workbench-desktop-experience-r5
Current state: R5 design frozen; implementation not yet executed on owner workstation
Objective: non-destructively migrate current accepted Workbench shell to Dash-first R5 navigation/frame while preserving governed Granite and R6-OS1 runtime behavior
Route: build-spawn-debug
Action class: BUILD / TEST / VERIFY
Protected state: accepted R6-OS1 candidate and persistent RD3 OS Runtime
Allowed surface: fresh isolated Workbench candidate/evidence lane only
Known-failure constraints: load current PowerShell failure registry; exact-final parser preflight; immutable failed lanes; no duplicate runner revision; no stale evidence identity binding
Dependencies/authority: authoritative current Workbench source and exact accepted R6-OS1 candidate identity must be resolved locally before mutation
Acceptance evidence: compile/self-test/UI smoke/governed Granite regression/right-workpane/navigation/HUD/runtime-survival machine gates
Recovery/non-mutation: abandon candidate lane and preserve accepted baseline on failure
STOP conditions: source authority ambiguous, protected identity drift, known-bad path repeated unchanged, implementation requires production mutation or security weakening, or machine acceptance cannot be honestly established
Closeout trigger: AUTOMATED PASS / USER UI TEST READY for R5 Slice 1
```

## 20. R5 Design Result

```text
R5 DESIGN RESULT
Product: SIGNALPROOF WORKBENCH
Default surface: DASH
Top-level order: DASH -> SESSIONS -> BOTS -> COMMAND CENTER -> MEMORY -> SETTINGS
Three-column shell: PRESERVED AND EXPANDED
Hermes Desktop: FEATURE / INTERACTION REFERENCE ONLY
Hermes runtime: REPLACEABLE GOVERNED ADAPTER
Signalproof state ownership: PRESERVED
Governor/Core authority: PRESERVED
Accepted R6-OS1 candidate: PROTECTED MIGRATION BASELINE
Direct YOLO/governor bypass: REJECTED
Production mutation: NONE
Next executable gate: R5 SLICE 1 LOCAL BUILD / TEST / VERIFY
```
