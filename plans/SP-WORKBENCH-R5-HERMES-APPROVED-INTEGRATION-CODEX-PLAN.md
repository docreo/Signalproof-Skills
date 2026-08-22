# Signalproof Workbench R5 - Hermes-Approved Functionality Integration Plan for Codex

**Status:** CANDIDATE / CODEX-LEVEL IMPLEMENTATION PLAN / NO PRODUCTION MUTATION  
**Work stream:** Signalproof Workbench Desktop Experience R5  
**Owner:** Doc Reo  
**Branch:** `candidate/workbench-desktop-experience-r5`  
**Accepted shell:** `designs/SP-WORKBENCH-R5-SLICE1-RD2-TOPNAV-ACCEPTANCE.md`  
**R5 design:** `designs/SP-WORKBENCH-DESKTOP-EXPERIENCE-R5.md`  
**R4 Hermes matrix:** `designs/SP-WORKBENCH-DESKTOP-EXPERIENCE-MATRIX-RD1-R4.md` on `candidate/workbench-bots-rd1`  
**R4 designer handoff:** `handoffs/SP-WORKBENCH-RD1-R4-DESIGNER-HANDOFF.md` on `candidate/workbench-bots-rd1`  
**Protected public Skills main checked at plan creation:** `a1bf4633d1adc1a1229fc338daa45c57014d37c0`

---

# 1. Mission

Evolve the accepted Signalproof Workbench R5 shell into a mature Signalproof-owned desktop AI operations workspace by decomposing the approved Hermes Desktop / modern AI-client capability family into bounded implementation slices.

The goal is not to clone Hermes, Grok, ChatGPT, or any other client.

The goal is to achieve comparable daily-use ergonomics and agent-work visibility while preserving Signalproof ownership of identity, memory, state, evidence, authorization, runtime policy, and recovery.

Target authority chain:

```text
Human
  -> Signalproof Workbench UI
  -> Signalproof Governor
  -> Signalproof Core Runtime
  -> Signalproof Agent Runtime / Broker
  -> Adapter / Provider / Tool / Worker
       |- Hermes adapter
       |- local Granite/direct governed model adapter
       |- coding worker / Codex-class adapter
       |- future model/provider adapters
       |- approved tools / MCP / execution environments
```

Hermes is a replaceable adapter and implementation/reference source, not Workbench authority.

---

# 2. Accepted Starting Point

The continuing UX shell is locked as:

```text
TOP:  SP Signalproof Workbench | DASH | SESSIONS | BOTS | COMMAND CENTER | MEMORY | SETTINGS | utilities
LEFT: active-mode-specific rail
CENTER: dominant work/conversation canvas
RIGHT: contextual workpane / evidence / files / preview / terminal / Git / artifacts
BOTTOM/HUD: compact governed runtime/task/approval status where useful
```

Dash is first/default.

The prior vertical six-destination left navigation is rejected. Do not reintroduce it.

The currently accepted Workbench family already has evidence of:

- Signalproof branding;
- persistent Sessions;
- persistent Bot profiles;
- direct human conversation through the governed Granite path;
- right-side Context / Control-Evidence behavior;
- long transcript/code rendering;
- local state persistence;
- read-only authenticated persistent OS Runtime observation;
- OS Runtime independence from Workbench process lifetime;
- GHL held behind a separate adapter/credential gate.

The next builder must inspect the exact current host candidate before changing code. Do not assume the Git design branch contains the current executable source.

---

# 3. Non-Negotiable Protected State

Preserve unless new evidence explicitly invalidates it:

1. `Human -> Workbench -> Governor -> Core -> Granite` remains working during migration.
2. No direct Workbench -> model bypass.
3. No direct Workbench -> Core bypass.
4. No direct Workbench -> Hermes process authority path.
5. Persistent OS Runtime stays independent of Workbench UI process lifetime.
6. Current Workbench OS Runtime access stays read-only until a separate actuation gate is explicitly designed, authorized, built, and verified.
7. GHL stays disabled until its dedicated normalized adapter/credential gate.
8. Production state is not replaced by Candidate work.
9. Protected-main / PR controls remain binding.
10. Canonical private Build Ledger append is a separate authority boundary.
11. Candidate Skill activation is a separate authority boundary.
12. No UI status may claim RUNNING, ONLINE, CONNECTED, HEALTHY, COMPLETED, or AUTHORIZED without an authoritative source.
13. Unknown, stale, degraded, disabled, and not-connected states must be rendered truthfully.

