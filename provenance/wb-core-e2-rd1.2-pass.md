# Workbench Core E2 RD1.2 Runtime Acceptance

**Status:** AUTOMATED PASS / ISOLATED ADAPTER CONTRACT ACCEPTED  
**Work stream:** Signalproof Workbench governed Core access  
**Branch:** `candidate/wb-core-rd1`

## Runtime result

The owner executed `B8A-E2-CORE-RD1.2.ps1` on the target Windows environment under the normal non-Administrator Workbench user.

Observed terminal result:

- exact runner SHA/parser preflight PASS;
- protected Core preflight count 39 and all eight anchors exact;
- accepted Node runtime exact;
- embedded adapter candidate exact;
- embedded adapter test exact;
- process-argument micro-fixtures PASS;
- adapter syntax exit 0;
- adapter test syntax exit 0;
- adapter contract test exit 0;
- adapter result JSON parsed and reported PASS;
- positive loopback Core fixture returned HTTP 200 / `WOULD_EXECUTE`;
- six fail-closed negative cases passed;
- negative cases made zero Core HTTP calls;
- plaintext Core token was not returned;
- model execution false;
- Hermes execution false;
- production mutation false;
- loopback host exact `127.0.0.1`;
- Core route exact `/v1/models/invoke`;
- protected Core postflight count 39 and all anchors exact;
- terminal success banner printed;
- observed `E2 RD1.2 EXIT CODE: 0`.

## Acceptance claim

E2 establishes that the isolated Governor-to-Core adapter contract is viable and fail-closed for the stated scope.

Accepted architecture remains:

`Workbench -> Governor -> Governor-to-Core adapter -> Core /v1/models/invoke`.

The Core credential remains behind the Governor/adapter boundary and is not exposed to the Workbench.

## Failure history preserved

The accepted RD1.2 result does not erase prior harness failures:

1. RD1: `ProcessStartInfo.ArgumentList` unavailable under Windows PowerShell 5.1.
2. RD1.1: bounded `.Arguments` guard rejected the real whitespace path.
3. RD1.2: bounded whitespace quoting encoder plus micro-fixtures resolved the process-launch transport class.

Candidate learning remains governed separately and is not automatically promoted.

## Protected state

No production Governor request, production Core request, model execution, Hermes execution, production mutation, protected Core mutation, credential issuance, privilege/security-control change, protected-main mutation, Candidate activation, or canonical Build Ledger append occurred.

## Next gate

The isolated E2 contract is complete for its evidence class.

The next consequential step is a separately authorized production-integration phase that would need to:

- bind the adapter into the production Governor path;
- provision the Governor/adapter with least-privilege Core `models:invoke` access without exposing the credential to Workbench;
- preserve Workbench -> Governor authentication and Local Service runtime identity;
- prove the live Governor -> Core request path;
- verify Core independently enforces the Governor decision before model actuation;
- preserve rollback and protected Core invariants;
- keep production deployment, credential/access, privilege/security changes, and canonical Build Ledger actions within their separately authorized gates.

No production integration is authorized by this E2 acceptance record.
