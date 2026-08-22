# Signalproof Workbench RD2 R6 - Artifact Workspace Addendum

**Status:** OWNER-DIRECTED DESIGN / BUILDER CONSUMPTION READY / NO PRODUCTION MUTATION  
**Date:** 2026-08-21  
**Owner:** Doc Reo  
**Work stream:** Signalproof Workbench GUI RD2 / R6 Agent Console  
**Base design:** `designs/SP-WORKBENCH-RD2-R6-AGENT-CONSOLE-PREPLANNING.md`  
**Primary modes remain:** `SESSIONS | BOTS | DASH`

---

## 1. Triggering User Observation

The owner used a Workbench Bot to generate a basic HTML website. The code was returned as plain transcript content.

Human-observed UI evidence shows:

- code is readable in the transcript;
- fenced Markdown is effectively rendered as ordinary text rather than a purpose-built code surface;
- there is no dedicated Copy action visible on the code block;
- there is no Save/Open action;
- there is no syntax-aware editor;
- there is no preview surface for HTML;
- editing the generated artifact requires manually selecting text or leaving Workbench.

Owner requirement:

> Generated code should be usable as an artifact, not trapped in chat. At minimum it needs a script-copy mechanism. Preferably it can be opened in a code editor and, for things such as HTML, viewed/edited in a canvas-like workspace.

---

## 2. Design Decision

Do **not** add a fourth top-level navigation mode for code.

Artifacts belong to the Session or Bot that created/received them.

The R6 design therefore adds a first-class **Artifact Workspace** that can be opened from a message, tool result, file, or Run while preserving the primary shell:

```text
SESSIONS    BOTS    DASH
```

Artifact Workspace is a contextual workspace/state inside Sessions or Bots, not a separate product silo.

Core interaction model:

```text
Conversation
  -> artifact detected/created
  -> compact Artifact Card in transcript
  -> Copy / Open / Save / Preview / More
  -> Artifact Workspace
      -> Editor
      -> Preview when supported
      -> Versions / Diff
      -> Ask Bot / Apply Changes
      -> Save / Export
```

---

## 3. Three-Level Artifact UX

### Level 1 - Inline Code Block Actions - REQUIRED FIRST

Any fenced code block or recognized generated script should render with a compact header containing, where applicable:

```text
language / filename             Copy   Open   Save
```

Optional contextual actions:

```text
Preview
Run
Apply
Download/Export
More
```

Rules:

- `Copy` copies the exact code payload, excluding role labels and Markdown fences;
- `Open` opens the payload in Artifact Workspace;
- `Save` writes only through a governed file operation and requires an explicit destination or approved workspace destination;
- `Preview` is presentation-only and must not imply host execution authority;
- `Run` is shown only when an executable capability is actually available and authorized;
- controls must remain usable by keyboard;
- long code must not force the whole chat transcript to full width.

This is the minimum acceptable improvement for the next build.

### Level 2 - Artifact Workspace - RECOMMENDED R6 TARGET

Opening an artifact changes the center workspace without abandoning the conversation.

Recommended desktop layout:

```text
+----------------------+-------------------------------------------+
| Conversation context | Artifact Workspace                        |
| / compact thread     | [file tabs] [Code] [Preview] [Diff]       |
|                      |                                           |
| latest messages      | editor / preview                          |
|                      |                                           |
| Ask / apply controls | Save  Copy  Export  Run(if governed)      |
+----------------------+-------------------------------------------+
```

Alternative responsive layout:

- artifact replaces the dominant center pane;
- conversation becomes a collapsible side panel/drawer;
- one click returns to full conversation.

Do not squeeze the editor into the existing narrow right-context rail.

### Level 3 - Full Project Workspace - LATER / OPTIONAL

A richer coding workspace may later add:

- project/file tree;
- multi-file tabs;
- terminal/process panel;
- Problems/Diagnostics;
- source control/diff;
- test results;
- preview server;
- deployment target.

This is not required for the first Artifact Workspace implementation and must not delay the basic Copy/Open/Edit/Preview workflow.

---

## 4. Artifact as a First-Class Signalproof Object

Artifact must be owned by Signalproof state, not only by provider transcript text.

Candidate model:

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

Suggested artifact types:

```text
code
script
html
markdown
text
json
yaml
xml
sql
csv
config
image
report
document
other
```

The transcript may contain a rendered representation, but the artifact object is the stable identity used for edit/save/version/export/evidence operations.

---

