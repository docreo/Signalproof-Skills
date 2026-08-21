# Workbench Core E4 RD2.2 - Strict Real Governed Model PASS

**Status:** AUTOMATED PASS / USER UI TEST READY  
**Work stream:** Signalproof Workbench governed local model path

## Production correction PASS

E4 RD2.2 completed successfully with exit code `0`.

Installed production identities:

- Governor server SHA-256: `F966D5DE6BD3009BCE4C3D5BC25D1D91F46239320975B31147F54BCBF4C41616`
- Governor-Core adapter SHA-256: `C440EB58D3592A3BB081138C05067E87886228EE070D88A8F88F7178DCE17E7C`
- Governor accepted manifest SHA-256: `A9BE4C193F615B4745ADF37BDF9F815CEE24FC986C5C850554D3AE07902B5F8F`

RD2.2 corrected the model input contract by flattening `capability` and `prompt` to the top-level Core request body while preserving `governor_request` and `governor_decision` evidence. It also changed the Governor response seam to return actual non-empty model text only and fail closed on empty generation.

Protected Core remained unchanged and online on the accepted loopback endpoint.

## Strict real-model verifier PASS

E4 V RD2.2 completed successfully with exit code `0`.

Observed strict runtime path:

`Workbench registered-client protocol -> Governor -> Core PEP -> general_reasoning -> local model`

Verifier facts:

- normal non-elevated Workbench user: PASS
- connected to production Governor pipe: PASS
- challenge protocol/fingerprint/nonce: PASS
- registered-client authentication: PASS
- Governor returned a JSON string model response rather than metadata object: PASS
- actual model text non-empty: PASS
- prior `general_reasoning` metadata false positive excluded: PASS
- raw load-only Core JSON excluded: PASS
- raw Core response object excluded: PASS

Actual model text:

`The Signalproof governed local model is working.`

Disposition:

`STRICT REAL GOVERNED MODEL TEXT PASS`

Evidence paths:

- `F:\Downloads\Quarantine\Evidence\B8A-E4-RD2.2-EV\E4-RD2.2-EVIDENCE.json`
- `F:\Downloads\Quarantine\Evidence\B8A-E4-V-EV-RD2.2\E4-V-EVIDENCE.json`

## Remaining gate

The remaining acceptance gate is the real Workbench GUI user observation:

1. launch production Workbench as the normal user;
2. send a short prompt such as `yo`;
3. verify the visible response is normal model prose rather than raw Core JSON or Governor control JSON;
4. send a second prompt and verify continued usability.

No canonical Build Ledger append, Candidate activation, protected-main mutation, or unrelated release work is implied by this record.
