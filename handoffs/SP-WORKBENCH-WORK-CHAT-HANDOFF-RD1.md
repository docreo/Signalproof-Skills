# Signalproof Workbench Bots/Sessions Design - Work Chat Handoff RD1

**Status:** DESIGN-ONLY HANDOFF / NO IMPLEMENTATION MUTATION  
**Work stream:** Signalproof LLM Workbench - Bots, Sessions, Agent Runtime, governed LLM execution  
**Owner:** Doc Reo  
**Git doctrine basis at handoff:** `docreo/Signalproof-Skills` main `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`  
**Design branch:** `candidate/workbench-bots-rd1`  
**Prior milestone:** Build 8A D4 Governor production activation - CLOSED / PRODUCTION ACTIVE  
**Build Ledger disposition:** STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION

---

# RECEIVING CHAT - START HERE

Run:

```text
log-build-git
/dsp design-git and debug all
```

Treat this handoff as a provenance-bound transfer packet, not complete current truth.

Before consequential work:

1. refetch current `docreo/Signalproof-Skills` main;
2. read the current Active `design-git`, `signalproof-design`, `build-git`, `full-debug`, `handoff-log`, and applicable Governor/security contracts;
3. compare current main against this handoff's Git basis;
4. retrieve task-relevant private Build Ledger / production evidence when available, but do not guess missing private truth;
5. reload `library/POWERSHELL-FAILURE-REGISTRY.yaml` before generating or running any new PowerShell;
6. preserve the current production Workbench/Governor state exactly;
7. remain in DESIGN / RESEARCH / INVESTIGATE until the owner separately authorizes implementation.

**First action:** create the complete Signalproof-native Workbench architecture and UI/UX design for Bots + Sessions + governed agent execution. Do not modify the installed production Workbench, Governor, Local Service task, keys, ACLs, protected Core, or activation metadata during the design phase.

---

# 1. Why This Design Phase Exists

Build 8A D4 successfully activated the Signalproof Governor and current Workbench production client. The owner then launched the real Workbench GUI and discovered an important product boundary:

- the UI launches correctly;
- the Workbench authenticates to the production Governor;
- the Governor returns `ALLOW` for `agent.hermes.governed-worker`;
- the UI currently displays the Governor response/envelope;
- the Workbench does not yet provide a complete conversational LLM experience;
- the current UI visibly reports no direct model/Hermes path and remains fail-closed for model execution.

Therefore the next product phase is not another activation repair. It is a **new Signalproof Workbench architecture/design phase** that connects the governed control plane to a persistent agent/LLM execution plane and replaces the current diagnostic-style Workbench UX with the intended user product.

The owner's explicit direction is:

> This is the new look and design for Signalproof Workbench.

The target experience should combine the best interaction patterns of **Hermes Bot** and **Grok Bot**, but remain Signalproof-native in identity, architecture, governance, data model, evidence, and future extensibility.

Do not clone either product visually or make either vendor the owner of Signalproof state.

---

# 2. Current Evidence-Backed Production Truth

The receiving chat may rely on the following as accepted milestone truth unless newer evidence actually contradicts it.

## Build 8A D4 accepted chain

1. **RD1.1**
   - privileged activation attempt encountered a live redirected-log file-sharing harness failure;
   - failure was not accepted as a Governor product failure;
   - failed production state was rolled back.

2. **RD1.2**
   - recovery verification passed;
   - failed privileged product/data/task state was clean;
   - prepared normal-user cryptographic identity was preserved;
   - protected Core remained exact.

3. **RD1.2.1 privileged install**
   - production Governor and Workbench installation passed;
   - intended ACL boundaries passed;
   - production runtime identity was Local Service;
   - persistent startup task/readiness was established in the privileged evidence class;
   - DPAPI signing-key state was present;
   - protected Core remained exact.

4. **RD1.2.1 final-user harness**
   - standard-user `Get-ScheduledTask` visibility produced a false-negative harness failure;
   - this did not invalidate stronger privileged task/runtime evidence.

5. **RD1.3**
   - changed the evidence class instead of replaying installation;
   - installed normal-user Workbench authenticated to the live production Governor;
   - Governor returned `ALLOW`;
   - runtime identity remained Local Service;
   - DPAPI key remained present;
   - protected Core remained unchanged.

