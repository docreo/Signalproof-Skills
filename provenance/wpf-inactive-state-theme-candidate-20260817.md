# WPF Inactive / Unfocused Selected-State Theme Consistency Candidate

## Candidate ID

`SP-DESIGN-WPF-INACTIVE-STATE-20260817`

## Affected skill

`signalproof-design`

## Lifecycle state

CANDIDATE

The problem is now runtime-confirmed and preserved in a closed working product milestone, but the proposed shared-style correction has not yet been implemented and accepted. The skill lifecycle therefore remains Candidate rather than Tested or Active.

## Trigger

Signalproof Competition Radar RD2 C1-E Build 3B owner visual acceptance exposed a repeatable WPF state-theme inconsistency.

The accepted correction workflow itself passed visually and functionally, but certain controls rendered with default Windows light-state styling when they were preselected, inactive, unfocused, disabled, or otherwise outside the active interaction state.

By contrast, active selected rows in other Radar surfaces remained correctly styled with the intended dark-theme shell and readable selection highlight.

## Evidence class

Human-Observed Fact + Runtime Visual Evidence + Protected Milestone Evidence.

## Reusable lesson

Do not treat a white/light control surface as a one-control cosmetic bug when the visual defect appears only in preselected, inactive, unfocused, disabled, or selected-but-inactive states.

For WPF applications using a dark theme, inspect and govern the full visual-state matrix for relevant controls rather than only the normal and active-selected states.

Candidate design rule:

> A governed dark-theme WPF application should explicitly style the inactive, unfocused, selected-but-inactive, preselected, and disabled visual states of interactive controls so system/default light brushes cannot leak into the product theme.

Relevant controls may include:

- `ComboBox`
- `ComboBoxItem`
- `DataGridRow`
- `ListBoxItem`
- `TextBox`
- `Button`
- other controls that inherit default Windows state brushes

## Design implication

Prefer a shared application-level style/template correction over page-by-page color patches when multiple controls exhibit the same state-dependent fallback behavior.

Active-selected styling and inactive-selected styling must be tested separately.

A shared theme correction should define an explicit state matrix for each governed control class, including where applicable:

- normal
- pointer-over
- focused
- active selected
- selected but unfocused/inactive
- preselected/default selection
- disabled

## Non-regression principle

A visual-state theme correction must not change control semantics, selection identity, data authority, append-only review behavior, navigation authority, or protected product workflows.

The correction target must remain independently readable outside a selected DataGrid row so future visual-state changes cannot become the sole source of target identity.

## Known product evidence

Competition Radar RD2 C1-E Build 3B correction preparation passed automated and owner visual acceptance with:

- explicit owner-history target selection;
- separate readable correction-target summary;
- in-shell correction preparation;
- read-only `Corrected` state;
- in-memory preview only;
- no live correction commit path;
- ordinary owner-review path unchanged;
- `SignalReviewStore` unchanged;
- raw `radar.db` unchanged;
- `signals.db` unchanged;
- `reviews.db` unchanged.

Build 3B was formally closed as:

`CLOSED / PROTECTED / WORKING`

Protected milestone evidence recorded by the product closeout:

- Build 3B lock manifest SHA-256: `C889B08090DBD468AF3590038F53200CFB8C76CB1313CF236E7DC541F0A201A5`
- Build 3B closeout SHA-256: `AFB45053CCF0C698ACC05550CF0276238803DC9A5FC4EB8B7C672F1318AD882F`
- Known-limitations SHA-256: `8594CC52EBDAC129760C0A7E61B9CF848A64F1DA3FD4AFE320ECC3885A040CC0`
- staged/noncanonical closeout-ledger SHA-256: `A47178DE9E51911C368D632EF1C765F44971D1C881A2A7D0B7A72FE6212E102A`
- closeout evidence SHA-256: `A9AB82EDA19B8F9A361B5D0C4C2FD294195FFE60724CB65FEAC20186823CF7B6`

The protected milestone explicitly classifies the WPF state-theme issue as `LOGGED / NON-BLOCKING / DEFERRED` and does not reopen the accepted correction workflow.

## Candidate acceptance requirement

Promotion beyond Candidate requires a bounded shared-style implementation test demonstrating all of the following:

1. inactive/unfocused/preselected state leakage is removed for the targeted WPF controls;
2. active-selected state remains readable and visually accepted;
3. disabled state remains distinguishable without reverting to default light-system brushes;
4. no selection identity or interaction semantics change;
5. no navigation, review, correction, data-authority, or database behavior changes;
6. the previously protected working baseline remains recoverable;
7. owner visual acceptance passes on at least the Radar surfaces that originally exposed the issue.

Until those conditions pass, this item remains a governed Candidate and must not be represented as an Active public design rule.
