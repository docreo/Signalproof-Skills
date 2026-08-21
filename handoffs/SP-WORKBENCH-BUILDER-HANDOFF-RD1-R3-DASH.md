# Signalproof Workbench RD1 R3 Dash - Builder Handoff Addendum

**Status:** OWNER DASH DIRECTION ACCEPTED / BUILDER HANDOFF ADDENDUM / NO PRODUCTION MUTATION  
**Work stream:** Signalproof Workbench Bots/Sessions RD1  
**Owner:** Doc Reo  
**Design branch:** `candidate/workbench-bots-rd1`  
**Base visual direction:** R2  
**Dash addendum commit:** `3f0a45e13bf5a6b967fd13a5217c8bd28db15abb`

## 1. Owner Acceptance Signal

Owner reviewed the Dash concept and stated:

> `ok I like it let's see if this also works for the builder.`

Interpretation:

- Dash design direction: ACCEPTED FOR BUILDER CONSUMPTION;
- production/runtime behavior: NOT YET ACCEPTED;
- production deployment/release: NOT AUTHORIZED;
- canonical Build Ledger append: NOT AUTHORIZED.

## 2. Builder Must Consume

Builder now consumes the prior R2 handoff plus:

`designs/SP-WORKBENCH-DASH-RD1-ADDENDUM.md`

The Dash addendum modifies only the shell-level mode set and adds a dashboard workspace. It does not replace the accepted R2 Sessions/Bots design or the runtime architecture.

## 3. Updated Primary Modes

The left-rail primary mode switch is now:

```text
SESSIONS    BOTS    DASH
```

Meaning:

- Sessions = normal conversation history/workspace;
- Bots = persistent governed workers and visible collaboration;
- Dash = mostly read-only operational overview built from configured widgets.

## 4. Builder Feasibility Result

### Shell integration

**PASS / BUILDABLE.**

Adding Dash is a bounded extension of the accepted R2 shell. It does not require a new application shell or a return to the earlier seven-destination dashboard architecture.

Implementation can use the same mode-selection state that already distinguishes Sessions and Bots, adding a third mode and a dashboard center-canvas template.

### Dashboard layout

**PASS / BUILDABLE.**

The Greenlight reference is suitable as a dashboard-density example only. The builder may implement:

- compact summary/KPI row;
- modular widget grid;
- calendar/agenda panel;
- meetings panel;
- tasks panel;
- opportunities panel;
- growth panel;
- current-status panel;
- alerts/attention panel;
- contextual right-rail detail.

The builder must not copy Greenlight branding, navigation, product wording, or whole-app layout.

### Widget model

**PASS WITH CONTRACT FREEZE.**

Dash should use a simple configurable widget contract rather than hard-coding every panel into the shell.

Candidate conceptual fields:

```text
WidgetDefinition
  widget_id
  widget_type
  title
  source_scope
  enabled
  position
  size
  refresh_policy
  stale_after
  filters
  alert_thresholds
  linked_bot_id optional
  linked_session_id optional
  configuration_version

WidgetSnapshot
  widget_id
  observed_at
  source_updated_at optional
  state
  summary_value optional
  payload_reference
  evidence_reference optional
  stale
  error optional
```

This allows the requested setup/customization behavior while keeping normal dashboard use mostly read-only.

### Read-mostly behavior

**PASS.**

Builder should separate two states:

1. `VIEW MODE` - normal use, mostly read-only;
2. `CUSTOMIZE MODE` - choose widgets, reorder/resize, set sources/filters/thresholds.

Customization must be explicit. Normal dashboard clicks should drill into detail rather than accidentally changing configuration.

### Data-source independence

**PASS WITH ADAPTER BOUNDARY.**

Widgets must not assume one vendor or one source. Calendar, meeting, task, opportunity, growth, alert, and status data should enter through replaceable source adapters or Signalproof-owned normalized state.

Examples of future sources may include calendar providers, GHL, local Signalproof services, Bots, project state, or approved external integrations. No specific external provider is required for the initial shell.

### Truthfulness and freshness

**PASS WITH HARD REQUIREMENT.**

Every widget must distinguish:

- current;
- stale;
- unknown;
- unavailable/error.

A visual value cannot be presented as current merely because a prior snapshot exists.

A minimum widget surface should support:

- last refresh/source time;
- stale/unknown state;
- source attribution or drill-down;
- failure reason when unavailable.

### Actions

**PASS WITH HANDOFF RULE.**

