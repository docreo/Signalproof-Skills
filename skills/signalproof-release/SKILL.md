---
name: signalproof-release
description: Govern whether an exact accepted artifact may be promoted or distributed by checking artifact identity, provenance, acceptance evidence, security/recovery gates, versioning, checksums/signatures where applicable, rollback designation, release notes, distribution scope, owner authority, and non-claims. Use when deciding whether a candidate is actually release-ready or when preparing a controlled release without overstating evidence.
---

# Signalproof Release

## Purpose

`signalproof-release` is the release-governance specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

Its central rule is:

> **Release only the exact accepted artifact, with provenance and recovery, and never make a stronger release claim than the evidence supports.**

A build may compile, test, verify, review, and pass scoped security gates while still not be releasable. Release is a separate authority and evidence boundary.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, verification, review, recovery, security, milestone closeout, STOP conditions, public/private boundaries, proof, and continuity.

Release governance does not create authority to publish, sign, deploy, overwrite distribution channels, rotate rollback baselines, or change customer-facing claims without the required human/project authority.

## Release Contract

1. **Identify the exact release candidate.** Record version, build/commit, artifact path/name, and immutable digest when applicable.
2. **Bind evidence to that exact artifact.** Acceptance evidence from another build, branch, package, environment, or rebuild does not silently transfer.
3. **Require the project-defined acceptance gates.** Compile, tests, runtime, Verify, Review, Security, Recovery, installer, signing, owner acceptance, or other gates remain distinct.
4. **Reject post-acceptance artifact drift.** If the bytes changed after acceptance, the new artifact is a new candidate and must be re-evaluated to the affected boundary.
5. **Preserve provenance.** Record source commit/ref, build process, toolchain/runtime identity when material, artifact hashes, dependency/package identity, and evidence locations.
6. **Preserve rollback.** A release should not destroy or overwrite the last verified rollback; designate the recovery target and verify its identity before promotion.
7. **Keep version identity coherent.** Product version, package name, manifests, installer metadata, release notes, and published labels must refer to the same release identity.
8. **Use checksums and signatures accurately.** Hashes prove byte identity; signatures prove the checked signer/integrity relationship. Neither alone proves functional or security readiness.
9. **Require truthful release notes.** State what changed, what was verified, known limitations/open gates, recovery information, and no stronger claims than evidence permits.
10. **Separate release authorization from technical readiness.** A technically releasable candidate may still be awaiting owner/business/legal/publication authority.
11. **Control distribution scope.** Internal R&D, alpha, beta, limited evaluation, public release, and production deployment are different release boundaries.
12. **Preserve release evidence.** Keep acceptance reports, hashes, provenance, known failures, rollback identity, release notes, and owner decision trace.
13. **Do not erase failed/rejected candidates.** Preserve enough evidence to explain why they were not released and to prevent accidental re-promotion.
14. **Close the release milestone.** After a meaningful release/promotion decision, route through `signalproof-closeout` before the next development phase.

## Release Workflow

### 1. Declare Release Intent

Capture:

- release name/version;
- intended audience/distribution boundary;
- exact artifact(s);
- source repository/ref/commit;
- owner/release authority;
- required acceptance gates;
- current rollback target;
- publication/deployment destination when authorized.

Do not begin by uploading or publishing.

### 2. Freeze Candidate Identity

For every release artifact record, as applicable:

- filename;
- size;
- SHA-256;
- package/archive inventory;
- executable/installer version metadata;
- source commit/build ID;
- build timestamp only as supporting metadata, not identity authority;
- signature state;
- SBOM/license/provenance references where required.

Once acceptance evidence is bound to a digest, rebuilding/repacking/re-signing/changing bytes creates a new artifact identity that may require re-verification.

### 3. Build the Release Gate Matrix

Use project-defined gates. Example:

