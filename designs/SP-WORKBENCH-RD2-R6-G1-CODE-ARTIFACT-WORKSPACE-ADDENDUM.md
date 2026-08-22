# Signalproof Workbench RD2 R6 G1 — Code Artifact Workspace Addendum

**Date:** 2026-08-21  
**Status:** OWNER-DIRECTED DESIGN ADDENDUM / INCLUDED IN CURRENT COMPLETE ENVELOPE  
**Workstream:** Signalproof Workbench GUI RD2 R6  
**Applies to:** R6-G1 UX Housekeeping and later Agent Runtime Artifact model  
**Protected baseline:** current working R5.1/H1 behavior and Workbench -> Governor -> Core -> Granite path

## Owner-observed gap

The running Workbench can return useful fenced code, but the result is presented only as raw transcript text. Example owner evidence is an assistant-generated HTML document shown between Markdown fences. The operator should not have to manually drag-select a long block out of the transcript to use it.

This is a product-workflow deficiency, not a request to turn the Workbench transcript into an unrestricted IDE.

## Product decision

Generated fenced code is treated as a **Code Artifact** in addition to remaining visible in conversation history.

The Workbench should recognize fenced code blocks such as:

```text
```html
...
```
```

and expose a governed artifact affordance.

### R6-G1 required behavior

For one or more fenced code blocks in an assistant response:

1. detect the fenced block without changing the original assistant message;
2. identify the declared language when present (`html`, `css`, `javascript`, `powershell`, `python`, etc.);
3. expose an obvious `Code` / `Artifact` affordance associated with the current conversation;
4. provide **View / Edit** in a dedicated Code Artifact Workspace using a monospaced editor surface;
5. provide **Copy** to clipboard;
6. provide **Save As...** through an explicit owner-selected filesystem destination;
7. show language/type and a safe suggested filename when practical;
8. preserve a clear `Back to Chat` / close path;
9. never execute, shell, launch, install, or publish the generated code merely because it exists;
10. do not create a direct provider/tool/shell bypass.

### R6-G1 editor scope

The first editor is deliberately bounded. It is not required to provide a full IDE.

Required:

- monospaced text;
- editable text;
- selection;
- clipboard copy;
- Save As;
- keyboard reachability;
- readable dark-theme contrast;
- long-code scrolling;
- language/file-type label;
- exact generated text available without transcript markdown fences.

Useful if safe and low-risk:

- line/column indicator;
- `Revert to Generated` within the open artifact instance;
- multiple fenced blocks selectable as separate artifacts.

Deferred to later governed runtime capability:

- execute/run;
- terminal/shell;
- dependency installation;
- arbitrary program launch;
- external browser launch;
- live web hosting/deployment;
- automatic source-tree writes;
- model-driven file overwrite without an authorized tool path.

## HTML preview decision

A visual HTML preview is desirable, but R6-G1 must not introduce an ungoverned `Process.Start`, browser-launch path, or script-execution bypass merely to obtain preview.

Therefore:

- **View/Edit/Copy/Save As are R6-G1 requirements.**
- **Preview is deferred until implemented through a bounded preview surface or governed local-tool capability.**

A future preview implementation should define script/network behavior explicitly rather than silently rendering arbitrary active content.

## Artifact state model

R6-G1 may derive artifacts deterministically from persisted assistant-message text, avoiding a premature competing canonical storage system.

Later Agent Runtime work should normalize this into the already planned Signalproof-owned `Artifact` lifecycle object. Edited artifacts that become durable project/workspace files must carry provenance and policy through that runtime rather than becoming provider-owned state.

## UI integration

Do not replace the accepted `SESSIONS | BOTS | DASH` shell.

Preferred interaction:

```text
Assistant message contains fenced code
-> Workbench detects Code Artifact(s)
-> small visible artifact affordance appears
-> operator chooses View/Edit
-> Code Artifact Workspace opens
-> Copy / Save As / edit
-> Back to Chat
```

The workspace may be a centered/docked application surface or a dedicated Workbench child window if that is the smallest reliable WinForms implementation. A modal message box containing code is not sufficient.

## Version/build legibility — same R6-G1 gate

The Workbench viewer must expose its candidate/version identity legibly at normal desktop scale.

Acceptance:

- visible without hover;
- not clipped;
- not tiny low-contrast gray-on-charcoal text;
- remains readable under ordinary Windows scaling;
- does not compete visually with primary conversation content;
- candidate identity is truthful and does not imply production promotion.

## R6-G1 automated acceptance additions

Static/source checks must establish:

- code-fence detection exists;
- artifact View/Edit surface exists;
- Copy action exists;
- Save As action exists;
- no artifact auto-execution path exists;
- no direct Ollama/provider bypass added;
- no direct shell/terminal execution added;
- Governor request pipe contract remains present;
- Sessions/Bots create/rename/delete behavior remains represented;
- R5.1 transcript/composer separation remains represented;
- version/build identity label exists and is not configured as hidden;
- approved brand identity remains.

Runtime/self-test should exercise artifact extraction with a deterministic fenced HTML fixture without requiring a model request.

## Human UI acceptance additions

Using a response containing the supplied HTML-style fenced code, the owner must be able to:

1. see that code was recognized as an artifact;
2. open it outside the raw transcript;
3. read and edit it comfortably;
4. copy it with one explicit action;
5. invoke Save As and choose the destination;
6. return to the conversation;
7. still see the Workbench version/build identity clearly.

This acceptance does not claim code execution, deployment, or live HTML preview.

## Governance boundary

Generated code is content until the owner or an authorized governed runtime action promotes it into an executable/write action.

> **Artifact visibility is not execution authority.**
