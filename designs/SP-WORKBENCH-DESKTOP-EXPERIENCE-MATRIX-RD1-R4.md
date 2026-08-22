# Signalproof Workbench RD1 R4 - Desktop Experience and Hermes Feature Matrix

**Status:** CANDIDATE / DESIGN AUTHORITY PACKET / NO PRODUCTION MUTATION  
**Work stream:** Signalproof Workbench Bots/Sessions/Dash  
**Owner:** Doc Reo  
**Design branch:** `candidate/workbench-bots-rd1`  
**Implementation branch to reconcile before build:** `candidate/workbench-rd2-gui-build`  
**Current protected Signalproof-Skills main checked:** `a1bf4633d1adc1a1229fc338daa45c57014d37c0`  
**Upstream reference checked:** `NousResearch/hermes-agent` current Desktop documentation on 2026-08-22  
**Supersedes:** prior top-level mode ordering where it conflicts with this document  
**Preserves:** accepted three-column Workbench shell, Signalproof visual identity, Governor/Core/Agent Runtime architecture, truthful-state requirements, and protected production baseline

---

## 1. Owner Decision Locked by R4

Signalproof Workbench is an AI operations workspace, not a Hermes clone.

The default/top-level operating order is now:

```text
DASH -> SESSIONS -> BOTS -> COMMAND CENTER -> MEMORY -> SETTINGS
```

`DASH` is first and is the default landing surface.

Meaning:

- **Dash** = operational awareness, governance state, active work, attention, runtime health, and configured summaries;
- **Sessions** = normal resumable human/AI conversations and workspaces;
- **Bots** = persistent named governed workers and their conversations/routines;
- **Command Center** = task/run/delegation orchestration and operator intervention;
- **Memory** = inspectable memory/skills/context relationships and lifecycle;
- **Settings** = providers, models, gateways, tools, skills, MCP, safety, memory, voice, appearance, keyboard, and runtime configuration.

Secondary capabilities such as Files, Artifacts, Git Review, Terminal, Evidence, Scheduled Jobs, Capabilities, and Messaging should normally appear as contextual rails, workpanes, overlays, command-palette destinations, or mode-specific utilities rather than expanding the primary navigation without need.

---

## 2. Non-Negotiable Signalproof Architecture

```text
Human
  -> Signalproof Workbench UI
  -> Signalproof Governor                 Policy Decision Point
  -> Signalproof Core Runtime             Policy Enforcement Point
  -> Signalproof Agent Runtime / Broker   Execution Plane
  -> Adapter / Provider / Tool / Worker
```

Hermes is a replaceable governed adapter and reference implementation source. It is not product-state authority.

Signalproof owns canonical product objects including Bot, Session, Message, Task, Run, Delegation, Schedule, Artifact reference, operational evidence, memory policy, adapter binding, approval state, and Workbench configuration.

A Bot is not authority. A widget is not authority. A model is not authority. A provider is not authority.

---

## 3. Shell Contract

Keep the accepted desktop-first shell:

```text
+------------------------------------------------------------------------------------------------+
| Signalproof Workbench | DASH | SESSIONS | BOTS | COMMAND CENTER | MEMORY | SETTINGS | Status |
+----------------------+-----------------------------------------------------+-------------------+
| mode/list rail       | dominant center workspace                           | contextual       |
|                      |                                                     | right workpane   |
| Dash sections        | dashboard / conversation / bot / orchestration      | terminal         |
| Session history      |                                                     | files            |
| Bot roster           |                                                     | preview          |
| task/run queues      |                                                     | git review       |
| memory filters       |                                                     | artifacts        |
|                      |                                                     | evidence         |
|                      | composer where conversational                       | context          |
+----------------------+-----------------------------------------------------+-------------------+
| HUD / status: Governor | Core | Runtime | Gateway | Model | Context | Task | Approval | Evidence |
+------------------------------------------------------------------------------------------------+
```

Rules:

1. The center remains the dominant work surface.
2. The right workpane is contextual and collapsible.
3. Dash must not become a card-wall admin portal; use hierarchy, lists, streams, compact modules, and drill-down.
4. Governance detail is available without flooding ordinary assistant prose.
5. Status is evidence-backed. UNKNOWN is never rendered as healthy.
6. The existing accepted Workbench visual language remains black/charcoal/red with restrained chrome.
7. Do not reopen accepted transcript/composer layout decisions merely to imitate Hermes.

---

## 4. Disposition Legend

