# Signalproof Workbench Bots/Sessions RD1 - Architecture Design

**Status:** CANDIDATE / DESIGN ONLY / NO PRODUCTION MUTATION  
**Work stream:** Signalproof Workbench Bots/Sessions RD1  
**Owner:** Doc Reo  
**Git basis:** `docreo/Signalproof-Skills/main` at `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`  
**Handoff branch:** `candidate/workbench-bots-rd1`  
**Handoff commit:** `12fbf6066e3ff5459493be3249b7da17ff48f665`  
**Prior milestone:** Build 8A D4 - CLOSED / PRODUCTION ACTIVE  
**Mode:** DESIGN / RESEARCH / INVESTIGATE / VERIFY ONLY

## 1. Executive Design Decision

Signalproof Workbench becomes the human-facing AI operations workspace for normal conversations, persistent named Bots, visible delegation, governed tools, web research, schedules, isolated execution environments, and inspectable operational evidence.

The current production Workbench and Governor prove the control-plane boundary. They do not yet provide the complete conversational execution path.

The new architecture adds a Signalproof-owned Agent Runtime/Broker as the execution plane while preserving the existing Governor and Core Runtime separation:

```text
Human
  |
  v
Signalproof Workbench UI
  |
  | IntentRequest
  v
Signalproof Governor                         Policy Decision Point
  |
  | signed, scoped DecisionEnvelope
  v
Signalproof Core Runtime                     Policy Enforcement Point
  |
  | constrained ExecutionTicket
  v
Signalproof Agent Runtime / Broker            Execution Plane
  |
  +--> Bot Registry
  +--> Session Service
  +--> Context Assembly
  +--> Memory Service
  +--> Task / Delegation Orchestrator
  +--> Tool / Skill Capability Broker
  +--> Scheduler
  +--> Artifact Service
  +--> Web / Browser Adapter
  +--> Execution Environment Manager
  +--> Provider / Model Router
  +--> Operational Evidence Journal
  |
  +--> Hermes Adapter                         First replaceable agent adapter
  +--> Direct Model Adapter                   Optional governed plain-chat path
  +--> Future Agent Adapters
  |
  v
Approved local or external models, tools, MCP services, browsers, and worker environments
```

### Governing rule

No Bot, Session, adapter, model, tool, scheduler, or execution environment may bypass the Governor and Core Runtime for a capability that requires governance.

The Governor decides. Core enforces. The Agent Runtime executes. Hermes performs agent work through an adapter. Signalproof owns the product state.

## 2. Reconciliation With Existing Governor Architecture

The prior accepted architecture states:

```text
Application -> Signalproof Governor -> Signalproof Core Runtime -> Governed Agent / Model / Engine / Tool
```

The Workbench handoff described a new backend behind the Governor. The design must preserve the accepted Core Runtime Policy Enforcement Point rather than accidentally replacing it.

Therefore the correct RD1 execution chain is:

```text
Workbench -> Governor -> Core Runtime -> Agent Runtime/Broker -> Adapter -> Engine
```

The Agent Runtime is not a second Governor and not a substitute for Core Runtime.

Its responsibilities are orchestration, state, routing, sessions, memory, tasks, adapter lifecycle, streaming, and operational evidence.

## 3. Architectural Ownership Boundaries

### Workbench owns

- human interaction and operator visibility;
- Bots and Sessions UX;
- task and delegation visibility;
- approvals and clarification surfaces;
- simple versus advanced configuration;
- evidence drill-down;
- user-selected context and attachments;
- operational status presentation.

### Governor owns

- policy decisions;
- capability authorization;
- human-approval policy;
- policy epoch and revocation state;
- trusted caller/application binding;
- decision scope and constraints;
- signed decision provenance.

### Core Runtime owns

- policy enforcement;
- validation of exact authorized capability and scope;
- enforcement of decision binding, expiry, caller identity, and request identity;
- prevention of capability substitution or expansion;
- invocation of the approved execution surface.

### Agent Runtime/Broker owns

- Signalproof Bot Registry;
- Signalproof Session Service;
- task/run lifecycle;
- context assembly and budgeting;
- memory retrieval and governed memory writes;
- provider/model selection under policy;
- adapter dispatch;
- tool/skill capability dispatch;
- inter-bot delegation;
- scheduler execution requests;
- execution environment allocation;
- artifact references;
- operational event journaling;
- streaming events back to Workbench.

