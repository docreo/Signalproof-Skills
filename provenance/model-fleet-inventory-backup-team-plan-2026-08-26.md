# Signalproof Model Fleet Inventory / Backup Team Plan — 2026-08-26

**Status:** STAGED / NONCANONICAL LOG-SKILL RECORD  
**Owner:** Doc Reo  
**Lifecycle effect:** Creates `signalproof-model-fleet` as CANDIDATE only. Does not activate or reserve a Build Ledger event number.

## Why This Exists

A machine-wide AI shutdown on 2026-08-25/26 left Hermes unable to see local models because the serving runtime was stopped/disabled even though historical evidence indicates model assets were preserved. The incident exposed a process gap: shutdown and recovery procedures distinguished services, but did not yet require a complete model-fleet inventory + independent backup + tested restore contract.

## Verified Historical Stock

The following items have direct Signalproof evidence and should be treated as **historically verified, requiring live re-inventory now**:

- `qwen3.6:27b` — pulled and runtime-tested through Ollama; native context reported 262144; accepted Hermes runtime context 65536; 8/8 growing-history tool-call soak passed; assigned to six named Hermes profiles during the accepted recovery.
- `qwen3:14b` — explicitly preserved during Qwen 3.6 migration/reconciliation; previously used by named Hermes bots.
- `qwen3.5:9b` — explicitly preserved during Qwen 3.6 migration/reconciliation.
- Granite family / Signalproof custom Granite assets — historical evidence includes `signalproof-granite:1.0`, custom Granite metadata, and backup/alias work. Exact current aliases/tags must be re-enumerated from the live store.

## Discussed / Expected but Not Yet Re-Proven in This Stock-Take

These must not be marked PRESENT merely from conversation history:

- Gemma variants.
- Kimi/K3-related local or remote-runtime assets.
- other Qwen variants beyond the verified tags above.
- DeepSeek, Mistral, GPT-OSS, Llama, embeddings, rerankers, vision, speech, and other model families unless live inventory proves them.
- Kokoro and other speech/voice model assets should be inventoried as a separate model class because they are not Ollama LLM tags.

## Historical Model Store Topology Evidence

Prior Signalproof evidence recorded an Ollama environment with:

- user/process `OLLAMA_MODELS` pointing to a governed F-drive model store;
- `C:\Users\...\.ollama\models` implemented as a junction into the F-drive topology;
- another F-drive Ollama path implemented as a junction to the governed store;
- at least one rollback directory on the same volume.

Because historical work also used multiple model-store path conventions across recovery phases, the current team must resolve live authority before any backup or mutation. **Do not hard-code the current canonical store from this record.**

## Team Mission

Produce a recoverable, auditable local AI model fleet in which every important model has four separately proven states:

1. **Storage** — required bytes and manifests exist.
2. **Runtime** — the correct local model server can expose the model.
3. **Binding** — Hermes/Signalproof components point to the intended endpoint/tag/context.
4. **Recovery** — an independent backup can reconstruct the model after loss or corruption.

## Team Roles

### 1. Inventory Lead

Owns read-only discovery.

Deliverables:
- runtime versions and endpoints;
- active environment variables;
- canonical store/junction resolution;
- `ollama list` / API inventory;
- manifest inventory;
- blob/file inventory and byte counts;
- non-Ollama model caches separated by class;
- machine-readable inventory file.

No deletion, pulls, aliases, or service reconfiguration during this phase.

### 2. Provenance & Model Registry Lead

For each model, reconcile:
- exact tag/name;
- provider/source;
- family/architecture;
- size/parameters;
- quantization;
- native and accepted context;
- license/provenance;
- aliases;
- custom Modelfile/config dependencies;
- intended Signalproof/Hermes role.

Classify every record as `VERIFIED_PRESENT`, `HISTORICALLY_VERIFIED`, `EXPECTED_UNVERIFIED`, `ORPHAN_UNKNOWN`, or `RETIRED`.

### 3. Backup Lead

Design two backup layers:

**Layer A — Fast local recovery**
- store snapshot / manifests / configuration / aliases;
- may live on local independent volume if useful;
- optimized for fast repair, not disaster recovery.

