# Signalproof Windows Authenticode Execution Gate — Candidate V1/RD1

**Status:** CANDIDATE; requires review/merge before becoming active.
**Scope:** Every Signalproof-owned Windows deliverable containing executable PowerShell or a Windows executable for owner use, diagnostics, repair, installation, rollback, or public release.
**Trigger:** Owner's ReoFlow V2/RD2 Whisper diagnostic was blocked by PowerShell because the handed-off PS1 was unsigned.

## Rule

**Never hand an unsigned Windows PowerShell script to an operator as ready to execute under the Signalproof name.**

Author/build source files may remain unsigned while in Git or a controlled staging environment. An executable handoff is different: before labeling a Windows artifact `USER TEST READY`, `INSTALL READY`, `REPAIR READY`, or `RELEASE READY`, the exact files to be executed must have signatures valid on the intended Windows workstation under its effective execution policy.

If the signer is unavailable, deliver **SIGNING BLOCKED / DO NOT EXECUTE** and request the smallest missing prerequisite. Do not invent a signature, represent a SHA-256 checksum as signing, weaken execution policy, set `-ExecutionPolicy Bypass`, call `Unblock-File` as an unsigned-script fix, or install an untrusted certificate silently.

## Executable inputs covered

- All distributed `.ps1`, `.psm1`, `.psd1` when applicable, and PowerShell executable configuration/scripts, including diagnostics, maintenance and setup utilities.
- All product-owned compiled `.exe`, `.dll`, `.msi` and equivalent Windows installation, recovery, and updater binaries supported by Authenticode.
- Any child PowerShell scripts launched by a signed entrypoint. Signing the parent does not confer signature validity to a child.
- Vendor dependencies: validate vendor provenance, their signing where applicable, exact bytes and licenses; do not sign third-party binaries as though Signalproof authored them.
- A raw `.cmd`/`.bat` file does **not** satisfy the Authenticode gate. Ship a properly signed PowerShell entrypoint, MSI, or signed EXE bootstrapper instead; no wrapper that bypasses script checks.

## Signing architecture

1. Resolve and pin the approved publisher identity from the legally authorized Signalproof owner/publisher.
2. Use a trusted certificate with Code Signing EKU and a private key available only to the designated Windows signing station or an approved cloud/HSM signing service. Do not put private keys, tokens, PFX files, passwords or secrets in Git, archives, logs, evidence, or customer packages.
3. Compile and freeze the executable/source payload **before** applying Authenticode. Any post-sign change invalidates the signature.
4. Sign PowerShell with `Set-AuthenticodeSignature` using SHA-256 and an appropriate compatible timestamp service where supported. Sign PE/MSI artifacts with the approved Windows `signtool` or the established Microsoft Artifact Signing workflow; timestamp externally for releases.
5. Verify each exact signed artifact on Windows using `Get-AuthenticodeSignature` (PowerShell) or `signtool verify /pa /v` as appropriate. Require `Status=Valid`, an approved signer thumbprint/publisher, valid trust chain, and proper timestamp if required by the release profile.
6. Perform a signed-only launch test with the **effective** local policy. Verify the executable and every child script; capture signed-file hashes *after* signing and include them in a final manifest, along with protected rollback hashes.
7. Package only verified final bytes. Inspect the extracted package and rerun signature and manifest checks on exactly those extracted bytes.
8. Maintain separate gate reports: `SOURCE / STATIC PASS`, `SIGNED / TRUST PASS`, `WINDOWS EXECUTION PASS`, `HUMAN UI PASS`, and `PUBLIC RELEASE APPROVED`. Do not conflate them.

## Diagnostic and development caveat

On a machine with AllSigned, even a local PS1 needs a trusted publisher signature. On RemoteSigned, downloaded PS1 files may require one due to zone metadata. Determine the effective policy using `Get-ExecutionPolicy -List`; never infer the entire policy from the error string alone.

For a private owner workstation, a certificate trusted by that workstation *may* be viable after explicit security approval and enrollment. It is not the same as public-trust publisher signing and cannot be described as Microsoft-trusted or usable for general public release. Existing Greenlight documentation identifies an organization/public Microsoft Artifact Signing path for AI No Hype, LLC, but that status must be independently verified.

## Do-not-repeat preflight

Before the next executable Windows handoff:
- Are any executable `.ps1` files unsigned, have `UnknownError`, `NotTrusted`, `HashMismatch`, `NotSigned`, or an unexpected signer? **STOP.**
- Does any entrypoint hide unsigned nested scripts or rely on execution-policy bypass? **STOP.**
- Is the artifact signed but modified afterward (including line-ending normalization)? **STOP.**
- Does signing key identity, trust scope, timestamp, target OS or publisher remain unknown? **STOP and state what is missing.**
- Is there no trusted signing credential available? **SIGNING BLOCKED; do not issue an executable link labeled install/test ready.**

## Known-error fingerprint

`KE-WINDOWS-UNSIGNED-OPERATOR-HANDOFF-001`

**Evidence fingerprint:** Windows PowerShell reports `PSSecurityException` / `File ... is not digitally signed` for a Signalproof-distributed script before any product code executes.

**Cause category:** packaging / trust / signing gate missed, not Whisper, Obsidian, or product runtime.

**Mitigation:** approved Authenticode signer + final-byte verification + trusted execution test. Do not retry an unchanged unsigned script.

## Canonical references

- `docreo/Signalproof-Media-Studio/Signing/README.txt`
- `docreo/Signalproof-Media-Studio/SIGNING-STATUS.txt`
- `docreo/Greenlight/payload/Release-Signing/SIGNING-HANDOFF-AI-NO-HYPE.md`
- Microsoft Learn PowerShell `about_Execution_Policies`, `Set-AuthenticodeSignature`, and `Get-AuthenticodeSignature`.

**Governance:** This candidate provides a missing cross-product security gate. It does not imply possession of a signing certificate, alter workstation trust stores, authorize release, or modify any production deployment.