- **ADOPT** - interaction concept fits Signalproof substantially as-is.
- **ADAPT** - retain the useful interaction but change state ownership, governance, branding, workflow, or authority.
- **INTEGRATE** - connect to an existing Signalproof/runtime capability rather than reproduce it independently.
- **DEFER** - valid target but not required for the first build slice.
- **REJECT** - conflicts with Signalproof authority, safety, product identity, or truthful-state requirements.

Priority:

- **P0** = foundational / required for intended Workbench product.
- **P1** = high-value next capability.
- **P2** = later maturity/polish.

---

# 5. Complete Design Matrix

## A. Primary Navigation and Dash

| ID | Reference capability | Disposition | Signalproof Workbench design | Backend/source dependency | Governance / evidence rule | Priority |
|---|---|---|---|---|---|---|
| A1 | Chat-first default landing | ADAPT | **Dash-first default landing**, with Sessions one click away | Operational state service | Dash values must come from authoritative state or show UNKNOWN | P0 |
| A2 | Sessions/Bots sidebar switch | ADAPT | Persistent top-level **Dash / Sessions / Bots / Command Center / Memory / Settings** navigation | Workbench route state | Mode switch cannot destroy active state | P0 |
| A3 | Dashboard/status overview | INTEGRATE | Signalproof Dash summarizes Governor, Core, Agent Runtime, gateways, active Bots, tasks, approvals, alerts, recent changes, and selected business widgets | Normalized operational state + adapters | No fabricated live integrations; timestamp/freshness required | P0 |
| A4 | Configurable status items | ADOPT | User-selectable Dash sections and HUD/status items | User settings | Configuration changes are explicit; normal view is read-mostly | P1 |
| A5 | Dashboard widgets | ADAPT | Widget definitions/snapshots use Signalproof-owned contracts and source adapters | Widget service / adapters | Current/stale/unknown/error semantics required | P1 |
| A6 | Drill-down from overview | ADOPT | Every material Dash item routes to owning Session, Bot, task/run, evidence, source app, or configuration | Cross-object navigation | Summary cannot contradict technical/evidence view | P0 |

## B. Sessions / Conversation Workspace

| ID | Reference capability | Disposition | Signalproof Workbench design | Backend/source dependency | Governance / evidence rule | Priority |
|---|---|---|---|---|---|---|
| B1 | Streaming chat | ADOPT | Stream assistant/model output and tool/task state where backend supports it | Agent Runtime event stream | Never simulate streaming if backend only returns final output | P0 |
| B2 | Shared/resumable session history | ADAPT | Signalproof Session is canonical; adapter session IDs are mappings only | Session Service | Adapter loss must not redefine canonical session identity | P0 |
| B3 | Drag/drop attachments | ADOPT | Drop files/images into composer with explicit context scope | Artifact/Attachment Service | File access must respect workspace/file capability policy | P1 |
| B4 | Composer history | ADOPT | Up/down recall of prior prompts where appropriate | Local UI state | Recall does not silently resend | P1 |
| B5 | Queued prompts and queue editing | ADAPT | Visible pending-turn queue with pause/edit/delete/reorder where runtime supports sequential queueing | Agent Runtime queue | Pending text is not a completed action; status must be explicit | P1 |
| B6 | Conversation timeline rail | ADOPT | Optional prompt/turn timeline for long sessions | Session index | Pure navigation; no state mutation | P2 |
| B7 | Find in transcript | ADOPT | Search rendered transcript and jump between matches | Client transcript index | Search does not alter source transcript | P1 |
| B8 | Session archive/search/rename/delete | ADOPT | Full session hygiene with pin/archive/search/rename/delete | Session Service | Deletion semantics must be explicit and recoverable where policy allows | P0 |
| B9 | Tabs | ADOPT | Multiple simultaneous Session/Bot/work views in tabs | Window/session state | Every tab shows its exact session/bot identity | P1 |
| B10 | Multiple windows | DEFER | Pop active Session/Bot/task into another window/monitor | Desktop window manager | Same underlying state, no duplicated authority | P2 |
| B11 | Model picker in composer | ADAPT | Simple `Auto / Local / pinned model` default; advanced provider/model details on demand | Model Capability Registry | No silent cloud fallback against policy | P0 |
| B12 | Reasoning/fast-mode presets | ADAPT | Expose only supported model controls and label them accurately | Provider/model adapter | UI may not claim provider capability not verified | P1 |
| B13 | Context usage meter | ADOPT | Live context meter with breakdown for conversation, system rules, skills, memory, tool definitions, MCP, attachments, etc. | Context Assembly Service | Values must be actual counts/estimates labeled by source | P1 |
| B14 | Stop / interrupt / steer / retry | ADOPT | Session controls mapped to normalized runtime operations | Agent Runtime | Control must report whether cancellation/steering actually succeeded | P0 |
| B15 | Markdown/code/table/link rendering | ADOPT | Mature rendering with copy/select and safe code blocks | Client renderer | Code presentation must not imply execution | P0 |
| B16 | Voice | INTEGRATE | Voice input/output as a Session capability | Voice adapter | Microphone/network/provider scope visible and governed | P2 |

