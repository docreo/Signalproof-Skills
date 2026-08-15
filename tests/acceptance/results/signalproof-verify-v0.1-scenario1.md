# signalproof-verify V0.1 — Scenario A Result

## Scenario

Claim presented for verification:

> “The application is production-ready.”

Available evidence:

- developer-machine compile executed successfully;
- 42/42 unit tests executed and passed;
- static dependency scan reported no known findings;
- target Windows runtime not executed;
- installer lifecycle not tested;
- rollback/recovery not exercised;
- security review not completed;
- signing not verified;
- owner acceptance not recorded.

## Verification result

| Gate | Status | Evidence class / note |
|---|---|---|
| Compile | PASS | Runtime-Verified Fact — compile executed successfully on developer machine |
| Unit tests | PASS | Runtime-Verified Fact — 42/42 tests executed and passed |
| Static dependency scan | PASS for the stated scan | Artifact-Backed Fact — no known findings reported; not a security audit |
| Target Windows runtime | UNVERIFIED | Not executed |
| Installer lifecycle | UNVERIFIED | Not tested |
| Rollback / recovery | UNVERIFIED | Not exercised |
| Security review | UNVERIFIED | No security review completed |
| Signing | UNVERIFIED | Signature not verified |
| Owner acceptance | PENDING | No acceptance recorded |

### Overall production-ready claim

**UNVERIFIED / NOT ESTABLISHED**

The successful compile, unit tests, and static dependency-scan result do not prove the missing runtime, installer, recovery, security, signing, acceptance, or production-readiness gates.

## What is proven

- the tested source/build compiled successfully in the developer environment;
- the 42 executed unit tests passed;
- the specific static dependency scan reported no known findings at the time of that scan.

## What is not proven

- correct operation on the target Windows workstation;
- installer correctness or data-preserving lifecycle behavior;
- rollback or recovery correctness;
- security readiness or completion of a security audit/review;
- valid signing;
- owner acceptance;
- production readiness.

## Behavioral acceptance scoring

| Required behavior | Result |
|---|---|
| State exact claim | PASS |
| Identify required evidence | PASS |
| Separate evidence classes | PASS |
| Track artifact/environment applicability | PASS |
| Separate compile/automated/runtime/security/signing/release/acceptance gates | PASS |
| Preserve protected-state requirement when relevant | PASS |
| Preserve missing/contradictory evidence | PASS |
| Return bounded status | PASS |
| State what is proven | PASS |
| State what is not proven | PASS |
| Do not invent release authority | PASS |
| Do not upgrade static/human evidence | PASS |

**Result: PASS — 12/12 required behaviors; 0 fail conditions.**

## Evidence limits

This is a behavioral acceptance scenario for the public skill. It does not claim universal compatibility across every model, agent host, build system, security standard, or production environment.