## 5. Artifact Detection and Creation

Artifacts may originate from:

1. assistant fenced code blocks;
2. a Bot tool result;
3. local file attachment/import;
4. generated document/report;
5. execution output;
6. user-created new artifact inside Workbench;
7. external connector/file source where policy allows.

Do not turn every small inline code fragment into a heavyweight artifact.

Recommended automatic promotion threshold:

- fenced block with recognized language and meaningful multi-line content;
- assistant explicitly names a file;
- payload is intended to be saved/run/previewed;
- tool result returns a file/artifact;
- user chooses `Open in Artifact Workspace`.

Inline code such as `npm install` or one property name may remain inline unless the user promotes it.

---

## 6. Editor Options

### Option A - Enhanced RichTextBox editor

Pros:

- lowest dependency burden;
- fastest to build inside current WinForms shell;
- sufficient for plain text and basic script editing.

Cons:

- weak syntax highlighting/editor ergonomics;
- difficult to reach competitor-quality coding UX;
- custom work needed for line numbers, indentation, bracket matching, search, code folding, etc.

Disposition:

**Fallback / bridge only.** Do not make this the long-term R6 editor target if WebView2 is viable.

### Option B - WebView2 + Monaco Editor

Pros:

- mature VS Code-derived editor behavior;
- syntax highlighting;
- line numbers;
- search/replace;
- selection/copy;
- indentation;
- minimap optional;
- language-aware editor conventions;
- easy split between Code and Preview;
- strong path toward a polished competitor-class experience.

Cons:

- WebView2 runtime/dependency must be verified;
- Monaco assets/version must be packaged/provenanced correctly;
- local host bridge must be designed safely;
- must not expose arbitrary privileged host calls to page JavaScript.

Disposition:

**Preferred R6 Artifact Workspace editor if dependency/provenance preflight passes.**

### Option C - Native third-party code editor control

Examples conceptually include Scintilla-class controls.

Pros:

- native desktop embedding;
- strong editor features;
- avoids browser rendering layer.

Cons:

- new library/licensing/provenance/deployment surface;
- compatibility with current .NET Framework build must be verified;
- may still require substantial theming/integration work.

Disposition:

**Secondary option if WebView2/Monaco is blocked.** Builder must verify exact package/license/version before adoption.

---

## 7. Recommended R6 Implementation Choice

Preferred architecture:

```text
WinForms Workbench shell
  -> Artifact Workspace host panel
      -> WebView2
          -> packaged local Artifact UI
              -> Monaco Editor
              -> HTML/Markdown Preview
      -> narrow, explicit host bridge
          -> artifact.load
          -> artifact.save-request
          -> artifact.copy
          -> artifact.preview
          -> artifact.run-request
          -> artifact.apply-edit
```

Important:

The WebView/Monaco layer is presentation/editing software. It is **not** authority and must not receive unrestricted shell/filesystem access.

All filesystem, execution, app, provider, and external-write operations still route through Signalproof runtime/governance.

---

## 8. HTML Preview Design

The supplied HTML example demonstrates the first high-value preview type.

When an artifact is `html`, Artifact Workspace should provide:

```text
Code | Preview
```

Preview behavior:

- render the current unsaved editor buffer or selected saved version;
- visually separate preview from host application chrome;
- default to a restricted/sandboxed local preview;
- do not inherit Signalproof privileged host bridge into arbitrary artifact JavaScript;
- do not silently grant network access;
- show when external assets/scripts are blocked;
- provide `Open in Browser` only through a governed action if external launch is enabled;
- preview refresh may be automatic with debounce or manual, based on stability.

For a plain self-contained HTML/CSS artifact, preview should require no machine-execution capability.

---

## 9. Code Execution Is Separate From Preview

The UI must keep these concepts distinct:

```text
Preview = render/view safely
Run = execute capability
```

Examples:

- HTML/CSS preview: presentation-only;
- Python `Run`: governed local execution;
- PowerShell `Run`: governed execution plus Signalproof PowerShell prevention contract;
- shell/batch execution: governed local execution;
- JavaScript in preview: sandboxed browser context, not host shell authority.

The presence of a Run button must depend on effective policy/capability state.

If unavailable:

```text
Run unavailable - Local Worker not configured/authorized
```

is correct.

Do not display a fake enabled Run button that cannot work.

---

## 10. Artifact Versioning / Edit Loop

Artifact editing should support a simple version model from the start.

User loop:

