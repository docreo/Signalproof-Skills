# Signalproof Workbench Bots/Sessions RD1 - Visual Direction R2

**Status:** CANDIDATE / VISUAL DESIGN ONLY / NO PRODUCTION MUTATION  
**Work stream:** Signalproof Workbench Bots/Sessions RD1  
**Owner:** Doc Reo  
**Design revision:** R2  
**Supersedes:** the primary navigation and frame direction in Sections 2 through 5 of `SP-WORKBENCH-BOTS-SESSIONS-RD1-UX-AND-ACCEPTANCE.md` where this document conflicts  
**Companion architecture:** `designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-ARCHITECTURE.md`

## 1. Owner Visual Direction

The owner supplied four visual references showing the interaction pattern desired for Signalproof Workbench.

The references are not branding sources and are not implementation authority. They establish the desired product nature:

- desktop-first horizontal workspace;
- persistent three-column composition;
- compact left rail;
- large center conversation/task canvas;
- contextual right rail;
- a two-tab mode switch at the top of the left rail: `SESSIONS` and `BOTS`;
- `SESSIONS` behaves like a conventional LLM/chat history workspace;
- `BOTS` is a dedicated space for persistent Bots, Bot creation, Bot conversation, and Bot-to-Bot collaboration;
- the center conversation remains the dominant human-facing surface;
- utilities and governed detail remain available without turning the ordinary screen into a dashboard.

Signalproof branding remains required. The visual references do not authorize copying their names, artwork, colors, or proprietary identity.

## 2. R2 Product Principle

> **Sessions are conversations. Bots are workers. The center is where the human works.**

The interface should feel like a strong desktop LLM client first, with governed multi-Bot operations built into it.

It should not feel like:

- an enterprise admin dashboard;
- a seven-destination navigation portal;
- a Governor diagnostics console;
- a card-heavy monitoring screen;
- a clone of Hermes or any reference product.

## 3. Primary Frame

R2 uses one persistent application shell.

```text
+--------------------------------------------------------------------------------------+
| Signalproof Workbench                                  [Control] [Status] [Settings] |
+--------------------------+-------------------------------------------+---------------+
| SESSIONS     BOTS        | Active conversation / task               | Context rail  |
| -----------------------  |                                           |               |
| mode-specific left rail  | user                                     | mode-specific |
|                          | assistant                                 | details       |
|                          | bot/tool/delegation activity when useful  |               |
|                          |                                           |               |
|                          |                                           |               |
|                          |                                           |               |
|                          | [composer..............................]    |               |
+--------------------------+-------------------------------------------+---------------+
```

The app does not require a separate top-level `Workbench` destination. The Workbench is the shell itself.

## 4. Left Rail Mode Switch

The left rail begins with two persistent tabs:

```text
SESSIONS    BOTS
```

Only one is active at a time.

The tab switch changes the left rail data model and contextual right rail. It does not destroy or replace the active center conversation unless the user chooses another item.

### 4.1 Sessions tab

The Sessions tab is the ordinary LLM workspace.

Recommended order:

1. `+ New Session`
2. compact search/filter
3. optional quick surfaces that belong to session work
4. pinned Sessions
5. recent Sessions grouped by recency
6. archived/history access

Session rows show only what helps selection:

- title;
- optional Bot indicator when a persistent Bot owns the Session;
- last activity;
- short status/attention indicator where necessary.

Do not overload every Session row with model, provider, token, runtime, capability, or evidence metadata.

### 4.2 Session quick surfaces

The reference pattern supports a small set of session-adjacent shortcuts above history. Signalproof may expose, when useful:

- Capabilities;
- Messaging;
- Artifacts;
- Scheduled Jobs.

These are secondary shortcuts, not permanent top-level product destinations.

They should be hidden or collapsed if they create unnecessary density.

### 4.3 Bots tab

The Bots tab contains Bots only.

Recommended order:

1. search Bots;
2. `+ Create Bot`;
3. Bot roster;
4. optional team/crew grouping where supported.

