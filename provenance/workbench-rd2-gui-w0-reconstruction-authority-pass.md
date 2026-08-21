# Signalproof Workbench GUI RD2 - W0 Reconstruction Authority PASS

**Status:** W0 PASS / RECONSTRUCTION AUTHORITY / POWERSHELL RD1.X LOOP CLOSED  
**Date:** 2026-08-21  
**Workstream:** Signalproof Workbench GUI RD2  
**Branch:** `candidate/workbench-rd2-gui-build`

## Decision

W0 is resolved without a fourth RD1.x PowerShell provenance-harness retry.

The three RD1.x runs established a recurring Windows PowerShell 5.1 generic collection-materialization harness defect. They did not establish a Workbench product failure and they did not contradict the already accepted production/runtime evidence.

The same harness failure class reached the normal three-attempt boundary. `SP-WORKBENCH-W0-RD1.3.ps1` must not be converted into an RD1.4 by another collection-shape patch.

## Evidence-sufficiency route

Existing preserved build evidence establishes the actual Workbench build lineage strongly enough to answer the source/build-authority question without requiring a conventional `.csproj` or `.sln` worktree.

The Workbench build lineage is a direct single-source C# build using the existing Windows .NET Framework compiler.

Observed build contract:

```text
csc.exe
  /target:winexe
  /optimize+
  /platform:anycpu
  /win32icon:<approved icon>
  /out:<candidate exe>
  /reference:System.dll
  /reference:System.Core.dll
  /reference:System.Drawing.dll
  /reference:System.Windows.Forms.dll
  SignalproofLlmWorkbench.cs
```

Later RD2 build evidence pins the compiler path as:

`C:\WINDOWS\Microsoft.NET\Framework64\v4.0.30319\csc.exe`

and shows the established pattern of a fresh isolated candidate root containing `src`, `Assets/Brand`, `build`, `evidence`, derivation evidence, report, and manifest.

Therefore absence of a surviving conventional Visual Studio project tree is not itself a source-authority blocker for this product lineage.

## Baseline authority classes

### Immutable accepted baseline input

Accepted RD3 Workbench source evidence:

`F:\Downloads\Quarantine\Evidence\B8A-GOV-D4-WORKBENCH-V1-RD3-AUTH-R2\src\SignalproofLlmWorkbench.cs`

Expected SHA-256:

`3A075A9709511EA4B0580AC0B2A6C7B637B949CD5174E1D3913D015D9275E18A`

This file remains immutable evidence. It is not silently relabeled as an editable development tree.

### Accepted deployed baseline

Installed Workbench:

`F:\Signalproof\Apps\Signalproof Governor\client\Signalproof-LLM-Workbench-V1-RD3.exe`

Expected SHA-256:

`C47416969095B83B9788ED939BB31CC90A75EBA40FD330A9EEB5DEB30FB6174F`

Production remains protected and unchanged.

### Reconstructed editable authority

The GUI RD2 build may establish a new isolated candidate source tree by copying the exact accepted RD3 source bytes into a fresh candidate `src` path after hash verification and recording a derivation manifest.

That candidate copy becomes the editable source authority for GUI RD2 because its parentage, byte identity, compiler/build recipe, protected production boundary, and intended mutation scope are explicit.

This is reconstruction authority, not retroactive relabeling of the historical Evidence directory.

## Protected runtime behavior

The prior governed-model milestone remains CLOSED / USER UI PASS.

Protected behavior:

```text
Signalproof Workbench
-> Signalproof Governor
-> Signalproof Core Runtime
-> general_reasoning
-> local model
```

GUI RD2 may evolve the presentation/source candidate but must preserve this existing governed path unless a later separately verified runtime gate supersedes it.

## Brand authority

Approved circular red Signalproof Workbench logo SHA-256:

`4B660A3C4F9F75BEF0F6552747A61FD8178ACD0AA6C0B4F441FB9EB69CC88EDD`

Use the exact controlled asset. Do not redraw or reconstruct it.

## W0 disposition

```text
W0 SOURCE AND INTERFACE AUTHORITY: PASS VIA RECONSTRUCTION AUTHORITY
CONVENTIONAL CSPROJ/SLN REQUIRED: NO, NOT FOR THIS VERIFIED BUILD LINEAGE
ACCEPTED SOURCE BASELINE: HASH-BOUND IMMUTABLE RD3 SOURCE
EDITABLE GUI RD2 SOURCE AUTHORITY: FRESH DERIVED CANDIDATE TREE
BUILD TOOLCHAIN: EXISTING .NET FRAMEWORK CSC DIRECT COMPILE
PRODUCTION: PROTECTED / UNCHANGED
GOVERNED LOCAL-MODEL PATH: PROTECTED
POWERSHELL RD1.X PROVENANCE HARNESS: CLOSED AFTER THREE SAME-CLASS ATTEMPTS
```

## W1 contract freeze

The next implementation gate is W1/W2 combined bootstrap:

1. verify the accepted RD3 source SHA-256;
2. verify the accepted installed Workbench SHA-256;
3. verify the approved logo SHA-256 from an existing controlled local copy;
4. resolve the existing `csc.exe` without installing anything;
5. create a fresh isolated GUI RD2 candidate tree;
6. copy the accepted source bytes into candidate `src` and prove byte equality;
7. copy the approved branding into stable candidate asset slots;
8. record baseline derivation and protected-production identities;
9. begin the owner-accepted `SESSIONS | BOTS | DASH` shell implementation only in the isolated candidate;
10. compile/test candidate without production replacement or registration mutation.

## Current GUI contract

```text
SESSIONS | BOTS | DASH
```

- Sessions are normal resumable LLM conversations.
- Bots are persistent governed workers with truthful visible collaboration.
- Dash is a mostly read-only operational overview with explicit customization mode.

The shell remains desktop-first with left rail, dominant center workspace, contextual/collapsible right rail, bottom composer in conversational modes, Signalproof black/charcoal/red identity, actual approved logo, and Control/Evidence on demand.

## Authority

The owner's active `/dsp authorize all build-spawn-debug` envelope permits normal owner-authorizable W1/W2 candidate construction, compile, debug, and automated verification inside this isolated workstream.

It does not authorize production/release, protected-main bypass, canonical Build Ledger append, Candidate activation, privilege escalation, new credentials/access, security weakening, or unrelated workstreams.

## Next status

`W0 PASS -> W1 CONTRACT FROZEN -> W2 ISOLATED GUI CANDIDATE BUILD`