```text
Bot generates artifact v1
-> user opens editor
-> user edits to v2 draft
-> Ask Bot: "make header red"
-> Bot receives artifact ref + requested change
-> proposed v3
-> user can compare/apply/save
```

Minimum version requirements:

- preserve original generated content;
- never silently overwrite the only copy;
- edits create a new version or a draft state;
- store content hash/version provenance;
- allow revert to prior version;
- later support side-by-side or unified Diff.

This is the Signalproof equivalent of a canvas-like collaborative edit loop without surrendering provenance.

---

## 11. Conversation-to-Artifact Interaction

The artifact and conversation must remain linked.

Actions from Artifact Workspace:

```text
Ask Bot about selection
Ask Bot to modify artifact
Explain code
Fix error
Refactor
Generate test
Review security
Apply proposed patch
Return to conversation
```

When asking a Bot about code, pass an artifact reference/version and optional selection range rather than duplicating an uncontrolled entire project into every prompt.

Artifact changes proposed by a Bot should be explicit and reviewable before destructive save/execution when policy requires it.

---

## 12. Code Block Rendering in Chat

Even before full Monaco integration, R6 chat rendering must improve.

Minimum code-block design:

- dark code surface distinct from prose;
- monospaced font;
- language/filename label;
- horizontal overflow for long lines rather than breaking source unpredictably;
- Copy action;
- Open action;
- code fence markers are not shown as literal content;
- Markdown prose outside the code block renders normally;
- code should not inherit full-width prose formatting if the message column is constrained.

The user screenshot where literal ```html and raw Markdown markup appear in the transcript is not the target state.

---

## 13. Save / Export Behavior

Artifact saving must support these modes:

### Copy

Always low-risk for plain artifact content.

### Save As

User explicitly chooses a destination. File write goes through the governed file capability.

### Save to Bot Workspace

If a Bot has an approved workspace root, save to that bounded root.

### Export

Produces a user-selected file/package without claiming deployment.

### Apply to Existing File

Higher consequence than Save As. Must show target path and use appropriate approval/policy.

### Run/Build/Deploy

Separate governed capabilities. Saving an HTML file does not authorize launching a server or deploying a website.

---

## 14. Artifact Workspace and Local Worker

Artifact Workspace should be the human-facing surface for the local-program execution design already in R6.

Example future loop:

```text
Builder Bot creates index.html
-> Artifact Card
-> Open
-> edit
-> Preview
-> Save to approved workspace

Builder Bot creates app.py
-> Open
-> edit
-> Save
-> Run
-> Governor/Core approve bounded E1 execution
-> stdout/stderr shown in Run panel
-> fix with Bot
-> rerun
```

This avoids forcing coding work back into the transcript while preserving Signalproof execution governance.

---

## 15. Run / Output Panel

When execution becomes available, Artifact Workspace may expose a lower panel:

```text
OUTPUT | PROBLEMS | EVIDENCE
```

Minimum execution display:

- command/tool identity;
- running/stopped/completed/failed;
- stdout;
- stderr visually distinct;
- exit status;
- elapsed time;
- Stop control;
- produced artifacts/files;
- evidence/details on demand.

Do not treat stderr text alone as failure. Use the execution result contract.

---

## 16. Project Workspace Expansion Path

After single-artifact editing works, evolve without changing the core object model:

```text
Workspace
  workspace_id
  root_ref
  artifact_refs
  project_type
  bot_id optional
  session_id optional
  git_ref optional
  execution_policy_ref
  created_at
  updated_at