---

# 4. Hermes Decomposition Rule

Before implementing any Hermes-derived feature, classify it as one of:

```text
ADOPT      interaction concept fits Signalproof substantially as-is
ADAPT      preserve interaction but replace state ownership / security / governance semantics
INTEGRATE  connect to existing Signalproof service rather than duplicate it
DEFER      valid later feature, not current dependency
REJECT     conflicts with Signalproof authority, privacy, governance, or truthful-state rules
```

For every feature, answer four questions:

1. What user interaction is valuable?
2. What Signalproof-owned object/service is canonical?
3. What backend capability must actually exist before the UI may claim it works?
4. What evidence proves the feature executed correctly?

Do not copy a Hermes UI element merely because it exists upstream.

Before copying/adapting actual upstream source code, verify current upstream license, file-level provenance, dependencies, and compatibility with Signalproof licensing. Interaction ideas may be reimplemented independently when that is cleaner or safer.

---

# 5. Canonical Signalproof Product Objects

Codex should move Workbench toward explicit canonical objects rather than hiding state inside controls:

```text
WorkbenchConfig
Gateway
Provider
ModelCapability
Bot
BotVersion
Session
Message
Attachment
ContextPackage
Task
Run
RunEvent
Delegation
ApprovalRequest
ClarificationRequest
Schedule
Routine
ExecutionEnvironment
TerminalSession
ArtifactReference
GitWorkspace
GitChangeAttribution
MemoryItem
MemoryLink
MemoryPromotion
EvidenceReference
OperationalJournalEntry
AdapterBinding
```

Hermes IDs, provider IDs, terminal PIDs, external job IDs, or model session IDs are mappings to these objects, not replacements for them.

---

# 6. Target Capability Families

The approved R4 matrix calls for the following families, implemented only when their backend truth can be supported:

## 6.1 Sessions / mature conversational workspace

Target capabilities:

- streaming output where backend supports it;
- resumable Signalproof-owned Session history;
- search, pin, archive, rename, delete;
- attachments / drag-and-drop;
- transcript find/navigation;
- multiple tabs/work views;
- model policy selector such as Auto / Local / pinned model;
- context usage meter with source breakdown;
- Stop / Interrupt / Steer / Retry;
- mature Markdown, tables, links, and code blocks;
- bounded tool/run activity embedded in conversation;
- optional prompt queue only when runtime supports queue semantics.

Do not break the current working Granite conversation path while improving Session UX.

## 6.2 Bots / persistent governed workers

Target Bot profile/configuration:

- avatar/icon;
- name;
- role;
- mission;
- instructions / SOUL policy;
- model policy;
- skills;
- tools;
- MCP access;
- memory policy;
- web/file/app permissions;
- execution environment;
- routines/schedules;
- delegation policy;
- approval policy;
- budget/resource policy;
- version/provenance.

Target user interactions:

- Create / Edit / Duplicate / Hide / Delete Bot;
- canonical Bot chat;
- additional Bot Sessions;
- assign task;
- `@BotName` delegation;
- explicit Add Bot / crew;
- visible Bot-to-Bot handoff;
- group chats;
- routines;
- current Run/task state;
- attention/unread cues.

Bots cannot grant themselves credentials, memory scope, tools, network access, or authority.

## 6.3 Agent Runtime / Broker

This is the key enabling backend before advanced Hermes-style agent UX can become real.

Required normalized responsibilities:

- accept governed Task requests from Workbench/Core;
- create stable Signalproof Task and Run identities;
- route work to adapters/workers;
- emit normalized Run events;
- persist current state;
- support Stop/Cancel and later Pause/Resume where worker supports it;
- mediate delegation;
- enforce budgets/hop/cycle constraints;
- generate evidence/provenance references;
- expose status to Workbench without granting UI authority;
- distinguish worker failure from harness/adapter failure;
- maintain adapter mappings.

Do not wire Command Center to fake local UI state before this contract exists.

## 6.4 Hermes adapter

Hermes adapter should translate between Signalproof normalized contracts and Hermes worker semantics.

Adapter responsibilities may include:

- capability discovery;
- worker/session launch mapping;
- tool/MCP availability mapping;
- stream/event normalization;
- cancellation/interrupt mapping;
- artifact mapping;
- terminal/execution mapping where appropriate;
- Hermes memory import/reference without making it canonical Signalproof memory;
- schedule/routine execution mapping where authorized;
- error classification;
- evidence capture.

Hermes must not:

- bypass Governor/Core;
- become canonical Bot/Session/Memory state;
- silently inherit credentials;
- silently obtain all Signalproof context;
- silently enable unrestricted execution;
- redefine protected workspace roots;
- represent unknown execution as success.

## 6.5 Command Center

When Agent Runtime exists, implement:

- Tasks;
- Runs;
- current step/event stream;
- delegations;
- approvals;
- clarification requests;
- queued work;
- blocked work;
- failed work;
- retry/recovery state;
- schedules/routines;
- worker/gateway/environment state;
- Stop/Pause/Resume/Cancel/Reprioritize only where normalized backend supports them.

No decorative spinner is sufficient evidence of active work.

## 6.6 Contextual right workpane

Target tabs/surfaces:

```text
CONTEXT | FILES | PREVIEW | TERMINAL | GIT | ARTIFACTS | EVIDENCE
```

Rules:

- collapses before center becomes cramped;
- mode/context determines relevant default;
- preview is read-only unless explicit action occurs;
- current roots/cwd/environment/source identity are visible;
- Evidence remains on-demand utility depth, not ordinary visual noise.

## 6.7 Files / Preview / Artifacts

Implement against approved roots and artifact service:

- bounded workspace browser;
- text/image/document preview;
- tool/web-output preview;
- attachments/context inclusion;
- artifact gallery/search;
- jump to originating Session/Run;
- provenance/source path/hash where relevant.

Do not expose arbitrary filesystem roots as available merely because the OS can access them.

## 6.8 Terminal / execution environments

Implement only behind governed execution capability:

- named terminal sessions;
- exact environment identity;
- cwd/workspace;
- owner Session/Bot/Task;
- running process visibility;
- hidden terminals persist only when explicitly allowed;
- Stop/Kill semantics;
- add selected terminal output to chat/context;
- evidence links;
- multiple terminals later.

A displayed code block is not execution evidence.

## 6.9 Git review / worktrees

Target:

- repository registry/discovery roots;
- branch / ahead-behind state;
- changed files;
- diff views: uncommitted / branch / last attributable Run or Turn;
- exact attribution or UNKNOWN;
- stage / unstage / revert under policy;
- commit / push under policy;
- PR creation through approved adapter;
- isolated worktrees for parallel agent work.

Never attribute pre-existing changes to a new Bot/Run without evidence.

## 6.10 Memory

Signalproof owns canonical memory.

Target views:

- Graph;
- List;
- Timeline;
- Sources / provenance;
- Skills / context relationships.

Target scopes:

```text
M0 Turn
M1 Session
M2 Bot
M3 Project / Workspace
M4 Organization / Canonical candidate
```

Memory writes/promotions require source, scope, provenance, lifecycle, and policy. Model inference does not silently become canonical fact.

## 6.11 Routines / schedules

Target:

- per-Bot routines;
- Signalproof Scheduler canonical identity;
- Hermes cron/scheduler only as an execution adapter where useful;
- next run / last run / status / source / owner;
- consequential execution remains governed;
- schedule creation does not imply the future Run succeeded.

## 6.12 Group chats / Bot-to-Bot collaboration

Target:

