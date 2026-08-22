# Signalproof Workbench RD2 R6 - G0 Source Authority Deduplication

**Date:** 2026-08-21  
**Status:** SOURCE AUTHORITY PROVEN BY CONTENT IDENTITY / COMPLETE ENVELOPE CONTINUES  
**Branch:** `candidate/workbench-rd2-gui-build`

## Evidence result

R6-G0 authoritative-material recovery RD3 executed on the owner workstation and proved the following protected state before discovery:

- non-elevated owner context;
- fresh RD3 evidence lane;
- Quarantine Evidence root present;
- production Workbench present;
- production Workbench SHA-256 remains exact.

The recovery scan found four loose C# files whose SHA-256 is exactly:

`B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12`

Paths reported:

1. `F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-GUI-RD2-R5.1\src\SignalproofWorkbenchGuiRd2.cs`
2. `F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-GUI-RD2-R5.1-PRESERVED-20260821-103336\src\SignalproofWorkbenchGuiRd2.cs`
3. `F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-GUI-RD2-R5.1-PRESERVED-20260821-104234\src\SignalproofWorkbenchGuiRd2.cs`
4. `F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-R6-G0-EV-RD3\recovered\SignalproofWorkbenchGuiRd2-R5.1-RECOVERED.cs`

Because all four files have the same cryptographic content identity, they are duplicate locations of one authoritative byte stream rather than competing source variants.

## Authority conclusion

Source authority is established at the byte level:

`AUTHORITATIVE R5.1 SOURCE SHA-256 = B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12`

Path multiplicity does not invalidate authority when all candidate paths are byte-identical and bind to the already-protected historical R5.1 source identity.

The prior RD3 selector's requirement for exactly one matching path was therefore overly strict. The correct discriminator is uniqueness of authoritative content identity, not uniqueness of filesystem location.

## Additional preserved identities

RD3 also found:

- exact H1 builder SHA-256 `D462707C7323E8D714109532F445734ED581115B773E6515232EE28E7A0236FA` in two loose locations and once inside the exact H1 package;
- exact H1 package SHA-256 `A89CBBC62E3C0061160D25F9A2E2322B3A8B03804210A030F10CD8EABCE3D74F` in one loose ZIP.

These duplicate builder locations likewise represent the same protected bytes.

## Failure-learning classification

Resolved failure sequence:

1. R6-G0 RD1 assumed exactly one historical source path inside the deterministic-scroll candidate root -> false artifact-layout assumption.
2. R6-G0 RD2 structural discovery proved that candidate root contains zero loose C# files.
3. RD2 bootstrap initially hid child diagnostics -> HARNESS / OBSERVABILITY defect, corrected with stream capture.
4. R6-G0 RD3 broadened only the evidence-discovery surface and found the authoritative source elsewhere in Quarantine Evidence.
5. RD3 path-count selector did not select source because four exact copies existed -> discriminator bug; source authority is nevertheless proven because all four hashes are identical.

Do not repeat the failed rule `exactly one path == authority` for immutable duplicate evidence. Prefer `exactly one accepted content identity` when duplicate locations contain byte-identical evidence.

## Complete state

`/dsp complete` remains active for the bounded Workbench R6 workstream.

Current state:

`COMPLETE / AUTHORIZED-PENDING-PRECONDITION`

The precondition is no longer source authority. Source authority is proven.

The remaining environment bridge is transfer of one exact authoritative R5.1 source byte stream into the Builder chat/runtime so the R6-G1 implementation can be generated and reviewed against the real source rather than through blind text transforms.

Preferred source path for transfer:

`F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-GUI-RD2-R5.1\src\SignalproofWorkbenchGuiRd2.cs`

Before Builder mutation, verify the uploaded/transferred file SHA-256 remains:

`B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12`

## Protected behavior remains

- `Workbench -> Governor -> Core -> Granite` remains protected;
- no direct Ollama/provider/process bypass;
- production Workbench remains unchanged;
- Sessions/Bots create/resume/rename/delete behavior remains protected;
- R5.1 transcript/composer non-overlap and native-scroll architecture remains protected;
- R6-G1 adds gutters/readable width/message rhythm/composer polish/mature scroll semantics and the owner-requested native code/artifact/context box treatment;
- no production deployment, protected-main bypass, canonical Build Ledger append, or release mutation is implied.