### Hermes Adapter owns

- translation between Signalproof runtime contracts and supported Hermes programmatic interfaces;
- Hermes process/profile lifecycle within approved boundaries;
- mapping Signalproof runs to Hermes execution sessions;
- converting Hermes streaming/tool/approval/delegation events to Signalproof events;
- translating Signalproof approvals and steering back to Hermes;
- reporting actual Hermes/runtime/model/tool provenance.

Hermes does not own canonical Signalproof Bot identity, Session identity, schedules, memory policy, approvals, evidence, or product history.

## 4. Hermes Integration Disposition

### Current external verification

Official upstream is `NousResearch/hermes-agent`.

Verified current repository facts on 2026-08-20:

- repository: `NousResearch/hermes-agent`;
- license: MIT;
- default branch: `main`;
- current observed main HEAD during design: `8794e5a21c980a0f26532cb4883284b786cb3f25`;
- repository exposes a shared `AIAgent` core, provider resolution, tools, session storage, gateway, cron, plugins, memory providers, and multiple programmatic entry points;
- Hermes documentation identifies three supported external integration protocols: ACP, TUI gateway JSON-RPC, and OpenAI-compatible HTTP API;
- TUI gateway exposes fine-grained sessions, approvals, streaming events, delegation state, subagent steering, image attachment, model changes, and process control;
- API server exposes OpenAI-compatible chat/responses plus run lifecycle, approvals, steering, stop, capabilities, model options, and health;
- an August 2026 public issue reports an installed Hermes Agent v0.20.0 (2026.8.3), while the GitHub release page indexed by search may lag behind current installed/main development state.

### RD1 disposition

**ADAPT / INTEGRATE as a replaceable external runtime adapter. Do not fork Hermes into Signalproof state ownership.**

Preferred initial integration surface:

**TUI gateway JSON-RPC over a local controlled transport** because it exposes the richer feature surface needed by Workbench, including sessions, streaming, approvals, model switching, delegation, and interruption.

Secondary integration surface:

**OpenAI-compatible API server** for simpler HTTP-based compatibility, remote-node adapters, and reduced-feature fallback where full gateway semantics are not required.

Do not use ACP as the primary Workbench integration because ACP is optimized for editor/IDE clients.

Avoid direct in-process import of `AIAgent` for RD1 unless a later build investigation proves it materially improves reliability without unacceptable coupling. A process boundary gives Signalproof clearer lifecycle, recovery, identity, and upgrade control.

### Hermes state rule

A Hermes session ID may be mapped to a Signalproof Session as adapter state, but it is not the canonical Session identity.

If Hermes state is lost or upgraded, Signalproof must be able to reconstruct or resume the user product from Signalproof-owned state according to the configured retention and context policy.

## 5. First-Class Product Objects

The design separates persistent identities, conversations, tasks, runs, memory, and evidence.

### 5.1 Bot

A Bot is a persistent governed AI worker identity.

Required fields:

```text
bot_id
name
title
role
mission
description
avatar_ref
owner_id
status
bot_version
instruction_policy_ref
model_policy_ref
provider_policy_ref
skill_policy_ref
tool_policy_ref
memory_policy_ref
web_policy_ref
file_policy_ref
schedule_policy_ref
delegation_policy_ref
execution_environment_policy_ref
approval_policy_ref
budget_policy_ref
created_at
updated_at
provenance_ref
```

A Bot may own many Sessions and may participate in many Tasks.

A Bot configuration change increments `bot_version`. Existing Sessions keep the version they were created or last migrated under until an explicit migration is accepted.

### 5.2 Session

A Session is a resumable human or Bot conversation/work context.

Required fields:

```text
session_id
bot_id
bot_version
title
status
created_at
updated_at
last_active_at
message_cursor
context_policy_ref
active_task_ids
artifact_refs
attachment_refs
runtime_mapping_refs
archive_state
pin_state
search_metadata
provenance_ref
```

A Session is not the Bot's entire long-term memory.

### 5.3 Message

A Message is user-visible conversational content.

Required fields:

```text
message_id
session_id
sequence
actor_type
actor_id
content_ref
content_type
created_at
parent_message_id
edit_of_message_id
artifact_refs
provenance_ref
```