## C. Right Workpane / Files / Terminal / Artifacts

| ID | Reference capability | Disposition | Signalproof Workbench design | Backend/source dependency | Governance / evidence rule | Priority |
|---|---|---|---|---|---|---|
| C1 | Right-hand preview rail | ADOPT | Contextual right workpane for file/web/tool/artifact/evidence preview while center work continues | Preview services | Preview is read-only unless explicit action is invoked | P0 |
| C2 | File browser | ADAPT | Browse current approved workspace roots | File capability broker | Never show inaccessible roots as available | P0 |
| C3 | File preview | ADOPT | Text/image/document preview linked to Session/task | Artifact/File service | Preserve source identity and path/provenance | P0 |
| C4 | Terminal in right rail | ADAPT | Persistent governed terminal/work shell | Local worker / execution environment | Shell execution requires exact capability/approval policy; no GUI bypass | P0 |
| C5 | Multiple terminals | ADAPT | Multiple named terminal instances scoped to workspace/Bot/environment | Execution Environment Manager | Each terminal shows identity, cwd, environment, owner Bot/session, and execution scope | P1 |
| C6 | Persistent terminal while hidden | ADAPT | Hiding pane does not kill approved process; explicit close/stop required | Process manager | Hidden running process remains visible in Command Center/HUD | P1 |
| C7 | Add terminal output to chat | ADOPT | Select output and attach as bounded context | Context Assembly Service | Context attachment records source terminal/run | P1 |
| C8 | Artifacts gallery | ADOPT | Searchable images/files/links generated by sessions/tasks, with jump-to-origin | Artifact Service | Every artifact has origin session/run/provenance | P1 |
| C9 | Web/tool output preview | ADOPT | Render fetched page/tool output beside active conversation | Adapter + preview service | Distinguish source content from model interpretation | P1 |

## D. Git / Repository Work

| ID | Reference capability | Disposition | Signalproof Workbench design | Backend/source dependency | Governance / evidence rule | Priority |
|---|---|---|---|---|---|---|
| D1 | Repository discovery | ADAPT | Explicit repository registry plus bounded discovery roots | Workspace service | Discovery roots/exclusions configurable; no uncontrolled disk crawl | P1 |
| D2 | Branch/ahead-behind status | ADOPT | Git state in right workpane and Dash/Command Center when relevant | Git adapter | Ref/head must be current at action time | P0 |
| D3 | Changed-file list/tree | ADOPT | Working-tree changes with clear source/run attribution | Git adapter + Run journal | Never attribute pre-existing changes to current Bot/turn | P0 |
| D4 | Diff: uncommitted / branch / last turn | ADAPT | Preserve all three scopes; `Last Run/Turn` requires exact run-to-file attribution | Git adapter + Run evidence | If exact attribution unavailable, mark UNKNOWN rather than guess | P0 |
| D5 | Stage/unstage/revert | ADAPT | Controlled Git actions from review pane | Git write capability | Destructive/revert actions require policy and recovery visibility | P1 |
| D6 | Commit / push | ADAPT | Commit and push through governed Git capability | Git adapter / credentials | Protected branches and publication authority remain binding | P1 |
| D7 | Generated commit message | ADOPT | Generate suggestion from exact diff; user/authorized Bot may edit | Model + Git read | Suggestion is not proof of change quality | P1 |
| D8 | Create PR / ask agent to open PR | ADAPT | Governed PR workflow with branch/source verification | GitHub/SCM adapter | External write is separately authorized and evidenced | P1 |
| D9 | Worktrees | ADOPT | Parallel candidate lanes/worktrees for isolated agent work | Git + workspace manager | Must not overwrite accepted checkout or production | P1 |

## E. Bots / Persistent Agents / Group Work

