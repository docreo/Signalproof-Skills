# Signalproof Model Fleet Inventory / Backup Team Plan — 2026-08-26

**Status:** STAGED / NONCANONICAL LOG-SKILL RECORD  
**Owner:** Doc Reo  
**Lifecycle effect:** Creates `signalproof-model-fleet` as CANDIDATE only. Does not activate or reserve a Build Ledger event number.

## Why This Exists

A machine-wide AI shutdown on 2026-08-25/26 left Hermes unable to see local models because the serving runtime was stopped/disabled even though the model assets remained present. The incident exposed a process gap: shutdown and recovery procedures distinguished services, but did not yet require a complete model-fleet inventory + independent backup + tested restore contract.

## Authoritative Live Stock — 2026-08-26

The current read-only stock-take establishes:

- Ollama version `0.30.8`.
- Active host: `127.0.0.1:11434`.
- Active user/process `OLLAMA_MODELS`: `F:\Signalproof\Runtime\Models\Ollama`.
- Ollama listener healthy on port 11434.
- Active store contains 26 manifests, 40 blobs, and approximately 44.67 GB of blob storage.

### General reasoning / agent LLMs

- `qwen3.5:latest` — 6.6 GB. **PRIMARY PRACTICAL LOCAL HERMES MODEL / WORKING WELL.**
- `qwen3.6:latest` — 22 GB. **PRESENT, BUT TOO HEAVY FOR PRACTICAL USE ON CURRENT WORKSTATION.** Retain as installed/archive-capable unless later hardware/runtime conditions improve.
- `gemma4:latest` — 9.6 GB. **WORKING / APPROVED SECONDARY LOCAL GENERAL MODEL.**
- `llama3.1:8b` — 4.9 GB. **AVAILABLE ROTATION / SECONDARY.**
- `llama3.2:3b` — 2.0 GB. **AVAILABLE ROTATION / LIGHTWEIGHT SECONDARY.**

### Qwen 3:14B historical note

`qwen3:14b` was historically preserved and used by Hermes, but it is not present in the current live `ollama list`. Operationally it also encountered a Hermes context-floor problem around the required 65536 context target. Treat it as **HISTORICAL / NOT CURRENT PRIMARY / REQUIRES EXPLICIT RE-INTRODUCTION IF EVER RETESTED** rather than a current fleet dependency.

### Granite family

- `signalproof-granite:latest` — 2.1 GB. **WORKING GREAT / CORE SIGNALPROOF LOCAL MODEL.**
- `signalproof-granite:1.0` — same underlying payload identity as `signalproof-granite:latest`.
- `granite4.1:3b` — 2.1 GB. **AVAILABLE.**
- `granite-embedding:30m` — 62 MB. **EMBEDDING WORKLOAD CLASS; NOT A GENERAL LLM ROTATION MODEL.**
- multiple `signalproof-granite-backup:*` tags resolve to the same payload digest as the Signalproof Granite model. These are aliases/tags, not independent 2.1 GB physical copies.

### Kimi / K3

No Kimi model is visible in the local Ollama inventory. Current owner policy is **do not deploy Kimi locally on this workstation**; if used later, treat it as remote/VPS infrastructure and separately govern provider, network, security, and cost controls.

### Kokoro

Kokoro is **not part of the general reasoning/agent model rotation**. It is a specialty TTS/voice model used by Signalproof voice/media workflows and must maintain its own runtime, voice assets, backup, restore, and synthesis acceptance path.

## Model Store Topology

Current live authority differs from older historical path conventions.

### Current active authority

`F:\Signalproof\Runtime\Models\Ollama`

The current active store has 26 manifests / 40 blobs / approximately 44.67 GB.

### Legacy / alternate topology still present

- `F:\Signalproof\Models\Ollama` — separate directory containing 23 manifests / 32 blobs / approximately 44.63 GB.
- `F:\Ollama\Models` — junction to `F:\Signalproof\Models\Ollama`.
- `C:\Users\...\.ollama\models` — junction to `F:\Ollama\Models`.

**Critical finding:** the currently active `OLLAMA_MODELS` path and the legacy/junction target are not the same directory and have different manifest/blob counts. Do not delete, merge, redirect, or deduplicate either store until file-level identity and dependency reconciliation is complete.

