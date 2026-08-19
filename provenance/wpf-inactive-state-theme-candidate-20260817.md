# WPF Inactive / Unfocused Selected-State Theme Consistency Candidate

## Candidate ID

`SP-DESIGN-WPF-INACTIVE-STATE-20260817`

## Affected skill

`signalproof-design`

## Lifecycle state

CANDIDATE

The problem is now runtime-confirmed across multiple Competition Radar surfaces, including a governed owner-entry form with several ComboBoxes. The proposed shared-style correction has not yet been implemented and accepted. The skill lifecycle therefore remains Candidate rather than Tested or Active.

## Trigger

Signalproof Competition Radar RD2 C1-E Build 3B owner visual acceptance exposed a repeatable WPF state-theme inconsistency.

The accepted correction workflow itself passed visually and functionally, but certain controls rendered with default Windows light-state styling when they were preselected, inactive, unfocused, disabled, or otherwise outside the active interaction state.

By contrast, active selected rows in other Radar surfaces remained correctly styled with the intended dark-theme shell and readable selection highlight.

## Evidence class

Human-Observed Fact + Runtime Visual Evidence + Protected Milestone Evidence.

## Reusable lesson

Do not treat a white/light control surface as a one-control cosmetic bug when the visual defect appears only in preselected, inactive, unfocused, disabled, collapsed-selected, or selected-but-inactive states.

For WPF applications using a dark theme, inspect and govern the full visual-state matrix for relevant controls rather than only the normal and active-selected states.

Candidate design rule:

> A governed dark-theme WPF application should explicitly style the inactive, unfocused, selected-but-inactive, preselected, collapsed-selected, and disabled visual states of interactive controls so system/default light brushes cannot leak into the product theme.

Relevant controls may include:

- `ComboBox`
- `ComboBoxItem`
- `DataGridRow`
- `ListBoxItem`
- `TextBox`
- `Button`
- `CheckBox`
- other controls that inherit default Windows state brushes

## New semantic finding: unselected is not a governed value

Radar Build 2A exposed a related design problem that is not purely cosmetic.

The initial ComboBox surfaces showed real governed values such as `Discovered`, `ResearchMore`, `NR`, `Low`, `Pending`, and `Unknown` before the owner had actively selected anything.

That is semantically ambiguous. A product must distinguish:

- **no selection has been made yet**;
- **the owner deliberately selected a governed value such as `Unknown`, `NR`, or `Pending`**.

Candidate design rule:

> A required governed selector should begin in an explicit no-selection state such as `Select Governance`, `Select Disposition`, `Select Rating`, `Select Confidence`, `Select Evidence Completeness`, `Select Security`, `Select Provenance`, `Select License`, `Select Promotion`, `Select GitHub Endorsement`, and `Select Owner Approval`. A placeholder/cue is not persisted state and must not be represented as a valid domain enum.

This is particularly important for Signalproof because `UNKNOWN`, `NR`, `Pending`, and early lifecycle values are meaningful evidence/governance states rather than neutral UI defaults.

## Design implication

Prefer a shared application-level style/template correction over page-by-page color patches when multiple controls exhibit the same state-dependent fallback behavior.

For governed selectors, treat visual-state theming and no-selection semantics as separate requirements:

1. the ComboBox must have an explicit initial `Select …` cue that is not a persisted domain value;
2. after a real selection, the collapsed ComboBox must remain dark/readable;
3. opening the dropdown must show readable dark-theme items;
4. focused, pointer-over, selected, selected-but-unfocused, and disabled states must remain readable;
5. disabled state must remain visibly disabled without falling back to a white/light system surface.

Active-selected styling and inactive-selected styling must be tested separately.

A shared theme correction should define an explicit state matrix for each governed control class, including where applicable:

- unselected / cue
- normal
- pointer-over
- focused
- popup open
- active selected
- selected but unfocused/inactive
- collapsed selected value
- disabled

## Non-regression principle

A visual-state theme correction must not change control semantics, selection identity, data authority, append-only review behavior, navigation authority, or protected product workflows.

A placeholder such as `Select Governance` is display-only and must not become a stored enum/string value.

The correction target must remain independently readable outside a selected DataGrid row so future visual-state changes cannot become the sole source of target identity.

## Build 3B product evidence

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

## Build 3C confirming evidence

Competition Radar RD2 C1-E Build 3C owner visual acceptance independently reproduced the same state-dependent theme behavior on the correction surface while the governed correction flow itself remained readable and functional.

Observed Build 3C behavior:

- the `Owner disposition` ComboBox rendered as a light/white surface inside the otherwise dark correction page;
- the effect was present before and after the in-memory correction preview;
- the fixed `Corrected` review-state field, correction notes surface, target summary, chain-semantics panel, and final owner-confirmation panel remained readable;
- the normal-launch owner-confirmation checkbox and append button were correctly disabled by governance, demonstrating that the visual defect did not imply a permission-state failure;
- the final preview accurately displayed classification-run identity, signal identity, target sequence/event identity, target review state, target owner disposition, proposed disposition, correction notes, and prepared timestamp;
- no correction event was written during visual acceptance.

