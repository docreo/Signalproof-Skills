# Signalproof Workbench RD2 R6-G1 Candidate Packet RD1

**Date:** 2026-08-21  
**Status:** CANDIDATE BUILT / STATIC INTEGRITY PASS / WINDOWS MACHINE ACCEPTANCE PENDING  
**Branch:** `candidate/workbench-rd2-gui-build`

## Baseline authority

The owner transferred one authoritative R5.1 Workbench C# source byte stream into the Builder runtime.

Received source SHA-256:

`B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12`

This exactly matches the previously protected R5.1 source identity.

The source bytes are not committed to the public Signalproof-Skills repository.

## R6-G1 candidate identity

Candidate C# source SHA-256:

`19BC9E02D4DFF27F101E44CD0FCEF4213FE6FFA3A2EA917E1B98F1DFBFC67993`

Builder/test runner SHA-256:

`95EDEC1B20BD25033312BE3F650C314396813FF9E9F4C61A3365EA3F77CEACF6`

Transfer packet ZIP SHA-256:

`7083B1ECB4127B718E674F78329C4903C682765076726A327793169E20D49E82`

## Bounded R6-G1 implementation

The candidate implements the first R6 UI-housekeeping slice:

- centered readable transcript content with effective desktop gutters;
- manual bounded message layout rather than the disproven per-message `FlowLayoutPanel` transcript architecture;
- improved message rhythm;
- per-message Copy action;
- fenced code/artifact rendering with monospaced controlled overflow;
- code/artifact Copy and Open actions;
- Save As only after explicit user action in the opened viewer;
- no code/artifact auto-execution path;
- malformed/unclosed fenced blocks degrade to ordinary prose;
- follow newest only when the reader remains near bottom;
- reader position preserved when the operator scrolls upward;
- `Jump to latest` affordance;
- outbound user turns resume normal follow behavior;
- bounded multiline composer growth and content-column alignment;
- reusable right-rail context-card visual treatment.

## Protected state retained in candidate source

Static review confirms:

- Governor request pipe remains present;
- no direct Ollama endpoint appears in Workbench source;
- no `Process.Start` execution path appears in Workbench source;
- Session delete implementation remains present;
- Bot delete implementation remains present;
- Dashboard remains present and live-source functionality remains deferred;
- no production/release mutation is included.

The candidate transport test remains `Workbench -> Governor -> Core -> Granite` and now writes explicit FAIL evidence if that regression test cannot complete, rather than allowing child-process diagnostics to disappear.

## Windows machine acceptance packet

The candidate transfer packet contains:

- exact R6-G1 candidate source;
- exact build/test runner;
- R5.1-to-R6-G1 patch;
- simple local launcher;
- SHA-256 manifest;
- run/readme instructions.

The Windows runner is required to:

1. run non-elevated;
2. verify candidate source identity;
3. prove at least one authoritative R5.1 baseline source remains recoverable by content identity;
4. verify the protected production Workbench SHA-256;
5. recover the approved Signalproof logo by content identity;
6. run protected-state static checks;
7. stage a fresh candidate evidence lane;
8. compile with the existing exact .NET Framework compiler;
9. run R6-G1 self-tests including closed and malformed fenced-code fixtures;
10. run the governed Governor/Core/Granite transport regression;
11. re-verify production identity unchanged;
12. write machine-acceptance evidence and package the exact tested candidate;
13. launch the exact tested candidate only after machine gates PASS.

## Acceptance boundary

Current state:

`COMPLETE / DEBUGGING / WINDOWS MACHINE GATE NEXT`

Do not claim automated PASS until the owner workstation runner returns PASS. Do not claim human UI PASS until the owner reports the exact candidate is working and properly usable.

No production deployment, public release, protected-main bypass, canonical Build Ledger append, candidate-skill activation, credential acquisition, privilege escalation, or security weakening is authorized or implied.
