# Signalproof Workbench Bots/Sessions RD1 - UX, State Model, and Design Acceptance

**Status:** CANDIDATE / DESIGN ONLY / NO PRODUCTION MUTATION  
**Work stream:** Signalproof Workbench Bots/Sessions RD1  
**Owner:** Doc Reo  
**Companion architecture:** `designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-ARCHITECTURE.md`

## 1. Product Experience Goal

Signalproof Workbench should feel like a personal AI operations workspace, not a diagnostic Governor console.

The ordinary user experience is conversational and simple. Governance, runtime, evidence, provider, tool, memory, and execution-environment detail remain visible and inspectable without becoming the main conversation body.

Product principle:

> Simple by default. Governed always. Inspectable on demand.

The user should be able to answer at a glance:

```text
WHO AM I TALKING TO?
WHAT ARE WE WORKING ON?
WHAT IS IT DOING?
DOES IT NEED ME?
WHAT MAY IT ACCESS?
WHAT ACTUALLY HAPPENED?
WHERE IS THE PROOF?
```

## 2. Primary Information Architecture

The initial handoff proposed eleven top-level navigation destinations. For ordinary use, RD1 consolidates related technical surfaces so the navigation remains powerful without becoming configuration-heavy.

### Primary left navigation

1. **Workbench** - current conversation and operational home
2. **Bots** - persistent worker identities and configuration
3. **Sessions** - resumable conversation/work history
4. **Activity** - Tasks, Runs, delegations, approvals, schedules, and attention queue
5. **Library** - Context, Research, Tools/Skills, Memory, Files, and Evidence
6. **Automations** - schedules and recurring governed work
7. **Settings** - providers, models, runtime, environments, integrations, and advanced administration

### Library subnavigation

- Files / Context
- Research / Web
- Tools / Skills / MCP
- Memory
- Evidence
- Artifacts

This preserves every handoff-required capability while reducing primary navigation overload.

## 3. Workbench Frame

```text
+--------------------------------------------------------------------------------+
| Signalproof Workbench | Active Bot | Session | Runtime State | Governor State  |
+----------------------+--------------------------------------+------------------+
| Primary Navigation   | Conversation / Task Canvas           | Context Inspector|
|                      |                                      |                  |
| Workbench            | USER                                 | Bot              |
| Bots                 | ...                                  | Session          |
| Sessions             |                                      | Tasks            |
| Activity             | ASSISTANT                            | Memory           |
| Library              | actual response                      | Capabilities     |
| Automations          |                                      | Environment      |
| Settings             | [tool/delegation cards]              | Control/Evidence |
|                      |                                      |                  |
| Bot Roster optional  | [attachment chips]                   | [collapse]       |
|                      |                                      |                  |
|                      | Composer: message / attach / @Bot     |                  |
+----------------------+--------------------------------------+------------------+
```

### Top status bar

Shows only meaningful operational state:

- active Bot;
- Session title;
- current run state;
- Governor state when relevant;
- execution environment label;
- simple model route label such as `Auto`, `Local`, or explicit pinned model.

Advanced provider/model detail belongs in the Inspector.

### Optional Bot roster

When in Bot mode, a secondary roster can appear beneath or adjacent to primary navigation with:

- avatar;
- Bot name;
- role/title;
- state text;
- attention marker;
- current Task count;
- quick create Bot.

A user can hide the roster and work Session-first.

## 4. Conversation Canvas

The center pane is the human-facing product surface.

It contains:

- user messages;
- actual assistant/model responses;
- attachments;
- artifact previews;
- concise tool cards;
- delegation cards;
- approval cards;
- clarification cards;
- run state when work continues beyond one response.

### Critical separation

Do not display a raw Governor ALLOW/DENY envelope as if it were the assistant answer.

Correct conceptual rendering:

```text
USER
What changed in AI regulation today?

ASSISTANT
<actual researched answer>

RESEARCH CARD
3 sources read | Research Bot | Completed

CONTROL / EVIDENCE
Governor: ALLOW
Capability: web.search + web.fetch
Runtime: Signalproof Agent Runtime
Adapter: Hermes
Model: actual model used
Evidence: View
```