| ID | Reference capability | Disposition | Signalproof Workbench design | Backend/source dependency | Governance / evidence rule | Priority |
|---|---|---|---|---|---|---|
| E1 | Named bot roster | ADOPT | Persistent Bots with avatar, name, role/mission, state, latest activity, attention | Bot Registry | Status derives from real runtime/task state | P0 |
| E2 | Create/Edit Bot | ADAPT | Simple creation first; Advanced exposes model policy, SOUL/instructions, skills, tools, MCP, memory, web, files, apps, environment, schedules, delegation, approval | Bot Registry + policy stores | Bot changes versioned/provenanced; cannot grant itself authority | P0 |
| E3 | Bot-specific canonical chat | ADOPT | Each Bot has a primary conversation plus additional Sessions | Session Service | Bot Chat is still Signalproof Session state | P0 |
| E4 | Bot routines / cron | ADAPT | Per-Bot Routines pane backed by Signalproof Scheduler; Hermes cron may be adapter execution | Scheduler | Schedule creation and each consequential run remain governed | P1 |
| E5 | Hide/unhide Bots | ADOPT | Roster curation without deleting Bot state | Bot Registry/UI state | Hidden Bot activity still visible in Command Center/attention if consequential | P2 |
| E6 | Duplicate Bot | ADAPT | Clone configuration with explicit choices for memory, credentials, schedules, environment, and secrets | Bot Registry | Never silently clone credentials or private memory | P1 |
| E7 | @mentions | ADOPT | `@BotName` creates inspectable delegation/handoff | Task/Delegation Orchestrator | Context package and capability subset must be visible | P0 |
| E8 | Bot-to-Bot messaging | ADAPT | Visible attributed inter-Bot thread with source/destination/result | Inter-Bot Bus | No hidden inheritance of credentials/tools/full context | P0 |
| E9 | Group chats | ADOPT | Human + multiple Bots in a shared governed room | Group Session service | Every speaker/run attributable; reply-selection rule inspectable | P1 |
| E10 | Bot groups/crews | ADOPT | Organize Bots into crews/sections without merging identity | Bot Registry | Crew membership grants no new capabilities by itself | P1 |
| E11 | Per-Bot execution environment | ADAPT | Tiered workspace/container/VM/remote-worker assignment | Execution Environment Manager | Environment identity, roots, accounts, network, reset/rollback visible | P1 |
| E12 | Bot avatar generation | DEFER | Optional generated/uploaded avatars | Image adapter | Cosmetic only; identity always textual too | P2 |

## F. Command Center / Orchestration

| ID | Reference capability | Disposition | Signalproof Workbench design | Backend/source dependency | Governance / evidence rule | Priority |
|---|---|---|---|---|---|---|
| F1 | Agents/Command Center surface | ADAPT | First-class top-level Command Center for Tasks, Runs, Delegations, approvals, blockers, queued work, failures, schedules, and worker status | Agent Runtime | All states tied to actual persisted Task/Run objects | P0 |
| F2 | Active runs | ADOPT | Live list grouped by Bot/project/session with elapsed state and current step | Run service | No fake `working` indicator without active run evidence | P0 |
| F3 | Queue management | ADOPT | Pause/resume/cancel/reprioritize when runtime supports it | Task queue | Action outcome must be confirmed, not assumed | P1 |
| F4 | Approval queue | ADAPT | Central human approval/clarification inbox with risk/capability/resource context | Governor + Runtime | Approval UI cannot broaden exact requested scope | P0 |
| F5 | Delegation graph/thread | ADOPT | Inspect chain of Bot handoffs, hops, context packages, results, failures | Delegation service | Enforce hop/cycle/budget limits | P1 |
| F6 | Failure/retry view | ADAPT | Failure class, attempt number, evidence, recovery option, retry conditions | Run journal / known-failure intelligence | Same-failure retry discipline remains binding | P0 |
| F7 | Scheduled jobs | ADOPT | Upcoming/running/recent schedules with owning Bot and delivery target | Scheduler | Scheduled authority is not unlimited future authority; policy checked at execution | P1 |

## G. Memory / Skills / Context

