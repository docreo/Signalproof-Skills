# Signalproof Hermes Governor Build 8A - R3-C5 Log-Skill Record

**Status:** PUBLIC-SAFE LOG-SKILL RECORD  
**Lifecycle:** accepted recovered candidate; not a production activation; not a canonical Build Ledger append  
**Git basis:** `2b6e644800e9ea80b48990c0d9d1ea38755f2f6c`

## Work unit

Build 8A D3 registered-client bootstrap integration, recovered R3-C5 candidate.

Accepted security architecture remains:

`Pipe ACL + registered-client cryptographic challenge-response`

Local Service is retained. The accepted path does not use process opening, executable-path/hash authorization, client impersonation, WMI process identity, debug privilege, production activation, Hermes execution, or model execution.

## Acceptance evidence

The recovered R3-C5 evidence established the complete bounded authentication matrix:

- registered client -> Governor `ALLOW`;
- wrong key -> `DENY / SIGNATURE_INVALID`;
- wrong application ID -> `DENY / APPLICATION_ID_MISMATCH`;
- wrong capability -> `DENY / CAPABILITY_MISMATCH`;
- wrong/replayed nonce -> `DENY / NONCE_MISMATCH`;
- malformed signature -> `DENY / MALFORMED_SIGNATURE`;
- unregistered client -> `DENY / UNREGISTERED_CLIENT`.

The bounded integration server produced a clean completion record with one successful governed context, six authentication failures, bridge code zero, and empty stderr.

Independent recovery verification also established:

- frozen Governor parent project remained exact;
- protected Core remained exact under its accepted inventory/anchor contract;
- production Governor product/data roots remained absent;
- candidate bootstrap still used no OpenProcess, client impersonation, PID authorization query, or WMI process query;
- Pipe ACL, registered-client signature verification, and cryptographic nonce generation remained present;
- the registration fixture contained public-key material only and explicitly recorded private-key persistence as false.

## Review state

- **Implementation review:** PASS with recovered harness false-negative note
- **Security:** PASS
- **Permissions:** PASS under accepted D2 Local Service lineage
- **Verify:** PASS
- **Owner final debug gate:** accepted by subsequent `/dsp log-skill` continuation

## Preserved failure lineage

The successful candidate does not erase failed lanes. The following harness/tooling failures remain evidence:

1. heterogeneous response property dereference under StrictMode;
2. null/scalar `.Count` assumptions under StrictMode;
3. self-referential source-scan assertions matching their own forbidden literals;
4. interactive PowerShell submission patterns that were not accepted by the actual console path;
5. negative-test result contracts that collapsed `reason_codes` arrays into fragile scalar comparisons;
6. a final server-exit readout that reported failure after the server had already produced clean `COMPLETE` evidence;
7. a recovery verifier that rejected the metadata field `private_key_persisted=false` because of a broad text regex rather than structural field inspection.

These are classified as harness/verification defects unless independent evidence shows product/security failure.

## Existing known-error mappings

No duplicate Active IDs are created here. Existing catalog entries already cover major recurrence families, including:

- `KE-PS-PARSER-GENERATED-SCRIPT-001`;
- `KE-PS-NATIVE-STDERR-001`;
- `KE-HETEROGENEOUS-PROPERTY-001`;
- `KE-WINDOWS-PATH-NORMALIZATION-001`;
- `KE-STATIC-RUNTIME-CONFLATION-001`;
- `KE-REPEATED-FAILED-PATH-001`.

## New learning staged for governance

Two generalized lessons are staged as Candidate learning rather than auto-promoted:

1. **Evidence sufficiency termination:** once independent acceptance evidence proves the required product/security claim, a later harness/finalizer failure must be classified against its own evidence class and must not automatically regress the already-proven product claim or trigger a full replay.
2. **Executable known-error prevention:** prose-only known-error records are insufficient for high-frequency recurrence. Where a prevention rule is machine-checkable, `build-git` should route it into executable lint/preflight/contract tests before generated code is handed to the owner.

## Governance boundary

This `log-skill` record does not:

- reserve a canonical C-number;
- claim a canonical private Build Ledger append;
- activate a new Skill or Known Error;
- authorize production activation;
- authorize service/task installation, privilege escalation, permanent ACL changes, secrets, destructive cleanup, or protected-state mutation.

Private evidence, local paths, exact protected hashes, and canonical chronology remain outside this public-safe record.
