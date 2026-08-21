# Signalproof Workbench RD2 R6 - Agent Console Pre-Planning

**Status:** DESIGN / PRE-PLANNING READY WITH CHECKPOINTS / NO PRODUCTION MUTATION  
**Date:** 2026-08-21  
**Owner:** Doc Reo  
**Work stream:** Signalproof Workbench GUI RD2  
**Current doctrine authority:** `docreo/Signalproof-Skills/main` at `f27e5f83172ffdca628f992c3b36297a2967d551`  
**Design/evidence branch:** `candidate/workbench-rd2-gui-build`  
**Mode:** DESIGN-GIT + PLAN + SEPARATED CHALLENGE LANES  
**Builder implementation:** separate receiving chat after handoff

---

## 1. Owner Direction

The next Workbench phase is not another isolated scroll-fix cycle.

The owner has directed that the Workbench become a smooth, usable Signalproof agent console with the non-Dashboard functionality discussed throughout the Workbench design actually working.

Immediate user-visible housekeeping:

1. add more breathing room around transcript content so messages are not pressed against the edge of the conversation box;
2. improve visual rhythm and interaction smoothness so the application feels closer to mature chat/agent clients;
3. preserve the now-working Session/Bot deletion controls;
4. continue to improve the Sessions and Bots experiences as first-class product modes;
5. keep `DASH` present, but defer live Dashboard integrations/functionality until the owner returns to that workstream.

Functional direction:

1. Bots must become real governed workers, not configuration-only records;
2. Sessions must remain normal resumable conversations;
3. Workbench must be able to connect through governed adapters to multiple AI/provider backends;
4. Workbench must be able to use approved tools and connect to approved external applications;
5. Workbench must be able to run approved programs/commands on the local machine through a governed execution path;
6. the Signalproof Revenue Recovery Engine use case must be able to operate through the Workbench rather than waiting for a separate interface;
7. the owner wants OpenAI/Codex/API, Claude, Gemini, Grok, CS1/Cerebras, Granite, and Hermes-style agent connectivity to fit the same Bot/Session product model;
8. Signalproof remains the authority and state owner. Hermes or any model/provider remains replaceable.

---

## 2. Current Human-Observed UI Evidence

Latest owner screenshot shows a running Signalproof Workbench with:

- `SESSIONS | BOTS | DASH` shell present;
- Signalproof black/red identity;
- Session transcript rendering user and Signalproof/Granite messages;
- right contextual rail;
- bottom composer and Send control;
- governed Granite conversation occurring in the center transcript;
- long response content visible in the transcript;
- prior owner confirmation that Session/Bot delete controls work.

Current visual deficiency visible in the screenshot:

- transcript content begins too close to the left/internal edge of the conversation surface;
- lines are allowed to run too wide across the center canvas, reducing readability;
- message groups need more consistent vertical rhythm;
- composer and transcript need stronger shared alignment/gutter rules;
- the experience reads as a functional engineering console rather than a refined daily-use chat/agent client.

Important evidence boundary:

The screenshot proves a running UI state and supports design correction. It does not by itself prove every R5.1/H1 automated gate, every Bot function, every provider adapter, app connector, tool path, or machine-execution capability.

---

## 3. Protected Architecture - Must Not Regress

The accepted execution ownership remains:

```text
Human
  -> Signalproof Workbench UI
  -> Signalproof Governor
  -> Signalproof Core Runtime
  -> Signalproof Agent Runtime / Broker
  -> governed adapter / provider / tool / worker
```

For the already-working local conversational path:

```text
Workbench -> Governor -> Core -> Granite
```

must continue to work while the Agent Runtime is introduced behind the same governance boundary.

Ownership remains:

- Workbench owns human interaction and operator visibility;
- Governor decides policy/authority;
- Core enforces the decision;
- Agent Runtime/Broker orchestrates execution and state;
- adapters translate to Hermes/providers/apps/tools;
- Signalproof owns canonical Bot, Session, Task, Run, Memory, Evidence, and policy-linked state;
- external engines do not become the authority plane.

