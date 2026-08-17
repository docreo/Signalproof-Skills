# WPF Inactive / Unfocused Selected-State Theme Consistency Candidate

## Candidate ID

`SP-DESIGN-WPF-INACTIVE-STATE-20260817`

## Affected skill

`signalproof-design`

## Lifecycle state

CANDIDATE

## Trigger

Signalproof Competition Radar RD2 C1-E Build 3B owner visual acceptance exposed a repeatable WPF state-theme inconsistency.

The accepted correction workflow itself passed visually and functionally, but certain controls rendered with default Windows light-state styling when they were preselected, inactive, unfocused, disabled, or otherwise outside the active interaction state.

By contrast, active selected rows in other Radar surfaces remained correctly styled with the intended dark-theme shell and readable selection highlight.

## Evidence class

Human-Observed Fact + Runtime Visual Evidence.

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

## Non-regression principle

A visual-state theme correction must not change control semantics, selection identity, data authority, append-only review behavior, navigation authority, or protected product workflows.

## Known product evidence

Competition Radar Build 3B correction preparation passed its workflow acceptance with:

- explicit owner-history target selection;
- separate readable correction-target summary;
- in-shell correction preparation;
- read-only `Corrected` state;
- in-memory preview only;
- no live correction commit path.

The visual limitation is therefore recorded separately from correction-function acceptance.

## Candidate status

This lesson is logged as a candidate only. It is not yet an Active public skill rule.

Promotion should require at least one bounded shared-style implementation test showing that inactive/unfocused state leakage is corrected without regressing active-selected states or product behavior.