Control/evidence appears as a compact expandable surface, not as conversational prose unless specifically requested.

## 5. Context Inspector

The right rail is collapsible and contextual.

### Summary view

- Bot identity and role
- Session state
- active Task / Run
- memory/context summary
- capability summary
- current execution environment
- Governor state

### Evidence view

- decision reference
- Core enforcement result
- adapter/runtime identity
- actual provider/model route
- tool calls
- approvals
- delegations
- artifacts
- operational journal range

### Advanced view

- capability IDs and scopes
- resource scopes
- context budget
- model/provider policy
- runtime mapping
- token/cost usage where available
- technical failure class
- event IDs/hashes where useful

The Inspector explains operational state. It must not contradict it.

## 6. Bot Experience

### Bot list

Each Bot card shows:

```text
Avatar
Name
Role
State
Last activity
Attention / approval count
Current environment tier
```

### Bot detail tabs

1. Overview
2. Sessions
3. Capabilities
4. Memory
5. Automations
6. Environment
7. Evidence
8. Advanced

### Simple Bot creation

Default wizard asks only:

1. **Name** - what should this Bot be called?
2. **Role** - what kind of worker is it?
3. **Mission** - what should it accomplish?
4. **Access** - what may it use or reach?

Signalproof then proposes a policy profile for review.

The user sees a plain-language summary such as:

```text
This Bot can read project files, search and read the public web, and create drafts.
It cannot send messages, publish, purchase, delete, use your personal browser profile,
or execute shell commands without separate approval.
```

### Advanced Bot configuration

Advanced mode exposes:

- system/personality instructions;
- provider/model policy;
- reasoning profile;
- Skills;
- tools/MCP;
- web/browser level;
- file roots;
- memory policy;
- context budget;
- execution environment;
- schedules;
- delegation policy;
- approval policy;
- spend/usage budget;
- provenance/version.

## 7. Session Experience

Sessions support conventional chat use independent of persistent Bot administration.

Session list supports:

- search;
- rename;
- pin;
- archive;
- Bot filter;
- project/workspace filter;
- status filter;
- last-active sort.

A user may:

- start a general Session;
- start from a Bot;
- resume a prior Session;
- branch a Session;
- attach context;
- migrate to another Bot through an explicit handoff rather than silently changing identity.

Session history retains actual provider/model/tool provenance without forcing it into ordinary prose.

## 8. Activity Center

Activity is the operational inbox for work that outlives a single chat response.

Views:

- Needs Your Attention
- Running
- Queued
- Delegated
- Scheduled
- Completed
- Failed / Blocked

Each Activity card contains:

```text
Task purpose
Bot
Session
State
Started / scheduled time
Why attention is required
Next action
Evidence link
```

This is where asynchronous-style work returns for review. The Workbench must never imply background work exists unless an actual Runtime/Scheduler owns the Task.

## 9. Delegation UX

### User initiation

The user can:

- type `@BotName`;
- select `Delegate` from a message or Task;
- drag/assign a Task to a Bot in Activity where supported.

### Handoff card

Before or during delegation, show:

```text
FROM: Research Bot
TO: Builder Bot
PURPOSE: Build a prototype from accepted findings
CONTEXT SHARED: 4 selected artifacts + summary
CAPABILITIES REQUESTED: file.read, file.write, code.execute
APPROVAL: required for code execution
STATUS: Waiting / Running / Complete
```

### Inspectable inter-Bot thread

The user can open a delegation and inspect:

- source request;
- context package;
- target response;
- capability requests;
- approvals/denials;
- artifacts;
- result returned to origin.

No hidden Bot-to-Bot channel should perform meaningful work without operational evidence.

## 10. Research / Web UX

Research is a governed capability, not a single unrestricted toggle.

The user-facing control may show simple modes:

- Off
- Search web
- Search + read pages
- Browser mode

Advanced settings expose W0-W5 capability levels from the companion architecture.