| ID | Reference capability | Disposition | Signalproof Workbench design | Backend/source dependency | Governance / evidence rule | Priority |
|---|---|---|---|---|---|---|
| G1 | Memory Graph / Star Map | ADAPT | Interactive graph of Session/Bot/Project memories, Skills, provenance, and relationships | Memory Service + Skill Registry | Node state distinguishes learned, candidate, approved, active, stale, disputed | P1 |
| G2 | Timeline/playback | ADOPT | Time filter/playback for learned/used/changed memory and skills | Provenance timeline | Historical state cannot be rewritten by current inference | P2 |
| G3 | All / Used / Learned filters | ADAPT | Filters include scope, lifecycle, source, Bot, project, sensitivity, freshness | Memory index | Filter labels map to defined state semantics | P1 |
| G4 | Edit/delete memory | ADAPT | Memory correction/removal through explicit lifecycle actions | Memory Service | Canonical/project memory promotion requires separate governance | P1 |
| G5 | Share graph layout | ADOPT | Export/import layout only, excluding memory/skill content by default | UI layout store | Sharing must not leak underlying content | P2 |
| G6 | Skills browse/install/manage | ADAPT | Surface Signalproof Skill lifecycle and adapter skills | Skill Registry | Candidate != Active; install != authorize | P1 |
| G7 | Context inspector | ADOPT | Explain context assembled for current run and why each source is included | Context Assembly Service | Allow drill-down without exposing hidden secrets | P1 |

## H. HUD / Quick Entry / Desktop Convenience

| ID | Reference capability | Disposition | Signalproof Workbench design | Backend/source dependency | Governance / evidence rule | Priority |
|---|---|---|---|---|---|---|
| H1 | HUD floating chat | ADAPT | Optional always-on-top compact Workbench HUD for active Session/Bot | Desktop shell | Screen/app context capture must be explicit and permissioned | P1 |
| H2 | Position-as-context | ADAPT / CAUTION | Do not infer underlying app/page merely from window position unless an explicit screen-context capability is enabled | Screen/context adapter | Strong privacy indicator and explicit scope required | P2 |
| H3 | Quick Entry global hotkey | ADOPT | Global prompt/task launcher that targets chosen Session/Bot/Quick Task | Desktop shell + Runtime | User sees destination and capability scope before consequential execution | P1 |
| H4 | Global snap/show shortcuts | ADOPT | Rebindable show/hide/bring-to-pointer shortcuts | Desktop shell | Cosmetic/navigation only | P2 |
| H5 | Keep computer awake | ADOPT | Per-machine option for long approved runs | Desktop power manager | Does not imply run success; visible while active | P2 |

## I. Settings / Profiles / Providers / Gateways

| ID | Reference capability | Disposition | Signalproof Workbench design | Backend/source dependency | Governance / evidence rule | Priority |
|---|---|---|---|---|---|---|
| I1 | GUI onboarding | ADOPT | Guided first-run and runtime connection setup | Runtime/bootstrap | Must not weaken existing Governor/Core boundary | P1 |
| I2 | Providers/accounts/API keys | ADAPT | Provider account UI separated from model policy and Bot authority | Credential store + Model Registry | Secrets stored by approved mechanism; never displayed casually | P0 |
| I3 | Full provider/model catalog | ADAPT | Show verified models/capabilities from registry, including Granite/local and external providers | Model Capability Registry | Availability/capability has `last_verified`; no stale claims | P0 |
| I4 | Tool backend installs | ADAPT | Install/configure tools through governed setup workflow | Capability registry / package manager | Installation authority separate from execution authority | P1 |
| I5 | MCP management | ADAPT | Add/configure MCP servers as connectors behind capability policy | MCP broker | MCP connection is not blanket tool authorization | P1 |
| I6 | Per-profile settings | ADAPT | Signalproof Bot/Profile settings with explicit `Applies to` scope | Bot/Profile registry | Cross-Bot edits must show exact target | P1 |
| I7 | Profile export/import | ADAPT | Export Bot/workspace package with secrets stripped by default; include optional appearance/layout | Package service | Provenance/version manifest required; credentials excluded unless separately supported | P2 |
| I8 | Multi-profile concurrent sessions | ADOPT | Sessions across Bots/profiles run simultaneously | Runtime | Identity always visible in tab/HUD/run | P1 |
| I9 | Local gateway | INTEGRATE | Local Signalproof Agent Runtime gateway is primary | Gateway registry | Governor/Core remain ahead of execution | P0 |
| I10 | Remote gateway | ADAPT | Register remote Signalproof worker/runtime endpoints | Gateway registry | Authenticated, testable, named connection; policy/locality visible | P1 |
| I11 | Multiple gateways registry | ADOPT | Named Local/LAN/Remote/SSH/cloud-compatible execution endpoints | Gateway registry | Distinguish connection from trust/authority | P1 |
| I12 | Gateway selector + remembered profile | ADOPT | Switch runtime endpoint without confusing it with Bot identity | Gateway registry | Changing gateway cannot silently change data-locality policy | P1 |
| I13 | Connection test | ADOPT | Test health/auth/stream legs separately | Gateway registry | Test result is connectivity evidence only, not capability acceptance | P1 |
| I14 | Fleet update | ADAPT | Later managed updates across registered Signalproof/Hermes worker instances | Update service | Update requires bounded authority, rollback, version evidence | P2 |
| I15 | Hermes Cloud direct dependency | REJECT AS REQUIRED | Optional adapter only; Signalproof must not require Hermes Cloud | Hermes adapter | No mandatory third-party hosted dependency | P0 |