Build 3C automated acceptance immediately preceding that visual observation proved:

- static UI / authority checks passed;
- Release builds passed;
- complete Radar regression checks passed;
- one-shot correction fixture passed;
- blind-retry prevention passed;
- `SignalReviewStore` remained unchanged;
- raw `radar.db`, `signals.db`, and live `reviews.db` remained unchanged.

Accepted Build 3C automated evidence identifiers:

- manifest SHA-256: `91D5F984C289F15BCC914695010DAB874702A85E8D97217DA3824C2F67063A38`
- phase record SHA-256: `671BF2DEDF7FF82CFCBF33A972EF65341C5C863313EA6890BB6947B1376C6791`
- staged/noncanonical ledger SHA-256: `1E11413433F25DDDC4DF6006D3295C48D7160D8C40B9C87F432D21F14F5AC8BF`
- Recovery 3 evidence SHA-256: `DD646D65A9F99F1E738F34D6D18C78588EB8A209FA1B094C5EB4FA951D318434`

## Build 2A owner-entry confirming evidence

Competition Radar RD2 Rating / Promotion Build 2A owner visual testing reproduced the theme defect across a materially denser governed form rather than a single correction selector.

Observed runtime behavior:

- the Capability Assessment workspace correctly remained inside the unified Radar shell;
- Build 2A correctly stated that typing, selecting, previewing, and confirming do not persist anything;
- the LIVE WRITE GATE correctly stated that normal launch cannot persist capability assessments;
- multiple collapsed ComboBoxes rendered as white/light surfaces inside the dark workspace;
- selected values on those collapsed light surfaces had weak contrast and were difficult to read;
- the expanded Governance dropdown itself rendered dark/readable, demonstrating a state/template mismatch between popup items and the collapsed selection surface;
- initial fields displayed governed values such as `Discovered`, `ResearchMore`, `NR`, `Low`, `Pending`, and `Unknown`, making it unclear whether the owner had selected them or they were merely defaults;
- the owner explicitly requested visible `Select …` prompts for governed selectors;
- the confirmation checkbox was visible but correctly unavailable before a validated preview, which is expected governance behavior rather than a defect;
- the `LIVE APPEND - BUILD 2B NOT AUTHORIZED` control remained unavailable as required.

Build 2A automated acceptance immediately before this observation proved:

- exact preview generation PASS;
- preview token invalidation PASS;
- one-shot coordinator disposable test PASS;
- duplicate second invocation rejected PASS;
- persistence-failure/no-blind-retry behavior PASS;
- Build 1 semantic regression PASS;
- protected Review/History/Correction source unchanged;
- raw `radar.db`, `signals.db`, and `reviews.db` unchanged;
- live `capability-assessments.db` absent;
- normal-launch live-write gate disabled.

Accepted Build 2A automated evidence identifiers:

- manifest SHA-256: `A67FF16810BE76EB8712D2C76A9AA07F9550ED9411C70DF19816AC00DFF3F5D3`
- phase SHA-256: `6FAF26D767EBFC32872620B67A859215704670CFBC14DDC215CA0229F56FC594`
- staged/noncanonical ledger SHA-256: `7A108F97164BF6E2ABC04E6430D410B09F98E9DE664E25928F2668FA5A06B6FC`
- automated evidence SHA-256: `EDC0C017074BB3D11559274BAA9A1DEBC277BD1EFA546CCA7880B6B74BD0BAC5`

Owner-supplied runtime screenshots from this design-git review:

- screenshot SHA-256: `285A609CCB8C7943966F0EA0BFC01565066187C5EA2497119A19BCBC8D638FEB`
- screenshot SHA-256: `F8D8997BC2B784BFF5DE40B38D4A7590EAF4FBEE6473948099F6C99E90FFA348`
- screenshot SHA-256: `05406E1ED1921029C5B05F8EC34DC382C323016DE65DC033C274F589B5E961C7`

This third runtime case strengthens the evidence that the defect belongs at the shared WPF visual-state/template layer rather than as a page-local cosmetic patch.

## Candidate acceptance requirement

Promotion beyond Candidate requires a bounded shared-style implementation test demonstrating all of the following:

1. inactive/unfocused/preselected/collapsed-selected state leakage is removed for the targeted WPF controls;
2. governed selectors begin with explicit non-domain `Select …` cues where owner choice is required;
3. cue state and actual domain values such as `Unknown`, `NR`, `Pending`, and lifecycle values are visually and semantically distinguishable;
4. active-selected and popup-open states remain readable and visually accepted;
5. disabled state remains distinguishable without reverting to default light-system brushes;
6. no placeholder is persisted as domain state;
7. no selection identity or interaction semantics change;
8. no navigation, review, correction, data-authority, or database behavior changes;
9. the previously protected working baseline remains recoverable;
10. owner visual acceptance passes on the Radar surfaces that exposed the issue, including the Build 2A governed selector form.

Until those conditions pass, this item remains a governed Candidate and must not be represented as an Active public design rule.