No new feature may create a direct Workbench -> provider/tool/shell bypass for a capability that requires governance.

---

## 4. Protected Product Model

Primary modes remain:

```text
SESSIONS    BOTS    DASH
```

### Sessions

Sessions are normal conversations/workspaces.

Required behavior target:

- create;
- select/resume;
- rename;
- delete with confirmation;
- persistent history;
- provider/model context visible but not intrusive;
- attachments/context;
- streaming response;
- stop/interruption;
- retry/regenerate where supported;
- copy/select;
- proper Markdown/code rendering;
- tool/approval activity shown without dumping internal protocol text into the transcript;
- evidence/control available on demand.

### Bots

Bots are persistent governed workers.

Required behavior target:

- create;
- select;
- rename;
- delete;
- role/mission/instruction editing;
- provider/model policy;
- memory policy;
- tools/web/file policy;
- delegation policy;
- execution environment policy;
- application connector policy;
- schedule/automation policy;
- persistent Bot conversation(s);
- task/run history;
- visible collaborator/delegation state;
- actual execution when adapter/runtime support exists;
- never fabricate worker activity.

### Dash

Dash remains in the shell.

Current owner boundary:

- live Dashboard functionality is deferred;
- do not remove the Dash mode;
- do not spend this phase implementing broad live widgets/source adapters;
- preserve earlier dashboard contracts so later work can resume cleanly;
- any placeholder state must remain explicitly non-live/unknown.

---

## 5. Design Challenge Lanes

No independent external design agents are available inside this chat runtime. The requested spawn-style pre-planning is therefore executed as explicitly separated challenge lanes whose conclusions are reconciled below rather than represented as independently running agents.

### Lane A - Daily-Use UX / Competitive Parity

Question:

What must change for Workbench to feel like a polished chat/agent application rather than a functional engineering prototype?

Result:

The center conversation area should move toward a bounded readable content column instead of using the full available width.

Recommended design tokens for Builder validation:

```text
conversation_outer_gutter: 20-32 px desktop
conversation_content_max_width: 960-1100 px
message_group_gap: 18-24 px
role_to_body_gap: 4-8 px
transcript_top_padding: 20-28 px
transcript_bottom_padding: 20-32 px plus composer-safe space
composer_gap_from_transcript: 12-20 px
composer_inner_padding: 12-16 px
left/right message text padding: minimum 16-24 px from usable content boundary
```

Exact values may be tuned during visual acceptance, but the principle is locked: text must not touch container edges and line length must remain comfortable.

Smoother interaction target:

- stable scroll with no layout jumps;
- follow latest while the operator remains at bottom;
- if operator scrolls upward, do not forcibly yank them back down;
- provide `Jump to latest` affordance when new content arrives while scrolled up;
- preserve input focus after sends unless an approval/modal legitimately takes focus;
- streaming assistant output where backend supports it;
- clear `working / tool / waiting for approval / stopped / complete` states;
- Send changes to Stop while an interruptible run is active;
- Enter sends, Shift+Enter adds newline;
- keyboard-reachable primary controls;
- Markdown rendering for headings, bullets, inline code, fenced code, tables, links, bold/italic;
- copy buttons for messages/code blocks;
- links visibly distinguished and opened according to governed/safe policy;
- useful empty states;
- non-blocking status/errors;
- no raw JSON/protocol payloads in normal conversation mode.

Design challenge result: PASS. This is bounded polish, not a shell redesign.

### Lane B - Agent Runtime / Hermes-Style Capability

Question:

How does Workbench acquire Hermes-like agent functionality without surrendering Signalproof authority/state?

Result:

Implement the already-designed Signalproof Agent Runtime/Broker as the narrow orchestration waist behind Governor/Core.

The Agent Runtime should own normalized Signalproof lifecycle objects:

```text
Bot
Session
Message
Task
Run
Delegation
ToolInvocation
ApprovalRequest
Artifact
MemoryUpdate
Schedule
AdapterBinding
```

The runtime should expose one Signalproof client contract to Workbench regardless of which backend is executing.

Recommended first adapter remains Hermes TUI Gateway JSON-RPC because prior upstream review established support for:

- prompt submission;
- sessions;
- streaming message events;
- tool lifecycle events;
- approvals;
- clarification prompts;
- interruption/steering;
- model switching;
- delegation/subagents;
- image attachment;
- process/session controls.

Hermes should run behind a Signalproof adapter/process boundary. Its session/profile IDs are adapter state, not canonical Signalproof identity.

Design challenge result: PASS WITH CONTRACT FREEZE.

### Lane C - Multi-Provider AI Routing

Question:

How do Granite, OpenAI/Codex/API, Claude, Gemini, Grok, CS1/Cerebras, Hermes, and future providers coexist without one-off GUI integrations?

Result:

Create a `ProviderAdapter` contract owned by Agent Runtime.

Conceptual interface:

```text
ProviderAdapter
  adapter_id
  provider_family
  capability_manifest
  health()
  list_models()
  create_or_bind_session()
  submit_turn()
  stream_events()
  stop()
  steer() optional
  tool_support
  attachment_support
  reasoning_support
  usage_reporting
  provenance()
```

Provider state belongs in Bot/Session policy and normalized runtime state, not hard-coded GUI branches.

Initial adapter families:

1. `granite.local` - already-proven local governed model path;
2. `hermes.gateway` - rich agent adapter;
3. `openai.api` - OpenAI API model/provider route;
4. `openai.codex` - separate Codex/agent worker integration where available and authorized;
5. `anthropic.api` - Claude;
6. `google.gemini` - Gemini;
7. `xai.api` - Grok;
8. `cerebras.api` - CS1/Cerebras-class provider route;
9. `openai.compatible` - governed generic compatibility surface for future endpoints.

Credentials are not configuration prose. They must remain in an approved secret store and be resolved at execution time under policy. Do not store API keys in Bot JSON/state or Git.

Design challenge result: PASS WITH SECRET/PROVIDER GATES.

### Lane D - Local Program / Machine Execution

Question:

How can Bots run programs on the owner's machine without turning the Workbench into an unrestricted remote shell?

Result:

Create a governed local worker/execution adapter behind Core and Agent Runtime.

Conceptual execution chain:

```text
Bot/Session intent
 -> Governor decision
 -> Core execution ticket
 -> Agent Runtime
 -> LocalWorkerAdapter
 -> approved process/shell/program
```

Required execution controls:

- exact executable/tool identity where applicable;
- explicit working directory;
- bounded filesystem roots;
- environment-variable allowlist/secret injection policy;
- timeout;
- process ID tracking;
- stdout/stderr streaming separately;
- exit-code/result contract;
- interrupt/kill;
- write/destructive classification;
- elevation/privilege boundary;
- external-network boundary;
- evidence journal;
- artifact references;
- no hidden persistence.

Execution levels should remain policy-addressable, consistent with the existing conceptual environment model:

```text
E0 conversation only
E1 Bot workspace
E2 isolated process/container/WSL when validated
E3 dedicated Windows sandbox/VM
E4 remote worker
```

For initial usability, E1 local process execution can be the first target if it can be bounded and audited. Do not pretend E2-E4 isolation exists until verified.

Design challenge result: PASS WITH HARD GOVERNANCE GATE.

### Lane E - Tools, Web, Files, MCP, and App Connectivity

Question:

How does the Workbench connect to other applications without creating a separate bespoke implementation for every app?

Result:

Use a normalized capability/app connector layer behind Agent Runtime.

Connector classes:

```text
ToolAdapter
McpAdapter
WebAdapter
BrowserAdapter
FileAdapter
AppConnector
NotificationAdapter
```