- human + multiple Bots in shared Session;
- every speaker attributable;
- visible handoff/delegation records;
- explicit context package sent to collaborator;
- no shared full memory/credentials by default;
- hop/cycle/budget limits;
- synthesized result returned to main conversation.

## 6.13 Settings / provider / gateway / tools / MCP

Target categories:

- Providers;
- Models;
- Gateways;
- Workspace;
- Tools & Keys;
- MCP;
- Skills;
- Memory & Context;
- Safety / Approvals;
- Voice;
- Chat;
- Appearance;
- Keyboard Shortcuts;
- Advanced / Desktop.

Gateway record should include identity, endpoint/transport, health, last verified time, locality, capabilities, auth state without secrets, policy scope, model/provider associations, and disable/recovery state.

No automatic cloud fallback when local/private execution is required.

## 6.14 Dash

Dash should progressively become operationally useful as real services connect.

Hierarchy:

1. Governor/Core/OS Runtime/Agent Runtime/gateway/model state;
2. attention: approvals, blockers, failures, stale integrations, evidence/security exceptions;
3. active Bots / Tasks / Runs;
4. today: schedules/calendar/meetings when adapters exist;
5. Signalproof app/runtime/project state;
6. business widgets such as GHL / Opportunity Detector only after adapter truth exists;
7. recent changes/evidence.

Avoid a card-wall admin portal.

## 6.15 HUD / Quick Entry / command palette

After core services stabilize:

- compact runtime/gateway/model/context/run/approval indicators;
- global quick prompt/task capture;
- target Bot/Session selector;
- command palette;
- keyboard-first navigation;
- explicit screen/context privacy controls if desktop capture is later introduced.

---

# 7. Implementation Order

Do not attempt all capabilities in one monolithic rewrite.

## Gate 0 - Reconcile exact current candidate

First action for the receiving builder:

1. refetch current `docreo/Signalproof-Skills/main`;
2. refetch `candidate/workbench-desktop-experience-r5`;
3. refetch `candidate/workbench-bots-rd1`;
4. inspect exact host RD2 candidate source/build report/manifest;
5. hash-bind the exact accepted RD2 source and EXE;
6. verify persistent OS Runtime identity and working Granite path;
7. reload PowerShell failure registry if PowerShell is used;
8. create a new isolated candidate/worktree; do not mutate RD2 accepted evidence in place.

Acceptance: exact current implementation identity known and protected.

## Gate 1 - Structural refactor without behavior loss

Objective: make current WinForms/desktop code maintainable enough for advanced panes/services without greenfield replacement.

Preferred work:

- extract view/state/service boundaries incrementally;
- centralize route state;
- centralize Signalproof-owned object contracts;
- add event/status binding interfaces;
- make right workpane pluggable/collapsible;
- preserve accepted top navigation and current Sessions/Bots behavior.

Acceptance: same user-visible accepted functions pass with cleaner internal seams.

## Gate 2 - Sessions maturity

Implement high-value chat-client improvements that do not require Hermes runtime first:

- transcript/search improvements;
- attachments foundation;
- tab/session hygiene;
- model policy display;
- context meter foundation;
- stop/retry normalization only where current backend supports it;
- right-pane Context/Preview improvements.

Acceptance: mature daily chat experience, governed Granite path unchanged.

## Gate 3 - Canonical Bot model and Bot editor

Move Bots from simple profiles toward versioned governed worker definitions.

Acceptance: Bot configuration can express future Hermes capabilities without actually pretending those capabilities are connected.

## Gate 4 - Agent Runtime / Broker foundation

Build normalized Task/Run/Event/Delegation contracts and one safe worker route.

Start with the smallest worker integration that proves the contract before adding many adapters.

Acceptance: Workbench can create an actual governed Task/Run and observe evidence-backed lifecycle.

## Gate 5 - Hermes adapter minimum viable integration

Connect Hermes behind Agent Runtime for one bounded worker capability.

Minimum proof should include:

- registered adapter identity;
- governed request;
- bounded context/capability package;
- real Run events;
- result/artifact mapping;
- stop/error semantics;
- evidence;
- no authority bypass.