A Bot row shows:

- Signalproof-approved replaceable avatar/icon slot;
- Bot name;
- role or mission shorthand;
- state/attention cue;
- last activity.

Selecting a Bot opens or resumes that Bot's current conversation in the center canvas.

## 5. Bot Workspace Contract

The Bots area is not merely a settings page.

It is the operating space for persistent Signalproof workers.

A user should be able to:

- create a Bot;
- select a Bot;
- chat directly with that Bot;
- assign a task;
- let the Bot request help from another approved Bot;
- explicitly add another Bot to a task or crew;
- see that collaboration happen;
- inspect the handoff when needed;
- receive the synthesized result in the main conversation.

Bot-to-Bot collaboration remains governed by the architecture contract. The visual design must not imply that Bots inherit each other's credentials, full memory, tools, or authority.

## 6. Center Conversation Canvas

The center pane remains dominant in both Sessions and Bots modes.

It contains:

- ordinary user messages;
- actual assistant/Bot answers;
- compact reasoning/task-state labels only when useful;
- attachments;
- artifacts;
- concise tool activity;
- Bot handoff/delegation events;
- approval requests;
- clarification requests.

### 6.1 Visual density

Use a restrained desktop density similar to a serious LLM client:

- generous central reading width;
- minimal bubble chrome for assistant responses;
- stronger distinction for user prompts;
- subtle separators instead of many nested cards;
- compact metadata;
- no large dashboard metrics in the ordinary conversation.

### 6.2 Task activity inside conversation

Bot collaboration should be visible without overwhelming the conversation.

Example:

```text
Research Bot
I found three relevant changes. I am asking Builder Bot to test one implementation assumption.

BOT HANDOFF
Research -> Builder
Purpose: validate implementation assumption
Status: Running
[View handoff]

Research Bot
Builder confirmed the assumption and returned the test artifact. Here is the combined result...
```

The user sees enough to understand what happened. Full operational evidence remains drillable.

## 7. Contextual Right Rail

The right rail is contextual and may collapse.

It is not permanently the same `Context Inspector` used in R1.

### 7.1 In Sessions mode

The right rail may show one context at a time, such as:

- Session info;
- attachments/artifacts;
- active capability summary;
- scheduled work related to the Session;
- Control/Evidence when opened.

When no right-rail content is useful, it may collapse completely to maximize reading space.

### 7.2 In Bots mode

The right rail prioritizes the selected Bot's operating context:

- crew/team participants;
- Bot collaborators;
- current delegated tasks;
- Bot routines/automations;
- scheduled jobs;
- runtime/environment summary;
- Control/Evidence on demand.

A compact `CREW` or `COLLABORATORS` region is preferred over hiding Bot-to-Bot participation.

### 7.3 Control/Evidence

Control/Evidence remains mandatory but is utility depth, not permanent visual weight.

Open it from a top-right utility or contextual action.

It may temporarily replace the right rail content with:

- Governor decision;
- Core enforcement result;
- Agent Runtime identity;
- Hermes or other adapter identity;
- provider/model route;
- tools/capabilities;
- approvals;
- delegation evidence;
- operational journal links.

## 8. Top Bar

Use a thin desktop title/utility bar.

Left:

- Signalproof product mark slot;
- `Signalproof Workbench`.

Center should remain visually quiet.

Right utilities may include:

- Governor/Runtime status indicator;
- Control/Evidence;
- notifications/attention;
- Settings;
- native window controls where the platform owns them.

Avoid filling the top bar with multiple large status pills.

## 9. Composer

The composer is persistent at the bottom of the center pane.

Base actions:

- message input;
- attach/context;
- `@Bot` or Add Bot;
- tools/capabilities shortcut where appropriate;
- web/research shortcut where appropriate;
- send/stop.

The composer should look and behave like an LLM message composer rather than an enterprise form.

## 10. Signalproof Brand Direction

The product uses Signalproof identity rather than the reference-product palette.

### 10.1 Default visual language