6. **RD1.4**
   - exact final metadata/evidence finalization passed;
   - activation metadata transitioned to `PRODUCTION_ACTIVE`;
   - `production_activation=true`;
   - exact RD1.3 final-user proof was bound into activation metadata;
   - protected Core remained unchanged.

7. **Post-activation Full Debug + recheck**
   - no further production correction was required;
   - Build 8A D4 was declared `PRODUCTION ACTIVE / CLOSEOUT READY`;
   - later milestone closeout marked Build 8A D4 CLOSED.

## Important distinction

The accepted production activation proves the **control plane** and the Workbench-to-Governor authentication boundary.

It does **not** prove that the current GUI provides this complete path:

```text
Workbench GUI
-> Governor auth/policy
-> ALLOW
-> agent runtime
-> Hermes/model
-> assistant response
-> Workbench conversation display
```

That complete product path is the next architecture/build target.

---

# 3. Build Ledger / Governance Context for Design

The design chat must understand enough Build Ledger state to avoid reopening accepted work incorrectly.

## Prior milestone

Stable work-stream identity:

`Build 8A D4 - Signalproof Governor production activation`

Status:

`CLOSED / PRODUCTION ACTIVE`

## Canonical Build Ledger boundary

Canonical Build Ledger append was **not** performed during the activation closeout because live canonical ledger identity/head/chain/projection was not separately verified and authorized.

Disposition:

`STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION`

Do not:

- invent or reserve a `C###` number;
- assume a projected ledger head;
- hand-edit canonical JSONL/SQLite;
- make normal bot/session runtime events canonical Build Ledger events.

The Build Ledger is for meaningful governed milestones, promotions, recovery, closeouts, authorization/phase transitions, and other canonical development/governance events.

The future Workbench requires a **separate operational event/evidence journal** for sessions, messages, tool calls, bot handoffs, model calls, runtime state, approvals, and agent activity. That operational journal may later emit bounded milestone evidence into the Build Ledger through governed closeout, but must not collapse runtime telemetry into canonical development chronology.

## Reusable failure intelligence

Candidate:

`KE-PS-SCHEDULED-TASK-VISIBILITY-001`

Meaning:

A standard-user `Get-ScheduledTask` miss is not sole authority that a privileged Local Service task is absent when stronger privileged registration/runtime evidence exists.

Lifecycle:

`CANDIDATE` only.

Do not silently treat it as Active prevention doctrine without normal Known Errors/Learn promotion and regression coverage.

## Other PowerShell continuity that remains relevant

Current Active failure registry includes prevention for exact-final parser validation, interactive block handling, optional property/shape errors, Windows PowerShell JSON behavior, dictionary membership, reserved variables, native stderr classification, nested here-strings, path canonicalization, and harness-vs-product evidence classification.

If the next phase later creates PowerShell installers/runners, reload the current registry from Git first. A new chat or renamed runner does not reset failure continuity.

---

# 4. Protected Baseline - MUST NOT CHANGE DURING DESIGN

The design phase is non-mutating with respect to production.

Protect:

- installed production Signalproof Governor;
- installed current Signalproof Workbench baseline;
- normal-user CurrentUser cryptographic client identity;
- Governor Local Service runtime boundary;
- DPAPI production signing state;
- production task/ACL configuration;
- `PRODUCTION_ACTIVE` activation metadata;
- protected Signalproof Core Runtime baseline;
- accepted Build 8A D4 evidence;
- current Active Signalproof Skills/commands on protected main.

Do not reinstall, repair, alter, disable, replace, or reconfigure these merely to create the design.

Material redesign belongs in a candidate design/build stream and must preserve rollback to the accepted baseline.

---

# 5. Owner's Product Direction - New Signalproof Workbench

The new Workbench should feel like a **personal AI operations workspace** rather than the current diagnostic authorization client.

Reference interaction patterns:

- Hermes Bot mode;
- Grok Bot mode;
- existing Hermes session/profile/tool ecosystem;
- Signalproof Governor and Human-Centered AI governance requirements.

Use references for product patterns, not branding duplication.

## Core owner requirements

The Workbench must support both:

1. **Sessions** - normal resumable conversations/workspaces;
2. **Bots** - persistent named AI workers with distinct roles, context, tools, skills, memory, and governed permissions.