When authenticated or external-write activity is requested, the Workbench must surface the exact site/account scope and required approval.

A Research card should show source count and completion state. Full source/tool detail is available through Evidence.

## 11. Approval and Clarification UX

Approval cards must state:

```text
WHAT wants to act
WHAT it wants to do
WHERE it will act
WHY it is needed
WHAT could change
WHETHER it is reversible
WHAT happens if denied
```

Actions:

- Approve once
- Deny
- Edit scope where policy supports it
- Inspect evidence / policy

Do not use ambiguous global approvals when a capability-specific approval can be shown.

Clarification cards remain conversational and should not be visually confused with security authorization.

## 12. Automations UX

Automation creation starts from a Bot or Task template.

Simple mode asks:

- what should happen;
- when/trigger;
- where the result should appear;
- whether approval is required before consequential actions.

Automation detail shows:

- Bot;
- Task template;
- schedule/trigger;
- current policy profile;
- next run;
- last run;
- current state;
- evidence.

Every scheduled execution is re-evaluated under current policy at run time. A schedule is not a permanent authorization token.

## 13. Execution Environment UX

Ordinary users see plain labels:

- Conversation only
- Local workspace
- Isolated workspace
- Dedicated Windows worker
- Remote worker

Advanced view maps these to E0-E4 tiers and shows:

- environment identity;
- allowed roots;
- network scope;
- credential scopes;
- installed capabilities;
- health evidence;
- reset/rollback policy.

UNKNOWN or unverified environment state cannot be presented as healthy.

## 14. State Semantics

### Product-facing states

| State | Meaning |
|---|---|
| READY | Available for the permitted next action; evidence supports readiness |
| ACTIVE | Currently executing or streaming |
| QUEUED | Accepted but not yet executing |
| WAITING FOR YOU | Human approval, clarification, or decision is required |
| BLOCKED | Policy, prerequisite, permission, or enforcement prevents progress |
| DEGRADED | Part of the path is unavailable; reduced capability is explicit |
| OFFLINE | Required runtime/worker/provider is not reachable |
| UNKNOWN | Required evidence is absent or stale |
| COMPLETED | Required completion criteria for the Task/Run are met |
| FAILED | Execution ended without meeting completion criteria |
| CANCELLED | Execution was intentionally stopped |

### Visual rule

Color may reinforce state but never carry state alone. The textual state and reason are authoritative.

### Health rule

Do not label a component healthy merely because its process exists. Health claims must map to defined evidence.

## 15. Simple vs Advanced Mode

### Simple mode

Optimized for daily use:

- named Bot;
- Session;
- normal conversation;
- attachments;
- web/research choice;
- visible Tasks;
- plain approvals;
- concise evidence badges;
- automatic policy/model recommendations within owner constraints.

### Advanced mode

Adds:

- provider/model selection;
- capability IDs;
- Skills/MCP configuration;
- memory scopes;
- context budgets;
- execution environment policy;
- schedule policy;
- delegation graph;
- evidence/event detail;
- technical runtime health and adapter state.

Simple mode hides complexity, not governance.

## 16. Failure UX

### Governor DENY

`BLOCKED - Governor denied this capability.`

Show reason and allowed next choices. No Runtime call is implied.

### Core enforcement rejection

`BLOCKED - Authorization was issued, but Core Runtime did not accept the execution request.`

Treat as a separate enforcement evidence class.

### Agent Runtime unavailable

`DEGRADED - The control plane is available, but the Agent Runtime is unavailable. No model execution occurred.`

### Hermes unavailable

`DEGRADED - The selected Hermes adapter is unavailable.`

Offer only policy-approved alternatives.

### Local model unavailable

If policy is local-only:

`BLOCKED - The required local model is unavailable. External fallback is not permitted.`

### Tool denied during run

Pause and present the requested capability. Do not let the model narrate an action as completed when it was denied.

### Evidence journal failure

For actions requiring durable evidence:

`BLOCKED - Required operational evidence could not be recorded.`

## 17. Design-Only Full Debug Challenge

