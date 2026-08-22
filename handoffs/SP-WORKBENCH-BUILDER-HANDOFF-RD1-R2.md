# Signalproof Workbench RD1 R2 - Builder Handoff

**Status:** OWNER VISUAL DIRECTION ACCEPTED / BUILDER HANDOFF OPEN / NO PRODUCTION MUTATION  
**Work stream:** Signalproof Workbench Bots/Sessions RD1  
**Owner:** Doc Reo  
**Visual direction:** R2  
**Design branch:** `candidate/workbench-bots-rd1`  
**Current public main checked:** `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**R2 visual-direction commit:** `041198d8076399303198ef1aac403f3aa417cb10`

## 1. Owner Acceptance Signal

Owner reviewed the interactive R2 visual candidate and stated:

> `ok I like it let's see if it works for the builder.`

Interpretation for this handoff:

- visual direction: ACCEPTED FOR BUILDER CONSUMPTION;
- production/runtime behavior: NOT YET ACCEPTED;
- implementation: may proceed only through the bounded Builder/source-authority gates below;
- production deployment/release: NOT AUTHORIZED;
- canonical Build Ledger append: NOT AUTHORIZED.

## 2. Builder Must Consume These Contracts

1. `designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-ARCHITECTURE.md`
2. `designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-UX-AND-ACCEPTANCE.md`
3. `designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-VISUAL-DIRECTION-R2.md`
4. `handoffs/SP-WORKBENCH-WORK-CHAT-HANDOFF-RD1.md`

Where the older UX document conflicts with R2 visual direction, R2 controls the frame and navigation model. The companion architecture continues to control runtime/governance boundaries.

## 3. Non-Negotiable Visual Contract

Builder target:

- desktop-first full application window;
- three-column shell: left rail / dominant center conversation / contextual right rail;
- `SESSIONS` and `BOTS` are the two primary modes at the top of the left rail;
- Sessions behaves like a conventional LLM session/history workspace;
- Bots is a dedicated persistent-worker operating space;
- Bots may collaborate visibly to complete tasks;
- center conversation remains the primary human surface;
- right rail is contextual and collapsible;
- Control/Evidence is available on demand without becoming ordinary assistant prose;
- bottom composer remains persistent;
- Signalproof black/charcoal/red identity;
- restrained visual chrome, not a dashboard-card layout;
- full technical detail remains inspectable.

## 4. Non-Negotiable Runtime Contract

Builder must preserve:

```text
Human
  -> Signalproof Workbench UI
  -> Signalproof Governor            Policy Decision Point
  -> Signalproof Core Runtime        Policy Enforcement Point
  -> Signalproof Agent Runtime       Execution Plane
  -> Adapter(s), including Hermes
  -> approved models / tools / web / environments
```

The new UI must not bypass Governor or Core Runtime.

A Bot is not authority.

Session state, Bot identity, operational evidence, schedules, and Signalproof product history remain Signalproof-owned canonical product state. Hermes is an adapter, not product-state authority.

## 5. Brand Asset Proof

The owner supplied the Signalproof logo file during visual review.

Observed file:

`SignalproofTransLogoNew(1).png`

Observed properties:

- PNG;
- 2048 x 2048;
- RGBA;
- SHA256 `4B660A3C4F9F75BEF0F6552747A61FD8178ACD0AA6C0B4F441FB9EB69CC88EDD`.

This SHA256 exactly matches the Build Ledger design-standard record for:

`SignalproofTransLogoNew(7).png`

Therefore the supplied visual-review asset is cryptographically identical to that accepted recorded Signalproof logo master.

Builder may use the controlled approved asset with this identity for Workbench branding. Do not publish the canonical artwork into the public Skills repository merely for convenience.

Stable product asset slots remain:

- `Assets/Brand/product-logo.png`
- `Assets/Brand/product-icon.png`
- `Assets/Brand/product-icon.ico`

Additional icon sizes may be derived from the approved master in the implementation source when required by the target desktop framework.

## 6. Builder Feasibility Review

### UI

**PASS / BUILDABLE.**

The R2 visual structure can be implemented with ordinary desktop layout primitives:

- fixed/min-max left rail;
- flexible center column;
- collapsible fixed/min-max right rail;
- top utility bar;
- bottom composer;
- mode-bound left-rail data templates;
- session/Bot selection state;
- contextual right-rail view switching.

No visual requirement depends on unsupported geometry or speculative rendering.

### Product state

**PASS WITH CONTRACT FREEZE.**

Required first-class state already exists in design:

- Bot;
- Session;
- Message;
- Task;
- Run;
- Delegation;
- operational evidence events.

Builder should not collapse these objects for implementation convenience.

### Multi-Bot interaction

**PASS WITH BACKEND DEPENDENCY.**

The UI is implementable now as a state/rendering contract. Real Bot-to-Bot task completion requires the Agent Runtime/Broker and governed delegation path. The UI must not fake background work when no actual runtime owns it.

### Governance

**PASS WITH HARD BOUNDARY.**

