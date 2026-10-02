# Repeated Legacy Transport Failure -> Implementation-Class Migration — Candidate Learning

**Status:** CANDIDATE  
**Source domain:** local media/audio transport, Windows compatibility, governed migration  
**Lifecycle:** DISCOVERED -> CANDIDATE; not Active doctrine

## Failure pattern

A legacy media transport can fail through several apparently different symptoms while still representing one architectural failure family. Examples include path/filename incompatibility, unsupported device-specific commands, and lifecycle/device-state loss during pause/resume.

Treating each symptom as a wholly separate bug can produce an endless compatibility-patch chain even after the implementation class itself has become the dominant risk.

## Candidate principles

### 1. Track the failure family, not only the latest error code

Preserve the sequence of failures and ask whether they share the same transport, API family, device model, or lifecycle boundary. A different error code does not automatically reset the retry identity.

### 2. Apply the repeated-path rule at the implementation-class level

When materially distinct patches against the same legacy path keep exposing the next compatibility failure, stop extending that path. Choose a materially different implementation class with a stronger platform/runtime fit.

### 3. Preserve accepted surfaces while migrating the failing surface

Do not replace a separately accepted playback surface merely because another surface using related legacy code is failing. Isolate the migration to the bounded failing workflow, then migrate other surfaces under their own evidence and acceptance gates.

### 4. Use the platform-appropriate backend deliberately

For Windows production audio, restrict the new audio component to the intended Windows backend rather than compiling unrelated cross-platform backends. Keep the component local-only and pin/hash its third-party source and manifest identity.

### 5. Require an executable platform probe before human handoff

Cross-build and static source inspection are not enough for output-device readiness. Before `USER UI TEST READY`, run a bounded native probe on the target platform that initializes the real output backend and exercises the required transport lifecycle.

### 6. Registry availability is not the same as actual playback

A capability registry may prove that a component's manifest, path, hash, and provenance are valid. Separately prove that the native component can initialize the target audio backend and perform the runtime behavior the UI depends on.

### 7. Do not weaken provenance to ease migration

A new transport should retain or improve the existing controls: exact third-party pin, strict manifest decoding, executable hash binding, local path containment, no hidden network/model fallback, and explicit capability registration.

## Regression candidates

- repeated legacy failures remain one carried-forward failure family across error-code changes;
- failing production-preview transport can migrate without altering a separately accepted project-audition transport;
- new Windows player source enables only the intended backend;
- strict component manifest includes source provenance and executable hash;
- native target-platform output probe is required before human UI handoff;
- capability registry fails closed on manifest/hash/backend drift;
- UI transport uses the new component and does not silently fall back to the retired legacy path.

## Governance note

This candidate is reusable public-safe engineering learning. Private artifact hashes, workstation paths, user screenshots, and Build Ledger chronology remain private evidence. Candidate status does not authorize automatic activation.
