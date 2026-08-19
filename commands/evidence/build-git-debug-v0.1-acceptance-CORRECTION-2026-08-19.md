# build-git-debug V0.1 Acceptance Evidence Correction — 2026-08-19

**Status:** CORRECTION / SUPERSESSION NOTE  
**Applies to:** `commands/evidence/build-git-debug-v0.1-acceptance-2026-08-19.md`  
**Command:** `build-git-debug`  
**Candidate branch:** `command-build-git-debug-v0.1`

## Why this correction exists

The earlier Candidate acceptance note contains an internally inconsistent SHA-256 narrative for `Signalproof-Core-Control-Center.ps1`:

- it records a console-observed expected-length failure of **61** characters;
- it then prints a value that visually appears to be a valid 64-character SHA-256;
- it records a purported “corrected live” value containing an inserted `FD0` sequence that is **67 characters**, despite labeling it as 64 characters.

That 67-character value is not a valid SHA-256 and must not be reused as authority.

This correction preserves the historical note rather than silently overwriting it, consistent with immutable evidence-path discipline.

## Trusted live value

The direct read-only PowerShell triage captured the protected Control Center file at:

`223A93B9979FD0FD94733A1E848A629B0989090EB22894337EEB8F026BCCAC44`

Machine-checked length: **64 hexadecimal characters**.

The final successful C1 recovery runner later reported all eight protected-anchor SHA-256 literal-shape checks PASS and both preflight and final two-read protected-state verification PASS, including `Signalproof-Core-Control-Center.ps1`.

## What can and cannot be claimed

Supported:

- the R3-R1 runtime reported `Len Exp: 61` and two 64-character actual hashes;
- the protected Control Center live hash above is 64 hex characters;
- the later R3-R2 recovery machine-validated the protected anchor SHA-256 literals as 64 hex and completed successfully;
- protected Core remained unchanged at the accepted C1 tail closeout.

Not supported:

- a specific reconstructed 61-character malformed literal. The console-rendered `Expected:` line does not reliably preserve such a 61-character byte sequence;
- the previously recorded 67-character `...9090FD0...` value as any SHA-256 authority.

## Corrected acceptance interpretation

The Build 8A incident still supports the `build-git-debug` requirement that authority-critical literals be machine-validated for shape/length before operator handoff. However, the public evidence should describe the defect as:

> **A reproducible protected-hash expectation/validation inconsistency in R3-R1, where runtime reported expected length 61 while the live hash was independently verified as a valid 64-character SHA-256. The subsequent R3-R2 path added mandatory 64-hex literal-shape validation and completed successfully.**

Do not use the historical note’s reconstructed malformed/corrected literal pair for future hash authority.

## Current frozen C1 identities unaffected by this correction

- Candidate source SHA-256: `D7FA3544EBF2A9DA3A98E3066C90CCCD4269C68A4CAFEC5C0679070C462DDB52`
- Manifest SHA-256: `3568845AE10295C68F08A9E6CB025447C1590C8A67D58E789072CD9F2AD9014C`
- Evidence SHA-256: `ED09CB878339A19198ECD14D42C69D68870EEFEA6B2B3BDAC0BBFE14D223E494`
- Report SHA-256: `9CF99FF6851894DAD7C58E78DCAE852198811EAB7E1B6172F53A2B3A0D154C83`
- Final successful recovery runner SHA-256: `A8DF6A9861A75AE6A3873F7264DA607CA3BBEFAE588D7507BA1D2C181A56208D`

## Governance

This correction:

- does not modify protected Core Runtime;
- does not change the frozen C1 candidate artifacts;
- does not authorize Hermes/model execution;
- does not accept C1;
- does not activate `build-git-debug` or `log-build-git-debug`;
- does not create a canonical private Build Ledger event.

For hash identity, this correction supersedes the malformed/corrected literal pair in the earlier public acceptance note.