Acceptance: one real Hermes-backed Signalproof Bot task succeeds under Governor/Core without Hermes owning canonical Bot/Session/Memory state.

## Gate 6 - Command Center live binding

Replace current placeholder/UNKNOWN Command Center sections with actual Agent Runtime Task/Run/Approval/Delegation state.

Acceptance: status reflects persisted runtime truth and user controls report actual outcomes.

## Gate 7 - Right workpane foundation

Implement Context / Files / Preview / Artifacts first.

Acceptance: context-aware pane is useful and collapses cleanly without reducing center usability.

## Gate 8 - Governed Terminal and execution environment

Only after execution-environment contracts exist.

Acceptance: exact terminal owner/environment/cwd/process state and evidence are visible; no bypass.

## Gate 9 - Git review / worktree integration

Acceptance: current ref/change state is accurate and attribution rules are enforced.

## Gate 10 - Memory service + Memory Graph/List/Timeline

Acceptance: provenance and lifecycle are inspectable; no silent canonical promotion.

## Gate 11 - Routines / scheduler

Acceptance: canonical Signalproof schedules are observable and future executions remain governed Runs.

## Gate 12 - Group chats / inter-Bot delegation

Acceptance: collaboration is visible, bounded, attributable, and cannot inherit hidden authority.

## Gate 13 - Providers / gateways / MCP / tools settings

Acceptance: connection/capability state is real, secrets are not exposed, no prohibited fallback occurs.

## Gate 14 - Dash live operational binding

Acceptance: every material live value has source/freshness semantics; UNKNOWN remains honest.

## Gate 15 - HUD / Quick Entry / command palette / keyboard polish

Acceptance: convenience features do not create a second authority path.

## Gate 16 - Voice / multiwindow / advanced polish

Later maturity only after the operational core is stable.

---

# 8. Builder Strategy

Codex should prefer a **strangler migration** over a rewrite:

```text
accepted Workbench behavior
  -> extracted interfaces/contracts
  -> new Signalproof-owned services
  -> adapter bindings
  -> new UI surfaces consuming normalized services
  -> retire old inline implementation only after exact parity/evidence
```

For each slice:

1. inspect current source first;
2. identify protected methods/state;
3. add the smallest seam;
4. compile/test exact candidate;
5. preserve rollback copy;
6. run transport/runtime regression;
7. run UI automation where reliable;
8. obtain owner visual acceptance for material UX changes;
9. only then continue to next slice.

Do not combine major architecture, runtime, storage, and visual redesign into the same unbounded patch.

---

# 9. Required Testing Layers

Each applicable slice should distinguish:

- static/source contract test;
- compile/build test;
- serialization/state migration test;
- Governor authentication/policy test;
- Core enforcement test;
- model/adapter transport test;
- Agent Runtime Task/Run lifecycle test;
- adapter error/cancel test;
- persistence/reopen test;
- process independence test;
- UI navigation/resizing test;
- human visual/usability gate;
- provenance/evidence check;
- protected baseline postflight.

Harness failures must not be mislabeled as product failures.

---

# 10. PowerShell / Host Execution Guard

If PowerShell remains part of the local build/test workflow:

- reload current `library/POWERSHELL-FAILURE-REGISTRY.yaml` from public `main` before generating a consequential runner;
- preserve attempt counts across chats;
- parse the exact final staged `.ps1` before execution;
- hash-bind exact runner identity where identity matters;
- do not repeat a disproven harness method without materially changed conditions;
- keep generated/received executables and runners in the discovered governed quarantine/evidence staging root rather than assuming ordinary Downloads;
- do not publish private host paths into the public Skills repository.

Known R5 UI-smoke history from this workstream:

```text
Attempt 1: UI Automation name lookup / InvokePattern -> HARNESS FAIL
Attempt 2: UI Automation exact ControlType.Button -> HARNESS FAIL
Attempt 3: Win32 child HWND + BM_CLICK -> PASS
```

This history is prevention evidence, not a reason to claim the product itself failed.