- black / near-black application background;
- charcoal panel layers;
- Signalproof red as the primary accent;
- white / near-white primary text;
- restrained gray secondary text;
- red for active navigation and branded emphasis;
- semantic status colors only where state requires them;
- Bot avatars may use controlled secondary identity colors, but state and identity must also be textual.

### 10.2 Brand asset contract

Current Build Ledger evidence confirms the Signalproof design standard requires replaceable product identity slots and preserves approved brand source identity outside the public Skills repository.

Known brand-source records include:

- `SignalproofTransLogoNew(7).png`
  - SHA256 `4B660A3C4F9F75BEF0F6552747A61FD8178ACD0AA6C0B4F441FB9EB69CC88EDD`
- `SignalproofTransLogoNew500.png`
  - SHA256 `C560335C3A5930F9F4CD2AB699A8B93316BD8C02B5ACDE8A30BC8E71A4101B3A`

A later accepted Signalproof product baseline also records:

- `product-logo.png`
  - SHA256 `54135BF7F7A8D4E9261FE385E2EB1009F5BE95B215D226B5CC254A4FA77541D2`
- `product-icon.ico`
  - SHA256 `23B597B59BC272851D1F4463004C66EBED9E64DCECF922F666CBA873F3FC172D`

This proves an accepted Signalproof product icon artifact exists in Build Ledger evidence. It does **not** prove that a complete Workbench-specific favicon/icon-size set is currently recovered or authoritative.

### 10.3 Future build asset rule

Implementation must:

1. locate the controlled approved Signalproof brand-assets source;
2. verify asset identity against accepted evidence;
3. populate stable Workbench slots such as:
   - `Assets/Brand/product-logo.png`
   - `Assets/Brand/product-icon.png`
   - `Assets/Brand/product-icon.ico`
4. derive additional platform icon sizes only from the approved master when needed;
5. never invent a replacement Signalproof mark because an asset path is temporarily unknown.

## 11. What R2 Removes from R1

R2 intentionally removes the following from ordinary navigation:

- `Workbench` as a left-nav item;
- the seven-item permanent vertical navigation stack;
- a permanent Bot roster below unrelated primary navigation;
- a permanently open technical Context Inspector;
- dashboard-like status-pill density across the top bar.

The underlying capabilities are not removed. They are relocated into Session shortcuts, Bot-specific surfaces, contextual right rail, utilities, and Settings.

## 12. What R2 Preserves from R1

R2 preserves:

- Sessions as first-class durable conversation state;
- Bots as first-class persistent workers;
- actual assistant answers in the center conversation;
- inspectable Bot delegation;
- governed web/tools/memory/environment capability boundaries;
- explicit approvals;
- Operational Journal separation from Build Ledger;
- Simple vs Advanced depth;
- evidence-backed status;
- no silent cloud fallback when policy forbids it;
- Governor -> Core Runtime -> Agent Runtime enforcement chain.

## 13. Resize and Density Contract

Desktop target first.

At wide width:

```text
left rail 220-280 px
center flexes and remains dominant
right rail 240-340 px when open
```

At narrower desktop width:

- right rail collapses first;
- left rail may reduce width;
- center remains usable;
- Sessions/Bots tabs remain visible;
- composer remains reachable.

At compact/mobile width, a later product decision may convert side rails to drawers. RD1 visual approval does not require a mobile-first redesign.

## 14. R2 Visual Acceptance Checklist

Owner visual review should answer:

1. Does the app immediately read as a modern desktop LLM client?
2. Are `SESSIONS` and `BOTS` the obvious top-level operating modes?
3. Does Sessions feel like normal ChatGPT-style history/work rather than an admin screen?
4. Does Bots feel like a dedicated worker space rather than a Bot settings catalog?
5. Is the center conversation clearly dominant?
6. Can multiple Bots collaborate without hiding who did what?
7. Is the right rail useful but non-dominant?
8. Is Signalproof black/red identity obvious without overwhelming readability?
9. Are technical governance details available without becoming the main UI?
10. Does the interface avoid copying the reference products' branding?

