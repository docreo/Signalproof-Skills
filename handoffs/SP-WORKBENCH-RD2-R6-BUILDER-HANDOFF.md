# Signalproof Workbench RD2 R6 - Builder Handoff

**Status:** BUILDER HANDOFF READY / DESIGN-PREPLANNING COMPLETE / PRODUCTION UNCHANGED  
**Date:** 2026-08-21  
**Owner:** Doc Reo  
**Work stream:** Signalproof Workbench GUI RD2  
**Receiving role:** Builder / Build-Spawn-Debug executor  
**Design authority packet:** `designs/SP-WORKBENCH-RD2-R6-AGENT-CONSOLE-PREPLANNING.md`  
**Design packet commit:** `a30d2347dcbc8f31cc97e5453219f6794cf79cf3`

---

# RECEIVING CHAT - START HERE

Run:

```text
log-build-git
```

Then refetch current Signalproof-Skills Git definitions and resolve the current `/dsp complete` / `build-spawn-debug` contracts before consequential work.

Treat this handoff as a provenance-bound transfer packet, not complete current truth.

If PowerShell is relevant, reload:

```text
library/POWERSHELL-FAILURE-REGISTRY.yaml
```

before generating or modifying another runner.

Retrieve private Build Ledger continuity selectively when available. If unavailable, mark it UNAVAILABLE rather than guessing.

Revalidate the transferred Next Gate before mutation.

Do not redesign the product shell unless current evidence materially contradicts the accepted design.

---

## 1. Mission

Build the next Signalproof Workbench agent-console phase from the accepted design and latest human UI feedback.

The owner wants the application to become a smooth daily-use AI/agent workspace with working non-Dashboard capability, while preserving Signalproof governance and the already-working local Granite path.

The next Builder must not spend another cycle debating whether the Workbench should have Sessions/Bots/Dash, whether Hermes may be adapted, or whether provider/app execution belongs behind Governor/Core. Those design decisions are already established.

Primary product statement:

> Sessions are conversations. Bots are workers. Dash is the operational overview. Signalproof owns the state and authority. Governor decides. Core enforces. Agent Runtime executes. Providers, Hermes, tools, apps, and workers are replaceable governed adapters.

---

## 2. Latest Owner Feedback - Must Be Included

The latest owner screenshot shows a running Workbench conversation and represents the current visual review baseline.

Owner feedback:

- the reviewers did not give up on the product;
- immediate housekeeping is needed;
- messages need more internal breathing room/gap from the conversation-box edges;
- the GUI should feel smoother and more polished like mature competitors;
- the remaining functionality needs to work;
- Workbench should connect to other applications;
- Workbench should be able to run approved programs on the local machine;
- live Dashboard functionality is not the current priority;
- the owner wants the design chat and Builder chat synchronized, with this handoff as the Builder's execution authority packet.

Do not interpret the request for polish as permission to replace the accepted shell.

---

## 3. Current Evidence-Backed State

### Human-observed / runtime-visible

Current UI evidence supports:

- Signalproof Workbench launches;
- `SESSIONS | BOTS | DASH` shell exists;
- Signalproof branding exists;
- conversation through Granite is visible;
- Session transcript renders long content;
- right contextual rail exists;
- composer exists;
- prior owner feedback confirmed Session/Bot delete buttons work.

### Prior machine/runtime evidence in this workstream

Prior iterations established:

- accepted RD3 source lineage/protected production checks;
- .NET Framework compiler availability;
- approved logo/icon source identity;
- registered-client governed path;
- real Granite round trip;
- protected production postflight checks;
- R5.1 compiled successfully before the stale harness assertion stopped the run;
- the R5.1 H1 correction changed the harness contract while preserving the same R5.1 GUI source identity.

The receiving Builder must verify the latest local evidence rather than assuming every old assertion remains current.

---

## 4. Current Git State at Handoff Creation

Protected `docreo/Signalproof-Skills/main`:

```text
f27e5f83172ffdca628f992c3b36297a2967d551
```

Commit:

```text
Add DSP Complete bounded completion workflow (#146)
```

Candidate branch:

```text
candidate/workbench-rd2-gui-build
```

