# Workbench Core E2 RD1

**Status:** CANDIDATE / AUTHORING TEST PASS / WINDOWS ACCEPTANCE PENDING  
**Work stream:** Signalproof Workbench governed Core access  
**Git basis:** `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`  
**Branch:** `candidate/wb-core-rd1`

## Objective

Build the smallest isolated Governor-to-Core adapter contract after E1 established that the production Governor has no Core bridge.

Durable path remains:

`Workbench -> Governor -> Core -> approved capability`.

The Workbench must not receive a Core credential or gain a direct Core/network route.

## Accepted upstream contract

Prior D1/D1-R2 accepted evidence established the Core route body and enforcement boundary:

- `POST /v1/models/invoke`;
- Core client authentication with scope `models:invoke`;
- body contains `governor_request`, `governor_decision`, and `model_input`;
- Core `GovernorDecisionEnforcer` independently consumes the signed Governor ALLOW and request binding before model actuation;
- replay/tamper/unsigned requests fail before actuation.

E2 reuses that contract rather than inventing a new Core API.

## Candidate adapter

Candidate source identity:

`governor-core-adapter.js`

SHA-256:

`77CDC72234D15C4E240E8E86014A007F6C50D5B979043C6AB00475DC266E99F0`

Candidate test identity:

`governor-core-adapter.test.js`

SHA-256:

`202E75F0456EA458FCEA2113406A1458A4DC00B1C5F1B37FDD9AE9475DABB02E`

Windows E2 runner:

`B8A-E2-CORE-RD1.ps1`

SHA-256:

`B82DC8A85C975FDE36EF24A7C252BFCFE76BA2764181A79B382838E813EE1E5A`

## Adapter contract

The adapter:

- permits only loopback host `127.0.0.1`;
- uses exact Core route `/v1/models/invoke`;
- requires Governor decision `ALLOW`;
- binds application ID between request and decision;
- requires capability `agent.hermes.governed-worker`;
- requires operation `local_text_request`;
- requires exactly permission `local_text_input` in request and decision;
- accepts `model_input` only as structured input;
- reads the Core credential from a trusted local token path supplied to the adapter runtime;
- does not accept the Core token from the Workbench request;
- sends the accepted D1-style body to Core;
- does not hard-code Ollama or Hermes executable paths;
- does not return the plaintext Core token.

## Authoring-environment test

Node syntax validation passed for both adapter and test source.

Behavioral fixture passed:

- positive loopback POST returned HTTP 200;
- positive fixture returned `WOULD_EXECUTE`;
- six fail-closed negative cases passed;
- negative cases produced zero Core HTTP calls;
- plaintext token returned: false;
- model executed: false;
- Hermes executed: false;
- production mutation: false.

The authoring-environment fixture is not Windows/runtime acceptance.

## Windows runner scope

E2 RD1 stages only the isolated candidate under the Quarantine Evidence root, verifies accepted Node identity, validates Node syntax, runs the isolated loopback fixture, and verifies the protected 39-file Core baseline before and after.

It does not:

- call the production Governor;
- call the production Core;
- issue/read a production Core credential;
- modify the production Workbench;
- modify the production Governor;
- execute Hermes or a model;
- mutate protected Core;
- append the canonical Build Ledger.

## Static recurrence checks

Authoring checks found:

- no leading rejected `& {` operator wrapper;
- no assignment to `$Host`;
- no unsafe direct `.Count` dereference;
- no standalone split `else` submission;
- controlled output ASCII / no U+2014.

Exact Windows PowerShell parser validation of the staged runner remains required.

## Next gate

Run E2 RD1 once as the normal non-Administrator Workbench user after SHA-256 and exact-final parser validation.

If E2 passes, production integration is still a separate authority gate because it will require selecting/using the real Core client credential and changing the production Governor execution surface.