The owner's `/dsp design-git and debug all` instruction is executed here as three **logical lanes**. No independent agents were spawned and no production correction was attempted.

### Builder logical lane

**Question:** Is the current production Workbench failing in a way that requires a production fix before design?

**Finding:** No evidence requires reopening Build 8A D4. The accepted control path proves Workbench-to-Governor authorization. The missing conversational execution path is a product/backend capability gap, not evidence that production activation failed.

**Design consequence:** Do not repair/reinstall production. Build a new candidate Agent Runtime/Broker in a later authorized phase.

### Design logical lane

**Question:** Does the proposed experience satisfy Bots, Sessions, context control, visible orchestration, power-user depth, and normal chat usability without copying Hermes/Grok branding?

**Finding:** PASS WITH CONSOLIDATION. The initial eleven-item navigation is functionally complete but risks configuration overload. Consolidating Context, Research, Tools/Skills, Memory, Files, and Evidence beneath `Library` keeps all required surfaces while improving ordinary navigation.

**Design consequence:** Seven primary destinations plus contextual/advanced subnavigation.

### Governor logical lane

**Question:** Can the architecture preserve the accepted Governor/Core boundary while adding powerful Bots, tools, schedules, web, memory, delegation, and isolated workers?

**Findings:**

1. Agent Runtime must sit behind Core Runtime enforcement, not bypass it.
2. A Bot identity is not authority; every capability remains policy-scoped.
3. Delegation must transfer a bounded ContextPackage and capability request, not all memory/tools/credentials.
4. Schedules must reauthorize at execution time.
5. Web search/read/authenticated read/external write require separate capability classes.
6. Provider credentials and signing keys must never become prompt context.
7. Local-only model policy must not silently fall back to cloud.
8. Operational telemetry belongs in the Operational Journal, not canonical Build Ledger chronology.
9. Consequential autonomous action must remain inspectable and attributable.
10. Execution environments require explicit identities, roots, networks, credential scopes, and recovery semantics.

**Governor decision:** DESIGN PASS WITH IMPLEMENTATION GATES. No production authorization is implied.

## 18. Full Debug Result

```text
FULL DEBUG RESULT
Workstream: Signalproof Workbench Bots/Sessions RD1
Failure class: PRODUCT CAPABILITY GAP - conversational execution backend not yet built
Carried-forward failure attempt count: no same-failure production retry initiated
Known-error matches: PowerShell registry restored; no PowerShell artifact generated or executed
Bounded authorization: DESIGN / RESEARCH / INVESTIGATE / VERIFY ONLY
Spawn truth: logical Builder / Design / Governor lanes; no independent agents spawned
Persisted-state inspection: handoff + current Git + task-relevant private ledger continuity reviewed
Correction result: no production correction required; architecture corrected to retain Core Runtime enforcement
Exact-final validation truth class: design/document review only, not runtime validation
Original-failure retest: NOT APPLICABLE - this phase does not replay production activation
Protected-state result: preserved by non-mutating design workflow
Governor decision: DESIGN PASS WITH IMPLEMENTATION GATES
Final status: DESIGN CANDIDATE READY FOR OWNER REVIEW
Next action: owner accepts/changes design before any build-planning or implementation authority
```

## 19. Acceptance Matrix for Future Build

The following matrix defines evidence classes. It is not a claim that implementation has passed them.