Before this R6 handoff commit, comparison against current main reported:

```text
status: diverged
ahead_by: 20
behind_by: 4
merge_base: 80a21ccb324d96d4970ce9f61a279cb85ffcd16d
```

The candidate branch is a design/evidence/build stream. It is not protected main authority.

Do not merge/rebase merely to make the branch graph look tidy during active R6 implementation unless a separate Git-governance action establishes that requirement.

Refetch both refs before mutation because this handoff itself adds newer commits.

---

## 5. Current Command Reconciliation

Current protected `/dsp` recognizes:

- `design-git`;
- `build-spawn-debug`;
- `complete`;
- `handoff-log`;
- normal build/debug/log commands.

`design-spawn-git` is not a canonical Active command on the current protected-main command surface.

The owner invocation was interpreted by intent, without inventing a new command:

```text
/dsp authorize all design-spawn-git complete pre-planning
```

was executed as:

```text
design-git
+ signalproof-plan
+ explicit separated challenge lanes
+ Complete-style bounded pre-planning authority
+ Builder handoff
```

The Builder receiving chat should use the current canonical `complete` / `build-spawn-debug` route for implementation, after refetching current definitions.

---

## 6. Protected Architecture

Must remain:

```text
Human
-> Signalproof Workbench UI
-> Signalproof Governor
-> Signalproof Core Runtime
-> Signalproof Agent Runtime / Broker
-> governed adapter / provider / tool / worker
```

Already-proven local path:

```text
Workbench -> Governor -> Core -> Granite
```

must remain working.

No GUI feature may create a provider/tool/shell bypass around Governor/Core for a governed capability.

### Ownership

Workbench owns:

- human interaction;
- Sessions/Bots/Dash UX;
- approvals/clarifications;
- capability status presentation;
- evidence/control drill-down.

Governor owns:

- policy decisions;
- authorization;
- approval requirements;
- scope/constraints;
- decision provenance.

Core owns:

- policy enforcement;
- identity/scope/expiry validation;
- prevention of capability substitution/expansion;
- invocation of approved execution surfaces.

Agent Runtime/Broker owns:

- Bot Registry;
- Session Service;
- Run/Task lifecycle;
- provider routing;
- tool/capability dispatch;
- app connectors;
- delegation;
- memory coordination;
- scheduler execution requests;
- artifact/evidence references;
- streaming events;
- worker/environment allocation.

External providers/Hermes do not own canonical Signalproof product state.

---

## 7. Product Modes

Keep:

```text
SESSIONS    BOTS    DASH
```

### Sessions

Target behavior:

- create;
- resume;
- rename;
- delete;
- persistent history;
- attachments/context;
- reliable long responses;
- streaming where backend supports it;
- stop/interruption;
- retry/regenerate where supported;
- Markdown/code/table/link rendering;
- copy/select;
- concise tool/activity presentation;
- evidence/control on demand.

### Bots

Target behavior:

- create;
- select;
- rename;
- delete;
- role/mission/instruction edit;
- provider/model policy;
- tools/web/files/app policy;
- memory policy;
- execution policy;
- delegation policy;
- schedule policy;
- persistent conversations;
- real Task/Run state;
- actual provider/tool execution through Agent Runtime;
- real delegation only when backed by a Run/Delegation record.

### Dash

Current boundary:

- keep mode present;
- preserve prior design/contracts;
- do not implement broad live Dashboard data in this phase;
- do not fabricate widget state;
- Dashboard cannot block the RRE/agent-console work.

---

## 8. First Builder Slice - R6-G1 UX Housekeeping

Before the larger runtime work, build a visible polish candidate.

Required changes:

### Transcript gutter

- add explicit internal left/right/top/bottom breathing room;
- effective desktop text gutter should be at least approximately 20 px;
- do not let text hug the conversation-box edge.

### Readable content width

- normal prose should use a centered readable column rather than span the full monitor width;
- validate approximately 960-1100 px maximum normal prose width;
- allow controlled wider/scrollable treatment for code/tables where needed.

### Message rhythm

- keep role label/body visually grouped;
- use approximately 18-24 px equivalent between turns;
- give Markdown block elements consistent spacing;
- no giant accidental whitespace.