The Workbench should expose the features we would actually use from Hermes/Grok-style bot products, including web research, but under Signalproof governance.

---

# 6. Sessions and Bots Are Separate First-Class Concepts

Do not collapse Bots and Sessions into the same object.

## Bot

A persistent governed worker identity.

Candidate bot fields include:

- bot ID;
- name;
- avatar/icon;
- title;
- role/mission;
- description;
- system/personality instructions;
- model policy;
- provider policy;
- allowed skills;
- allowed tools/capabilities;
- memory policy;
- web/browser policy;
- file/workspace policy;
- schedule/automation policy;
- inter-bot communication permissions;
- execution environment/sandbox identity;
- approval requirements;
- owner/status/health;
- provenance/version.

A Bot can have multiple Sessions.

## Session

A resumable conversation/work context.

Candidate session fields include:

- session ID;
- bot ID or orchestrator context;
- title;
- created/updated timestamps;
- message history;
- attachments/context;
- active tasks;
- artifacts;
- model/provider actually used;
- tool activity;
- handoffs/delegations;
- approvals;
- runtime evidence references;
- archive/pin/search state.

A Session is not itself the Bot's entire long-term memory.

---

# 7. Reference Features to Carry Forward

The user-provided Hermes/Grok comparison describes the following product patterns as especially relevant to Signalproof Workbench:

## From Hermes-style operation

- profiles/bots with independent names, roles and descriptions;
- selectable providers/models for power users;
- local models;
- per-bot tools and skills;
- schedules/cron;
- voice capability;
- Git integration;
- strong local computer/file workflows;
- high customization;
- session mode plus bot mode;
- web/tool extensibility.

## From Grok Bot-style operation

- very simple named-bot roster;
- one natural conversational surface per worker;
- highly visible agent-to-agent delegation;
- inspectable bot-to-bot communication;
- dedicated worker environments/computers;
- strong separation between agent execution and personal accounts;
- asynchronous work and return-for-approval behavior;
- low configuration burden for ordinary users;
- polished mobile/remote interaction concept.

## Signalproof interpretation

Signalproof should combine:

- **simple default UX** like Grok Bot;
- **power-user extensibility** like Hermes;
- **governed permissions/evidence** unique to Signalproof;
- **local-first/private execution** where appropriate;
- **provider independence** rather than a single-model lock-in;
- **explicit bot/session state** to avoid context bloat;
- **inspectable orchestration** instead of hidden agent-to-agent behavior.

---

# 8. Backend Is Required

Yes: this product requires a backend execution layer.

Do **not** turn the Signalproof Governor itself into the agent engine.

The Governor remains the control/policy/authorization plane.

Recommended conceptual architecture:

```text
Signalproof Workbench UI
        |
        | user/bot/session intent
        v
Signalproof Governor
        |
        | authenticated + policy-approved capability request
        v
Signalproof Agent Runtime / Broker   <--- NEW BACKEND LAYER
        |
        +--> Bot Registry
        +--> Session Service
        +--> Memory / Context Service
        +--> Agent Orchestrator / Inter-Bot Bus
        +--> Tool / Skill Capability Broker
        +--> Scheduler / Automation Service
        +--> Artifact / Attachment Service
        +--> Web / Browser Research Adapter
        +--> Execution Environment Manager
        +--> Provider / Model Router
        +--> Operational Event / Evidence Journal
        |
        +--> Hermes Adapter (first governed agent runtime)
        +--> future agent adapters
        +--> optional governed direct-model adapter
        |
        v
Model + Tool Providers
```

The runtime/broker should consume Governor-approved capabilities rather than bypassing the Governor.

---

# 9. Hermes Integration Strategy

Hermes should be the **first agent-runtime adapter**, not the owner of Signalproof state.

Design for:

- direct integration/adaptation of appropriate Hermes agent/runtime functions after current license/API verification;
- Signalproof-owned bot/session schema;
- Signalproof-owned memory/evidence policy;
- Signalproof-owned UI;
- Signalproof Governor wrapping powerful operations;
- Hermes provider/model flexibility where useful;
- local model support;
- skills/tools/MCP/web/terminal/file capabilities only through governed capability policy;
- replaceable adapter contract so another agent engine can be introduced later without rewriting the Workbench product model.