## J. Keyboard / Command Palette / Appearance / Accessibility

| ID | Reference capability | Disposition | Signalproof Workbench design | Backend/source dependency | Governance / evidence rule | Priority |
|---|---|---|---|---|---|---|
| J1 | Command palette | ADOPT | Global command/navigation palette for pages, sessions, Bots, terminal, gateway, settings, actions | Command registry | Consequential commands still pass normal authority gates | P0 |
| J2 | Rebindable shortcuts | ADOPT | Shortcut settings with collision detection | Desktop UI state | No hidden destructive shortcut without explicit semantics | P1 |
| J3 | Theme/appearance | ADAPT | Signalproof default remains black/charcoal/red; optional accessible themes may be added | UI theme system | Brand identity preserved in default product | P2 |
| J4 | External theme marketplace | DEFER | Consider only after security/license review | Theme importer | Remote theme package is untrusted input | P2 |
| J5 | UI language switcher | DEFER | Localization-ready architecture | i18n layer | Do not block core Workbench build | P2 |
| J6 | Zoom/scalable UI | ADOPT | Scalable interface/text | Desktop UI | Must preserve layout at supported scales | P1 |
| J7 | Keyboard navigation | ADOPT | Full principal workflow keyboard reachability | UI | Required acceptance evidence | P0 |
| J8 | Screen-reader/semantic accessibility | ADOPT | Semantic controls, labels, status text, focus order | UI accessibility layer | State cannot rely on color alone | P0 |
| J9 | Reduced motion | ADOPT | Respect system/user reduced-motion preference | UI | Motion never required to understand state | P1 |

## K. Safety / Authority / Evidence

| ID | Reference capability | Disposition | Signalproof Workbench design | Backend/source dependency | Governance / evidence rule | Priority |
|---|---|---|---|---|---|---|
| K1 | Hermes per-session YOLO bypass | **REJECT DIRECT PARITY** | No Workbench control may bypass Signalproof Governor/Core. A future `Authorized Session Scope` may reduce repeated prompts only inside a signed bounded envelope | Governor/Core | Authorization scope, expiry, resources, capabilities, evidence remain enforced | P0 |
| K2 | Tool approval prompts | INTEGRATE | Approvals generated by Governor policy and Runtime escalation | Governor + Runtime | Exact capability/resource scope shown | P0 |
| K3 | Control/Evidence panel | ADOPT + EXTEND | Right workpane/overlay shows Governor decision, Core enforcement, runtime/adapter/model/tool identities, approvals, evidence links | Operational Evidence Journal | Ordinary prose stays readable; evidence remains inspectable | P0 |
| K4 | Operational journal | SIGNALPROOF EXTENSION | Persist session/message/tool/run/delegation/gateway evidence separately from canonical Build Ledger | Operational Journal | Runtime telemetry does not become canonical development chronology | P0 |
| K5 | Build Ledger summary | SIGNALPROOF EXTENSION | Dash/technical view may show milestone status/read-only references | Build Ledger adapter | No runtime UI may directly manufacture canonical ledger entries | P1 |
| K6 | Protected state / rollback | SIGNALPROOF EXTENSION | Command Center/technical view shows protected baseline, candidate identity, recovery path where development work is active | Build/evidence service | Recovery claims require evidence | P1 |
| K7 | Skill lifecycle | SIGNALPROOF EXTENSION | Display Discovered/Candidate/Tested/Approved/Active/etc. separately from strategic disposition | Skill governance | Candidate is never shown as Active | P1 |
| K8 | Quarantine/Evidence | SIGNALPROOF EXTENSION | Evidence/quarantine status available in technical depth when relevant | Evidence service | Do not expose private/internal evidence in public-safe surfaces | P1 |
| K9 | Truthful background work | SIGNALPROOF EXTENSION | A Bot can appear RUNNING only when an actual Run/worker owns work | Runtime | No decorative activity animation without evidence | P0 |
| K10 | Human control boundary | SIGNALPROOF EXTENSION | Always expose Stop, approval, clarification, ownership, and consequential-action boundaries | Governor + Runtime | Human PASS cannot be fabricated | P0 |