### Composer polish

- align composer with the readable conversation column;
- add input internal padding;
- no transcript overlap;
- multiline input grows only to a sensible limit;
- Enter sends;
- Shift+Enter inserts newline;
- Send/Stop state is explicit;
- focus remains stable after send unless an approval/modal takes it.

### Mature scroll semantics

Preserve deterministic bottom reliability but improve behavior:

- auto-follow while user is already near bottom;
- if user intentionally scrolls up, do not yank them down;
- show `Jump to latest` when new content arrives while scrolled away;
- explicit send makes newest user turn visible;
- assistant output completes visibly without another user message.

Do not reintroduce the failed FlowLayoutPanel message system.

Do not reintroduce transcript/composer overlap.

### UX acceptance

Machine-verifiable checks first, then owner UI test.

Return:

```text
AUTOMATED PASS / USER UI TEST READY
```

with exact candidate identity and launch action.

---

## 9. Next Runtime Program

After R6-G1 owner acceptance, proceed under the same bounded Workbench stream using the R6 pre-planning gate sequence.

### R6-G2 - Agent Runtime Contract Freeze

Freeze Signalproof-owned runtime contracts before provider-specific code.

Minimum normalized lifecycle:

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

Minimum request surface candidate:

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

Minimum streaming/event surface candidate:

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

Transport is an implementation decision subject to evidence. The invariant is more important: Workbench consumes Signalproof runtime contracts, not provider SDKs directly.

### R6-G3 - Granite Through Normalized Agent Runtime

Wrap/migrate the already-working Granite conversational path behind the normalized runtime while preserving Governor/Core.

This proves the new runtime without depending on external credentials.

### R6-G4 - Governed Local Program/Tool Worker

Target first verified execution class:

```text
E1 Bot workspace / bounded local process execution
```

Minimum behavior:

- exact program/tool identity where practical;
- working directory;
- bounded filesystem scope;
- environment policy;
- timeout;
- stdout/stderr separate;
- exit code;
- process identity;
- stop/kill;
- evidence receipt;
- approval policy;
- no hidden persistence;
- no elevation/security weakening without separate authority.

### R6-G5 - Hermes Gateway Adapter

Preferred first rich agent adapter remains Hermes TUI Gateway JSON-RPC.

Expected normalized capabilities where upstream supports them:

- sessions;
- prompt submission;
- streaming;
- tool lifecycle;
- approvals;
- clarification;
- interrupt/steer;
- provider/model switch;
- delegation/subagents;
- attachments;
- process/session controls.

Hermes session/profile state remains adapter state.

### R6-G6 - Web / File / MCP Capability Broker

Implement governed capability surfaces behind Agent Runtime and Bot policy.

Web levels remain policy-addressable:

```text
W0 none
W1 search
W2 fetch/read
W3 unauthenticated browser
W4 authenticated read
W5 external write/action
```

Downloads are separately governed.

### R6-G7 - First Business App Connector

Load the existing RRE/GHL plan rather than inventing a new CRM design.

Prove:

1. one real read;
2. one governed consequential action/write;
3. evidence/receipt;
4. policy/approval behavior.

### R6-G8 - OpenAI API and Codex

Treat them as separate capability families:

- OpenAI API = provider/model route;
- Codex = coding/agent worker integration.

Do not collapse Codex into generic chat simply because both are OpenAI products.

### R6-G9 - Claude / Gemini / Grok / Cerebras

Add sequentially through the same ProviderAdapter contract.

Do not implement all at once.

Do not add per-provider GUI architecture.

### R6-G10 - Delegation / Memory / Scheduling

Sequence:

1. reliable single-Bot Run lifecycle;
2. real delegation;
3. M1 Session memory;
4. M2 Bot memory;
5. schedule/automation.

Do not let a provider/Hermes memory system become canonical Signalproof memory policy.

### R6-G11 - Non-Dashboard Acceptance

Run regression, review, security, recovery, evidence, usability, and owner UI acceptance for the completed non-Dashboard functionality.

---

## 10. Provider Architecture

One normalized `ProviderAdapter` family.

Candidate interface:

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

Initial families:

```text
granite.local
hermes.gateway
openai.api
openai.codex
anthropic.api
google.gemini
xai.api
cerebras.api
openai.compatible
```

Do not store provider credentials in Bot state or Git.

Bot configuration describes requested policy/target.

Runtime state reports actual effective availability.

Example truthful UI:

```text
Provider target: Claude
Configured: yes
Credential: unavailable
Effective execution: Granite fallback
```

Never render `Claude active` without a verified live adapter/credential/round trip.

---

## 11. App / Tool Connector Architecture

Use normalized capability connectors behind Agent Runtime:

```text
ToolAdapter
McpAdapter
WebAdapter
BrowserAdapter
FileAdapter
AppConnector
NotificationAdapter
```

Candidate AppConnector:

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

App-specific business logic does not belong in the Workbench UI.

Prefer direct API/private integration/webhook/MCP routes over browser automation when those routes exist and meet the use case.

---

## 12. RRE Priority

The Signalproof Revenue Recovery Engine is a high-priority consumer of this Workbench.

The Workbench functionality needed for RRE before live Dash is:

1. reliable Sessions;
2. persistent RRE Bot;
3. Agent Runtime;
4. provider routing;
5. web/research;
6. governed local tools/programs;
7. files/artifacts;
8. CRM/app connector;
9. task/run history;
10. approval/evidence;
11. delegation after single-Bot stability.

Do not make live Dashboard work a dependency for the RRE.

---

## 13. Known Failure Memory

Do not repeat these mistakes:

1. Per-message WinForms FlowLayoutPanel transcript: disproven for this product path.
2. Transcript/composer overlap: caused valid content to be hidden.
3. Repeated variations of the same auto-scroll technique without new localization: do not repeat.
4. Stale self-test contract: R5.1 H1 proved a harness can reject the intended implementation if the test is not updated with the contract.
5. PowerShell exact-final parser/hash discipline remains required.
6. Do not reset failure attempt count because a chat or runner name changed.
7. Do not infer source authority from binaries/recovery copies where a reproducible source basis is required.
8. Do not fake provider/app/tool/delegation status.
9. Do not let a Bot configuration grant itself capability.
10. Do not build provider-specific GUI branches.
11. Do not surrender canonical Signalproof Session/Bot state to Hermes/provider state.
12. Do not overwrite production during candidate build.

---

## 14. PowerShell Guard State

Before any PowerShell generation/modification/execution, refetch current:

```text
library/POWERSHELL-FAILURE-REGISTRY.yaml
```

Known applicable classes include at least:

- `PS-PARSER-FINAL-001`;
- `PS-HARNESS-EVIDENCE-001`;
- `PS-NATIVE-STDERR-001` when invoking native build/runtime processes;
- `PS-PATH-CANONICAL-001` for path identity/comparison;
- any additional currently applicable rule discovered from live main.

Build sequence remains:

```text
SEARCH_REGISTRY
-> IDENTIFY_APPLICABLE_RULES
-> GENERATE_OR_EDIT
-> RUN_EXECUTABLE_KNOWN_ERROR_PREFLIGHT_WHEN_APPLICABLE
-> STATIC_KNOWN_FAILURE_CHECK
-> PARSE_EXACT_FINAL_ARTIFACT
-> BIND_FINAL_IDENTITY
-> EXECUTE_ONCE
-> CLASSIFY_RESULT
-> UPDATE_FAILURE_MEMORY_OR_CONTINUE
```

Unchanged known-bad retry = STOP.

---

## 15. Protected State

Must preserve:

- accepted production Workbench;
- production launcher/state;
- Signalproof Governor;
- Signalproof Core Runtime;
- registered-client authentication/keys;
- working local Granite governed round trip;
- approved Signalproof logo/icon identity;
- existing Session/Bot user state unless migration is explicitly designed/backed up;
- production activation metadata;
- evidence/rollback chain;
- current protected main.

All R6 implementation must remain isolated candidate work until a later authorized production/release gate.

---

## 16. Authority

Owner has expressed bounded completion intent for this exact Workbench stream.

Receiving Builder must still refetch current command contracts because command authority may drift.

Within the current bounded Workbench R6 stream, normal owner-authorizable build/debug/test/review/recovery/learning actions are intended to proceed without returning routine approval loops.