**Layer B — Independent disaster recovery**
- separate physical device or otherwise failure-isolated storage;
- complete required model payloads;
- SHA-256 manifest;
- inventory index;
- runtime/version/config snapshot;
- Hermes/profile binding snapshot with secrets excluded or separately protected.

A same-physical-disk rollback folder does not satisfy Layer B.

### 4. Restore-Test Lead

Test recovery without risking the production store.

Required gates:
- restore manifests/model payload into bounded alternate location/runtime;
- model appears under expected tag;
- direct inference succeeds;
- agent/tool-call test succeeds for agent models where applicable;
- Hermes can see the model through the intended endpoint;
- original production store remains unchanged.

Backup status remains `UNVERIFIED` until this passes.

### 5. Hermes / Application Binding Lead

Create a binding matrix for:
- default Hermes profile;
- admin;
- builder;
- designer;
- governance;
- multitasker;
- orchestrator;
- any future profiles.

For each: provider, endpoint, model tag, context, output policy, fallback/return behavior, and intended role.

A model-storage backup is incomplete if application bindings needed to use it are not recoverable.

### 6. Security / Governor Lead

Keep recovery separate from indiscriminate activation.

Rules:
- do not re-enable every AI runtime just to prove one model exists;
- preserve owner-controlled startup policy;
- differentiate direct Ollama `11434` from governed/compatibility paths when those are in use;
- preserve Governor authority where required by production architecture;
- secrets and credentials are never placed in public model inventories.

### 7. Verification / Closeout Lead

Before closeout:
- compare runtime inventory to disk inventory;
- compare both to backup inventory;
- compare model tags to Hermes bindings;
- hash/verify backup manifests;
- record missing/unknown assets explicitly;
- run native restore acceptance;
- route reusable lessons through `log-skill`;
- do not claim a canonical Build Ledger number unless verified chain-safe append is actually performed.

## Execution Phases

### Phase 0 — Preserve Current State

Do not uninstall, pull, delete, copy-over, retag, or migrate models. Preserve the current stopped/partially restored state long enough to capture evidence.

### Phase 1 — Live Read-Only Stock-Take

Capture:
- Windows environment variables for model runtimes;
- listening model-service ports and owners;
- Ollama executable/version;
- `ollama list` and `/api/tags`;
- canonical store and reparse topology;
- manifests and blob usage;
- likely Hugging Face / application-specific caches;
- Hermes model/profile configuration.

### Phase 2 — Reconciliation

Build one fleet table with columns:

`Model | Family | Runtime | Tag/Alias | Store | Size | Quant | Native Context | Runtime Context | Hermes Role | Present | Visible | Backed Up | Restore Tested | Provenance | Status`

### Phase 3 — Backup

Create Layer A + Layer B backups with checksums and immutable dated inventory manifests.

### Phase 4 — Restore Acceptance

Restore selected critical models first:

Priority A:
- current Hermes primary Qwen model;
- Signalproof Granite model(s);
- one known fallback model.

Priority B:
- Gemma and other useful secondary LLMs proven by live inventory.

Priority C:
- specialty models: coding, vision, embeddings, speech, reranking, experimental families.

### Phase 5 — Hermes Binding Acceptance

For each active Hermes role, prove configured model availability and a simple end-to-end inference. For agent/tool models, include a bounded tool-call acceptance test.

### Phase 6 — Shutdown/Restart Integration

Update future AI shutdown procedures so every intentional machine-wide AI shutdown records:

- pre-shutdown model fleet inventory hash;
- which services/startup entries are being disabled;
- which model stores are untouched;
- restart order;
- application-binding verification steps;
- emergency rollback.

Recommended recovery order:

`storage -> runtime -> model visibility -> application binding -> end-to-end inference`

## Skill Extraction

**New candidate:** `signalproof-model-fleet`  
**Status:** CANDIDATE / NOT ACTIVE  
**Purpose:** local AI model inventory, backup, restore, and runtime/application reconciliation.

This candidate should coordinate with, not replace:
- Known Errors;
- Failure Intelligence;
- Debug/Recovery;
- Closeout/Learn;
- Security/Governor controls.

## Immediate Next Action

Run one current-machine read-only inventory before making any more model/runtime changes. That output becomes the authoritative 2026-08-26 stock baseline and determines which historically known models are actually still present.