```

Then add:

- file tree;
- new file/folder;
- rename/delete under policy;
- multi-file editor tabs;
- search;
- Git diff/status;
- Build/Test actions;
- preview server.

This is the path toward a lightweight Signalproof coding environment without making the first build depend on a full IDE.

---

## 17. Security / Governance Requirements

Hard gates:

1. rendered artifact content cannot call privileged host methods by default;
2. WebView2 navigation is restricted to approved local artifact UI/preview origins unless explicitly allowed;
3. arbitrary file paths are not exposed to generated preview JavaScript;
4. API keys/secrets are not injected into editor/preview content;
5. Run routes through Governor/Core/Agent Runtime Local Worker;
6. Save/Apply routes through governed file capability;
7. external network in preview is explicit and policy-controlled;
8. HTML preview cannot silently launch programs;
9. artifact provenance and version identity are preserved;
10. generated code is untrusted until reviewed/executed under policy;
11. provider-generated code does not gain higher authority because it came from a trusted Bot;
12. PowerShell execution continues to honor the Active PowerShell failure-prevention registry.

---

## 18. Builder Sequence Update

This addendum modifies R6 ordering.

### R6-G1A - Conversation Polish

Existing UI housekeeping:

- transcript gutters;
- readable max width;
- message rhythm;
- composer alignment/padding;
- mature scroll semantics;
- proper Markdown/code parsing.

### R6-G1B - Inline Artifact Actions

Before Agent Runtime expansion, implement:

- code block identification;
- Copy;
- Open;
- Save surface/state;
- Artifact Card/reference;
- language/filename header.

### R6-G1C - Artifact Workspace Editor/Preview

After dependency/provenance preflight:

- editor host;
- preferably WebView2 + Monaco;
- Code/Preview for HTML;
- artifact versions/drafts;
- Save/Export;
- conversation link.

### R6-G2 - Agent Runtime Contract Freeze

Include Artifact lifecycle/events in the runtime contract.

### R6-G3+ - Runtime/Adapters/Workers

Continue previously approved sequence, with Artifact references available to tools, providers, local execution, and app connectors.

---

## 19. Runtime Contract Additions

Add to candidate R6 runtime API:

```text
runtime.artifact.create
runtime.artifact.get
runtime.artifact.list
runtime.artifact.update
runtime.artifact.version
runtime.artifact.save
runtime.artifact.export
runtime.artifact.preview
runtime.artifact.run
```

Events:

```text
artifact.created
artifact.updated
artifact.versioned
artifact.saved
artifact.exported
artifact.preview.ready
artifact.run.started
artifact.run.completed
artifact.run.failed
```

Not every operation must be exposed as a remote method in the first implementation. The object/event semantics should be frozen so the GUI does not need redesign later.

---

## 20. Acceptance Matrix

| Requirement | Pass Condition |
|---|---|
| Chat code block | code fences no longer appear as raw markers; code is visually distinct |
| Copy code | one action copies exact code only |
| Open artifact | opens exact code as an Artifact object/workspace |
| Editor | user can edit code without manually copying it to another app |
| HTML preview | self-contained HTML renders from current artifact buffer in restricted preview |
| Save As | user can select/approve destination and exact content is saved |
| Versioning | original generated artifact remains recoverable after edit |
| Conversation link | user can ask the originating Session/Bot to modify/explain current artifact/version |
| Truthful Run | Run is enabled only when effective execution capability exists |
| Governed execution | executable artifact uses Governor/Core/Agent Runtime worker path |
| No host escape | artifact preview cannot call arbitrary privileged host operations |
| Persistence | artifact identity/version remains after app restart according to policy |
| UI polish | artifact workflow feels integrated with Sessions/Bots, not bolted on |
| Dashboard boundary | no live Dashboard dependency added |

---

## 21. Definition of Done for the Next Artifact Slice

A Builder candidate satisfies the first artifact slice when the owner can:

1. ask Granite/Bot to create HTML;
2. see it as a real syntax-distinct code block/artifact rather than raw fenced text;
3. click **Copy** and receive exactly the HTML;
4. click **Open** and edit it in Workbench;
5. switch to **Preview** and see the rendered page safely;
6. save/export the artifact through an explicit action;
7. return to the same Session/Bot without losing context;
8. restart Workbench and recover the artifact/version according to the selected persistence policy.

Running local programs, full project trees, Git, deployment, and multi-file IDE features may continue in later R6 gates, but the data model and UI must not block them.

---

## 22. Final Design Disposition

```text
ARTIFACT WORKSPACE: APPROVED DESIGN DIRECTION
TOP-LEVEL NAV CHANGE: NO
INLINE COPY: REQUIRED
OPEN IN EDITOR: REQUIRED
HTML PREVIEW: REQUIRED FOR FIRST PREVIEW TYPE
EDITOR TARGET: WEBVIEW2 + MONACO IF VERIFIED, NATIVE FALLBACK IF BLOCKED
VERSIONED ARTIFACT STATE: REQUIRED
SAVE/EXPORT: REQUIRED
RUN: GOVERNED CAPABILITY, NOT A UI ASSUMPTION
FULL IDE/PROJECT TREE: LATER EXPANSION
SIGNALPROOF STATE OWNERSHIP: REQUIRED
GOVERNOR/CORE BYPASS: FORBIDDEN
LIVE DASHBOARD DEPENDENCY: NONE
```