| Evidence class | Future acceptance target |
|---|---|
| Product IA | Bots, Sessions, Activity, Library, Automations, Settings and Workbench workflows match approved design |
| Conversation | actual assistant response streams in the conversation while control/evidence remains separate |
| Bot state | Bot identity/version/policy persist and multiple Sessions remain distinct |
| Session state | create/resume/search/branch/archive preserve message and provenance contracts |
| Governor | exact capability request receives valid ALLOW/DENY/approval behavior |
| Core enforcement | substitution, scope expansion, expiry, identity mismatch and unauthorized runtime target fail closed |
| Runtime | Task/Run lifecycle, streaming, interruption, retries and failure classification behave as specified |
| Hermes adapter | approved Hermes interface maps streaming, approval, delegation and model provenance without owning Signalproof state |
| Model routing | policy/locality/budget/provider constraints are honored; no silent forbidden fallback |
| Tools/Web | capability-specific read/write/search/browser/tool scopes are enforced and evidenced |
| Memory | Session/Bot/project scopes remain separated; durable writes preserve provenance and approval policy |
| Delegation | context package is bounded, loop controls work, target Bot uses its own policy and credentials |
| Automation | scheduled run reauthorizes current policy and produces visible evidence/result |
| Environments | declared isolation tier matches actual runtime evidence and reset/recovery behavior |
| Evidence | operational events are durable, attributable, tamper-evident where designed, and separate from Build Ledger |
| Failure states | DENY/BLOCKED/DEGRADED/OFFLINE/UNKNOWN display truthfully without false success |
| Security | secrets, signing identities, account scopes, external writes, and cross-Bot authority remain bounded |
| Recovery | candidate can roll back without changing the accepted production baseline or losing protected user state |
| Accessibility | keyboard, scaling, screen-reader, contrast and state-text requirements pass specialist acceptance |
| Owner acceptance | final product workflow and visual direction explicitly accepted by owner |

## 20. Owner Review Questions

The design is ready for an owner decision when these questions can be answered yes:

- Bots and Sessions are clearly different.
- Workbench feels like normal AI conversation first, operations console second.
- meaningful Bot actions remain visible rather than hidden.
- Governor and Core Runtime remain in control of capability execution.
- Hermes is useful but replaceable.
- local and external models are selectable under policy without lock-in.
- web research is powerful without becoming unrestricted browsing.
- memory is useful without loading everything into every prompt.
- delegation reduces context bloat without creating hidden authority inheritance.
- schedules and worker environments remain governed at execution time.
- operational evidence is deep enough for review without polluting ordinary chat or Build Ledger chronology.
- production remains untouched until a later explicit build authorization.

## 21. Updated Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Workbench Bots/Sessions RD1
Git basis: docreo/Signalproof-Skills main 80a21ccb... plus candidate/workbench-bots-rd1 design commits
Current state: prior Build 8A D4 CLOSED / PRODUCTION ACTIVE; Workbench design stream OPEN
Objective: complete owner review of the Signalproof-native Workbench IA, runtime architecture, Bot/Session contracts, Hermes boundary, governance model, evidence model, and future acceptance gates
Route: design-git -> signalproof-design -> Full Debug logical design challenge -> owner review
Action class: DESIGN / DOCUMENT / VERIFY ONLY
Protected state: production Workbench, Governor, cryptographic identities, Local Service runtime, ACL/task configuration, PRODUCTION_ACTIVE metadata, protected Core, accepted Build 8A D4 evidence, protected main
Allowed surface: candidate Git design artifacts and noncanonical staged continuity records only
Known-failure constraints: current PowerShell failure registry loaded; no repeat activation runner; Scheduled Task visibility lesson remains Candidate; harness evidence must not overwrite stronger product evidence
Dependencies/authority: owner design acceptance required before build planning or implementation
Acceptance evidence: architecture document + UX/state document + Hermes integration disposition + logical Full Debug result + future acceptance matrix
Recovery/non-mutation: delete/revise candidate artifacts if design is rejected; production remains unchanged
STOP conditions: design bypasses Governor/Core; hides consequential autonomy; assumes secrets or unsupported isolation; collapses operational journal into Build Ledger; licensing/integration boundary becomes unresolved; production mutation is requested without new authority
Closeout trigger: owner accepts the design and separately authorizes the next build-planning/implementation phase
```

## 22. Design Status

**UX / STATE / GOVERNANCE DESIGN: PASS FOR OWNER REVIEW**

**Production mutation:** NONE  
**Runtime implementation:** NOT BUILT  
**Runtime validation:** NOT RUN  
**Production authorization:** NOT GRANTED  
**Canonical Build Ledger append:** NOT AUTHORIZED
