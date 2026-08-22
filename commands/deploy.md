# `deploy` - Active Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`deploy` is the canonical command behind `/dsp deploy`.

It promotes the exact accepted candidate to the exact authorized distribution boundary through Active `signalproof-release`, then verifies the deployed identity/behavior required by that boundary and routes to closeout.

Canonical route:

`/dsp deploy -> deploy -> signalproof-release -> post-deploy signalproof-verify -> signalproof-closeout`

## Preconditions

Require all applicable items:

- exact candidate identity;
- required automated acceptance PASS;
- Human QC PASS when human usability/behavior is part of acceptance;
- rollback/recovery path appropriate to the deployment;
- intended distribution/deployment boundary;
- explicit current deployment authority, normally `/dsp authorize deploy` or equivalent bounded owner authorization;
- law, license, Terms of Service, platform policy, security, privacy, credential, signing, and publication prerequisites satisfied or explicitly non-applicable for the stated boundary.

Technical readiness without deployment authority is `READY / AWAITING AUTHORITY`, not permission to deploy.

## Required behavior

1. Refetch current Git/candidate/deployment state when consequential state may have changed.
2. Load the current State Capsule when available; validate exact candidate and acceptance identity.
3. Apply `signalproof-release` to the defined distribution boundary.
4. Reject artifact drift. If bytes/version/package changed after acceptance, route to affected reverification rather than deploying stale evidence.
5. Preserve the current verified rollback/recovery target.
6. Perform only the deployment actions explicitly authorized for the stated boundary.
7. Verify the deployed artifact/version/environment sufficiently to prove the deployment claim.
8. If post-deploy verification fails, preserve the failure, use bounded recovery/rollback when authorized and necessary, and do not claim success.
9. On PASS, preserve deployed identity, verification proof, recovery state, known limitations, and owner authority, then route through meaningful closeout and reusable learning when material.

## Cost rule

Do not replay the whole build matrix at deployment. Consume still-valid evidence bound to the exact candidate and run only deployment-specific or invalidated checks. Use deterministic identity/health checks before expensive investigation.

## Result

Return one of:

- `DEPLOYED / VERIFIED`
- `READY / AWAITING AUTHORITY`
- `REVERIFY CANDIDATE`
- `DEPLOYMENT FAILED / RECOVERY REQUIRED`
- `BLOCKED`
- `STOP`

A successful local build is not `DEPLOYED / VERIFIED` unless local use is the explicitly defined distribution boundary.

## Authority boundary

`deploy` cannot manufacture deployment authority, widen the distribution boundary, bypass access controls or protected-main rules, acquire unauthorized credentials, weaken security/recovery/provenance, violate law/license/Terms of Service, or fabricate post-deploy PASS.

## STOP conditions

STOP when deployment authority is absent or ambiguous; candidate identity/evidence binding is invalid; required Human QC is open; rollback/recovery is materially inadequate; legal/license/Terms of Service/security/privacy/signing/publication prerequisites block the action; the destination or credential boundary is outside authority; or post-deploy verification cannot honestly support the deployment claim.
