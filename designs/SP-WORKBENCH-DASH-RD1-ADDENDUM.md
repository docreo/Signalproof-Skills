# Signalproof Workbench RD1 - Dash Workspace Addendum

**Status:** CANDIDATE / DESIGN ADDENDUM / NO PRODUCTION MUTATION  
**Work stream:** Signalproof Workbench Bots/Sessions RD1  
**Owner:** Doc Reo  
**Branch:** `candidate/workbench-bots-rd1`  
**Companion visual direction:** `designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-VISUAL-DIRECTION-R2.md`

## 1. Purpose

The owner directed that Workbench should include a separate page after `BOTS` named:

`DASH`

This page is distinct from Sessions and Bots. It is not the main conversation surface and not the Bot operating space.

It is a mostly read-only dashboard workspace where the user reviews the tracking widgets they have configured for their business/workflow.

The supplied Greenlight screenshot is design evidence for the **dashboard idea and widget density**, not authority for the full Workbench layout, shell, or navigation system.

Observed reference image:

- staged context image SHA256 `AF10DE9D4C7A832A1CE9B946FD0F5704AE427401BF4E7F5A3A880800AB99FD45`
- interpretation scope: dashboard composition reference only.

## 2. Navigation Change

The left-rail primary mode switch becomes:

```text
SESSIONS    BOTS    DASH
```

### Meaning

- `SESSIONS` = normal conversation history/workspace.
- `BOTS` = persistent worker operating space and Bot collaboration.
- `DASH` = mostly read-only widget review and status workspace.

This does **not** restore the earlier dashboard-heavy seven-destination shell. `DASH` is a single additional workspace, not a return to a portal-style product.

## 3. Product Principle

> Sessions are conversations. Bots are workers. Dash is the operational overview.

Dash exists so the user can quickly see the state of the systems and workflows they care about without opening each Session or Bot.

## 4. Dash Workspace Contract

Dash is primarily for review, awareness, and attention management.

After initial setup, it should be mostly read-only.

The owner may still:

- choose which widgets appear;
- configure widget order/layout;
- set data sources or linked entities where permitted;
- define alert thresholds/filters;
- choose which Bots, schedules, calendars, or opportunity sources feed a widget.

But once configured, normal usage is mainly:

- review;
- scan;
- drill into detail;
- open the underlying source item in Session, Bot, or external detail view when action is needed.

## 5. Dash Widget Domains

The first-class widget categories requested are:

1. **Calendar**
2. **Meetings**
3. **Tasks**
4. **Opportunities**
5. **Growth**
6. **Current Status**
7. **Alerts**

## 6. Dash Layout Direction

Dash should borrow the feel of a serious portfolio/operations dashboard like Greenlight while staying inside the Workbench shell.

Visual characteristics to borrow:

- clear header/title area;
- card- and widget-based composition;
- modular panels;
- compact KPI summary cards near the top;
- multiple rows of widgets below;
- easy scanning of priorities;
- strong hierarchy for important alerts and next actions.

Workbench constraints:

- preserve the Workbench top bar;
- preserve Signalproof branding;
- preserve the left-rail mode system;
- use the right-side contextual/detail rail where useful;
- preserve the black/charcoal/red Signalproof visual language.

## 7. Suggested Dash Information Architecture

Top strip:

- `Dash` title;
- optional workspace/project/profile/date filter;
- widget customization button;
- refresh or sync status;
- alert count.

Summary row examples:

- today meetings count;
- open tasks count;
- active opportunities;
- growth delta;
- alerts needing review;
- current status snapshot.

Main body:

1. Calendar / agenda widget
2. Meetings widget
3. Tasks widget
4. Opportunities pipeline widget
5. Growth trend widget
6. Current status widget
7. Alerts / attention widget

The right rail may become a detail/context pane for the selected widget or selected item.

## 8. Read-Only Bias Rule

Dash should not become a second full editing workspace.

Allowed ordinary actions:

- expand widget;
- drill into item;
- open related Session;
- open related Bot;
- acknowledge alert where appropriate;
- filter/sort;
- choose visible widgets;
- move/reorder widgets in customization mode.

Avoid as default behavior:

- heavy inline editing;
- complex record management;
- turning Dash into the primary place to create or edit everything;
- mixing long-form conversation directly into dashboard widgets.

Operational action should usually hand off to the appropriate detailed surface.

## 9. Relationship to Sessions and Bots

Dash can open a Session when the user wants to discuss or act on what they see.

Dash can show information produced by Bots and route the user into a Bot workspace when action is needed.

Dash shows outcomes and status, not hidden autonomous claims without evidence.

## 10. Evidence and Truthfulness

The dashboard must be truthful.

- Unknown data must be shown as unknown.
- Stale or unsynced widget data must be indicated.
- A widget cannot imply real-time sync if refresh has not happened.
- A Bot-derived metric should be attributable.
- Alerts must not be fabricated for visual drama.

When a widget value is important or consequential, the user should be able to inspect its source, last refresh, linked Bot/automation, and evidence/detail.

## 11. R3 Visual/Builder Consequence

The accepted R2 shell remains valid. The shell-level change is that the top-of-left-rail mode switch becomes three options instead of two:

```text
SESSIONS    BOTS    DASH
```

Mode meanings:

- Sessions mode = session list in left rail.
- Bots mode = Bot roster in left rail.
- Dash mode = dashboard-specific filters, saved views, or widget presets in left rail.

The center pane becomes the dashboard canvas when Dash is active.

## 12. Builder Feasibility

**PASS / BUILDABLE.** A read-mostly widget dashboard can be implemented inside the R2 shell without breaking the Sessions/Bots architecture.

The Greenlight screenshot supports dashboard density/composition direction only. It does not override the Workbench shell.

Dash remains acceptable if widget data remains attributable, refresh state is visible, unknown/stale data is not shown as healthy/current, and actions route to the appropriate governed surface.

## 13. Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Workbench Bots/Sessions RD1
Current state: R2 shell accepted for builder consumption; Dash workspace added as R3 design addendum
Objective: preserve Dash as a separate read-mostly workspace after Bots
Route: design-git / builder consumption
Action class: DESIGN ADDENDUM
Protected state: unchanged
Allowed surface: candidate design and future candidate implementation only
Key rule: Greenlight image informs dashboard style only, not Workbench shell replacement
Closeout trigger: builder consumes Dash addendum in future shell/build planning
```