## 15. Design-Only Full Debug R2

### Builder logical lane

**Finding:** The prior visual candidate was structurally buildable but would have produced the wrong product feel. Its seven-item left navigation and permanent inspector increased information architecture weight before the core LLM workflow was visually proven.

**Correction:** Replace the R1 primary frame with the R2 Sessions/Bots mode switch and three-column LLM-client shell before implementation begins.

### Design logical lane

**Finding:** The four supplied references share a strong common interaction grammar: left mode/list rail, dominant center conversation, contextual right rail, compact desktop chrome, persistent bottom composer. The strongest repeated signal is the `SESSIONS` / `BOTS` switch.

**Correction:** Treat `SESSIONS` and `BOTS` as the principal operating modes. Relocate secondary capabilities into contextual and utility surfaces.

### Governor logical lane

**Finding:** Simplifying the frame is acceptable only if governance remains inspectable and Bot collaboration is not hidden.

**Required constraints:**

- Control/Evidence remains reachable from the ordinary shell;
- Bot handoffs remain attributable;
- approvals remain explicit;
- a Bot never visually implies authority it does not have;
- status remains evidence-backed;
- right-rail collapse does not delete evidence or state;
- hidden technical depth cannot become hidden consequential action.

**Decision:** R2 DESIGN PASS FOR VISUAL OWNER REVIEW. No runtime, build, release, or production acceptance is implied.

## 16. Full Debug Result

```text
FULL DEBUG RESULT
Workstream: Signalproof Workbench Bots/Sessions RD1 Visual Direction R2
Git main checked: adb25389730ebbd8827bc77e052a0f05393ec79e
Candidate merge base: 80a21ccb324d96d4970ce9f61a279cb85ffcd16d
Candidate pre-R2 head: ec43d83d4cf12f468a81b6e34cdc058f99899290
Git drift: candidate is 3 ahead / 2 behind main
Drift classification: command/skill additions on main; no overlap with the three existing Workbench candidate files
Current design command: design-git 0.2.0
Current design skill: signalproof-design 0.2.0
UI polish skill: signalproof-ui-polish 0.1.0
Accessibility skill: signalproof-accessibility 0.1.0
Failure class: VISUAL / INFORMATION-ARCHITECTURE MISMATCH IN PRIOR MOCKUP
Correction: R2 Sessions/Bots horizontal-mode architecture
Spawn truth: logical Builder / Design / Governor lanes; no independent agents claimed
Protected production state: unchanged
Runtime validation: NOT CLAIMED
Owner visual acceptance: PENDING
Final status: VISUAL CANDIDATE R2 READY FOR OWNER REVIEW
```

## 17. Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Workbench Bots/Sessions RD1
Git basis: current main adb25389730ebbd8827bc77e052a0f05393ec79e + candidate/workbench-bots-rd1
Current state: production Build 8A D4 remains protected; visual design stream open
Objective: obtain owner visual acceptance of R2 Sessions/Bots desktop shell
Route: design-git -> signalproof-design -> signalproof-ui-polish -> signalproof-accessibility -> Full Debug logical challenge
Action class: DESIGN / DOCUMENT / VERIFY
Protected state: installed Workbench, Governor, Core Runtime, production activation metadata, accepted Build 8A D4 evidence, protected main
Allowed surface: candidate design/mockup artifacts only
Known-failure constraints: do not repeat R1 seven-item dashboard-style primary navigation; no PowerShell execution is required
Dependencies/authority: owner visual acceptance before build planning or implementation
Acceptance evidence: owner observation of exact R2 visual candidate plus this design contract
Recovery/non-mutation: revise or discard candidate design artifacts; production remains unchanged
STOP conditions: visual direction hides governance, hides meaningful Bot collaboration, copies reference-product branding, invents unavailable brand assets, or implementation is attempted without separate authority
Closeout trigger: owner visually approves R2 direction and separately authorizes next build-planning/implementation phase
```