```text
RELEASE CANDIDATE
├── source/build identity       PASS
├── compile/build               PASS
├── automated tests             PASS
├── target runtime              PASS / N-A / UNVERIFIED
├── verification               PASS
├── review                     PASS
├── security                   SCOPED PASS
├── recovery/rollback          PASS
├── installer/package          PASS / N-A
├── signature                  PASS / PENDING / N-A
├── release notes              PASS
├── owner acceptance           PASS / PENDING
└── distribution authority     PASS / PENDING
```

A release decision must not collapse distinct gates into one generic “green.”

### 4. Verify Evidence Binding

For each material gate ask:

- Does this evidence apply to the exact candidate bytes/version?
- Was the artifact rebuilt or repackaged afterward?
- Does the test environment match the claim?
- Does the acceptance result have a durable artifact/ref identity?
- Are there unresolved contradictory results?

If the exact release artifact cannot be tied to the acceptance evidence, mark the release **BLOCKED / REVERIFY CANDIDATE**.

### 5. Check Provenance and Supply Chain

Record proportionately:

- repository/commit/ref;
- build tooling/runtime versions;
- dependencies and lock/pin state;
- external binaries/models/assets;
- source/publisher/license where required;
- checksums/signatures;
- build/publish scripts;
- generated installer/package identity.

Do not introduce a new dependency, updater, signing tool, publishing helper, or packaging path during release without treating it as a material release change.

### 6. Verify Rollback Before Promotion

Confirm:

- rollback version/build identity;
- rollback artifact/tree digest where applicable;
- that it remains preserved and accessible;
- persistent user data compatibility;
- recovery procedure/evidence appropriate to the release;
- release action will not overwrite the only verified rollback.

Use `signalproof-recovery` if rollback trust or execution becomes the central problem.

### 7. Check Version and Packaging Coherence

Confirm that all release surfaces agree:

- app version;
- installer/package version;
- filenames;
- manifests;
- release notes/changelog;
- download labels;
- internal registry/provenance;
- tag/release name if used.

A mismatch is not cosmetic if it could cause the wrong artifact to be installed, supported, recovered, or audited.

### 8. Check Release Notes and Claims

Release notes should identify:

- version and release scope;
- material changes;
- accepted evidence/gates;
- known limitations and open gates;
- rollback/recovery note;
- compatibility boundary when established;
- security/signing state accurately;
- migration/data-impact notes where relevant.

Do not state:

- “production-ready” when production gates were not all satisfied;
- “secure” because a scanner/security review was scoped and passed;
- “signed” when signature verification is pending;
- “works everywhere” from one environment;
- “no known issues” when unresolved failures are preserved.

### 9. Confirm Signing / Integrity State

When signing is required, record:

- exact signed artifact identity;
- expected signer/certificate/publisher;
- verification result;
- timestamp state when relevant;
- whether signing changed the artifact bytes and therefore which digest is authoritative for distribution.

When signing is not required for the current R&D boundary, say so explicitly rather than pretending it passed.

### 10. Confirm Authority and Distribution Boundary

Distinguish:

- technically ready;
- owner accepted;
- authorized for internal evaluation;
- authorized for limited external testing;
- authorized for public distribution;
- authorized for production deployment.

Do not infer one from another.

### 11. Release Decision

Return one of:

- **RELEASE READY** — all required gates for the defined distribution boundary pass and authority is present.
- **READY / AWAITING AUTHORITY** — technical/evidence gates pass, but publication/deployment authorization is pending.
- **READY FOR LIMITED SCOPE** — accepted only for a narrower distribution boundary such as R&D/alpha/evaluation.
- **REVERIFY CANDIDATE** — artifact identity changed or evidence is bound to a different candidate.
- **RELEASE CHANGES REQUIRED** — release metadata, packaging, provenance, notes, rollback, or required gate needs correction.
- **BLOCKED** — a required release gate/evidence source is unavailable or unresolved.
- **STOP** — release would knowingly publish the wrong/unverified artifact, destroy rollback, expose protected material, bypass a required security/signing gate, or exceed authority.