Control-plane and tool telemetry are not inserted into normal assistant prose as raw JSON. They are linked through operational events and Control/Evidence UI surfaces.

### 5.4 Task

A Task is a bounded unit of work, including delegation.

Required fields:

```text
task_id
origin_session_id
origin_bot_id
target_bot_id
purpose
requested_output_contract
context_package_ref
requested_capabilities
budget
priority
deadline
status
approval_state
created_at
updated_at
result_artifact_refs
result_summary_ref
```

Task states:

```text
DRAFT
AUTHORIZING
QUEUED
RUNNING
WAITING_FOR_TOOL
WAITING_FOR_HUMAN
BLOCKED
COMPLETED
FAILED
CANCELLED
```

### 5.5 Run

A Run is one execution attempt of a Task or Session turn.

Required fields:

```text
run_id
task_id
session_id
bot_id
attempt
adapter_id
runtime_instance_id
model_route_ref
decision_ref
execution_ticket_ref
started_at
ended_at
status
failure_class
usage_ref
evidence_range_ref
```

Retries create new Run records. Failed Run evidence is preserved.

### 5.6 Delegation

Delegation is a Task with explicit origin and destination Bots.

Required delegation contract:

```text
delegation_id
origin_bot_id
target_bot_id
origin_session_id
context_package_ref
requested_capabilities
allowed_capability_subset
output_contract
hop_count
max_hops
budget
approval_state
status
result_ref
```

No target Bot silently inherits the origin Bot's full context, credentials, tools, or memory.

## 6. Governor Request and Execution Contracts

### 6.1 IntentRequest

Workbench or Runtime submits an intent to Governor.

Conceptual fields:

```text
request_id
principal_id
application_id
bot_id
session_id
task_id
run_id
capability_ids
resource_scopes
purpose
risk_class
input_digest
policy_context_ref
timestamp
nonce
```

### 6.2 DecisionEnvelope

Governor returns a signed scoped decision.

Conceptual fields:

```text
decision_id
request_id
decision = ALLOW | DENY | REQUIRE_APPROVAL
principal_id
application_id
capability_ids
resource_scopes
constraints
policy_epoch
approval_requirements
issued_at
expires_at
nonce
request_digest
decision_digest
signature
reason_codes
```

### 6.3 ExecutionTicket

Core Runtime validates the DecisionEnvelope and emits a constrained internal ExecutionTicket to the approved runtime surface.

Conceptual fields:

```text
execution_ticket_id
decision_id
run_id
capability_ids
resource_scopes
constraints
runtime_target
issued_at
expires_at
request_digest
enforcement_proof_ref
```

The Agent Runtime must not expand these fields.

### 6.4 Mid-run capability escalation

If Hermes or another adapter requests a capability not covered by the current ticket:

```text
Agent Runtime pauses run
-> creates CapabilityEscalationRequest
-> Governor evaluates
-> Workbench asks human if required
-> Core validates new/updated decision
-> Runtime receives new constrained ticket
-> run resumes or remains denied
```

No adapter self-authorizes a tool because the model asked for it.

## 7. Provider and Model Routing

Signalproof owns a Model Capability Registry independent of vendor branding.

Each provider/model entry declares facts such as:

```text
provider_id
model_id
modalities
reasoning_class
tool_calling
context_capacity
locality = LOCAL | LAN | EXTERNAL
privacy_class
credential_requirement
latency_class
cost_policy
availability
reliability_history
adapter_compatibility
last_verified
```

Routing inputs include:

- required capability;
- bot model policy;
- owner model pin;
- privacy and locality constraints;
- tool requirements;
- context size;
- cost budget;
- latency preference;
- current availability;
- verified reliability.

### Default rule

The Workbench ordinary mode may show only a simple model label such as `Auto`, `Local`, or a pinned model. Advanced mode exposes full provider/model routing details.

### No automatic cloud fallback

If a Bot or Session is constrained to local/private execution, an unavailable local model must result in a visible degraded or blocked state. It must not silently move data to an external provider.

## 8. Tool / Skill / MCP Capability Contract

Every runtime action maps to a Signalproof capability ID and scope.

Examples:

```text
file.read
file.write
file.patch
web.search
web.fetch
browser.navigate
browser.authenticated_read
download.create
external.write
shell.execute
code.execute
mcp.invoke
git.read
git.write
calendar.read
calendar.write
email.read
email.send
bot.delegate
schedule.create
memory.read
memory.write
```

Capabilities declare:

```text
capability_id
risk_class
allowed_resource_types
approval_level
network_scope
credential_scope
artifact_policy
evidence_policy
reversibility_requirement
rate_limit
budget_limit
```

Skills are governed capability packages. A Skill may request multiple capabilities, but it does not automatically receive them.

MCP servers are connectors behind capability policy, not blanket trust grants.

## 9. Web and Browser Governance Levels

Web functionality is deliberately decomposed.

### Level W0 - none

No network/web access.

### Level W1 - search

`web.search` only. Results are metadata/snippets or normalized search records.

### Level W2 - fetch/read

`web.fetch` for public pages and documents.

### Level W3 - browser navigation

Unauthenticated browser navigation and page interaction without external write.

### Level W4 - authenticated read

Use a dedicated approved browser profile or service account to read authenticated resources.

### Level W5 - external write/action

Submissions, posts, purchases, sends, updates, account changes, form submission, uploads, or other external side effects. Requires capability-specific policy and normally explicit human confirmation.

Downloads are separately governed because downloaded content changes local state and may introduce untrusted files.

## 10. Memory and Context Model

Memory is separated by durability and authority.

### M0 - Turn working state

Temporary in-run scratch state. Not durable after run unless explicitly promoted.

### M1 - Session memory

Conversation transcript, selected attachments, Session summary, and Session artifacts.

### M2 - Bot memory

Role-specific learned preferences and durable working knowledge approved by Bot memory policy.

### M3 - Project/Workspace memory

Shared context for a defined project. Access is explicit by Bot and Session policy.

### M4 - Organization/Canonical context candidate

Information that may belong in Granite/DIA canonical context. This is not written merely because a model inferred it. Promotion follows separate governance.

### Memory write rule

Every durable memory write records:

```text
memory_id
scope
source_ref
source_type
created_by
confidence
sensitivity
retention
ttl
owner_approval_state
last_verified
provenance_ref
```

### Context budget rule

The runtime assembles the smallest relevant context for the Bot and current task.

It must not automatically load every Session, Skill, tool, MCP server, file, project, or memory.

Cross-Bot context is transferred as an explicit ContextPackage containing selected references and a human-inspectable summary.

## 11. Inter-Bot Messaging and Delegation

### Visible delegation sequence

```text
User or Bot requests delegation
-> source Bot creates Task draft
-> Governor evaluates bot.delegate + requested capability subset
-> target Bot policy is checked
-> ContextPackage is created
-> delegation card appears in source Session
-> task appears in target Bot Activity
-> target Bot executes under its own policy and environment
-> result and evidence return
-> source Session shows result card
-> user can inspect the inter-Bot thread
```

### Anti-loop controls

- maximum delegation depth;
- cycle detection on Bot graph;
- maximum hop count;
- task budget;
- time budget;
- per-Bot concurrency limit;
- owner-defined global concurrency limit;
- stop on repeated no-progress delegation;
- human escalation when ambiguity or risk persists.

The orchestrator cannot create an unbounded Bot recursion tree.

## 12. Scheduler and Automations

Signalproof owns canonical schedule definitions.

Hermes cron may later be used as an adapter implementation detail if independently accepted, but Hermes cron is not the canonical schedule store for Workbench RD1.

A Schedule object includes:

```text
schedule_id
owner_id
bot_id
task_template_ref
trigger_type
schedule_expression
allowed_time_window
capability_policy_ref
budget_policy_ref
output_destination
approval_policy_ref
last_run
next_run
status
```

When due:

```text
Signalproof Scheduler
-> creates Task/Run intent
-> Governor evaluates current policy
-> Core enforces current decision
-> Agent Runtime executes
-> result returns to Activity / Session / configured destination
```

A prior schedule does not become a permanent bypass around current policy.

## 13. Execution Environment Tiers

Not every Bot requires a full virtual computer.

### E0 - Conversation only

No filesystem, shell, browser automation, or OS execution.

### E1 - Bot workspace

Dedicated local directory with explicit roots and read/write policy.