Each connector advertises capabilities and required authorization instead of silently appearing as universally available.

Web capability levels remain policy-visible:

```text
W0 none
W1 search
W2 fetch/read
W3 unauthenticated browser
W4 authenticated read
W5 external write/action
```

Downloads remain separately governed.

For the Signalproof Revenue Recovery Engine, application connectivity is a high-priority operational dependency. The Builder should consume the existing RRE/GHL integration plan when that connector gate begins rather than inventing a duplicate CRM contract inside Workbench.

Initial app-integration architecture should support:

- webhook/private-integration style connectors;
- authenticated APIs;
- MCP where appropriate;
- local companion services;
- browser automation only where a stronger API/integration route is unavailable and policy allows it.

Design challenge result: PASS WITH PER-CONNECTOR AUTHORITY.

### Lane F - Governance / Security / Truthfulness

Question:

What could make the richer Workbench unsafe or misleading?

Result:

Hard constraints:

- UI configuration is not execution authority;
- choosing a provider in a Bot does not make credentials/capabilities exist;
- a Bot cannot grant itself tools/web/shell/delegation;
- a provider cannot bypass Governor/Core because the GUI has its SDK;
- tool/app status must distinguish configured, authorized, available, unavailable, stale, and error;
- background work must be backed by actual Run/Task state;
- secret values are never displayed in normal evidence views;
- local execution logs must distinguish stdout/stderr/exit status;
- application external-write actions must surface approval according to policy;
- no provider connection is labeled live until a real round trip is verified;
- no Bot collaboration is shown unless a real Delegation/Run exists;
- no production mutation from candidate Builder work without separate authority.

Design challenge result: HARD PASS CONDITION.

### Lane G - RRE Operational Readiness

Question:

What is the smallest Workbench capability set that materially helps the Revenue Recovery Engine become useful?

Result:

The RRE does not need live Dash first.

It needs:

1. reliable Sessions;
2. persistent named RRE Bot;
3. Agent Runtime execution lifecycle;
4. provider routing so the RRE Bot can use an appropriate model/agent;
5. web/research capability;
6. governed local tool/program execution;
7. files/artifacts;
8. CRM/app connector path;
9. task/run history;
10. approvals and evidence;
11. optional multi-Bot delegation after the single-Bot path is stable.

Design challenge result: BUILD THESE BEFORE LIVE DASH.

---

## 6. Consolidated R6 Product Target

R6 is not defined as one monolithic release artifact. It is the next bounded implementation program whose Builder can advance gate by gate under the current Complete/build-spawn-debug authority.

The user-visible target is:

> Signalproof Workbench feels like a polished daily-use chat/agent client, keeps Sessions and Bots persistent and manageable, routes all consequential capabilities through Governor/Core, can execute real Bot work through a Signalproof Agent Runtime, can connect to approved AI providers and applications through adapters, can run approved programs/tools on the local machine, and leaves live Dashboard integrations for a later phase.

---

## 7. Required UI Housekeeping - First Builder Slice

The first Builder slice should be deliberately small and visible.

### 7.1 Conversation gutters

Add explicit internal transcript gutters/padding.

Acceptance target:

- no message text begins directly against the conversation surface edge;
- center conversation content has at least 20 px effective desktop gutter;
- content column is centered when available width exceeds its max width;
- composer aligns visually with the conversation content column.

### 7.2 Message rhythm

Acceptance target:

- role label and message body are visually grouped;
- adjacent turns have 18-24 px equivalent separation;
- long responses remain readable;
- no arbitrary giant blank gaps;
- Markdown block elements get consistent internal spacing.

### 7.3 Readable line length

Acceptance target:

- normal message text should not span the entire application width on large monitors;
- use a validated content max width in the approximate 960-1100 px range;
- code/table content may use controlled overflow or wider treatment without forcing all prose to full width.

### 7.4 Composer polish

Acceptance target:

- composer never overlaps transcript;
- multiline input grows within a bounded height;
- Send/Stop state is clear;
- input has internal padding;
- keyboard send/newline behavior is conventional;
- focus behavior is stable.

### 7.5 Scroll behavior

Preserve the repaired deterministic bottom behavior but evolve it toward mature-chat semantics:

- auto-follow while operator is already near bottom;
- do not force bottom while operator intentionally reads older content;
- show jump-to-latest when new content arrives off-screen;
- on explicit send, newest user turn should become visible;
- on assistant completion/stream, newest content should be reachable without another user message.

Do not regress to overlapping transcript/composer or the disproven FlowLayoutPanel behavior.

---

## 8. Runtime Contract Freeze Required Before Agent Execution

Before the Builder wires Hermes or additional providers, freeze a minimal Signalproof Runtime API between Workbench and Agent Runtime.

Candidate event/request surface:

```text
runtime.bot.list
runtime.bot.get
runtime.bot.save
runtime.session.create
runtime.session.list
runtime.session.resume
runtime.session.delete
runtime.turn.submit
runtime.turn.stop
runtime.turn.steer
runtime.run.status
runtime.task.list
runtime.task.create
runtime.delegation.create
runtime.approval.respond
runtime.clarify.respond
runtime.provider.list
runtime.provider.health
runtime.tool.list
runtime.connector.list
runtime.schedule.list
```

Streaming/event surface:

```text
message.start
message.delta
message.complete
run.started
run.status
run.completed
run.failed
tool.start
tool.progress
tool.complete
approval.request
clarify.request
delegation.started
delegation.completed
artifact.created
memory.updated
provider.status
connector.status
```

The exact transport may be local named pipe, local authenticated HTTP/WebSocket, or another verified local IPC design. The critical invariant is that Workbench consumes Signalproof contracts, not provider-specific APIs directly.

---

## 9. Bot Policy Model - R6 Freeze Candidate

A Bot configuration should distinguish intent/policy from current availability.

Candidate normalized fields:

```text
BotDefinition
  bot_id
  name
  role
  mission
  instructions
  provider_policy
  model_policy
  fallback_policy
  memory_policy
  web_policy
  file_policy
  tool_policy
  app_connector_policy
  execution_policy
  delegation_policy
  schedule_policy
  approval_policy
  budget_policy
  workspace_policy
  status
  version
  created_at
  updated_at
```

Right rail should show both:

- requested/configured policy;
- actual effective capability/runtime state.

Example:

```text
Provider target: Claude
Configured: yes
Credential: unavailable
Effective execution: Granite fallback
```

is truthful.

`Claude active` when no verified Claude adapter/credential exists is not truthful.

---

## 10. Session Model - R6 Freeze Candidate

Candidate Session fields:

```text
Session
  session_id
  title
  mode
  bot_id optional
  active_provider_binding
  active_model_binding
  created_at
  updated_at
  last_active_at
  workspace_ref optional
  memory_scope
  context_policy
  status
```

Session history remains Signalproof-owned even when an adapter mirrors state into Hermes or a provider API.

---

## 11. Local Execution Model

Candidate execution request:

```text
ExecutionRequest
  request_id
  run_id
  bot_id
  session_id
  capability
  executable_or_tool
  arguments
  cwd
  input_refs
  environment_policy_ref
  network_policy_ref
  file_policy_ref
  timeout
  expected_outputs
  approval_context
```

Candidate execution result:

```text
ExecutionResult
  request_id
  started_at
  completed_at
  process_identity
  exit_status
  stdout_ref
  stderr_ref
  artifact_refs
  evidence_ref
  policy_decision_ref
  error
```

The Builder should reuse established Signalproof execution/evidence conventions where available rather than creating a second unrelated shell-governance system.

---

## 12. Provider Adapter Sequence

Do not attempt every provider simultaneously.

Recommended implementation sequence:

### P0 - Granite normalized adapter

Wrap the already-working governed Granite path behind the new runtime/provider contract without regressing it.

Pass condition:

The same local Granite conversation works through the normalized Agent Runtime contract.

### P1 - Hermes gateway adapter

Why first external agent adapter:

It provides the broadest already-reviewed agent semantics needed for Sessions/Bots/tools/approvals/delegation.

Pass condition:

A Signalproof Bot can bind to Hermes through the adapter, submit a governed turn, stream output, report actual provider/tool provenance, interrupt a run, and preserve Signalproof-owned Session identity.

### P2 - OpenAI API adapter

Pass condition:

A Bot/Session can select a configured OpenAI model under policy and complete a governed round trip with usage/provenance captured.

### P3 - Codex worker adapter

Treat Codex as a worker/agent capability rather than conflating it with generic OpenAI chat API.

Pass condition:

A Bot can delegate a bounded coding task to an authorized Codex integration and receive normalized Run/Artifact/Evidence output.

### P4+ - Claude / Gemini / Grok / Cerebras

Add one at a time through the same ProviderAdapter contract with the same health, model, streaming, stop, usage, and provenance semantics where the provider supports them.

No GUI redesign is allowed per provider.

---

## 13. App Connector Sequence

The app-connector layer should be proven with one high-value business integration before broad catalog work.

Recommended sequence:

1. load the existing Signalproof RRE/GHL integration plan;
2. freeze `AppConnector` contract;
3. implement one read path;
4. implement one governed write/action path with approval;
5. capture evidence/receipt;
6. then generalize for additional applications.

Conceptual AppConnector contract:

```text
AppConnector
  connector_id
  app_family
  capability_manifest
  auth_state
  health
  read(query)
  action(intent)
  webhook_event(event)
  evidence()
```

Do not put app-specific business logic in the Workbench UI.

---

## 14. Tool and MCP Direction

WorkBench should present tools as capabilities available to Bots/Sessions, not as a giant configuration page.

Minimum tool UX:

- tools button/selector in composer or Bot context;
- compact effective-capability summary in right rail;
- tool activity rendered as concise cards/activity lane;
- details/evidence on demand;
- approval surface for consequential action;
- no raw MCP schema dump in normal use.

MCP implementation should sit behind Agent Runtime ToolAdapter/McpAdapter and Governor/Core policy.

---

## 15. Memory Direction

Memory levels remain conceptually:

```text
M0 turn scratch
M1 Session
M2 Bot
M3 project/workspace
M4 canonical/Granite candidate
```

R6 target should first make M1/M2 explicit and reliable.

Do not implement autonomous canonical M4 writes merely because a provider or Hermes has its own memory feature.

Hermes memory may be used as adapter execution state where useful, but Signalproof memory policy/state remains authoritative.

---

## 16. Delegation / Multi-Bot Direction

Multi-Bot behavior should become real only after single-Bot Run lifecycle works.

Minimum delegation contract:

```text
Delegation
  delegation_id
  parent_run_id
  source_bot_id
  target_bot_id
  task
  capability_scope
  context_refs
  status
  result_ref
  evidence_ref
```

User-facing behavior:

- show which Bot delegated to whom;
- show the actual task;
- show status;
- allow drill-down;
- do not manufacture 'collaboration' animation absent a real delegation.

---

## 17. Scheduling / Automation Direction

Scheduling belongs to Signalproof product state even when an adapter like Hermes provides execution support.

Minimum Schedule object:

```text
Schedule
  schedule_id
  bot_id
  task_template
  trigger
  timezone
  enabled
  capability_scope
  destination
  last_run
  next_run
  status
```

Do not make scheduling a blocker for the first real RRE Bot workflow. Add after interactive Run/Task is stable unless an RRE use case specifically requires it sooner.

---

## 18. Evidence and Control UX

The owner-approved product principle remains:

Normal conversation should feel normal.

Therefore:

- keep `Control / Evidence` available;
- normal assistant content stays human-readable;
- tool/approval activity is concise;
- deep decision envelopes, hashes, policy IDs, logs, and receipts are drill-down material;
- advanced governance must not dominate the default chat surface.

