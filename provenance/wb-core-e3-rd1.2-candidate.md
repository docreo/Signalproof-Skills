# Workbench Core E3 RD1.2 - Safe-Partial Correction Candidate

**Status:** BUILD SPAWN DEBUG / AUTOMATED CANDIDATE READY / FRESH PRODUCTION AUTHORIZATION REQUIRED  
**Work stream:** Signalproof Workbench governed Core access  
**Git basis:** `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**Branch:** `candidate/wb-core-e3-rd1`

## Current observed production state

Read-only E3 Recovery Check RD1.1 produced:

`SAFE_PARTIAL / ORPHAN_TOKEN_AFTER_ROLLBACK`

Observed facts:

- protected Core unchanged;
- Core online on `127.0.0.1:43119` with matching live `serve-installed` activity lock;
- `clients.json` bytes exactly match the client-absent prestate;
- `clients.json` ACL does **not** match the old inherited ACL because the hardening survived;
- surviving `clients.json` ACL is inheritance-protected and has no broad write grant;
- Workbench Core client record absent;
- Workbench token file present, non-empty, and not read;
- token ACL inheritance protected;
- token broad write absent;
- Local Service read true;
- Local Service write false.

## Failure localization

E3 RD1.1 production work reached:

- Core stop PASS;
- stale-lock interpretation PASS;
- least-privilege client issuance PASS;
- client record exact `models:invoke` PASS;
- token created PASS;
- plaintext token not printed PASS;
- clients.json hardening PASS;
- token hardening PASS;
- Local Service token read PASS.

The harness then falsely reported Local Service write capability because its verifier used aggregate `FileSystemRights` masks containing `FullControl`, whose value includes read bits.

Rollback then restored client-registry bytes before failing on exact full-SDDL restoration for lack of `SeSecurityPrivilege`, leaving the verified safe partial state above.

## RD1.2 correction

Artifact: `B8A-E3-RD1.2.ps1`

SHA-256:

`63D37A409C03EE0DF331B9B0A4DB020BDF4A6C5FAEB01D905AC68FFB763FC11F`

Changes relative to RD1.1:

1. Binds the exact `SAFE_PARTIAL / ORPHAN_TOKEN_AFTER_ROLLBACK` evidence before actuation.
2. Treats the surviving hardened `clients.json` ACL as the accepted safe baseline rather than attempting to restore the weaker inherited DACL.
3. Requires the Workbench client to be absent and the orphan token to be present with exact bridge ACL before mutation.
4. After Core is quiesced and stale-lock state is verified, deletes only the orphan token without reading its contents.
5. Reissues exactly `signalproof.llm-workbench` with one scope: `models:invoke`.
6. Verifies the already-hardened `clients.json` ACL instead of rewriting it.
7. Reapplies the exact token ACL to the newly issued token.
8. Replaces aggregate ACL masks with constituent read/write capability-bit tests.
9. Replaces full-SDDL rollback with a safe client-absent recovery baseline: restore client-absent `clients.json` bytes, remove the token, preserve the hardened `clients.json` ACL, restart Core.
10. Uses fresh evidence lane `B8A-E3-EV-RD1.2`.

## Safety boundaries

RD1.2 does not:

- self-elevate;
- read plaintext token contents;
- query scheduled tasks as standard user;
- patch/restart the production Governor;
- call `/v1/models/invoke`;
- execute a model or Hermes;
- mutate the protected 39-file Core program;
- change protected main;
- activate Candidate knowledge;
- append the canonical Build Ledger.

## Authorization state

The prior production authorization was consumed by the material RD1.1 production failure. `/dsp build-spawn-debug` authorized the diagnosis and candidate correction work only.

RD1.2 therefore requires a fresh exact owner authorization for `production Core integration` before Windows execution.
