---
name: signalproof-model-fleet
description: Inventory, preserve, back up, restore, and verify local AI model fleets and their runtime bindings without confusing model bytes, manifests, aliases, workload classes, profiles, or active services.
---

# Signalproof Model Fleet

## Status

**CANDIDATE / NOT ACTIVE — RD1**

## Purpose

`signalproof-model-fleet` governs local-model inventory, backup, restore, reconciliation, workload classification, and runtime visibility across Signalproof systems.

> **A model that exists on disk, a model that is registered in a runtime, and a model an application can use are different states. Prove each separately, and do not flatten different workload classes into one rotation pool.**

This skill is intended for Ollama and compatible local runtimes first, while remaining extensible to GGUF stores, Hugging Face caches, speech models, embedding models, and other governed local AI assets.

## Core Distinctions

Always distinguish:

1. **Model bytes** — blobs, GGUFs, safetensors, checkpoints, voices, adapters, or equivalent payloads.
2. **Runtime manifests/metadata** — tags, manifests, Modelfiles, aliases, quantization, context metadata, provenance.
3. **Runtime service state** — whether the serving engine is installed, enabled, listening, and healthy.
4. **Agent/application binding** — the endpoint, model tag, context, profile, and policy an application such as Hermes is configured to use.
5. **Workload class** — reasoning/agent, coding, vision, embedding/reranking, speech/TTS, STT, or other specialty function.
6. **Backup state** — whether all assets required for recovery exist on independent storage and pass integrity verification.
7. **Restore state** — whether a fresh or intentionally cleared runtime can reconstruct the model and make it visible to the intended application.

Do not infer one state from another.

## Workload-Class Doctrine

A fleet is not one interchangeable model pool. Classify models by intended function before rotation, backup priority, performance comparison, or application binding.

Examples:

- **Reasoning / agent LLMs** — general language reasoning, tool use, orchestration, Hermes roles.
- **Coding LLMs** — code generation, repair, repository work, build assistance.
- **Vision models** — image understanding or multimodal work.
- **Embedding / reranking models** — retrieval and search infrastructure.
- **Speech / TTS models** — voice synthesis and media pipelines.
- **Speech-to-text models** — transcription and audio understanding.
- **Specialty models** — narrowly scoped functions not meaningfully comparable to general LLMs.

Do not rotate a speech/TTS model such as Kokoro as though it were a substitute for a Hermes reasoning model. Preserve its own runtime, voices, dependencies, acceptance tests, and recovery path.

## Contract

1. Inventory before mutation.
2. Resolve the active runtime endpoint and model-store authority from live configuration, not memory or path assumptions.
3. Resolve junctions/symlinks/reparse points before identifying the canonical store.
4. Enumerate runtime-reported models and independently enumerate manifests/model files where possible.
5. Record exact model tag, family, architecture, parameter scale, quantization, context, size, source, license/provenance when available.
6. Record workload class and intended role separately from model family.
7. Record aliases separately from underlying model payload identity.
8. Record application/profile bindings separately from model inventory.
9. Back up manifests/configuration and model bytes; neither alone is sufficient for dependable offline recovery.
10. Use SHA-256 or stronger content verification for backup manifests and critical configuration snapshots.
11. A same-volume copy or rollback directory is not a disaster backup.
12. Preserve at least one recovery copy on independent storage before destructive cleanup, migration, or mass runtime disablement.
13. Test restore into a bounded target before declaring a backup valid.
14. Never activate services merely to prove bytes exist if an offline inventory can answer the question.
15. Never delete an apparently duplicate model until alias/blob deduplication and dependency relationships are proven.
16. Preserve credentials and secrets outside public inventory records.
17. Public Signalproof-Skills may contain procedures and public-safe lessons; machine-specific paths, hashes, private topology, and recovery evidence belong in private evidence/Build Ledger unless explicitly approved.

## Inventory Record

For each model or model family, record as applicable:

- canonical model/tag name;
- aliases/tags;
- provider/source registry;
- family/architecture;
- workload class;
- intended operational role;
- parameter scale;
- quantization/precision;
- declared native context;
- accepted runtime context;
- runtime/provider;
- local model-store authority;
- manifest identity/path class;
- blob/file identity and byte size;
- SHA-256 or equivalent integrity reference;
- license/provenance status;
- current service visibility;
- intended application/profile bindings;
- backup status;
- restore-test status;
- lifecycle state: ACTIVE / AVAILABLE / ARCHIVED / RETIRED / UNKNOWN.

## Workflow

### 1. Freeze a Read-Only Snapshot

Capture:

- relevant environment variables;
- runtime version(s);
- listener/endpoint ownership;
- runtime model list;
- canonical model-store resolution;
- manifests and model payload inventory;
- disk usage;
- workload class and intended role;
- application bindings such as Hermes profile model and endpoint configuration.