### 12. Promote and Preserve Evidence

Only after the applicable decision authorizes release:

- publish/distribute the exact accepted artifact;
- preserve final digest/signature/provenance;
- preserve release notes;
- preserve rollback designation;
- record owner decision;
- update Build Ledger canonically when live authority is verified, otherwise stage a noncanonical delta;
- close the milestone before opening the next phase.

## Artifact Drift Rule

If any accepted artifact is rebuilt, repacked, patched, re-signed, installer-wrapped, or otherwise changed after evidence was recorded:

```text
ACCEPTED ARTIFACT A
      ↓ bytes change
NEW ARTIFACT B
      ↓
EVIDENCE BINDING MUST BE RE-EVALUATED
```

Do not release B using A's evidence merely because the source code appears unchanged.

Reverification depth may be bounded to the effects of the change when that boundary is justified and documented.

## Release vs Verify, Review, Security, Recovery

`signalproof-verify` asks:
> **Is the specific claim proven?**

`signalproof-review` asks:
> **Is the work itself sound?**

`signalproof-security` asks:
> **Do material security-sensitive risks block the defined decision?**

`signalproof-recovery` asks:
> **Can we restore a trustworthy known-good state?**

`signalproof-release` asks:
> **May this exact accepted artifact be promoted to this exact distribution boundary, with truthful provenance, recovery, and claims?**

A PASS from another skill is an input to Release, not automatic release authority.

## Release Evidence Is Not Universal Certification

A successful release decision proves only that the project-defined release gates for the stated boundary were satisfied.

It does not automatically establish:

- legal/regulatory compliance;
- universal compatibility;
- vulnerability-free software;
- malware-free status beyond defined evidence;
- future security after environment/dependency changes;
- authorization for a broader deployment scope.

## STOP Conditions

Stop when:

- the release artifact does not match the accepted artifact identity;
- acceptance evidence belongs to another build/package/version;
- required rollback is missing, unverified, or would be overwritten;
- required security/signing/installer/runtime gate is unresolved;
- release notes materially overstate evidence;
- public/private or secret-bearing artifacts would be published;
- version/filename/manifest mismatch could cause artifact confusion;
- publisher/signing identity is unexpected or unverifiable where required;
- distribution scope exceeds owner authority;
- a failed/rejected candidate is being accidentally promoted;
- canonical evidence is being fabricated to make the release appear complete.

## Anti-Patterns

Fail this skill when Release:

- publishes a rebuilt ZIP using test evidence for an earlier ZIP;
- chooses an artifact by filename/date rather than immutable identity;
- treats compile/unit tests as full release readiness;
- treats Security SCOPED PASS as universal security certification;
- calls an unsigned artifact signed because signing is planned;
- overwrites the only known-good rollback during promotion;
- hides known limitations from release notes;
- changes dependencies/packaging during release without re-evaluation;
- publishes internal/private evidence or secrets;
- tags/releases a version whose metadata does not match the artifact;
- infers public-release authority from technical readiness;
- releases first and documents provenance afterward.

## Completion Criteria

Release governance is complete when the exact candidate identity, source/provenance, required gate matrix, evidence binding, review/security/recovery state, version/packaging coherence, checksum/signature state, rollback identity, release notes/non-claims, owner/distribution authority, release decision, final distributed artifact identity, and milestone evidence are explicit enough that another competent human or agent can determine exactly what was released, why it was authorized, how it can be verified, and how to recover from it.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-release`
- **Version:** `0.1.0-rc1`
- **Maturity:** Initial public release candidate
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-plan`, `signalproof-build`, `signalproof-verify`, `signalproof-review`, `signalproof-security`, `signalproof-recovery`, `signalproof-closeout`
- **Domain:** Release governance, artifact identity, evidence binding, provenance, versioning, checksums/signatures, rollback designation, release notes, distribution authority
- **Created by:** Doc Reo / Signalproof
