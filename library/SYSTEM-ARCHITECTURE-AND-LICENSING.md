# Signalproof System Architecture and Licensing

**Status:** PUBLIC GOVERNANCE / CURRENT ARCHITECTURE POLICY  
**Date:** 2026-08-25

This document defines the public-safe architecture and licensing boundaries that Signalproof repositories should describe consistently. It is a governance and repository-configuration policy, not a claim that every Candidate, Pilot, model, provider, or product is production-ready.

## 1. Architecture

Signalproof separates human authority, policy, runtime enforcement, and technology capability.

```text
HUMAN / AUTHORIZED SIGNALPROOF APPLICATION
                 |
                 v
        SIGNALPROOF GOVERNOR
     policy / authorization plane
                 |
                 v
     SIGNALPROOF CORE RUNTIME
 enforcement / shared runtime plane
                 |
        +--------+---------+
        |        |         |
        v        v         v
   AGENT PLANE  TRAFFIC   MODEL / PROVIDER PLANE
   e.g. Hermes  PLANE     Granite and approved
   bounded      e.g.      local/external candidates
   worker       Switchyard
```

The Governor decides bounded authority. Core Runtime enforces and coordinates approved runtime capability. Agents, routers, models, providers, tools, and traffic planes are subordinate capability surfaces. Their technical ability does not create authority.

A bounded authorization may permit approved runtime components to exchange normal task payloads directly within the granted scope. This does not make the Governor a mandatory per-token or per-message proxy. Reauthorization is required when material authority, provider class, cost class, data classification, capability scope, or other governed conditions change.

## 2. Current capability classes

### Signalproof Governor

Policy/authorization plane. It owns policy decisions and bounded grants. A model, agent, UI, configuration file, or self-asserted JSON field cannot substitute for authenticated Governor/Core authority.

### Signalproof Core Runtime

Shared enforcement/runtime plane. It hosts or integrates bounded runtime capability beneath Governor authority. Runtime capability remains separate from operator permission.

### Hermes governed worker

Hermes is an agent-runtime reference/integration beneath Signalproof authority, not Signalproof policy authority or canonical product-state authority. Signalproof may adapt/integrate selected mechanisms while preserving upstream license and attribution requirements.

### Switchyard

Switchyard is evaluated as a model-traffic substrate for translation, routing, fallback, and metrics. Its current Signalproof disposition remains `PILOT / ISOLATE`; traffic-plane capability does not create policy authority.

### Granite

Granite is the existing Signalproof governed local-engine/model path. Signalproof-owned integration, launcher, governance, knowledge, and runtime code must be distinguished from IBM model/software rights and other third-party runtime rights.

### Other local or external model/provider candidates

Qwen, GPT-OSS, DeepSeek, Kimi, and other model/provider candidates remain replaceable compute. Every exact model/version/quantization/provider route must independently pass provenance, license/terms, security, cost, readiness, and acceptance gates before activation. A model appearing in a Candidate plan does not make its license, redistribution rights, cost entitlement, or production suitability approved.

## 3. License classes

Signalproof uses explicit license scopes. A license in one repository must not be inferred to govern unrelated repositories, private evidence, binaries, models, trademarks, or third-party material.

### Class A - Signalproof public open-source code

Signalproof-authored public source released through `docreo/Signalproof-Skills` is licensed under Apache License 2.0 unless a file or component states otherwise. The repository `LICENSE`, `NOTICE`, and trademark policy remain controlling for that work.

Signalproof-authored source in another repository may also use Apache-2.0 when that repository explicitly declares the license. The presence of a public Signalproof Apache license does not silently relicense every private repository.

### Class B - Signalproof private source

Private Signalproof source must state its own license scope. When Apache-2.0 is selected for Signalproof-authored source, the repository should contain a canonical root `LICENSE` and should distinguish source rights from packaged evaluation/commercial terms and third-party rights.

Private visibility does not itself mean proprietary licensing, and an Apache source license does not by itself authorize distribution of third-party models, weights, voices, assets, trademarks, credentials, or services.

### Class C - private evidence and governance records

Private Build Ledger evidence, recovery records, protected-state data, internal provenance, private handoffs, hashes, local topology, and similar evidence are not automatically open-licensed merely because public Signalproof Skills use Apache-2.0.

The private Build Ledger is an evidence and continuity system. Its repository records must preserve their existing confidentiality and evidence boundaries unless separately approved for public release.

### Class D - third-party source, runtimes, models, providers, and assets

Third-party material remains governed by its upstream copyright, license, model license, terms of service, acceptable-use terms, trademarks, and distribution rules.