Before implementation, the receiving chat must verify the current official Hermes repository/license/version and identify which code/API surfaces are suitable for integration, adaptation, optional dependency, or reimplementation.

Do not assume a third-party hosted gateway or paid provider becomes a mandatory Signalproof dependency.

---

# 10. Agent-to-Agent Communication

This must be materially better than invisible delegation.

Design principle:

**Every meaningful inter-bot delegation should be inspectable.**

Possible UX:

- `@BotName` mention;
- `Delegate` action;
- handoff card visible in the source session;
- task appears in destination bot/activity stream;
- bot-to-bot messages can be opened and inspected;
- origin, destination, context package, capability request, approval state, result and evidence are visible;
- Governor can deny or constrain cross-bot capabilities;
- no bot silently inherits all context/tools from another bot.

This preserves human agency and reduces prompt/context bloat.

---

# 11. Execution Environments / Bot Computers

The Grok Bot reference suggests a strong safety/usability advantage from per-bot isolated computers/workspaces.

Signalproof should design this as an explicit capability tier rather than automatically letting every agent act inside the owner's personal interactive desktop.

Explore governed options such as:

- bot-specific local workspace;
- Windows sandbox/VM;
- containerized execution where appropriate;
- remote worker node;
- dedicated browser profile;
- dedicated service account;
- future network workstation allocation.

Each environment should have:

- explicit identity;
- allowed roots/accounts/network surfaces;
- credential boundary;
- tool/capability policy;
- evidence/telemetry;
- rollback/reset strategy;
- owner approval points.

Do not require full VM isolation for every simple chat. Design tiers.

---

# 12. Web / Research Capability

The Workbench must be able to pull current information from the web.

Design the feature as a governed capability, not as unrestricted browser access.

Possible separation:

- web search;
- page fetch/read;
- browser automation;
- authenticated site interaction;
- downloads;
- external write/actions.

Each should have separate Governor permissions and visible execution evidence.

A research bot may have search/read permission without login/write permission.

---

# 13. Proposed Information Architecture

This is a design target, not an implementation decision.

## Primary left navigation

- Home / Workbench
- Bots
- Sessions
- Tasks / Activity
- Files / Context
- Research / Web
- Automations
- Tools / Skills
- Memory
- Evidence
- Settings

## Bot-mode working view

Left rail:

- named bot roster;
- avatar;
- role/title;
- status/activity indicator;
- unread/attention state;
- quick create bot.

Center:

- current bot/session conversation;
- streaming assistant response;
- visible tool/task/delegation cards;
- attachments/context;
- bottom composer.

Right contextual rail:

- bot identity/role;
- session state;
- current model/provider (optional/simple vs advanced mode);
- active tasks;
- scheduled routines;
- memory/context summary;
- allowed skills/tools;
- Governor status;
- execution environment;
- evidence/activity drill-down.

## Session-mode working view

Allow normal session-centric use similar to conventional AI chat:

- searchable history;
- multiple sessions per bot;
- archive/pin/rename;
- resume prior work;
- new chat from selected bot/profile;
- attach files/context;
- preserve actual model/tool provenance.

The owner should not be forced into Bot mode for every task.

---

# 14. Simplicity vs Power-User Controls

Signalproof should avoid Hermes-style configuration overload for ordinary users while preserving advanced controls.

Recommended product principle:

**Simple by default, inspectable and configurable on demand.**

Default bot creation can ask:

- name;
- role;
- what it should do;
- what it may access.

Signalproof may recommend model/provider/tool policy automatically.

Advanced panel may expose:

- explicit model/provider;
- reasoning profile;
- skills;
- MCP/connectors;
- web/browser scope;
- execution environment;
- schedules;
- memory policy;
- context budget;
- governance/approval settings.

---

# 15. Context-Budget Principle

One major rationale for Bots is reducing context bloat.

Do not build a single mega-agent whose every prompt automatically contains:

- every session;
- every skill;
- every MCP;
- every tool;
- every file;
- every project;
- every memory.

Each bot should receive the smallest relevant policy, memory, skills, tools and context for its role.

Cross-bot context should be deliberately packaged through inspectable handoffs.

This aligns performance, cost, privacy, and governance.

---

# 16. Operational Evidence vs User Conversation

The current Workbench displays the Governor authorization JSON where a user expects an assistant answer. The redesign should separate these concepts.

Example conceptual view:

```text
USER
What changed in AI regulation today?

ASSISTANT
<actual model response>

CONTROL / EVIDENCE
Governor: ALLOW
Bot: Research
Capability: web.search.read
Agent runtime: Hermes adapter
Model: <actual runtime model>
Tool calls: <count / drill-down>
Approvals: none
Evidence: available
```

The assistant response belongs in the conversation.

Governor/auth/tool/runtime evidence belongs in an inspectable evidence/activity surface, not as the primary response body unless the user specifically asks for technical output.

---

# 17. Human-Centered Governance Requirements

The new Workbench must preserve:

- clear human ownership;
- visible active bot identity;
- visible capability boundaries;
- explainable approval/deny state;
- inspectable agent-to-agent delegation;
- explicit external-action approvals when required;
- fail-closed behavior when policy/runtime identity is invalid;
- meaningful status text, not decorative health indicators;
- technical/evidence depth without overwhelming the ordinary chat experience;
- recovery and rollback for stateful automations/bots;
- distinction between recommendation, plan, approved action and executed action.

Do not make autonomous activity invisible for visual simplicity.

---

# 18. Design-Only Full Debug Envelope

The owner requested `/dsp design-git and debug all` for the next chat, but explicitly said to plan/design without changing anything yet.

Therefore Full Debug in the receiving chat should be used as a **design challenge/review mechanism**, not as permission to mutate production.

Builder logical lane:

- inspect existing Workbench/Governor/runtime interfaces;
- identify backend contract gaps;
- do not implement.

Design logical lane:

- create IA, workflows, bot/session model, runtime architecture, evidence presentation and state semantics;
- identify mockup candidates.

Governor logical lane:

- challenge authority boundaries;
- verify no bypass around Governor;
- challenge bot isolation, credentials, web, automation, memory, inter-bot messaging and evidence architecture;
- preserve Build Ledger/runtime-journal separation.

Orchestrator:

- reconcile into one bounded Next Action Contract.

Do not claim independent agents spawned unless the environment actually supports them.

---

