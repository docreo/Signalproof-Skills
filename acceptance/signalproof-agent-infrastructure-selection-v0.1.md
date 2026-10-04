# Signalproof Agent Infrastructure Selection V0.1 Acceptance

**Candidate:** `signalproof-agent-infrastructure-selection` 0.1.0  
**Status:** CANDIDATE / NOT ACTIVE  
**Evidence date:** 2026-08-28  
**Related Candidate:** `signalproof-hermes-vps-builder` 0.1.0  
**Purpose:** preserve the infrastructure-selection and repeatable-deployment doctrine developed after the first governed Hermes VPS build without prematurely standardizing one provider.

## Source/Git Reconciliation

Current public command authority was reconciled before this extension:

- `/dsp complete` preserves protected state and Candidate-activation boundaries;
- `/dsp log-skill` allows staged/noncanonical learning preservation but does not auto-activate a Candidate;
- the existing draft PR #162 already contains `signalproof-hermes-vps-builder` 0.1.0 and its first-build acceptance evidence;
- the existing Hermes VPS Builder `SKILL.md` is 14,125 UTF-8 bytes and is already in the Signalproof decomposition/conciseness review band.

Disposition: do not materially expand the existing Hermes VPS Builder. Extract provider/region/fleet selection into this smaller companion Candidate.

## Current External Evidence

### Hostinger

Official Hostinger documentation reviewed 2026-08-28 states:

- VPS locations include U.S. Phoenix and Boston;
- VPS is also available in multiple European, Asian and Brazilian locations;
- VPS location is fixed after initial setup;
- moving a VPS to another data center requires backup/reinstall.

Source:
https://www.hostinger.com/support/1583267-where-are-hostinger-servers-located/

Accepted conclusion:

- Hostinger is not "Europe-only";
- the current Signalproof Hermes VPS remains the reference/learning deployment;
- its actual provisioned data-center location is still `UNKNOWN` until verified from the provider control plane;
- no rebuild is justified solely to align the reference deployment with a later provider preference.

### Orgo

Official Orgo materials reviewed 2026-08-28 state that Orgo provides persistent cloud computers for AI agents and identifies Hermes as an agent-hosting use case. Current product materials include templates, computer cloning, fleet management, isolated workspaces/VMs, secrets management, and scalable Linux/Windows offerings.

Orgo's privacy policy states Organic Intelligence, Inc. is a Delaware corporation with its principal place of business in San Francisco and that its infrastructure is built and operated in the United States.

Sources:
https://www.orgo.ai/
https://www.orgo.ai/privacy
https://www.orgo.ai/pricing

Accepted conclusion:

- Orgo is the preferred first **production-evaluation target** for the client deployment model;
- Orgo is not yet a Signalproof default production provider;
- a pilot must prove actual workload fit, recovery/export, network controls, secrets behavior, client isolation, support, cost and repeatability before default-provider designation.

## Hermes/Linux Known-Error Preflight

Current upstream issue evidence reviewed 2026-08-28 includes:

- #78574 — Linux default gateway can remain stale after `hermes update`;
- #46276 — per-profile user gateway units can drift due PATH mismatch;
- #25282 — update can regenerate systemd paths around the CLI user rather than the intended service account in affected service-account setups;
- #92145 — update restart failure can leave a process running with stale modules against new source.

References:
https://github.com/NousResearch/hermes-agent/issues/78574
https://github.com/NousResearch/hermes-agent/issues/46276
https://github.com/NousResearch/hermes-agent/issues/25282
https://github.com/NousResearch/hermes-agent/issues/92145

Acceptance consequence: a clean updater message is not sufficient proof. Persistent Linux Hermes deployments require service/PID/source/home reconciliation after consequential update work.

## Strategic Deployment Disposition

The current repeatable deployment model is:

1. **Hostinger reference build** — preserve and keep learning from the current working VPS.
2. **Signalproof portable deployment profile** — make provider, region, compute, network, access, recovery, cost and reconstruction explicit before future builds.
3. **Orgo production-evaluation pilot** — use as the first candidate for client-facing repeatable agent infrastructure because its current U.S.-infrastructure statement plus cloning/templates/fleet management align with the business model.
4. **Provider neutrality** — canonical Signalproof state and recovery must remain portable.
5. **Triggered provider radar** — do not continuously chase vendors. Re-evaluate when a client requirement, cost shift, security event, capacity block, material feature improvement or contract/privacy change makes the decision material.

## Deployment Profile Fields Accepted for Candidate Testing

Before a production/client build, capture:

- provider and service type;
- selected/verified region;
- OS and resources;
- public/private network surface;
- access/identity/least-privilege model;
- provider and host firewall responsibilities;
- backup/restore and reconstruction;
- templates/cloning/fleet capability;
- secrets handling;
- monitoring/logging;
- cost/bandwidth assumptions;
- documented residency/privacy commitments;
- portability/exit path;
- evidence verification date.

`UNKNOWN` is an allowed value. Inference is not.

## Skill Architecture Check

- new Candidate exact UTF-8 bytes: **10,435**;
- budget state: **below 12,000-byte decomposition review band — PASS**;
- existing Hermes VPS Builder bytes: **14,125**, unchanged;
- decomposition decision: **PASS** — infrastructure/provider selection is independently routeable and should not materially enlarge the Hermes install/hardening specialist;
- duplicate doctrine: avoided by inheriting Readiness, Research, Evaluate, Security, Recovery, Document and Hermes VPS Builder;
- activation: none;
- public-main mutation: none;
- rollback: close the draft PR/branch to remove Candidate changes.

## Promotion Gates Still Open

1. actual current Hostinger VPS region verified and recorded;
2. clean Orgo Hermes pilot completed;
3. same deployment-profile structure used on both environments;
4. provider-specific commands isolated from core doctrine;
5. backup/reconstruction exercised;
6. client isolation/secrets verified;
7. observed cost compared with assumptions;
8. normal Signalproof Candidate review and owner approval.

## Current Disposition

**CANDIDATE / LEARNING LOGGED / NOT ACTIVE.**

This record supports a repeatable client-deployment architecture, not a provider commitment or public production-readiness claim.