### E2 - Isolated process/container

Container, WSL, or other supported sandbox for code/tool execution where the environment is actually supported and validated.

### E3 - Dedicated Windows sandbox/VM

Separate Windows environment, dedicated browser profile, isolated credentials, and reset/rollback capability.

### E4 - Remote worker node

Dedicated LAN or remote Signalproof worker machine registered with explicit identity, capability inventory, health, and owner-approved trust.

Every environment declares:

```text
environment_id
identity
execution_tier
owner
allowed_roots
allowed_networks
credential_scopes
installed_capabilities
health
reset_policy
rollback_policy
evidence_policy
last_verified
```

Do not promise a Windows Sandbox, VM, container, or remote execution implementation until the build phase proves the selected technology on the target environment.

## 14. Signalproof-Owned Persistence

### Recommended logical stores

Signalproof may use one or more SQLite databases with WAL and explicit migrations, but the logical boundaries remain:

- Bot Registry;
- Sessions/Messages;
- Tasks/Runs;
- Memory;
- Artifact Index;
- Operational Event Journal;
- Runtime Adapter Mapping;
- Scheduler definitions.

### Suggested user/runtime separation

User-owned Workbench state belongs under a Signalproof per-user data root.

Service-owned runtime state belongs under a Signalproof machine/service data root.

Exact paths are a build-phase decision after source and installer authority are inspected.

Secrets do not belong in ordinary SQLite rows or journal payloads. Use approved Windows protected secret storage and store references/scopes instead.

## 15. Operational Event / Evidence Journal

The Operational Journal is separate from canonical Build Ledger chronology.

It records runtime evidence such as:

```text
event_id
event_time
stream_id
session_id
bot_id
task_id
run_id
event_type
actor_type
actor_id
capability_id
decision_ref
execution_ticket_ref
adapter_id
provider_id
model_id
resource_scope_ref
input_digest
output_digest
artifact_refs
status
failure_class
parent_event_id
previous_event_hash
event_hash
redaction_class
```

### Event classes

- session lifecycle;
- message accepted/streamed/completed;
- Governor decision reference;
- Core enforcement result;
- runtime start/stop;
- adapter start/stop;
- model route selected;
- tool start/progress/complete;
- approval requested/resolved;
- clarification requested/resolved;
- delegation created/accepted/completed;
- memory read/write;
- schedule fired;
- environment allocated/reset;
- artifact created;
- run failed/cancelled;
- recovery action.

### Journal design rules

- append-first semantics;
- preserve failed attempts;
- never store plaintext credentials;
- sensitive content may be stored separately and referenced;
- hash-chain events per stream or defined journal partition;
- journal write failure must produce a visible degraded state;
- consequential external actions should fail closed if required evidence cannot be recorded;
- Build Ledger receives only governed milestone summaries or closeout evidence, never ordinary chat telemetry.

## 16. Runtime Event Stream to Workbench

The Agent Runtime exposes normalized streaming events independent of Hermes.

Conceptual events:

```text
run.started
message.delta
message.completed
tool.started
tool.progress
tool.completed
approval.requested
approval.resolved
clarification.requested
clarification.resolved
delegation.created
delegation.progress
delegation.completed
artifact.created
memory.updated
run.steered
run.completed
run.failed
run.cancelled
runtime.degraded
```

Workbench renders these into conversation content, activity cards, and evidence drill-down without exposing vendor-specific event formats as the product contract.

## 17. Failure and Degraded-State Semantics

### Governor deny

Display:

`BLOCKED - Governor denied the requested capability.`

No adapter/model/tool call occurs.

### Approval required

Display:

`WAITING FOR YOU - Approval is required before this action can continue.`

### Core enforcement failure

Display:

`BLOCKED - Authorization existed, but Core Runtime did not accept the execution ticket.`

### Agent Runtime unavailable

Display:

`DEGRADED - Control approval is available, but the Agent Runtime is unavailable. No model call executed.`

### Hermes adapter unavailable

Display:

`DEGRADED - The runtime is available, but the selected Hermes adapter is unavailable.`

### Provider/model unavailable

If an approved fallback exists, present the allowed alternative. If not, block. Never silently violate local-only or provider policy.

### Tool denied mid-run

Pause the run and present the capability and reason. Do not hide tool denial inside generated assistant prose.

