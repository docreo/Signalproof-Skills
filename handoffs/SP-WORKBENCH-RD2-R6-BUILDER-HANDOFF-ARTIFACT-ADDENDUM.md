# Signalproof Workbench RD2 R6 - Builder Handoff Artifact Addendum

**Status:** BUILDER CONSUMPTION REQUIRED / DESIGN COMPLETE FOR ARTIFACT SLICE  
**Date:** 2026-08-21  
**Owner:** Doc Reo  
**Work stream:** Signalproof Workbench GUI RD2 / R6 Agent Console  
**Base Builder handoff:** `handoffs/SP-WORKBENCH-RD2-R6-BUILDER-HANDOFF.md`  
**Artifact design:** `designs/SP-WORKBENCH-RD2-R6-ARTIFACT-WORKSPACE-ADDENDUM.md`

## Receiving Builder - Mandatory Addition

The owner has added a material R6 requirement after using the current Workbench Bot to generate HTML.

Generated code must no longer be trapped as plain transcript text.

The next build must consume the Artifact Workspace addendum before implementing the R6 UI/runtime sequence.

## Updated Immediate Gate Order

```text
R6-G0  RECEIVE / RECONCILE
R6-G1A CONVERSATION POLISH
R6-G1B INLINE ARTIFACT ACTIONS
R6-G1C ARTIFACT WORKSPACE EDITOR / HTML PREVIEW
R6-G2  AGENT RUNTIME CONTRACT FREEZE
R6-G3+ EXISTING RUNTIME / ADAPTER / WORKER SEQUENCE
```

## R6-G1A

Keep prior housekeeping target:

- transcript/content gutters;
- readable centered message width;
- improved vertical rhythm;
- composer padding/alignment;
- mature scroll-follow behavior;
- real Markdown parsing.

## R6-G1B - Minimum Code Usability

When a Bot/Session produces a fenced multi-line code artifact, render a dedicated code surface with:

```text
language / filename       Copy   Open   Save
```

At minimum:

- strip literal Markdown fence markers from presentation;
- use monospaced code rendering;
- Copy copies exact source only;
- Open creates/opens a Signalproof Artifact object;
- Save routes through the governed file path;
- HTML may also expose Preview;
- Run is hidden/disabled unless effective governed execution exists.

Do not wait for the full Agent Runtime to deliver Copy/Open/Artifact UI.

## R6-G1C - Artifact Workspace

Preferred target after dependency/provenance preflight:

```text
WinForms shell
 -> Artifact Workspace host
 -> WebView2
 -> packaged local artifact UI
 -> Monaco Editor
 -> Code / Preview / Diff-ready model
```

If WebView2 + Monaco is blocked by dependency/provenance/runtime evidence, use the smallest verified native editor fallback and preserve the same Artifact object/runtime contract.

Do not add a new top-level nav tab. Artifact Workspace is contextual to the originating Session or Bot.

### First preview type

HTML.

Owner should be able to:

1. ask Bot for HTML;
2. see a real code block with Copy/Open;
3. open it in Workbench editor;
4. edit it;
5. switch to Preview;
6. save/export it;
7. return to the same Bot/Session;
8. recover the artifact/version after restart according to persistence policy.

## Artifact State Contract

Builder must preserve the conceptual object:

```text
Artifact
  artifact_id
  session_id
  bot_id optional
  run_id optional
  message_id optional
  artifact_type
  language optional
  filename optional
  mime_type optional
  title
  content_ref
  content_hash
  version
  parent_version optional
  provenance_ref
  workspace_ref optional
  created_at
  updated_at
  status
```

Do not make transcript text the only durable identity.

## Security Boundary

Artifact editor/preview is presentation and editing, not authority.

- no unrestricted host bridge;
- no arbitrary filesystem access from preview JavaScript;
- no secret injection into preview;
- no automatic external network;
- Save uses governed file capability;
- Run uses Governor -> Core -> Agent Runtime -> Local Worker;
- HTML preview must not imply machine execution;
- PowerShell Run must still use the active Signalproof PowerShell prevention contract.

## Acceptance Additions

Builder acceptance now also requires:

- generated fenced code renders as a distinct code block rather than raw ``` markers;
- exact source can be copied in one action;
- exact source can be opened as an artifact;
- artifact can be edited;
- self-contained HTML can be previewed safely;
- artifact can be saved/exported explicitly;
- original/version provenance survives edits;
- artifact remains linked to its originating Bot/Session;
- unavailable execution is not represented as active;
- live Dashboard remains deferred.

## Authority

Owner invocation `/dsp complete the redesign` binds this artifact requirement into the existing bounded Workbench R6 completion stream.

This does not authorize production deployment, protected-main bypass, canonical Build Ledger append, credential acquisition, privilege escalation, or security weakening.