# 19. Exact Next Action Contract for Receiving Chat

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Workbench Bots/Sessions RD1
Git basis: refetch current docreo/Signalproof-Skills main; compare against handoff basis 80a21ccb...
Current state: prior Governor activation CLOSED / PRODUCTION ACTIVE; new Workbench design stream OPEN
Objective: design the Signalproof-native Bots + Sessions Workbench and the governed backend Agent Runtime/Broker that delivers real LLM/tool responses through the existing Governor control plane
Route: design-git -> signalproof-design -> research/evaluate Hermes integration -> Full Debug logical design challenge -> handoff/owner review
Action class: DESIGN / RESEARCH / INVESTIGATE / VERIFY ONLY
Protected state: all current production Governor/Workbench activation state, cryptographic identities, Local Service runtime, ACL/task configuration, protected Core, accepted Build 8A D4 evidence, protected main
Allowed surface: Git/document research, current source/interface inspection, public Hermes/Grok feature research, architecture documents, schemas, diagrams, UI wireframes/mockups, candidate design provenance
Known-failure constraints: preserve PowerShell registry continuity; do not repeat ScheduledTasks standard-user false-negative logic; preserve evidence-sufficiency termination; do not confuse harness failure with product state
Dependencies/authority: no implementation authority in this phase; verify current Hermes official repo/license/API before selecting integration surfaces
Acceptance evidence: owner-approved IA + backend architecture + bot/session schemas + execution/evidence contracts + Governor boundary + Hermes adapter disposition + mockup/wireframe direction + implementation gates
Recovery/non-mutation: design artifacts live in candidate/document space only; production remains untouched
STOP conditions: any design bypasses Governor; requires secret/credential assumptions; collapses runtime journal into canonical Build Ledger; hides autonomous actions; mutates production; silently promotes Candidate/third-party capability; third-party licensing/integration boundary remains unresolved
Closeout trigger: owner accepts the complete Workbench design and separately authorizes build planning/implementation
```

---

# 20. Required Design Deliverables Before Build

The receiving design chat should produce, at minimum:

1. Workbench product IA and navigation;
2. Bots vs Sessions object model;
3. Bot configuration schema;
4. Session/message/artifact schema;
5. Agent Runtime/Broker architecture;
6. Governor request/decision/execution handoff contract;
7. Hermes adapter boundary and integration disposition;
8. provider/model routing contract;
9. tool/skill/MCP capability contract;
10. web/research capability levels;
11. memory/context model;
12. inter-bot messaging/delegation contract;
13. scheduler/automation model;
14. execution environment/isolation tiers;
15. operational event/evidence journal design;
16. user-visible Control/Evidence UI design;
17. simple vs advanced UI modes;
18. failure/deny/degraded/offline state semantics;
19. acceptance matrix for UI, backend, security, runtime and owner acceptance;
20. protected-baseline/rollback plan for eventual implementation.

Do not start broad code implementation until these contracts are sufficiently explicit and the owner authorizes the next phase.

---

# 21. UI Reference Supplied by Owner

The owner supplied a transcript/video discussion comparing the newly released Hermes Bot mode and Grok Bot.

Important points from that reference:

- both use named worker/bot experiences;
- Hermes Bot reorganizes profiles into a bot roster with per-bot configuration;
- Grok Bot emphasizes very smooth bot-to-bot delegation and visible worker communication;
- Hermes supports more provider/model/local-model customization;
- Grok Bot emphasizes dedicated per-agent virtual computers and separation from personal accounts;
- both demonstrate the value of specialized bots with smaller context footprints;
- the reference strongly favors named, role-specific workers over one giant context-heavy agent;
- Hermes remains stronger for local/power-user customization;
- Grok Bot is used as a UX reference for simplicity, orchestration and mobile/remote work.

Treat the transcript as product-reference evidence, not as architectural authority or a license grant.

---

# 22. Public / Private Boundary

This handoff intentionally does not publish private ledger heads, local evidence paths, private key material, credentials, or unnecessary machine-specific recovery details.

Receiving chat should retrieve private evidence only when task-relevant and accessible.

If private Build Ledger state cannot be accessed, mark it `UNAVAILABLE` and continue with public-safe design where possible. Do not reconstruct canonical chronology from memory.

---

# 23. Authority State at Handoff

Authorized now:

- design discussion;
- research;
- architecture planning;
- inspect current public Git/source contracts;
- produce design artifacts/wireframes/schemas;
- Full Debug as non-mutating design challenge;
- handoff/log-skill synchronization.

Not authorized by this handoff:

- production mutation;
- Workbench replacement;
- Governor code/runtime changes;
- new task/service/ACL changes;
- credential/key changes;
- new external account access;
- destructive operations;
- Candidate activation;
- merge to protected main;
- release/deployment;
- canonical Build Ledger append;
- broad implementation.

Owner decision required after design acceptance for implementation/build phase.

---

# 24. Definition of Done for the Next Design Chat

The next design chat is complete when the owner can look at the architecture and answer **yes** to all of these:

- I understand what a Bot is versus a Session.
- I understand where the Governor ends and the new Agent Runtime begins.
- I understand how Hermes is integrated without owning Signalproof state.
- I understand how local and external models/providers fit.
- I understand how bots communicate and delegate visibly.
- I understand how web research and tools are permissioned.
- I understand how each bot can receive an isolated workspace/computer when needed.
- I understand where memory/context lives.
- I understand what is recorded as operational evidence versus Build Ledger chronology.
- I can see the intended Signalproof Workbench UI structure.
- The design is simple enough for ordinary use and deep enough for power users.
- Production remains protected.
- The implementation phase can be split into bounded gates with clear acceptance evidence.

Only after that should the next chat request owner authorization for Build/implementation.

---

# HANDOFF END STATE

**Prior Build 8A D4:** CLOSED / PRODUCTION ACTIVE  
**Current Workbench product reality:** GUI + Governor control path work; complete conversational agent/LLM path is not yet the user product  
**New stream:** Signalproof Workbench Bots/Sessions RD1  
**Mode:** DESIGN ONLY  
**Backend requirement:** YES - new governed Agent Runtime/Broker behind Governor  
**Hermes role:** first replaceable governed agent-runtime adapter, subject to current integration/license/API verification  
**Reference UX:** Hermes Bot + Grok Bot interaction strengths, Signalproof-native implementation  
**Build Ledger:** prior closeout STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION  
**Production changes in this design chat:** NONE  
**Next owner gate:** approve complete Workbench design, then separately authorize build planning/implementation.