### Journal unavailable

Plain non-consequential conversation may continue only if policy allows temporary buffered evidence. Consequential actions requiring evidence fail closed.

### Unknown state

Use `UNKNOWN`, not a green or healthy indicator.

## 18. Security and Credential Rules

- Workbench does not expose private signing keys to Bots or models.
- Provider credentials are referenced by scoped secret IDs, not placed in prompts.
- Browser/service-account credentials are bound to environment and capability scope.
- Bots do not inherit another Bot's credentials during delegation.
- Adapter processes receive only the minimum credential material required by approved provider/tool configuration.
- External provider use must be explicit in policy and visible in evidence.
- Local-only policies cannot auto-fallback to cloud.
- The Runtime cannot widen a Core-issued ExecutionTicket.
- Model-generated tool names are requests, not authority.
- Every consequential external write is attributable to Bot, Session, Task, Run, decision, and human approval state.

## 19. Protected Baseline and Rollback Principle

Design work must not modify:

- production Governor;
- production Workbench;
- current cryptographic identities;
- Local Service runtime boundary;
- DPAPI signing state;
- task/ACL configuration;
- `PRODUCTION_ACTIVE` metadata;
- protected Core Runtime;
- accepted Build 8A D4 evidence;
- protected main.

Future implementation must be versioned as a candidate and preserve rollback to the currently accepted production Workbench/Governor baseline.

## 20. Implementation Gate Outline - Not Yet Authorized

The following is a design for future bounded gates only.

### Gate W0 - Source and interface authority

Read-only inspection of current Workbench, Governor, Core Runtime, launcher, production contracts, and protected source authority.

### Gate W1 - Contract freeze

Freeze Bot/Session/Task/Run schemas, Governor/Core/runtime envelopes, event stream, and persistence boundaries.

### Gate W2 - Runtime skeleton

Build non-production Agent Runtime/Broker skeleton with simulated adapter and no external model/tool execution.

### Gate W3 - Signalproof state and journal

Implement candidate Bot/Session/Task/Run persistence and operational journal with migration/rollback evidence.

### Gate W4 - Hermes adapter

Integrate controlled Hermes TUI gateway path in candidate environment with streaming, approvals, interrupt, and model provenance.

### Gate W5 - Basic conversational round trip

Prove candidate Workbench -> Governor -> Core -> Runtime -> Hermes/model -> Workbench response with no tools.

### Gate W6 - Governed tool and web path

Prove capability-specific tools, web search/read, denial, approval, and evidence.

### Gate W7 - Delegation and memory

Prove inter-Bot task handoff, context minimization, memory boundaries, loop prevention, and inspectability.

### Gate W8 - Scheduler and environment tiers

Prove current-policy reauthorization for schedules and at least the accepted execution tiers without overclaiming unsupported isolation.

### Gate W9 - Recovery, upgrade, security, and owner acceptance

Prove rollback, failure recovery, state migration, degraded states, UI/runtime/security acceptance, and owner acceptance before any production activation request.

No gate above is execution authority in this design phase.

## 21. Definition of Architecture Complete

Architecture design is sufficiently explicit for owner review when:

- Bot and Session are separate first-class objects;
- Task and Run lifecycles are explicit;
- Governor, Core Runtime, Agent Runtime, and adapter ownership are non-overlapping;
- Hermes integration is replaceable and Signalproof remains state owner;
- provider/model routing is policy driven and provider independent;
- tool/skill/MCP permissions map to capabilities;
- web levels are separately governed;
- memory scopes and context budgets are explicit;
- inter-Bot delegation is inspectable and bounded;
- schedule definitions remain Signalproof-owned;
- execution tiers are explicit without promising unverified technology;
- operational journal is distinct from Build Ledger;
- failure/degraded states fail honestly;
- implementation can be divided into bounded gates without touching the accepted baseline during design.

## 22. Design Disposition

**ARCHITECTURE: PASS FOR OWNER REVIEW**

Required correction incorporated during Full Debug design challenge:

- The Agent Runtime is placed behind the existing Core Runtime enforcement boundary, not directly behind Governor in a way that would bypass the accepted Policy Enforcement Point.

Runtime implementation remains **UNBUILT / UNTESTED / NOT AUTHORIZED**.
