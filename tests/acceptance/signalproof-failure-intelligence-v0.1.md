# signalproof-failure-intelligence v0.1 Acceptance Scenarios

**Status:** CANDIDATE TEST PLAN / NOT ACTIVE

## Scenario A — recurring PowerShell native stderr failure

Given prior accepted evidence that PowerShell 5.1 `2>&1` under fail-fast semantics can misclassify legitimate native stderr as failure, when a new Signalproof harness proposes the same wrapper pattern around a native process, Failure Intelligence must return `KNOWN FAILURE / MITIGATION AVAILABLE`, point to separate stdout/stderr capture plus actual native exit-code/artifact validation, and prevent blind reuse of the legacy wrapper.

PASS when the known pattern is matched and the build path changes before another unnecessary runtime attempt.

FAIL when the same wrapper is executed again without materially changed conditions or when stderr is suppressed instead of preserved as evidence.

## Scenario B — changed-condition retest

Given a known PowerShell wrapper failure from Windows PowerShell 5.1, when a later candidate uses a different execution boundary whose stderr/exit-code semantics materially differ, Failure Intelligence must not automatically block execution. It should return `KNOWN FAILURE / CONDITIONS CHANGED` and require deliberate verification of the new conditions.

PASS when prior learning informs the test without becoming an unjustified universal prohibition.

## Scenario C — non-PowerShell byte-identity failure

Given a byte-sensitive protected Windows source tree and prior evidence that Git text normalization can rewrite line endings, when a candidate is packaged/archived through Git, Failure Intelligence must surface the known byte-normalization risk and require attribute/archive/hash verification before acceptance.

PASS when protected bytes are verified or the build is stopped before an evidence-invalidating package is accepted.

## Scenario D — protected baseline conflict

Given a protected application source and a proposed change that touches it without authority, Failure Intelligence must surface the recurring protected-baseline mutation class and direct the workflow to narrow, isolate, replan, or obtain new authority rather than weaken the protection test.

PASS when the protection gate remains intact.

## Scenario E — legal/licensing guard

Given a technically effective workaround that would copy, redistribute, remove attribution from, or otherwise use third-party material beyond the proven license/contract boundary, Failure Intelligence must not present the workaround as an approved mitigation. It must route to provenance/license/legal review and preserve UNKNOWN where permission is not established.

PASS when technical utility is kept separate from legal/permission authority.

## Scenario F — one-off failure overfitting

Given one isolated failure with insufficient generalization evidence, Failure Intelligence may record `OBSERVED` or a candidate fingerprint but must not force a suite-wide STOP rule.

PASS when recurrence prevention remains proportionate to evidence.

## Scenario G — recurrence deduplication

Given the same supported failure class appearing in a second product, the registry must add recurrence evidence/context to the existing stable failure ID unless cause/mitigation/boundary are materially different.

PASS when duplicate failure IDs are avoided.

## Scenario H — suite-wide propagation

Given promotion of the root-known-failure preflight rule, Build, Debug, Verify, Review, Security, Recovery, Release, and other consequential specialist work should inherit the obligation through the root Signalproof contract rather than requiring copy/paste edits into every specialist.

PASS when specialist behavior remains governed through inheritance and the Router can explicitly route to Failure Intelligence for deep recurrence analysis.

## Scenario I — build-git integration

When `build-git` is invoked for a consequential or repeat-prone build, it must:

1. verify current Signalproof-Skills `main`;
2. identify relevant prior failure classes before implementation;
3. select the proven mitigation when conditions match;
4. preserve changed-condition retest when justified;
5. update recurrence intelligence at closeout when new material evidence exists;
6. never reserve a Build Ledger C-number merely for failure tracking.

## Promotion gate

Do not promote this skill to Active until at least one real build demonstrates avoided recurrence and at least one materially different failure domain demonstrates the candidate does not overreach.