Dash should not become a second record-management application.

Typical actions route to the appropriate surface:

- meeting -> meeting detail or Session;
- task -> task detail or owning Bot;
- opportunity -> opportunity detail or related Bot/Session;
- alert -> evidence/detail or responsible Bot;
- growth metric -> analysis Session;
- current status -> detail/evidence.

Consequential external actions remain governed through the same Governor/Core path as the rest of Workbench.

## 5. Runtime and Governance Boundaries Remain Unchanged

Builder must preserve:

```text
Human
  -> Signalproof Workbench UI
  -> Signalproof Governor
  -> Signalproof Core Runtime
  -> Signalproof Agent Runtime
  -> approved adapters / models / tools / web / environments
```

Dash is a presentation and normalized-state surface. It does not create a second authorization plane.

A dashboard widget is not authority.

A widget reporting Bot activity must derive from actual persisted runtime state/evidence, not simulated activity.

## 6. Suggested Builder Implementation Order

Dash should not block the basic Workbench shell or conversational path.

Recommended sequence after W0 source authority:

```text
W1 Contract freeze
W2 R2/R3 shell with Sessions + Bots + Dash mode switching
W3 Session/Bot persistence + basic Dash configuration persistence
W4 Agent Runtime skeleton
W5 Hermes adapter
W6 governed conversational round trip
W7 governed tools/web
W8 delegation + memory
W9 Dash source adapters / refresh / stale-state evidence
W10 automation/environment/recovery/security acceptance
```

This ordering lets the builder prove the visual shell and data contracts without pretending live dashboard integrations already exist.

## 7. R3 Shell Acceptance

A Builder-produced shell candidate is ready for owner UI testing when machine-verifiable checks establish:

- app builds under authoritative source/toolchain;
- protected production is unchanged;
- `SESSIONS`, `BOTS`, and `DASH` mode switching works;
- Dash loads a dashboard canvas rather than a chat transcript;
- widget configuration and normal view mode are distinct;
- placeholder/development widget data is explicitly labeled as such;
- stale/unknown/error states render truthfully;
- the Greenlight reference has not been copied as the application shell;
- right rail can show selected Dash detail without losing dashboard state;
- Signalproof branding remains intact;
- no fabricated live integrations are shown;
- principal controls remain keyboard reachable;
- no material clipping/overlap occurs at supported desktop sizes.

Then return:

```text
AUTOMATED PASS / USER UI TEST READY
```

with exact candidate launch instructions.

## 8. Builder Result

```text
BUILDER REVIEW - DASH
Dash direction: PASS / BUILDABLE
R2 shell compatibility: PASS
Primary modes: SESSIONS / BOTS / DASH
Widget configuration model: BUILDABLE
Read-mostly view: BUILDABLE
Greenlight usage: DASHBOARD REFERENCE ONLY
Data-source boundary: REPLACEABLE ADAPTERS / NORMALIZED SIGNALPROOF STATE
Truthfulness requirement: HARD GATE
Governor/Core architecture: UNCHANGED
Current implementation blocker: W0 WORKBENCH SOURCE AUTHORITY STILL REQUIRED
Production mutation: NONE
Production/release authority: NOT GRANTED
Canonical ledger authority: NOT GRANTED
```

## 9. Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Workbench Bots/Sessions RD1
Git basis: Signalproof-Skills current main + candidate/workbench-bots-rd1
Current state: R2 visual direction and R3 Dash direction accepted for Builder consumption
Objective: prove current Workbench source/interface authority, then freeze the R3 shell and widget contracts
Route: build-git -> Investigate / Verify -> Builder W0 -> W1
Action class: READ / INVESTIGATE / VERIFY, then bounded BUILD after source authority
Protected state: installed Workbench, Governor, Core Runtime, keys, ACL/task configuration, production activation metadata, accepted Build 8A D4 evidence, protected main
Allowed surface now: read-only source/provenance inspection and candidate documentation
Known-failure constraints: do not infer source authority from deployed binaries/recovery copies; reload PowerShell failure registry before later PS generation/execution
Acceptance evidence for W0: authoritative source location, toolchain, integration surfaces, brand source, protected baseline, isolated candidate path
STOP conditions: source authority ambiguous; dashboard requires bypassing Governor/Core; widgets fabricate live state; candidate path would overwrite production; Greenlight reference expands beyond dashboard-only design inspiration
Closeout trigger: W0 PASS and exact W1 contracts frozen
```
