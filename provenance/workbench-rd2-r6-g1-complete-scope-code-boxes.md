# Signalproof Workbench RD2 R6 G1 - Complete Scope Update: Native Code / Context Boxes

**Date:** 2026-08-21  
**Status:** COMPLETE ENVELOPE / IMPLEMENTATION SCOPE UPDATED / MILESTONE OPEN  
**Workstream:** Signalproof Workbench GUI RD2  
**Branch:** `candidate/workbench-rd2-gui-build`

## Owner directive

Owner clarified that the requested box treatment is to be implemented **in the actual Workbench code** under:

```text
/dsp complete
```

This is not a design-only request and does not create a separate workstream.

## Current Complete objective

Continue the existing R6 bounded implementation so the Workbench becomes a polished daily-use Signalproof chat/agent client while preserving the protected architecture and already-working governed Granite path.

The R6-G1 UX implementation now explicitly includes native reusable box/card treatment where appropriate.

## R6-G1 implementation additions

### 1. Conversation / artifact code boxes

When assistant content contains fenced code or other code-artifact content, the Workbench should render it as a bounded native code box rather than an undifferentiated prose dump when the current WinForms architecture can support this safely.

Target behavior:

- visually bounded code surface;
- language/title label when known;
- monospaced readable content;
- controlled horizontal/vertical overflow;
- Copy action;
- Open/expand or equivalent larger-view action when implemented safely;
- Save As only through explicit user action;
- no automatic execution;
- parser failure must degrade safely to transcript text rather than crash the Workbench.

### 2. Context / information cards

Right-rail and other compact state surfaces may use a reusable native Signalproof card pattern for items such as Bot Context, model/provider target, tools/capabilities, run/task state, and other truthful contextual information.

Target behavior:

- consistent internal padding;
- Signalproof black/charcoal/red visual language;
- clear title/body hierarchy;
- no fabricated status;
- configuration state remains distinct from effective runtime availability.

### 3. Integration with existing R6-G1 polish

These boxes must coexist with the already-locked R6-G1 requirements:

- transcript gutters;
- readable content width;
- message rhythm;
- composer alignment/polish;
- mature scroll semantics;
- no transcript/composer overlap;
- no return to the disproven per-message FlowLayoutPanel transcript architecture.

## Protected architecture

Remain unchanged:

```text
Workbench -> Governor -> Core -> Agent Runtime / Broker -> governed adapter/provider/tool/worker
```

The current local conversational path remains protected:

```text
Workbench -> Governor -> Core -> Granite
```

UI controls do not create execution authority.

A code box must never become an implicit shell/program execution path.

## Acceptance additions

Machine-verifiable acceptance for the G1 candidate should establish, where applicable:

- reusable box/card control code compiles;
- code-fence/artifact parsing is bounds-safe;
- malformed/unclosed fences do not throw an index/range exception;
- code content can be displayed/copied without execution;
- transcript still supports ordinary prose;
- conversation gutters/readable width/composer/scroll regression checks remain intact;
- Governor transport remains present;
- direct Ollama/Core/provider/process bypass remains absent;
- protected production identity remains unchanged during candidate build/test.

Human UI acceptance should verify that the exact candidate feels cleaner and that code/context boxes are readable, aligned, and usable without harming normal conversation flow.

## Complete authority

`/dsp complete` provides the bounded owner authority to continue all normal owner-authorizable build, spawn, investigate, debug, test, verify, review, security-check, recovery, and learning actions needed to finish this current Workbench R6 scope.

Routine intermediate approval is not required.

Excluded authority remains unchanged: no production deployment/release, protected-main bypass, canonical Build Ledger append, new credentials/secrets, privilege escalation/security weakening, Candidate activation, or unrelated workstream mutation.

## Next technical gate

The existing R6-G0 exact-source-localization precondition remains valid because the authoritative R5.1 C# source currently lives on the owner's Windows F: drive rather than in Git.

After G0 returns the exact control/method anchors, continue automatically into the R6-G1 code patch including the native box/card implementation described here.
