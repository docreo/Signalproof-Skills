# Signalproof Workbench R5 - Codex Handoff Log

**Status:** STAGED CONTINUITY LOG / NONCANONICAL BUILD LEDGER STATE  
**Work stream:** Signalproof Workbench R5 Hermes-Approved Functionality Integration  
**Branch:** `candidate/workbench-desktop-experience-r5`  
**Public main checked:** `a1bf4633d1adc1a1229fc338daa45c57014d37c0`  
**Date:** 2026-08-22

## Material state synchronized

- R5 Slice 1 RD1 proved the six-mode route family and protected runtime regressions, but human UI review rejected the vertical six-destination left rail.
- The rejected RD1 layout is preserved as a layout/information-architecture failure, not rewritten as success.
- R5 Slice 1 RD2 moved `DASH | SESSIONS | BOTS | COMMAND CENTER | MEMORY | SETTINGS` to the persistent top bar and restored the left rail to active-mode-specific content.
- Owner visually accepted RD2 and directed that it be locked in.
- The next workstream is broader integration of approved Hermes-derived desktop-agent capabilities into Signalproof Workbench, not another shell redesign.
- Hermes remains a replaceable governed adapter/reference source, not canonical Signalproof state or authority.
- Current governed Granite behavior and persistent OS Runtime independence remain protected and must be reverified by the receiving builder before mutation.

## PowerShell / harness learning preserved

Applicable prevention classification: `PS-HARNESS-EVIDENCE-001`.

UI smoke sequence:

```text
Attempt 1: UI Automation name lookup + InvokePattern -> HARNESS FAIL
Attempt 2: UI Automation exact ControlType.Button -> HARNESS FAIL
Attempt 3: Win32 child HWND + BM_CLICK -> PASS
```

Do not reset attempt history in a fresh chat. Do not return to the disproven UIA methods without a materially changed condition.

## Accepted UX rule

```text
Top bar: persistent primary destinations
Left rail: active-mode-specific controls/lists/filters
Center: dominant work/conversation canvas
Right: contextual workpane/evidence
```

## Current plan / handoff

```text
designs/SP-WORKBENCH-R5-SLICE1-RD2-TOPNAV-ACCEPTANCE.md
plans/SP-WORKBENCH-R5-HERMES-APPROVED-INTEGRATION-CODEX-PLAN.md
handoffs/SP-WORKBENCH-R5-CODEX-COMPLETE-HANDOFF.md
```

## Next action

Receiving higher-level builder starts a new bounded `/dsp complete` stream and performs Gate 0 exact-current-state reconciliation before creating a new candidate.

## Authority boundary

This log does not claim:

- production deployment;
- public release;
- protected-main promotion;
- canonical private Build Ledger append;
- Candidate Skill activation;
- credential/privilege/security-control authority.

Private Build Ledger chronology remains separate and must be retrieved selectively if available; otherwise mark unavailable rather than guessing.
