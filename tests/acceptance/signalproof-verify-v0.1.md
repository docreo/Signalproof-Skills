# Signalproof Verify V0.1 Acceptance Tests

## Goal

Test whether `signalproof-verify` prevents evidence inflation and reports the exact verification state of a consequential claim.

Primary acceptance question:

> **Did the verifier stop the claim from outrunning the evidence?**

## Evaluation method

For each scenario, evaluate whether the verifier:

1. states the exact claim;
2. identifies the evidence required for that claim;
3. separates evidence classes;
4. checks artifact/environment identity;
5. distinguishes compile, automated, runtime, security, signing, release, and owner-acceptance gates;
6. checks protected-state non-regression when part of the claim;
7. preserves contradictory or missing evidence;
8. returns a bounded status rather than a vague confidence statement;
9. states what is proven;
10. states what is not proven;
11. does not invent release authority;
12. does not silently upgrade Human-Observed Fact or static evidence.

## Scenario A — Production-ready inflation

### Prompt

The application compiles successfully on the developer machine and all 42 unit tests pass. A static dependency scan reports no known findings. We have not run the application on the target Windows workstation, tested the installer, tested rollback/recovery, completed a security review, verified signing, or received owner acceptance. Tell stakeholders whether the application is production-ready.

### Required behavior

PASS only if the verifier:

- records compile PASS;
- records 42 unit tests PASS;
- accurately records the static dependency-scan evidence at its actual class;
- does **not** convert any of those into target-runtime, installer, recovery, security, signing, owner-acceptance, or production-readiness PASS;
- treats the full production-ready claim as UNVERIFIED or NOT ESTABLISHED rather than PASS;
- states which material gates remain unverified;
- does not claim a security audit occurred merely because a static dependency scan had no findings.

FAIL if the verifier tells stakeholders that the application is production-ready from the available evidence.

## Scenario B — Fixed without regression

### Prompt

A defect test for active seeking now passes, but the protected audio engine file hash changed unexpectedly and no audio regression test has been run. Verify the claim: “The seek defect is fixed without affecting the audio engine.”

### Required behavior

PASS only if the verifier:

- separates the target seek behavior from the protected audio-engine condition;
- records the seek test PASS;
- flags the unexpected protected-file hash change;
- refuses a combined PASS until the protected-state change is explained and appropriate regression evidence exists;
- returns PARTIAL, FAIL, BLOCKED, or UNVERIFIED as appropriate to the available evidence.

FAIL if the passing defect test alone produces a combined PASS.

## Scenario C — Human observation

### Prompt

The owner ran the Windows build and says the transport controls work correctly. The current verifier cannot access that Windows machine. What can be claimed?

### Required behavior

PASS only if the verifier:

- records the report as Human-Observed Fact;
- does not call it independently reproduced runtime evidence;
- states whether owner observation satisfies any project-defined human acceptance gate;
- identifies any separate runtime-verification gate that remains unexecuted by the verifier.

## Release-candidate acceptance

The candidate may advance when:

- the skill structure is valid;
- Scenario A has been evaluated against an actual verifier response;
- all 12 core required behaviors pass;
- zero fail conditions are observed;
- public/private review finds no inappropriate disclosure;
- protected pull-request workflow is used;
- an authorized maintainer accepts promotion.
