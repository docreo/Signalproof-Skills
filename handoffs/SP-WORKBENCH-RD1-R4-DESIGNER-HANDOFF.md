# Signalproof Workbench RD1 R4 - Designer Handoff

**Status:** DESIGNER HANDOFF READY / NO PRODUCTION MUTATION  
**Work stream:** Signalproof Workbench Bots/Sessions/Dash  
**Owner:** Doc Reo  
**Design authority matrix:** `designs/SP-WORKBENCH-DESKTOP-EXPERIENCE-MATRIX-RD1-R4.md`  
**Design branch:** `candidate/workbench-bots-rd1`  
**Implementation stream to reconcile:** `candidate/workbench-rd2-gui-build`  
**Protected Signalproof-Skills main checked:** `a1bf4633d1adc1a1229fc338daa45c57014d37c0`  
**R4 matrix commit:** `4790ae072fb13ac3474eadf050a861c42c33358a`

---

# RECEIVING DESIGNER - START HERE

Before changing any design or implementation artifact:

1. refetch current `docreo/Signalproof-Skills/main`;
2. refetch `candidate/workbench-bots-rd1` and `candidate/workbench-rd2-gui-build`;
3. read current Active `design-git`, `signalproof-design`, `signalproof-ui-polish`, `signalproof-accessibility`, `handoff-log`, and applicable Governor/Core/security contracts;
4. read the R4 matrix named above in full;
5. read the current RD2 R6 Builder handoff before proposing a greenfield shell;
6. preserve the accepted production Workbench/Governor/Core baseline and current working Granite path;
7. treat this packet as a provenance-bound design transfer, not complete current runtime truth.

Do not redesign by memory. Reconcile current Git and current evidence first.

---

# 1. Mission

Produce the next complete Signalproof Workbench visual/interaction design specification using the R4 matrix as the product contract.

The target is not “make Workbench look like Hermes.”

The target is:

> Preserve the Signalproof Workbench identity, Dash, governance architecture, working conversational path, and accepted shell logic while adopting/adapting the best current desktop-agent interaction patterns into one coherent daily-use AI operations workspace.

The designer must deliver a design the Builder can implement incrementally without destroying known-working Workbench behavior.

---

# 2. Locked Owner Decisions

## 2.1 Dash is first

The default/top-level operating order is:

```text
DASH -> SESSIONS -> BOTS -> COMMAND CENTER -> MEMORY -> SETTINGS
```

Dash is the default landing surface.

Any older design saying `SESSIONS | BOTS` or `SESSIONS | BOTS | DASH` is superseded only on **ordering and expanded top-level navigation**. The accepted shell, Sessions behavior, Bots behavior, and Dash contracts remain useful unless this packet explicitly changes them.

## 2.2 Hermes feature family is desired

The designer should incorporate, where the R4 matrix marks them ADOPT/ADAPT/INTEGRATE:

- modern chat home/session experience;
- streaming output/tool activity;
- contextual right-side preview rail;
- file browser and preview;
- terminal;
- Git review;
- Artifacts;
- Bots roster;
- Bot routines;
- group chats;
- visible Bot-to-Bot messaging/delegation;
- Command Center;
- Memory Graph;
- context/HUD/status visibility;
- Quick Entry;
- settings/provider/model/tool/MCP management;
- multiple local/remote execution gateways;
- command palette and keyboard workflow.

These are interaction references, not authority to copy Hermes branding, product-state ownership, or security semantics.

## 2.3 Signalproof governance remains dominant

The designer must preserve:

```text
Human
-> Workbench UI
-> Signalproof Governor
-> Signalproof Core Runtime
-> Signalproof Agent Runtime / Broker
-> governed adapters / models / tools / environments
```

No Bot, model, provider, gateway, terminal, Git control, schedule, or external connector is its own authority plane.

---

# 3. Existing Workbench State - Do Not Treat as Greenfield

Current RD2 implementation continuity includes evidence of:

- a running Workbench application;
- a `SESSIONS | BOTS | DASH` shell;
- Signalproof branding;
- a visible Granite conversation path;
- long transcript rendering;
- a right contextual rail;
- a persistent composer;
- prior working Session/Bot deletion behavior;
- active R6 UX/runtime planning.

Therefore the design must specify a migration path from the current shell to R4.

Do not propose replacing the whole application simply because Hermes has a newer desktop shell.

---

# 4. Protected State

Do not alter or design around bypassing:

- installed production Workbench baseline;
- production Signalproof Governor;
- Core Runtime enforcement boundary;
- Local Service runtime identity where applicable;
- keys/ACL/task configuration;
- `PRODUCTION_ACTIVE` activation metadata;
- accepted Build 8A D4 evidence;
- protected main;
- already-working local Granite path.

Production/release authority is not granted by this handoff.

Canonical Build Ledger authority is not granted by this handoff.

---

# 5. Designer Deliverables

The designer should produce one coherent R4 design package containing at minimum:

## 5.1 Application shell map

Show the full desktop shell with:

```text
DASH | SESSIONS | BOTS | COMMAND CENTER | MEMORY | SETTINGS
```

plus:

- left mode/list rail;
- dominant center workspace;
- collapsible contextual right workpane;
- bottom HUD/status area where used;
- persistent composer in conversational modes;
- command palette entry point;
- Quick Entry/HUD behavior as separate desktop conveniences.

## 5.2 Dash design

Dash must answer:

```text
What is running?
What needs attention?
What changed?
What is blocked?
What is healthy/degraded/unknown?
What should I open next?
```

Design operational hierarchy, not an indiscriminate card mosaic.

Show source/freshness semantics for every live value.

## 5.3 Sessions design

Define:

- new/resume/search/archive/rename/delete;
- transcript layout;
- model/context controls;
- streaming/tool activity;
- attachments;
- queueing;
- long-session navigation/search;
- stop/steer/retry;
- tab behavior;
- right workpane interaction;
- evidence/control drill-down.

Preserve current transcript/composer improvements rather than reopening them by default.

## 5.4 Bots design

Define:

- roster;
- create/edit/duplicate/hide;
- role/mission;
- Bot Chat plus additional Sessions;
- routines;
- advanced capability/policy configuration;
- @mentions;
- group chats;
- visible Bot-to-Bot delegation;
- execution environment identity;
- current task/run state;
- attention/unread behavior.

## 5.5 Command Center design

Define first-class views for:

- active Tasks;
- Runs;
- Delegations;
- approvals/clarifications;
- queue;
- blockers/failures;
- retry/recovery state;
- scheduled work;
- worker/gateway status.

A decorative spinner is not sufficient evidence of work.

## 5.6 Memory design

Define:

- graph and list modes;
- scopes: Session/Bot/Project/Canonical candidate;
- provenance;
- lifecycle/state filters;
- timeline/playback where useful;
- edit/delete/correct flows;
- Skill relationships;
- explicit distinction between Candidate and Active state.

## 5.7 Settings design

Include:

- Providers/accounts/keys;
- Models;
- Gateways;
- Workspace;
- Safety/approvals;
- Memory & Context;
- Voice;
- Chat;
- Tools & Keys;
- MCP;
- Skills;
- Appearance;
- Keyboard Shortcuts;
- Advanced/Desktop settings.

Show exact target scope when editing Bot/profile-specific settings.

## 5.8 Right workpane design

Define a contextual workpane with surfaces such as:

```text
CONTEXT | FILES | PREVIEW | TERMINAL | GIT | ARTIFACTS | EVIDENCE
```

It must collapse before the center becomes unusable.

## 5.9 Git design

Show:

- current branch/ahead-behind;
- changed files;
- diff scopes: Uncommitted / Branch / Last Run or Turn;
- exact attribution state when known/unknown;
- stage/unstage/revert;
- commit/push;
- PR;
- worktrees;
- governed-action affordances.

## 5.10 Terminal / execution design

Show:

- current environment identity;
- cwd/workspace;
- owning Session/Bot;
- running process state;
- multiple terminals;
- persistent hidden terminals;
- stop/kill;
- add output to chat;
- evidence link;
- approval/authority cues for consequential execution.

Do not make displayed code appear to have executed when it has not.

## 5.11 HUD / Quick Entry

Design optional desktop convenience flows for:

- global prompt/task entry;
- target Bot/Session selection;
- always-on-top compact HUD;
- current Governor/Runtime/Gateway/Model/Task state;
- explicit screen-context/privacy controls if desktop-context capture is ever shown.

## 5.12 Responsive and accessibility behavior

Specify:

- wide desktop;
- narrower desktop;
- rail collapse order;
- minimum usable center width;
- keyboard navigation;
- focus movement;
- readable scaling/zoom;
- status text independent of color;
- reduced motion behavior.

---