Excluded unless separately authorized:

- production deployment/release;
- protected-main bypass;
- canonical private Build Ledger append;
- Candidate Skill activation;
- new privilege/elevation;
- security-control weakening;
- acquisition/use of new credentials without owner authorization;
- unrelated products/repos/objectives;
- publication of private evidence/secrets.

---

## 17. Acceptance Matrix Summary

Builder must preserve/produce evidence for:

- UX gutters/readable width;
- mature scroll semantics;
- composer polish;
- Session CRUD persistence;
- Bot CRUD/config persistence;
- Granite regression;
- Agent Runtime normalized contract;
- local worker execution;
- Hermes adapter;
- provider adapters;
- web/file/MCP/tool broker;
- first RRE app connector read/write;
- real delegation;
- M1/M2 memory;
- truthfulness negative tests;
- production isolation;
- Dashboard deferment/no fabricated data.

See the design packet for the detailed matrix.

---

## 18. Exact Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Workbench GUI RD2 - R6 Agent Console
Git basis: refetch Signalproof-Skills main + candidate/workbench-rd2-gui-build; transferred main was f27e5f83172ffdca628f992c3b36297a2967d551
Current state: R5/R5.1 lineage functional enough for continued development; latest owner review requests UX housekeeping and completion of non-Dashboard agent functionality
Objective: start R6 without redesign drift and produce the first polished UX candidate while preserving the governed Granite path
Route: log-build-git -> current complete/build-spawn-debug -> R6-G0 -> R6-G1
Action class: READ / VERIFY / BUILD / DEBUG / TEST
Protected state: production Workbench, Governor, Core, auth keys, Granite path, brand identity, existing Session/Bot state, protected main
Allowed surface: read current Git/evidence; isolated candidate source/build/evidence; no production overwrite
Known-failure constraints: reload PowerShell registry; do not reintroduce failed transcript mechanisms; distinguish harness failure from product failure; no fake capabilities
Dependencies/authority: current Complete/build-spawn-debug contract and owner-authorizable R6 candidate work; new credentials/elevation/release excluded
Acceptance evidence: R6-G1 automated checks + owner UI proof of gutters/readability/composer/scroll polish + no Granite regression
Recovery/non-mutation: preserve prior candidate/evidence; new materially changed candidate identity; production unchanged
STOP conditions: source/evidence cannot be reconciled; Governor/Core bypass; same failed approach unchanged; production risk; required excluded authority; credential/security/legal blocker; material product-scope change
Closeout trigger: R6-G1 USER UI PASS, then continue to R6-G2 runtime contract under same workstream unless owner changes direction
```

---

## 19. Receiving Builder - Do Not Do These First

Do not start by:

- rewriting the whole shell;
- implementing live Dash;
- adding all providers simultaneously;
- adding provider SDK calls directly in GUI code;
- making Hermes the canonical Session/Bot store;
- asking the owner to re-authorize normal bounded debug/build steps;
- inventing a new RRE CRM architecture;
- clearing/deleting current user state;
- merging candidate into protected main;
- promoting anything to production.

First do R6-G0 and R6-G1.

---

## 20. Transfer Status

```text
HANDOFF READY
DESIGN PRE-PLANNING: COMPLETE
BUILDER NEXT: R6-G0 RECEIVE AND RECONCILE
FIRST BUILD SLICE: R6-G1 UX HOUSEKEEPING
PRIMARY RUNTIME PROGRAM: SIGNALPROOF AGENT RUNTIME / BROKER
FIRST RICH AGENT ADAPTER: HERMES TUI GATEWAY JSON-RPC
FIRST LOCAL EXECUTION TARGET: GOVERNED E1 WORKER
FIRST BUSINESS CONNECTOR PRIORITY: EXISTING RRE/GHL PLAN
ADDITIONAL PROVIDERS: NORMALIZED ADAPTERS, SEQUENTIAL
LIVE DASHBOARD: DEFERRED
PRODUCTION: UNCHANGED
PRODUCTION/RELEASE: NOT AUTHORIZED
CANONICAL BUILD LEDGER: NOT APPENDED
```