Integration does not transfer ownership. Adaptation does not erase attribution. A permissive software license does not necessarily grant model-weight, service, trademark, hosted-API, or data rights.

Known current examples from accepted repository evidence:

- Nous Research Hermes Agent: MIT License. Signalproof integration must preserve the upstream MIT notice when copies/substantial portions are redistributed.
- NVIDIA NeMo Switchyard: Apache License 2.0 at the reviewed upstream basis used by the Signalproof Pilot.
- Signalproof Granite's current model manifest records Apache-2.0 for its exact Granite model basis; the exact model/version/digest remains part of the release freeze.

Other model candidates must not receive an assumed license classification merely because they use an open model catalog or local runner. Verify the exact upstream model card/repository and freeze the result before activation or redistribution.

### Class E - packaged evaluation or commercial distributions

A packaged candidate, installer, binary distribution, support arrangement, or commercial product may carry additional evaluation/EULA/support/warranty terms where legally compatible with the underlying licenses.

Those distribution terms must not be written as though they revoke permissions already granted for separately Apache-licensed source, and they must not purport to grant rights to third-party material that Signalproof does not own.

## 4. Third-party intake gate

Before a new external tool, model, provider, library, agent, runtime, or service is activated, record at minimum:

1. canonical upstream source/publisher;
2. exact version, commit, model ID, or other stable identity;
3. applicable software/model/content license;
4. required notices and attribution;
5. redistribution constraints;
6. Terms of Service / acceptable-use / platform-policy constraints where applicable;
7. integrity identity such as digest/hash/signature where available and material;
8. credential and cost class;
9. network/data-flow implications;
10. update behavior and rollback/recovery path;
11. security/trust boundary;
12. Signalproof disposition and maturity;
13. acceptance evidence before promotion.

If a material license/terms/provenance field remains unknown, the state is not PASS. Preserve it as `UNKNOWN / RESEARCH MORE`, `WATCHLIST`, `PILOT / ISOLATE`, or another evidence-supported non-promoted state.

## 5. Repository-description rules

GitHub repository descriptions and READMEs are evidence-facing system surfaces. They must describe current truth rather than aspirational architecture.

A description should identify:

- what the repository owns;
- its place in the Signalproof architecture;
- whether it is public/private when material to interpretation;
- Candidate/Pilot/production status where a reader could otherwise infer readiness.

Descriptions must not imply:

- Signalproof ownership of an upstream project;
- production readiness from a successful isolated test;
- activation from a Candidate branch or PR;
- canonical Build Ledger chronology from Git alone;
- an Apache license for private evidence merely because related public source is Apache-2.0;
- approved redistribution rights for third-party models/assets merely because integration works.

## 6. Recommended repository license surface

For Signalproof-authored source repositories using Apache-2.0:

```text
LICENSE                  canonical Apache-2.0 license
NOTICE                   attribution/required notices when applicable
THIRD-PARTY-NOTICES.*    upstream components and preserved license boundaries
LICENSE-SCOPE.*          optional clarification when source, binaries, assets,
                         evaluation packages, or commercial terms differ
README.*                  current architecture, status, and license summary
```

Do not rename or delete upstream license files merely to make GitHub detection cleaner. Preserve evidence and add a canonical root license/notice surface where appropriate.

## 7. Tool/model plan status rule

The system plan may include tools/models before they are approved. Planning and activation are separate states.

```text
PLAN / CANDIDATE
  -> exact provenance + license/terms
  -> security + privacy + cost
  -> readiness
  -> isolated test
  -> verification/review
  -> Human QC when applicable
  -> explicit promotion/activation
```

No tool or model earns Active/production status merely by being installed, reachable, free of provider-token cost, technically functional, or listed in a Signalproof plan.

## 8. Public/private boundary

Public Git should contain reusable governance, public-safe architecture, generalized lessons, and appropriately licensed source. Private repositories may contain implementation details, evidence, protected-state continuity, internal topology, and non-public product material.

Do not publish local workstation paths, credentials, private evidence, protected hashes, or internal recovery detail solely to make a public repository self-contained.

## 9. Change rule

When architecture, providers, models, tools, distribution plans, or licensing materially change, `/dsp log-skill` should reconcile:

- repository README/status language;
- license and third-party notices;
- capability/command/Skill registries when authority changes;
- provenance/log-skill records;
- GitHub description/topic recommendations where metadata access exists;
- Build Ledger staged continuity without fabricating canonical chronology.

A documentation update must not silently promote runtime authority.