# 6. Required Source-of-Truth Annotations

Every material status component in the design must identify its intended source.

Examples:

```text
Governor status -> Governor decision/health source
Core enforcement -> Core Runtime record
Bot state -> Bot Registry + Agent Runtime
Run state -> Run service
Gateway health -> Gateway Registry live/test observation
Model/provider -> Run provenance / Model Registry
Git Last Run -> Run-to-Git attribution evidence
Memory -> Memory Service + provenance
Skill lifecycle -> Signalproof Skill Registry
Dash business metric -> normalized adapter snapshot + timestamp
Build milestone -> canonical Build Ledger reference only when verified
```

If a design element has no trustworthy source, render `UNKNOWN`, development placeholder, or omit it.

---

# 7. Explicit Hermes Dispositions the Designer Must Respect

## Adopt/adapt

Use the R4 matrix for full detail. High-level desired patterns include:

- right preview/work rail;
- files/artifacts;
- terminals;
- Git review/worktrees;
- Memory Graph;
- Quick Entry;
- HUD;
- provider/model/tool/MCP UI;
- Bots/routines/group chats;
- Command Center;
- command palette;
- multi-gateway registry.

## Reject direct parity

Do not reproduce Hermes YOLO as a Signalproof bypass.

If a future Signalproof experience reduces repeated confirmations, it must be modeled as a bounded authorized session/workstream envelope enforced by Governor/Core, with explicit scope, expiry, capabilities, resources, and evidence.

## Optional only

Hermes Cloud is never a mandatory Workbench dependency.

---

# 8. Designer Acceptance Gate

The designer package is ready for Builder handoff only if all are true:

1. Dash is clearly first/default.
2. Sessions feels like a mature LLM workspace.
3. Bots feels like a persistent-worker operating space.
4. Command Center is operationally distinct from normal chat.
5. Memory lifecycle/provenance is understandable.
6. Settings scopes are clear.
7. Right workpane provides Terminal/Git/Files/Preview/Artifacts/Evidence without dominating the center.
8. Dash has truthful current/stale/unknown/error semantics.
9. Every consequential action still visually belongs under Signalproof governance.
10. Inter-Bot work is inspectable.
11. No Hermes branding or state ownership is copied.
12. Current RD2 implementation has a bounded migration path.
13. Existing working Granite conversation behavior is preserved.
14. Accessibility/keyboard/resize behavior is specified.
15. Concept, visual, runtime, data, accessibility, and owner acceptance are not conflated.

---

# 9. Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Workbench RD1 R4 Desktop Experience
Git basis: protected Signalproof-Skills main + candidate/workbench-bots-rd1 + reconcile candidate/workbench-rd2-gui-build
Current state: R4 feature/IA matrix created; production and working RD2 candidate remain protected
Objective: produce exact R4 designer specification and visual interaction package for Builder consumption
Route: design-git -> signalproof-design -> signalproof-ui-polish -> signalproof-accessibility -> design challenge/review
Action class: DESIGN / DOCUMENT / VERIFY
Protected state: production Workbench/Governor/Core, Granite working path, accepted RD2 shell behavior, protected main
Allowed surface: candidate design/documentation/mockup artifacts; read-only reconciliation against RD2 implementation
Known-failure constraints: do not greenfield-rewrite; do not reintroduce prior failed transcript/composer layout systems; do not fabricate live status; do not bypass Governor/Core
Dependencies/authority: owner has authorized bounded completion of this design handoff; production/release/canonical-ledger authority excluded
Acceptance evidence: complete designer package satisfying Section 8 and owner visual review of exact candidate
Recovery/non-mutation: revise candidate design artifacts only; no production mutation
STOP conditions: design requires architecture bypass; exact current RD2 state cannot be reconciled; protected baseline would be overwritten; UI would fabricate authority/status; material product choice contradicts locked owner decisions
Closeout trigger: exact R4 designer package passes design review and is ready for Builder consumption
```

---

# 10. Completion State

```text
COMPLETE / DESIGNER HANDOFF READY
R4 matrix: CREATED
Designer handoff: CREATED
Dash-first decision: LOCKED
Hermes feature family: INCLUDED THROUGH ADOPT/ADAPT/INTEGRATE MATRIX
Signalproof governance: PRESERVED
Current RD2 implementation: MUST BE RECONCILED / NOT REPLACED
Production mutation: NONE
Human visual acceptance of future R4 mockup: STILL REQUIRED
```
