# Signalproof Build Identity

**Status:** ACTIVE POLICY AFTER GOVERNED MERGE  
**Owner:** Doc Reo

## Canonical V/RD rule

Signalproof product builds using the V/RD scheme use one canonical identity:

`V# / RD#`

Progression:

`V1/RD1 -> ... -> V1/RD9 -> V2/RD1 -> ...`

Rules:

- RD is limited to RD1 through RD9.
- There is no RD10.
- After `Vn/RD9`, advance to `V(n+1)/RD1`.
- A successive build advances the V/RD identity unless it is an exact byte-identical repackage of the same build.
- Verify the current accepted identity from current Git/Build Ledger evidence before advancing.
- Use the canonical identity consistently across artifacts, handoffs, UI labels, and release evidence.
- Preferred artifact name: `<Product>-V#-RD#.<ext>`.
- Descriptive suffixes such as FIX, FINAL, WINDOWS, or LOGIN-FIX belong in metadata/release notes, not the canonical build identity.