---

## 19. Acceptance Matrix

| Requirement | Verification | Pass Condition | Evidence |
|---|---|---|---|
| Transcript breathing room | visual/UI test | messages have consistent internal gutters and readable max width | screenshot + UI review |
| Message rhythm | visual/UI test | role/body and turn gaps remain consistent across short/long messages | screenshot |
| Composer polish | interaction test | no overlap, stable focus, send/newline works | UI test |
| Mature scroll | interaction test | follows when at bottom, preserves manual scroll-up, jump-to-latest works | UI test/video/evidence |
| Session CRUD | runtime test | create/resume/rename/delete persist across restart | automated + UI |
| Bot CRUD/config | runtime test | create/rename/instruction/config/delete persist | automated + UI |
| Granite normalized runtime | governed round trip | existing Granite functionality works through Agent Runtime contract | runtime evidence |
| Hermes adapter | integration test | session/stream/stop/approval/tool events normalize correctly | adapter test/evidence |
| Provider adapter | per-provider round trip | configured provider works without GUI-specific bypass | runtime evidence |
| Local program execution | governed execution test | approved program runs, streams output, records result, can stop | execution receipt |
| External app read | connector test | approved connector reads real data through policy | connector evidence |
| External app write | approval/action test | consequential write requires/uses correct policy and receipt | connector evidence |
| Tools/MCP | capability test | approved tool can execute and report normalized event/result | tool evidence |
| Delegation | multi-Bot test | real target Bot Run exists with task/result/evidence | run/delegation evidence |
| Memory M1/M2 | persistence test | Session/Bot memory survives expected lifecycle under policy | runtime evidence |
| Truthfulness | negative tests | unavailable provider/tool/app never renders as active | automated/UI |
| Protected Granite path | regression | Workbench -> Governor -> Core -> Granite still passes | regression evidence |
| Production isolation | hash/path/postflight | candidate build does not overwrite accepted production | evidence |
| Dashboard boundary | inspection/UI | Dash remains present; live data not fabricated | screenshot/static |

---

## 20. Ordered Builder Gates

### R6-G0 - Receive and Reconcile

Read-only.

- run `log-build-git`;
- refetch current `Signalproof-Skills/main`;
- refetch `candidate/workbench-rd2-gui-build`;
- load this pre-planning document and the Builder handoff;
- reload PowerShell failure registry before any PS runner work;
- identify exact current R5.1/H1 candidate/evidence locally;
- preserve production.

### R6-G1 - UX Housekeeping Candidate

Implement only:

- content gutters;
- centered readable transcript max width;
- consistent turn spacing;
- composer alignment/padding;
- mature scroll-follow semantics if current control permits without regression;
- Markdown/rendering polish where safely bounded.

Return automated PASS then owner UI test.

Do not wait for provider runtime to validate this slice.

### R6-G2 - Agent Runtime Contract Freeze

No provider-specific implementation until normalized Signalproof request/event/state contracts are frozen.

### R6-G3 - Granite Through Agent Runtime

Make the existing governed local model path use the normalized runtime without changing the Governor/Core authority chain.

### R6-G4 - Local Tool/Program Worker

Implement bounded E1 local execution with stdout/stderr/exit/timeouts/stop/evidence and policy enforcement.

### R6-G5 - Hermes Gateway Adapter

Implement controlled local TUI Gateway JSON-RPC adapter and normalize streaming/tools/approvals/delegation/session state.

### R6-G6 - Web / File / MCP Capability Broker

Wire approved web/files/tool/MCP capabilities into Agent Runtime and Bot policy.

### R6-G7 - First Business App Connector

Consume the existing RRE/GHL plan and prove one read + one governed action path.

### R6-G8 - OpenAI/Codex

Implement OpenAI API provider then Codex worker adapter as separate capabilities.

### R6-G9 - Claude / Gemini / Grok / Cerebras

