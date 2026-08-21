# Signalproof Workbench Bots/Sessions/Dash RD1 R3 - Work Chat Handoff

**Status:** HANDOFF / DESIGN ACCEPTED FOR BUILDER CONSUMPTION / W0 NEXT  
**Created:** 2026-08-20 20:15 PDT / 2026-08-21 03:15 UTC  
**Work stream:** Signalproof Workbench Bots/Sessions RD1  
**Owner:** Doc Reo  
**Repository:** `docreo/Signalproof-Skills`  
**Candidate branch:** `candidate/workbench-bots-rd1`  
**Current protected main checked:** `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**Prior accepted production milestone:** Build 8A D4, CLOSED / PRODUCTION ACTIVE  
**Production mutation in this chat:** NONE

This handoff supersedes the earlier work-chat transfer packet for continuation purposes while preserving the prior file and commit history as provenance.

---

# RECEIVING CHAT - START HERE

Run:

```text
log-build-git
```

Then revalidate and execute the current next gate:

```text
/dsp build-git
```

The routed first action is **W0 Source and Interface Authority**, read-only.

Treat this handoff as a provenance-bound transfer packet, not complete current truth.

Before consequential work:

1. refetch current `docreo/Signalproof-Skills/main`;
2. refetch `candidate/workbench-bots-rd1` and reconcile any drift;
3. read current Active `log-build-git`, `build-git`, `design-git`, `full-debug`, `handoff-log`, `signalproof-design`, `signalproof-ui-polish`, and `signalproof-accessibility` contracts as applicable;
4. retrieve task-relevant private Build Ledger continuity when accessible;
5. preserve the accepted production Workbench/Governor/Core baseline;
6. do not infer source authority from an installed executable, recovery copy, historical snapshot, or similarly named folder;
7. if PowerShell becomes relevant, reload current `library/POWERSHELL-FAILURE-REGISTRY.yaml` before generating or running another PowerShell artifact;
8. do not reserve or invent a canonical Build Ledger sequence.

Git is doctrine authority. This handoff is the mission/provenance index.

---

# 1. Current Mission

Build the next Signalproof Workbench as a Signalproof-native desktop LLM workspace with three primary operating modes:

```text
SESSIONS    BOTS    DASH
```

The product must preserve the accepted governed execution chain:

```text
Human
-> Signalproof Workbench UI
-> Signalproof Governor            Policy Decision Point
-> Signalproof Core Runtime        Policy Enforcement Point
-> Signalproof Agent Runtime       Execution Plane
-> Replaceable adapters, including Hermes
-> Approved models / tools / web / environments
```

The new Workbench is a product expansion, not a repair of the accepted Build 8A D4 production activation.

---

# 2. Current Evidence-Backed Product Truth

Accepted prior production truth remains:

- the installed Workbench launches;
- the Workbench reaches the production Governor control path;
- the accepted Governor activation is closed and production active;
- the current GUI does not yet provide the complete governed conversational model/agent execution path;
- that missing path is classified as a new product/backend capability gap, not a production activation failure.

Do not reopen Build 8A D4 unless newer evidence actually contradicts the accepted milestone.

---

# 3. Owner-Accepted Visual Direction

The owner reviewed the interactive R2 Workbench mockup and accepted the direction for Builder consumption.

Core R2 layout:

- desktop-first full application window;
- persistent horizontal three-column shell;
- compact left rail;
- dominant center conversation/task canvas;
- contextual collapsible right rail;
- persistent bottom LLM composer;
- restrained black/charcoal Signalproof interface with red branded accents;
- technical governance visible on demand rather than dominating ordinary conversation.

The old seven-item dashboard-style navigation is not the accepted primary frame.

## Primary modes

The current shell now has three mode tabs:

```text
SESSIONS    BOTS    DASH
```

### Sessions

Sessions are ordinary resumable LLM conversations/workspaces.

Expected behavior:

- conventional chat history;
- new Session;
- search/filter;
- pinned and recent Sessions;
- attachments/context;
- normal assistant responses in the center canvas;
- provenance and evidence available without replacing assistant prose.

### Bots

Bots are persistent governed worker identities.

Expected behavior:

- create/select a Bot;
- chat directly with a Bot;
- assign tasks;
- allow governed Bot-to-Bot collaboration;
- show visible handoffs/delegation;
- inspect collaboration when needed;
- keep Bot capability, memory, tools, web, environment, scheduling, and delegation policy bounded.

A Bot is not authority and does not inherit another Bot's credentials, full memory, or capability set.

### Dash

Dash was added after the R2 visual acceptance and was also accepted for Builder consumption.

Dash is a mostly read-only operational overview where the user reviews configured tracking widgets.

First-class widget domains:

1. Calendar
2. Meetings
3. Tasks
4. Opportunities
5. Growth
6. Current Status
7. Alerts

Dash configuration may allow widget selection, order, sizing, filters, data source selection, and alert thresholds. Normal daily use should remain primarily review, scan, drill-down, and handoff to a more appropriate detailed surface.

The supplied Greenlight screenshot is a **dashboard composition and density reference only**. It is not authority for the Workbench shell, navigation, or overall application layout.

---

# 4. Dash Design Rules

Dash must not become a second full editing application.

Normal actions may include:

- expand a widget;
- drill into an item;
- open a related Session;
- open a related Bot;
- acknowledge an alert where appropriate;
- filter or sort;
- enter explicit Customize mode to select, move, resize, or configure widgets.

Avoid heavy inline record editing in ordinary Dash view.

Widget truthfulness is mandatory:

- UNKNOWN remains UNKNOWN;
- stale data is visibly stale;
- failed refresh is visible;
- last refresh is inspectable where material;
- Bot-produced status is attributable;
- alerts are not invented for visual effect;
- consequential values must have a drill-down to source/detail/evidence when available.

---

# 5. Approved Signalproof Branding

The owner supplied the Signalproof circular red logo during visual review.

Observed logo identity:

```text
SHA256 4B660A3C4F9F75BEF0F6552747A61FD8178ACD0AA6C0B4F441FB9EB69CC88EDD
```

This exactly matches the Signalproof logo master identity already recorded in accepted Build Ledger design evidence.

Implication:

- the Builder does not need to invent a temporary Signalproof logo;
- future implementation should use controlled approved brand artwork in stable product asset slots;
- the public Skills repository remains design/governance authority, not the canonical production artwork store.

Do not publish private/canonical artwork into public Git merely for convenience.

---

# 6. Candidate Design and Builder Artifacts

Current candidate lineage on `candidate/workbench-bots-rd1`:

### Original work-chat handoff

`handoffs/SP-WORKBENCH-WORK-CHAT-HANDOFF-RD1.md`

Commit:

`12fbf6066e3ff5459493be3249b7da17ff48f665`

### Architecture

`designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-ARCHITECTURE.md`

Commit:

`ae800d333755a4e25037a0a91dc5c9f515decc9c`

### UX / state / acceptance

`designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-UX-AND-ACCEPTANCE.md`

Commit:

`ec43d83d4cf12f468a81b6e34cdc058f99899290`

### R2 visual direction

`designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-VISUAL-DIRECTION-R2.md`

Commit:

`041198d8076399303198ef1aac403f3aa417cb10`

### R2 Builder handoff

`handoffs/SP-WORKBENCH-BUILDER-HANDOFF-RD1-R2.md`

Commit:

`06defad85ed3a62e1b9dbf4db58bf427b3665945`

### Dash addendum

`designs/SP-WORKBENCH-DASH-RD1-ADDENDUM.md`

Commit:

`3f0a45e13bf5a6b967fd13a5217c8bd28db15abb`

### R3 Dash Builder handoff

`handoffs/SP-WORKBENCH-BUILDER-HANDOFF-RD1-R3-DASH.md`

Commit:

`0e6aeab248441c2633bfe719cf5b9412cc2b928d`

At the last pre-handoff comparison, the candidate branch was **7 commits ahead and 2 commits behind** protected main, with merge base `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`.

The two newer protected-main commits were current Signalproof command/skill changes and did not overlap the seven Workbench candidate files in the comparison.

Recheck this in the receiving chat before any new write.

---

# 7. Full Debug / Builder Review Truth

The design/debug work used logical lanes. No independent agents were claimed.

## Builder lane

Result:

`PASS / BUILDABLE`

Findings:

- R2 three-column desktop shell is implementable;
- Sessions/Bots split is implementable;
- Dash can be added as a third mode without breaking the R2 shell;
- Dash View mode and Customize mode are both implementable;
- real multi-Bot collaboration requires the future Agent Runtime/Broker;
- the UI must not fake background activity when no actual runtime owns the task.

## Design lane

Result:

`PASS`

Findings:

- the accepted product grammar is a modern desktop LLM client, not a dashboard portal;
- Sessions and Bots remain separate first-class concepts;
- Dash is a separate operational overview mode;
- Greenlight is dashboard-only visual inspiration;
- conversation remains dominant in Sessions/Bots modes;
- Dash may use denser modular widgets because its purpose is overview.

## Governor lane

Result:

`PASS WITH IMPLEMENTATION GATES`

Required invariants:

- Governor remains Policy Decision Point;
- Core Runtime remains Policy Enforcement Point;
- Agent Runtime does not bypass Core;
- Bots are not authority;
- delegation is bounded and attributable;
- schedules reauthorize at execution time;
- external write and authenticated browser actions remain separate consequential capabilities;
- local-only model policy cannot silently fall back to cloud;
- operational runtime evidence stays separate from canonical Build Ledger chronology;
- Dash values and alerts remain evidence-backed and freshness-aware.

---

# 8. Build Ledger / Continuity Boundary

Task-relevant private continuity exists on the private Build Ledger candidate branch.

Current continuity disposition remains:

`STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION`

Do not:

- invent or reserve a C-number;
- hand-edit canonical ledger chronology;
- treat this candidate handoff as canonical chronology;
- put ordinary Session/Bot/Dash runtime telemetry directly into canonical Build Ledger history.

The Workbench architecture requires a separate Operational Event / Evidence Journal for runtime events.

Private Build Ledger continuity should be retrieved selectively in the receiving chat if needed for protected production/source-authority evidence.

---

# 9. PowerShell Guard State

Current prevention data checked at handoff:

`library/POWERSHELL-FAILURE-REGISTRY.yaml`

Version:

`0.1`

Status:

`ACTIVE_PREVENTION_DATA`

No PowerShell runner was generated or executed during the visual design, Dash design, or Builder feasibility review in this chat.

If W0 or any later implementation gate uses PowerShell, the receiving chat must refetch the current registry and apply it before generation or execution.

Important continuing prevention includes:

- parse the exact final staged `.ps1`;
- do not repeat a wrapper form rejected by the observed console environment;
- preserve same-failure attempt continuity across chats;
- distinguish parser/harness failure from product failure;
- preserve failed runners;
- bind hashes only after final serialization when identity matters.

Candidate lesson `KE-PS-SCHEDULED-TASK-VISIBILITY-001` remains Candidate only unless separately promoted.

---

# 10. Protected State

Do not mutate during W0:

- accepted production Signalproof Governor;
- installed accepted Workbench baseline;
- protected Signalproof Core Runtime;
- accepted production cryptographic identity/state;
- accepted production task/ACL state;
- accepted production activation metadata;
- accepted Build 8A D4 evidence;
- protected `Signalproof-Skills/main`.

W0 is read-only.

---

# 11. Exact Next Gate - W0 Source and Interface Authority

This is the first real next action.

## Objective

Prove the authoritative current Workbench source and the exact interfaces that a future isolated candidate may safely build against.

## W0 must identify, read-only

1. authoritative current Workbench source tree/project;
2. authoritative project/solution and framework/toolchain identity;
3. relationship between source, accepted deployed binary, and launcher;
4. current Workbench-to-Governor client contract;
5. current Governor request/response boundary;
6. Core Runtime enforcement boundary relevant to future execution tickets;
7. controlled approved branding source location;
8. protected rollback baseline;
9. isolated candidate build/output location that cannot overwrite production;
10. any source-control or provenance ambiguity that blocks implementation.

## W0 acceptance

Return `W0 PASS` only if the Builder can name the authoritative source and interfaces with evidence strong enough to begin an isolated candidate without guessing.

## W0 STOP conditions

STOP if:

- source authority remains ambiguous;
- only installed binaries or recovery copies are available;
- a candidate would overwrite or mutate production;
- the proposed architecture bypasses Governor/Core;
- required private source/provenance evidence is unavailable;
- Git drift materially invalidates the transferred contract;
- a consequential next action would require authority not granted by W0.

---

# 12. Result Branches After W0

## If W0 PASS

Freeze W1 contract before implementation.

Expected future sequence remains conceptually:

```text
W0 Source/interface authority
W1 Contract freeze
W2 R3 shell implementation: Sessions / Bots / Dash
W3 Signalproof Bot/Session/Dash state persistence
W4 Agent Runtime skeleton
W5 Hermes adapter
W6 governed conversational round trip
W7 governed tools/web
W8 delegation + memory
W9 automation/environment/recovery/security acceptance
```

This is a gate sequence, not blanket implementation authority.

## If W0 remains unresolved

Do not build against guesses.

Route to the smallest read-only provenance/source investigation needed to resolve authority.

## If W0 reveals a conflicting accepted source/runtime contract

Stop and redesign the affected candidate contract before mutation.

---

# 13. Authority at Handoff

Already accepted/authorized:

- owner visual acceptance of R2 direction for Builder consumption;
- owner acceptance of Dash direction for Builder consumption;
- candidate design/documentation writes already recorded;
- W0 read-only source/interface investigation.

Not authorized by this handoff:

- production mutation;
- release/deployment;
- protected-main mutation or bypass;
- canonical Build Ledger append;
- Candidate promotion to Active;
- privilege escalation;
- new secrets/credentials/access;
- security-control weakening;
- unrelated repositories/workstreams;
- implementation based on unresolved source authority.

Owner decision required later for any excluded consequential boundary.

---

# 14. Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Workbench Bots/Sessions RD1
Git basis: protected main adb25389730ebbd8827bc77e052a0f05393ec79e plus candidate/workbench-bots-rd1 through R3 Builder handoff
Current state: R2 visual direction and R3 Dash direction accepted for Builder consumption; prior Build 8A D4 remains CLOSED / PRODUCTION ACTIVE
Objective: prove authoritative current Workbench source and integration surfaces before implementation
Route: log-build-git -> build-git -> Investigate / Verify -> Builder W0
Action class: READ / INVESTIGATE / VERIFY
Protected state: accepted production Workbench/Governor/Core and related production activation evidence/state
Allowed surface: read-only source/provenance/interface inspection plus candidate continuity documentation
Known-failure constraints: do not infer source authority from deployment or recovery copies; reload PowerShell prevention data before any PS generation/execution; do not repeat known-bad PowerShell conditions
Dependencies/authority: W0 is owner-authorized as a read-only Builder gate; implementation authority does not arise from this handoff
Acceptance evidence: authoritative source/project/toolchain identity, interface boundaries, controlled branding source, protected rollback baseline, isolated candidate location, and explicit ambiguity resolution
Recovery/non-mutation: W0 requires no production changes
STOP conditions: source authority unresolved, required provenance unavailable, candidate path risks production, Governor/Core bypass, material Git drift, or excluded authority required
Closeout trigger: W0 Source and Interface Authority PASS and an exact W1 contract is frozen
```

---

# 15. Handoff Status

```text
HANDOFF READY
R2 VISUAL DIRECTION: OWNER ACCEPTED FOR BUILDER CONSUMPTION
R3 DASH DIRECTION: OWNER ACCEPTED FOR BUILDER CONSUMPTION
BUILDER FEASIBILITY: PASS / BUILDABLE
PRODUCTION: UNCHANGED
CANONICAL LEDGER: NOT APPENDED
CANDIDATE PROMOTION: NOT PERFORMED
NEXT GATE: W0 SOURCE AND INTERFACE AUTHORITY, READ-ONLY
FIRST RECEIVING COMMAND: log-build-git
```
