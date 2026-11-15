---
name: signalproof-agent-infrastructure-selection
description: Select and record the hosting, region, compute, access, recovery, security, cost, portability, and fleet-management profile for a persistent AI-agent deployment before build execution, without coupling Signalproof to one provider.
---

# Signalproof Agent Infrastructure Selection

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0  
**Parent:** `signalproof` 0.1.1+  
**Primary collaborators:** `signalproof-readiness`, `signalproof-research`, `signalproof-evaluate`, `signalproof-security`, `signalproof-recovery`, `signalproof-document`, `signalproof-hermes-vps-builder`

## Purpose

This Skill turns infrastructure choice into an explicit deployment gate instead of an accidental consequence of signup flow.

Its governing rule is:

> **Choose and record the environment before the agent build begins. A repeatable deployment must know where it runs, who operates the infrastructure, what can be recovered, and how the same workload can move elsewhere.**

The Skill is provider-neutral. Hostinger and Orgo are current reference cases, not permanent dependencies.

## Required Deployment Profile

Before a production or client build, record at minimum:

- client/workload identifier;
- provider and legal operating entity where relevant;
- service type: VPS, managed agent computer, dedicated host, cloud VM, or other;
- country/region/data-center location when available;
- operating system and version;
- CPU, RAM, storage and expansion limits;
- expected network path and latency needs;
- public/private listener expectations;
- SSH/RDP/VNC/dashboard access method;
- identity and least-privilege account model;
- provider firewall plus host firewall responsibilities;
- snapshot/backup/restore capability;
- template/clone/image capability;
- secrets-management capability;
- monitoring/logging capability;
- fleet/multi-client management capability;
- pricing basis and expected monthly operating range;
- bandwidth/egress constraints;
- data-residency/privacy commitments that are actually documented;
- DPA/compliance requirements when applicable;
- provider lock-in surfaces;
- reconstruction package and exit path;
- exact date the provider facts were verified.

Unknown fields must be marked `UNKNOWN`, not silently inferred.

## Environment Classes

- **Reference / Learning:** first working build, operator training, failure discovery and recovery rehearsal. Keep a stable reference server even if a later provider becomes preferable.
- **Production Evaluation:** prove region, least privilege, network boundary, runtime persistence, backup/restore, repeatability, cost, support, isolation and teardown/export.
- **Client Production:** use only after the provider/workload combination passes evaluation. Preserve provider replaceability.

## Region and Data-Residency Rule

Provider headquarters, UI language, customer IP address, and server location are different facts.

Do not infer one from another.

For every client deployment:

1. record the provider;
2. record the selected region/data center when the provider exposes it;
3. verify the actual provisioned region after creation when a trustworthy control-plane or service record exists;
4. record whether relocation is supported in place or requires rebuild/restore;
5. preserve a reconstruction/backup path before any migration;
6. do not promise a jurisdiction or data-residency property unless the provider documents it.

A U.S.-operated provider can be preferred for a U.S.-focused client base when that materially improves support, residency confidence, contracting, or operational fit, but the decision must remain evidence-based.

## Current Reference Disposition — 2026-08-28

### Hostinger

Current Signalproof use: **REFERENCE / LEARNING DEPLOYMENT**.

Current official Hostinger documentation states that VPS locations include U.S. Phoenix and Boston plus multiple European, Asian and Brazilian locations. It also states VPS location is fixed after initial setup; moving a VPS to another data center requires backup/reinstall rather than an in-place location change.

Signalproof consequence:

- keep the current working Hermes VPS as the reference build;
- do not rebuild it solely because its exact data center has not yet been recorded;
- verify and record the actual region when the control panel exposes it;
- require region capture before future client deployment acceptance.

Source reviewed 2026-08-28:
https://www.hostinger.com/support/1583267-where-are-hostinger-servers-located/

### Orgo

Current Signalproof use: **PREFERRED FIRST PRODUCTION EVALUATION TARGET / NOT YET DEFAULT**.

Current Orgo materials describe:

- always-on cloud computers for AI agents;
- Hermes as a supported agent-hosting use case;
- Linux on all current plans and Windows on Scale;
- templates;
- computer cloning;
- fleet management;
- isolated virtual machines;
- secrets management;
- live resource resizing.

Orgo's privacy policy states Organic Intelligence, Inc. is a Delaware corporation with its principal place of business in San Francisco and that its infrastructure is built and operated in the United States, including cloud infrastructure providers operated in the United States.

Signalproof consequence:

- Orgo is a strong first target for a client-production pilot;
- U.S. infrastructure is currently supported by provider documentation rather than inferred from branding;
- template/clone/fleet features align with the goal of repeatable multi-client deployment;
- a Signalproof pilot must still verify recovery, export/reconstruction, network controls, cost, support, secrets behavior, client isolation, and actual workload fit before Orgo becomes a default production standard.

Sources reviewed 2026-08-28:
https://www.orgo.ai/
https://www.orgo.ai/privacy
https://www.orgo.ai/pricing

## Provider Evaluation Matrix

Score evidence, not brand familiarity.

Required dimensions: workload, region, security, recovery, repeatability, fleet management, operator usability, cost, support, portability, governance, and contract/privacy fit.

Disposition values:

`PREFERRED | PILOT | ACCEPTABLE | WATCH | REJECT | UNKNOWN`

## Repeatable Deployment Contract

Infrastructure selection must feed a reusable deployment package.

Minimum package:

```text
deployment-profile/
  DEPLOYMENT-PROFILE.md
  PROVIDER-FACTS.md
  REGION-AND-NETWORK.md
  RESOURCE-MANIFEST.md
  ACCESS-MODEL.md
  BACKUP-AND-RECOVERY.md
  RECONSTRUCTION.md
  COST-ASSUMPTIONS.md
  KNOWN-ERRORS.md
  ACCEPTANCE.md
```

Provider-specific commands belong in provider adapters/docs. The core deployment profile should remain portable.

Signalproof-owned canonical state must not depend on a provider dashboard alone.

## Hermes/Linux Known-Error Preflight

For persistent Hermes Linux deployments, current upstream issue history shows update/service risks including stale running code after `hermes update`, systemd unit path drift, service-account path regeneration problems, and restart paths that leave gateways stopped or stale.

These are version- and condition-sensitive. Before consequential Hermes update:

1. check the current upstream release and relevant open/closed issues;
2. capture current service unit, PID, Hermes home and source identity;
3. confirm which account owns the service;
4. preserve rollback/reconstruction;
5. verify gateway restart and post-update source/process consistency;
6. do not accept a clean updater message as sufficient proof of a healthy supervised runtime.

Reference issues reviewed 2026-08-28:
https://github.com/NousResearch/hermes-agent/issues/78574
https://github.com/NousResearch/hermes-agent/issues/46276
https://github.com/NousResearch/hermes-agent/issues/25282
https://github.com/NousResearch/hermes-agent/issues/92145

## Competition / Provider-Radar Rule

Do not continuously chase every infrastructure vendor when the market decision is not material to the current build.

Use a triggered scan when:

- a new client requirement appears;
- region/residency requirements change;
- current provider cost materially changes;
- a provider outage/security event changes risk;
- capacity or platform features block the workload;
- a materially better repeatability/fleet feature emerges;
- contract/privacy requirements change.

Otherwise, keep the reference deployment stable and spend effort improving the portable Signalproof deployment standard.

## Separation of Authority

This Skill selects and records infrastructure. It does not:

- install Hermes by itself;
- grant provider credentials;
- authorize production deployment;
- expose dashboards publicly;
- weaken host/provider firewall controls;
- decide that provider marketing is verified evidence;
- promote a Candidate provider into a permanent standard;
- replace `signalproof-hermes-vps-builder` for Hermes-specific install/hardening/recovery gates.

## Acceptance Requirements Before Promotion

1. current Hostinger reference deployment has its actual region recorded;
2. one clean Orgo Hermes production-evaluation pilot completes;
3. the same Signalproof deployment profile is used for both environments;
4. provider-specific differences are isolated from core deployment doctrine;
5. backup/reconstruction is exercised on at least one environment;
6. client isolation and secrets boundaries are verified;
7. cost assumptions are compared with observed billing;
8. current Hermes update/service known-error checks prevent at least one unsafe or ambiguous operation;
9. normal Signalproof review and owner approval occur.

## STOP Conditions

STOP when:

- required region/residency cannot be verified but would be promised to a client;
- recovery/export path is absent for consequential migration;
- provider credentials would need to enter public Git or evidence;
- the selected provider cannot meet the workload's security or resource floor;
- a public listener is required without an authorized secure exposure design;
- provider lock-in would place canonical Signalproof state outside a recoverable path;
- a deployment is being called production-ready before the provider/workload pilot passes.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-agent-infrastructure-selection`
- **Version:** 0.1.0
- **Maturity:** Candidate / Not Active
- **Domain:** hosting/provider/region selection and repeatable agent deployment profile
- **Created by:** Doc Reo / Signalproof