Add sequentially through the same adapter contract.

### R6-G10 - Delegation / M1-M2 Memory / Schedules

Enable real multi-Bot delegation, reliable Session/Bot memory, then schedules/automation.

### R6-G11 - Non-Dashboard Acceptance

Run full regression/security/recovery/usability suite for all completed non-Dashboard functionality.

Live Dashboard data remains deferred.

---

## 21. Authority

Owner invocation for this planning phase:

`/dsp authorize all design-spawn-git complete pre-planning`

Canonical reconciliation:

- `design-spawn-git` is not an Active canonical DSP command on current main;
- owner intent is sufficiently clear to route through `design-git`, `signalproof-plan`, separated challenge lanes, and Complete-style bounded authority for pre-planning/documentation;
- no production/release/protected-main/canonical-ledger/credential/privilege/security-weakening authority is inferred.

The receiving Builder chat is intended to operate under the owner's existing completion intent for the same bounded Workbench stream, but must refetch current command authority before consequential work.

---

## 22. Protected State / Recovery

Must preserve:

- accepted production Workbench;
- Governor;
- Core Runtime;
- working registered-client transport/keys;
- current Granite governed round trip;
- Signalproof logo/icon identity;
- Session/Bot persisted data unless a migration is deliberately designed and backed up;
- earlier failed evidence and R4/R5/R5.1 learning;
- current production launch path/state;
- candidate isolation under Quarantine/Evidence or equivalent approved candidate root.

Do not overwrite production while developing R6.

Do not silently migrate/delete current Session/Bot user state.

---

## 23. Known Failure Constraints

Preserve these lessons:

1. Do not return to the per-message WinForms FlowLayoutPanel transcript mechanism that produced repeated long-response visibility failures.
2. Do not overlap transcript and composer in the same fill/bottom geometry that hides valid content.
3. Do not treat a stale harness assertion as product failure. Validate harness contracts against the current implementation.
4. Exact-final PowerShell parser/hash discipline remains required.
5. Do not repeat a known-bad PowerShell runner without materially changed evidence.
6. Do not infer source authority from deployed binaries/recovery copies when an authoritative/reproducible source basis is required.
7. Do not fake provider/app/tool/delegation availability.
8. Do not let UI provider selection become authority.
9. Do not implement every provider as a separate GUI code path.
10. Do not make live Dashboard work a prerequisite for RRE operational capability.

---

## 24. STOP Conditions

STOP and return to investigation/owner decision when:

- the current candidate source/evidence cannot be re-established;
- a proposed implementation bypasses Governor/Core;
- implementing local program execution requires unapproved elevation/security weakening;
- required provider/app credentials are unavailable and the gate cannot be tested honestly;
- an adapter's license or integration terms block the intended use;
- Signalproof canonical state would have to be surrendered to a provider/Hermes;
- production would be overwritten by candidate work;
- an existing working capability regresses without a bounded recovery path;
- the same failed condition is being retried unchanged;
- Builder needs to invent a Dashboard requirement contrary to the current deferment;
- implementation scope materially changes beyond the non-Dashboard agent-console objective.

---

## 25. Plan Status

```text
PLAN STATUS: READY WITH CHECKPOINTS

Immediate next Builder gate: R6-G0 RECEIVE AND RECONCILE
First implementation slice after reconciliation: R6-G1 UX HOUSEKEEPING CANDIDATE
Primary runtime objective: SIGNALPROOF AGENT RUNTIME / BROKER
First rich agent adapter: HERMES TUI GATEWAY JSON-RPC
First local execution target: GOVERNED E1 LOCAL WORKER
First business connector priority: RRE EXISTING APP/CRM INTEGRATION PLAN
Provider direction: NORMALIZED ADAPTERS, ONE AT A TIME
Dashboard live functionality: DEFERRED
Production mutation: NOT AUTHORIZED
Canonical Build Ledger append: NOT AUTHORIZED
```