---

# 11. Security / Licensing / Privacy Boundaries

Before adopting Hermes implementation code or external dependencies:

- inspect current upstream repository/license and relevant file provenance;
- preserve Signalproof licensing requirements for original Signalproof work;
- do not copy incompatible code;
- do not expose credentials in UI/logs/evidence;
- do not bypass authentication/authorization for convenience;
- do not expose arbitrary host filesystem/network capability through a Bot;
- do not normalize unrestricted execution as a standard Signalproof feature;
- do not import external memory as canonical truth without provenance/promotion policy.

Hermes-style reduced-friction/YOLO interaction is REJECTED as an authority bypass. If Signalproof later supports reduced confirmation, model it as a bounded, explicit, expiring authorization envelope enforced by Governor/Core.

---

# 12. Definition of Done for the Broader R5 Expansion

The broader Workbench expansion is mature when:

1. accepted top-navigation shell remains stable;
2. Sessions feels like a mature modern LLM workspace;
3. Bots are persistent governed workers, not presets;
4. at least one real Hermes-backed Bot task runs through Agent Runtime under Governor/Core;
5. Command Center shows actual Task/Run/Delegation/Approval truth;
6. right workpane supplies Context/Files/Preview/Terminal/Git/Artifacts/Evidence as real capabilities;
7. Memory is Signalproof-owned and provenance/lifecycle are inspectable;
8. schedules/routines are canonical Signalproof objects;
9. group chat / Bot delegation is visible and bounded;
10. provider/gateway/tool/MCP state is truthful and governed;
11. Dash reflects real operational state and freshness;
12. persistent OS Runtime remains independent;
13. current local/private routing requirements cannot silently fall back to cloud;
14. failed attempts and adapter failures remain evidenced;
15. owner reports the resulting Workbench is usable for daily operation.

This Definition of Done does not itself authorize production deployment or public release.

---

# 13. Receiving Codex First Action

Do not start by writing new GUI code.

Start by executing the receiving handoff bootstrap, then perform **Gate 0 reconciliation** and emit a bounded `/dsp complete` authorization envelope for the exact R5/Hermes integration stream.

The exact receiving packet is:

`handoffs/SP-WORKBENCH-R5-CODEX-COMPLETE-HANDOFF.md`

---

# 14. Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Workbench R5 Hermes-Approved Functionality Integration
Git basis: current public main + candidate/workbench-desktop-experience-r5 + candidate/workbench-bots-rd1 + exact host RD2 candidate evidence
Current state: RD2 top-navigation UX accepted; broader Hermes-derived functionality not yet integrated
Objective: incrementally integrate approved modern desktop-agent capabilities behind Signalproof-owned state and Governor/Core/Agent Runtime authority
Route: /dsp complete -> build-spawn-debug, using current Git skills and bounded slices in this plan
Action class: RECONCILE -> REFACTOR -> BUILD -> TEST -> VERIFY -> HUMAN UI
Protected state: accepted RD2 shell, current governed Granite path, persistent OS Runtime, production baseline, protected-main controls
Allowed surface: new isolated candidate source/build/evidence lanes, candidate Git documentation/design/implementation branches, governed adapter/runtime work
Known-failure constraints: no greenfield rewrite; no vertical six-destination left menu; no fake live state; no UIA retry loops already disproven; no direct Hermes/Core/model bypass
Dependencies/authority: owner has requested next workstream completion planning and Codex handoff; production deployment, protected-main bypass, canonical private Build Ledger append, credentials, privilege/security-control changes remain separate
Acceptance evidence: gate-specific machine PASS + exact candidate identity + human UI acceptance for material UX changes
Recovery/non-mutation: preserve each accepted candidate and rollback source; derive next slice separately
STOP conditions: authority bypass required; exact baseline cannot be established; licensing/security/provenance unresolved; protected state would be overwritten; same known failure repeated without changed condition; UI would fabricate capability/status
Closeout trigger: broader R5 Definition of Done satisfied and owner accepts resulting Workbench, or an excluded authority boundary is reached
```