---

# 6. Dash Detailed Contract - Default Surface

Dash should answer, at a glance:

```text
WHAT IS RUNNING?
WHAT NEEDS MY ATTENTION?
WHAT CHANGED?
WHAT IS BLOCKED?
WHAT IS HEALTHY / DEGRADED / UNKNOWN?
WHAT SHOULD I OPEN NEXT?
```

Recommended hierarchy:

1. **Operator strip** - Governor, Core, Agent Runtime, active gateway, model/locality, approval count, active runs.
2. **Attention stream** - approvals, blockers, failures, stale integrations, security/evidence exceptions.
3. **Active work** - Bots/tasks/runs with real state and elapsed time.
4. **Today / scheduled** - routines, calendar/agenda/meetings when adapters exist.
5. **Projects / applications** - Signalproof app/runtime status where authoritative state exists.
6. **Business widgets** - GHL/opportunity/growth/etc. only when normalized source adapters are actually connected.
7. **Recent changes/evidence** - bounded summaries linking to technical evidence.

Design rule: prefer one strong operational hierarchy over a mosaic of equally weighted cards.

---

# 7. Right Workpane Contract

The right side is a reusable workpane with tabs or contextual modes such as:

```text
CONTEXT | FILES | PREVIEW | TERMINAL | GIT | ARTIFACTS | EVIDENCE
```

It should remember state per active Session/Bot/project where useful. It can collapse completely.

When Terminal or Git is active, the center conversation remains available unless the user intentionally expands the workpane.

---

# 8. Source-of-Truth Matrix

| UI claim | Authoritative source |
|---|---|
| Governor ALLOW/DENY/REQUIRE_APPROVAL | Signalproof Governor decision record |
| Capability actually enforced | Core Runtime enforcement record |
| Bot identity/config | Signalproof Bot Registry |
| Session/message history | Signalproof Session Service |
| Task/Run status | Signalproof Agent Runtime |
| Adapter/provider/model used | Run provenance / Model Registry |
| Tool invocation | Operational Event Journal |
| File/artifact origin | Artifact/File service provenance |
| Git last-turn/last-run change | exact Run-to-Git attribution evidence |
| Gateway health | live/tested Gateway Registry observation |
| Memory node | Memory Service with provenance/lifecycle |
| Skill status | Signalproof Skill Registry/governance |
| Dashboard business value | normalized source adapter snapshot with timestamp |
| Build milestone | canonical Build Ledger reference when verified |

---

# 9. Current Implementation Reconciliation

The receiving designer must not pretend this is a greenfield product.

Current implementation continuity on `candidate/workbench-rd2-gui-build` includes a working Workbench shell, Granite conversation path, `SESSIONS | BOTS | DASH`, right contextual rail, composer, long transcript rendering, and ongoing R6 UX/runtime work.

R4 changes the information architecture target without authorizing destructive redesign:

1. Reorder/expand the primary navigation to **Dash first**.
2. Preserve existing working Sessions/Bots/Dash behavior during migration.
3. Add Command Center, Memory, Settings as top-level Workbench surfaces when their backend state is real enough to support them.
4. Add Hermes-like right workpane capabilities incrementally.
5. Do not reopen the known transcript/composer fixes or reintroduce the failed FlowLayoutPanel message system.
6. Code blocks, terminal surfaces, and execution affordances must fail safely and must not visually imply that displayed code has executed.
7. Live Dash adapters remain subordinate to the core conversational/agent-runtime path unless the owner reprioritizes them.

---

# 10. Phased Design/Build Target

## Phase P0 - Product truth and core shell

- Dash-first navigation;
- Sessions;
- Bots;
- Command Center shell backed by real Task/Run state;
- right workpane frame;
- files/preview;
- governed terminal;
- Git review basic read/diff;
- model/context/HUD state;
- Governor/Core/Runtime evidence panel;
- Signalproof-owned Bot/Session/Task/Run contracts;
- Granite path preserved behind normalized Agent Runtime.

## Phase P1 - Agent operating environment