## Operational Fleet Policy

### Tier A — Current local production/practical set

- Qwen 3.5 (`qwen3.5:latest`) — primary practical Hermes/general local model.
- Signalproof Granite (`signalproof-granite:latest` / `:1.0`) — core Signalproof local reasoning model.
- Gemma 4 (`gemma4:latest`) — working secondary/fallback general model.

### Tier B — Local rotation / cost and workload balancing

- Llama 3.1 8B.
- Llama 3.2 3B.
- Granite 4.1 3B.
- other locally available general models proven later.

Use these selectively by workload, latency, context, quality, and operating cost. Do not require every model to remain active or loaded simultaneously.

### Tier C — Present but not practical/current

- Qwen 3.6 — installed and preserved, but too heavy on current workstation for routine use.
- Qwen 3:14B — historical Hermes model; not currently installed/visible and previously conflicted with the Hermes context-floor requirement.

### Tier D — Remote / provider rotation

Cloud/API models and future VPS-hosted models may be rotated for capability or cost. Provider rotation is a separate policy from local model preservation. Do not treat provider availability as a substitute for backing up locally customized model assets.

### Specialty workload classes

- `granite-embedding:30m` — embeddings/retrieval.
- Kokoro — TTS/voice synthesis.
- future STT, vision, reranking, and media models belong to their own workload classes.

Specialty models are not interchangeable with Hermes/general reasoning models and require function-specific acceptance tests.

## Team Mission

Produce a recoverable, auditable model fleet in which every important model has separately proven:

1. **Storage** — required bytes and manifests exist.
2. **Runtime** — the correct serving engine exposes the model.
3. **Binding** — the intended application points to the correct endpoint/tag/context.
4. **Workload fit** — the model is classified for the function it actually serves.
5. **Recovery** — an independent backup can reconstruct the model/runtime binding.

## Team Roles

### 1. Inventory Lead

Own read-only discovery.

Deliverables:
- runtime versions and endpoints;
- active environment variables;
- canonical store/junction resolution;
- runtime and API model inventory;
- manifest and blob inventory;
- disk usage;
- non-Ollama model caches separated by workload class;
- machine-readable inventory file.

### 2. Provenance & Model Registry Lead

For each model reconcile:
- exact tag/name;
- payload digest;
- aliases;
- provider/source;
- architecture/family;
- workload class;
- parameters/quantization;
- native and accepted context;
- license/provenance;
- custom Modelfile/config dependencies;
- intended Signalproof/Hermes role;
- practical status on current hardware.

Classify each record as `PRIMARY`, `ROTATION`, `SPECIALTY`, `PRESENT_TOO_HEAVY`, `HISTORICAL`, `REMOTE_ONLY`, `ORPHAN_UNKNOWN`, or `RETIRED` as applicable.

### 3. Backup Lead

Design two backup layers.

**Layer A — Fast local recovery**
- store snapshot / manifests / configuration / aliases;
- may live on an independent local volume;
- optimized for fast repair.

**Layer B — Independent disaster recovery**
- separate physical device or otherwise failure-isolated storage;
- complete required model payloads;
- SHA-256 manifest;
- inventory index;
- runtime/version/config snapshot;
- application/profile binding snapshot with secrets excluded or separately protected.

A same-physical-disk rollback folder does not satisfy Layer B.

### 4. Store-Reconciliation Lead

New required role because two materially different Ollama store trees exist.

Before any cleanup:
- compare manifests between `Runtime\Models\Ollama` and legacy `Models\Ollama`;
- compare blob SHA identities;
- identify which four additional manifests and eight additional blobs exist only in the active store;
- prove whether any legacy-only assets exist;
- identify aliases that share blobs;
- classify each file/tree as ACTIVE, DUPLICATE-BY-CONTENT, LEGACY-REQUIRED, ORPHAN-UNKNOWN, or SAFE-TO-ARCHIVE.

No destructive deduplication until this reconciliation is complete.

### 5. Restore-Test Lead

Use workload-specific restore acceptance:
- general/agent LLM: direct inference plus context/tool behavior where required;
- embedding model: embedding/retrieval acceptance;
- TTS model such as Kokoro: synthesize a known phrase through its intended runtime/app and verify voice assets;
- other specialty model: function-specific test.