Control/Evidence may be visually collapsed, but enforcement and attributable evidence cannot be bypassed or omitted.

### Branding

**PASS.**

The owner-supplied logo cryptographically matches an accepted Build Ledger master identity.

## 7. First Builder Gate - W0 Source and Interface Authority

Before touching implementation, Builder must establish exact source authority for the currently accepted Workbench and its integration boundaries.

### W0 Objective

Identify, read-only:

1. authoritative current Workbench source tree/project;
2. framework/runtime version;
3. exact project/solution files;
4. existing production launcher and installed binary relationship;
5. current Workbench-to-Governor client contract;
6. exact Governor request/response integration surface;
7. exact Core Runtime enforcement boundary relevant to future execution tickets;
8. current branding asset source location;
9. rollback/protected production baseline;
10. candidate build/output location that cannot overwrite production.

### Current known production launcher from accepted continuity

The exact production launcher path is local/private operational state and is intentionally omitted from this public handoff. The known launcher identity is `Start-Workbench.ps1`.

Known installed Workbench binary name:

`Signalproof-LLM-Workbench-V1-RD3.exe`

These are production/deployment evidence, not source-authority proof.

### W0 STOP

STOP implementation if the actual current Workbench source authority cannot be established.

Do not use recovery snapshots, installed binaries, historical copies, or similarly named folders as source authority merely because they exist.

## 8. Builder Candidate Strategy After W0

Once source authority is proven, create an isolated candidate rather than modifying the installed baseline.

Preferred sequence:

```text
W0 Source/interface authority
W1 Contract freeze
W2 R2 shell implementation
W3 Signalproof Bot/Session state persistence
W4 Agent Runtime skeleton
W5 Hermes adapter
W6 governed conversational round trip
W7 governed tools/web
W8 delegation + memory
W9 automation/environment/recovery/security acceptance
```

The visual shell may be built before the full Agent Runtime is complete, but runtime-dependent UI states must remain truthful and visibly development/candidate state where necessary.

## 9. Builder Acceptance for R2 Shell

A Builder-produced shell candidate is ready for the next owner UI test only when machine-verifiable checks establish:

- builds cleanly under the authoritative project/toolchain;
- does not overwrite or mutate protected production;
- opens as a normal desktop application window;
- Sessions/Bots mode switch works;
- Sessions list and Bot roster are distinct data surfaces;
- selected Session/Bot controls the center conversation identity correctly;
- right rail can change/collapse without losing state;
- Control/Evidence is reachable;
- composer remains usable;
- approved Signalproof logo/icon identity is used;
- no obvious clipping/overlap at supported desktop sizes;
- keyboard focus remains reachable for principal controls;
- no fabricated runtime health or Bot activity;
- existing Governor/Core contracts remain untouched unless a separately authorized later gate changes them.

Then return:

```text
AUTOMATED PASS / USER UI TEST READY
```

with the exact candidate launch path and minimum human visual test.

## 10. Builder Logical Lane Result

```text
BUILDER REVIEW
Visual direction: PASS / BUILDABLE
Owner visual direction: ACCEPTED FOR BUILDER CONSUMPTION
Brand asset: VERIFIED EXACT MATCH TO ACCEPTED BUILD LEDGER MASTER HASH
Architecture dependency: ACCEPTED, Governor -> Core -> Agent Runtime preserved
Primary implementation blocker: CURRENT WORKBENCH SOURCE AUTHORITY NOT YET PROVEN IN THIS CHAT
Required next action: W0 SOURCE AND INTERFACE AUTHORITY, READ-ONLY
Production mutation: NONE
Production/release authority: NOT GRANTED
Canonical ledger authority: NOT GRANTED
```

## 11. Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Workbench Bots/Sessions RD1
Git basis: Signalproof-Skills main adb25389730ebbd8827bc77e052a0f05393ec79e + candidate/workbench-bots-rd1
Current state: R2 visual direction owner-accepted for Builder consumption; production Build 8A D4 protected
Objective: prove current Workbench source and interface authority before implementation
Route: build-git -> Investigate / Verify -> Builder W0
Action class: READ / INVESTIGATE / VERIFY
Protected state: installed Workbench, Governor, Core Runtime, keys, ACL/task configuration, production activation metadata, accepted Build 8A D4 evidence, protected main
Allowed surface: read-only source/provenance inspection and candidate documentation
Known-failure constraints: do not infer source authority from deployed binaries or recovery copies; reload PowerShell failure registry before any later PS generation/execution
Dependencies/authority: owner has authorized Builder consumption of the accepted visual direction; W0 remains non-mutating
Acceptance evidence: exact authoritative source location, project/toolchain identity, integration surfaces, brand source, protected baseline and isolated candidate path
Recovery/non-mutation: no changes required for W0
STOP conditions: source authority remains ambiguous; current Git/evidence changes materially; candidate path would overwrite production; architecture would bypass Governor/Core; branding source cannot be verified
Closeout trigger: W0 source/interface authority PASS and exact W1 contract can be frozen
```