- Hermes gateway adapter;
- routines/schedules;
- group chats and @Bot delegation;
- multi-terminal and execution environments;
- Artifacts;
- Git stage/commit/PR/worktrees;
- Memory Graph;
- Skills management;
- multi-gateway registry;
- Quick Entry;
- HUD;
- web/file/MCP capability broker;
- first business app connector.

## Phase P2 - maturity/polish

- multi-window workflows;
- localization;
- theme import after security review;
- profile packaging/export/import;
- fleet updates;
- richer memory timeline/share layout;
- generated avatars;
- advanced desktop context capture with explicit privacy policy.

---

# 11. Designer Acceptance Matrix

The design is ready for Builder consumption when the designer can demonstrate, in artifacts/specification:

1. Dash is unmistakably first/default.
2. Sessions remains a mature normal LLM workspace rather than an admin screen.
3. Bots remains a persistent-worker workspace, not a settings catalog.
4. Command Center clearly separates Task/Run/Delegation/Approval state from ordinary chat.
5. Memory has a defined graph/list drill-down and lifecycle semantics.
6. Settings clearly separates providers/credentials, gateways, models, tools/MCP, safety, memory, voice, appearance, and keyboard.
7. The right workpane supports Files/Preview/Terminal/Git/Artifacts/Evidence without crowding the center.
8. Dash does not become a card wall and never fabricates live state.
9. Terminal/Git/external-action surfaces visibly remain governed.
10. Bot-to-Bot work is inspectable.
11. No Hermes branding or product-state ownership is copied.
12. Signalproof black/charcoal/red identity remains obvious and readable.
13. Resize behavior preserves center usability; right workpane collapses first.
14. Keyboard/focus semantics are specified for principal flows.
15. Every health/status visualization has a source-of-truth field and UNKNOWN treatment.
16. The design distinguishes concept approval, visual approval, runtime acceptance, data acceptance, accessibility acceptance, and owner UI PASS.
17. Existing working RD2 shell behavior has a non-destructive migration path.

---

# 12. Forbidden Design Shortcuts

Do not:

- clone Hermes Desktop visually;
- move authority from Signalproof to Hermes;
- expose a YOLO-style Governor bypass;
- infer `RUNNING` from an animation or optimistic UI state;
- represent stale/unknown Dash data as current;
- mix normal operational telemetry into canonical Build Ledger chronology;
- hide consequential Bot delegation;
- silently transfer all context/credentials/tools between Bots;
- silently fall back from local/private execution to cloud;
- turn the Workbench into a dense enterprise dashboard;
- reopen accepted shell/transcript fixes without contradictory evidence;
- make code/terminal previews look executed when they are only displayed;
- use candidate Skills or memory as though they were approved canonical authority.

---

# 13. External Reference Notes

Current official Hermes Desktop documentation was used to identify interaction patterns including:

- streaming chat/tool summaries;
- right-hand preview rail;
- file browser and Artifacts;
- tabs/windows/panes;
- persistent terminals;
- Git review and worktrees;
- Memory Graph;
- Quick Entry;
- voice;
- HUD mode;
- settings/providers/models/tools/MCP;
- Profiles;
- Cron;
- Agents / Command Center;
- built-in Bot Mode, routines, group chats, @mentions, bot-to-bot messaging;
- command palette and rebindable shortcuts;
- concurrent profile sessions;
- local/remote/cloud/SSH multi-gateway registry.

Reference path:

`NousResearch/hermes-agent/website/docs/user-guide/desktop.md`

Signalproof disposition remains feature-by-feature ADOPT/ADAPT/INTEGRATE/DEFER/REJECT according to this matrix.

---

# 14. R4 Design Result

```text
R4 DESIGN RESULT
Work stream: Signalproof Workbench Bots/Sessions/Dash
Primary/default mode: DASH
Top-level order: DASH -> SESSIONS -> BOTS -> COMMAND CENTER -> MEMORY -> SETTINGS
Shell: PRESERVE three-column desktop Workbench
Hermes Desktop: FEATURE/INTERACTION REFERENCE ONLY
Hermes runtime: REPLACEABLE GOVERNED ADAPTER
Signalproof Governor/Core authority: PRESERVED
Existing RD2 implementation: PRESERVE AND MIGRATE, DO NOT GREENFIELD-REWRITE
Dash truthfulness: HARD GATE
Operational journal vs Build Ledger: SEPARATE
Direct YOLO/Governor bypass: REJECTED
Production mutation: NONE
Designer next action: produce R4 visual/interaction specification against this matrix, then reconcile with current RD2 candidate before implementation changes
```