Do not restart services during the initial inventory unless explicitly required and authorized.

### 2. Reconcile Runtime vs Disk

Classify each discovered item:

- **VISIBLE + PRESENT** — runtime sees it and supporting bytes/manifests are present.
- **PRESENT / NOT VISIBLE** — bytes/manifests exist but runtime does not expose it.
- **VISIBLE / STORAGE UNCERTAIN** — runtime reports it but canonical storage identity is not yet proven.
- **BOUND / MODEL UNAVAILABLE** — application profile references a model not currently visible.
- **ORPHAN / UNKNOWN** — payload or manifest has no proven active reference.

### 3. Back Up the Fleet

A governed backup should contain or reference:

- complete canonical model-store payload needed for offline restore;
- runtime manifests and aliases;
- exported/custom Modelfiles or model creation definitions;
- runtime version and environment configuration;
- application/profile model bindings;
- specialty-model dependencies and assets where applicable, including TTS voices/configuration;
- inventory JSON/CSV or equivalent machine-readable index;
- SHA-256 manifest;
- backup media identity and date;
- explicit exclusions and UNKNOWNs.

Prefer independent physical storage or another independently failure-isolated volume/device. A backup on the same physical device is only a convenience/rollback copy.

### 4. Verify Backup

Verify file counts, sizes, manifests, hashes, and required metadata. Where runtime registries are reproducible from public sources, record pull identifiers as secondary recovery paths, but do not treat internet availability as the only backup for locally customized or version-sensitive assets.

### 5. Test Restore

Restore into a bounded test target or alternate store when practical. Use class-appropriate acceptance:

- reasoning/agent model: direct inference plus required context/tool behavior;
- coding model: bounded code task where relevant;
- embedding/reranking model: retrieval/ranking acceptance;
- TTS model: synthesize a known phrase through the intended application/runtime and verify required voice assets;
- other specialty model: function-specific acceptance.

Also prove the intended application can see/use the restored model through the correct endpoint and the original production store remains untouched during the test.

### 6. Reconcile Applications

For Hermes and similar reasoning/agent consumers, independently prove:

- endpoint is correct;
- runtime listener exists;
- configured model tag exists;
- context/limits are intentional;
- named profiles and default profiles point to intended providers;
- returning from a local model to cloud/default providers still works where required.

For non-Hermes specialty consumers such as voice/media applications, reconcile their own runtime, model path, voice/config assets, and function-specific acceptance separately.

### 7. Log Learning

At meaningful milestones, route through `log-skill`. Do not reserve canonical Build Ledger sequence numbers, auto-activate this candidate, or publish private machine evidence.

## Shutdown / Restart Doctrine

A machine-wide AI shutdown must create a pre-shutdown inventory snapshot and a restart contract before services are disabled whenever feasible.

The restart contract should distinguish:

- installed but intentionally stopped;
- startup disabled;
- service removed;
- runtime running but no models visible;
- models present but application endpoint unavailable;
- application running with stale/missing model binding;
- specialty model runtime intentionally independent from the LLM runtime.

The recovery order should generally be:

`prove storage -> prove runtime -> prove model visibility -> prove application binding -> prove function-specific end-to-end acceptance`

Do not indiscriminately enable every AI runtime to repair one missing dependency.

## Initial Signalproof Lesson

Signalproof evidence from August 2026 demonstrates that stopping the AI runtime can make Hermes appear to have "lost" models even when model assets remain preserved. It also demonstrates that historical model-store topology can include multiple paths and junctions, making live authority reconciliation mandatory before backup or restore.

The same stock-take also reinforces that specialty models such as Kokoro have different operational roles and must not be flattened into the general Hermes/LLM rotation.

This candidate therefore formalizes two missing controls: **model-fleet preservation must be part of shutdown, migration, cleanup, and local-agent recovery workflows; and model function must govern rotation, backup, and acceptance.**

## STOP Conditions

STOP when:

- canonical model-store authority is ambiguous;
- a destructive action is proposed before inventory/backup;
- a backup is being called complete without integrity evidence;
- a same-device rollback copy is being represented as disaster recovery;
- an alias is being mistaken for independent model bytes;
- models from different workload classes are being treated as interchangeable without evidence;
- application binding is being changed before runtime/model availability is proven;
- private paths/hashes/secrets would be published publicly;
- a candidate skill would be promoted without lifecycle approval.

## Completion Criteria

A model-fleet operation is complete only when current inventory is machine-readable, workload classes are explicit, storage/runtime/application states are reconciled, backup status is explicit, integrity verification is recorded, restore readiness is tested or explicitly UNKNOWN, and any operational changes have bounded rollback.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-model-fleet`
- **Version:** `0.2.0-candidate`
- **Maturity:** Candidate
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Local AI model inventory, workload classification, backup, restore, and runtime reconciliation
- **Created by:** Doc Reo / Signalproof