Backup remains `UNVERIFIED` until restore acceptance passes.

### 6. Hermes / Application Binding Lead

For Hermes roles record provider, endpoint, model tag, context, output policy, fallback/return behavior, and role.

Current practical Hermes target should favor Qwen 3.5 where its live tests remain successful. Granite and Gemma 4 are local complementary/fallback models rather than forcing one universal model across every role.

For non-Hermes specialty consumers such as Kokoro voice workflows, reconcile their own runtime/model/voice configuration separately.

### 7. Cost / Rotation Lead

Manage model/provider rotation by:
- local compute cost;
- cloud/API cost;
- latency;
- context requirement;
- quality;
- workload fit;
- privacy/data sensitivity;
- current hardware pressure.

Do not keep heavy models active merely because they are installed. Preserve availability while routing work to the cheapest adequate model that satisfies the required capability and governance boundary.

### 8. Security / Governor Lead

Keep recovery separate from indiscriminate activation.

Rules:
- do not re-enable every AI runtime just to prove one model exists;
- preserve owner-controlled startup policy;
- distinguish direct Ollama `11434` from governed/compatibility paths when in use;
- preserve Governor authority where required by production architecture;
- never place secrets/credentials in public inventories;
- remote/VPS models such as a future Kimi deployment require separate network and provider governance.

### 9. Verification / Closeout Lead

Before closeout:
- compare runtime inventory to disk inventory;
- compare both stores to backup inventory;
- compare model tags to application bindings;
- hash/verify backups;
- record UNKNOWNs explicitly;
- run restore acceptance;
- route reusable lessons through `log-skill`;
- do not claim a canonical Build Ledger number unless verified chain-safe append is performed.

## Execution Phases

### Phase 0 — Preserve Current State

No model-store deletion, merge, retag, migration, or cleanup.

### Phase 1 — Live Stock Baseline

**PASS for current Ollama inventory.** Current baseline captured 2026-08-26.

### Phase 2 — Store Reconciliation

Highest immediate technical priority: reconcile active `Runtime\Models\Ollama` against legacy/junction-backed `Models\Ollama` without mutation.

### Phase 3 — Binding Matrix

Prove Hermes configuration against the practical model policy:
- primary: Qwen 3.5 where accepted;
- complementary/fallback: Granite and Gemma 4;
- do not bind routine Hermes work to Qwen 3.6 on current hardware;
- do not assume Qwen 3:14B is available.

### Phase 4 — Backup

Create Layer A + Layer B backups with immutable inventory and checksums.

Backup priority:
1. Signalproof custom Granite payload/configuration.
2. Qwen 3.5 practical Hermes model.
3. Gemma 4 working secondary.
4. specialty assets that cannot be trivially reproduced, including Kokoro voice/model assets.
5. rotation models.
6. Qwen 3.6 archive only if storage budget supports retaining a full independent copy; otherwise preserve exact reproducible pull/provenance metadata plus any non-reproducible local customization.

### Phase 5 — Restore Acceptance

Restore and acceptance-test each workload class separately.

### Phase 6 — Shutdown / Restart Integration

Future AI-off procedures must record:
- pre-shutdown model inventory hash;
- current model-store authority;
- services/startup entries disabled;
- stores explicitly untouched;
- intended restart order;
- Hermes/application binding verification;
- workload-specific specialty runtime requirements;
- emergency rollback.

Recommended recovery order:

`storage -> runtime -> model visibility -> application binding -> function-specific end-to-end acceptance`

## Skill Extraction

**Candidate:** `signalproof-model-fleet`  
**Status:** CANDIDATE / NOT ACTIVE  
**Purpose:** model inventory, workload classification, backup, restore, runtime/application reconciliation, and cost-aware rotation.

## Immediate Next Action

Perform a **read-only two-store reconciliation** between:

- `F:\Signalproof\Runtime\Models\Ollama`
- `F:\Signalproof\Models\Ollama`

The active store has 26 manifests / 40 blobs while the legacy tree has 23 manifests / 32 blobs. Determine the exact delta before any cleanup, consolidation, or backup implementation.
