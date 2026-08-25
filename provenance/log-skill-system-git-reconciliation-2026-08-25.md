# `/dsp log-skill` - System Git Reconciliation - 2026-08-25

**Status:** PUBLIC-SAFE LOG / SYSTEM RECONCILIATION OPEN  
**Public basis:** `docreo/Signalproof-Skills/main` at `2b5633f92e573e3cc7c6da2099f137611579bca1`

## Objective

Reconcile the Signalproof Git system after material expansion of the runtime, tool/model plan, Build Capsule/download commands, governed Hermes work, Switchyard pilot, Granite/Kokoro integration, and other private product repositories.

This record does not create canonical Build Ledger chronology and does not promote any Candidate or Pilot capability.

## Repositories inspected

- `docreo/Signalproof-Skills`
- `docreo/Signalproof-Core-Runtime`
- `docreo/Signalproof-Granite`
- `docreo/Signalproof-Kokoro`
- `docreo/Signalproof-Media-Studio`
- `docreo/Signalproof-Build-Ledger`
- `docreo/admin-operator`
- `docreo/signalproof-revenue-recovery`
- `docreo/Signalproof-Readiness`
- `docreo/Greenlight`
- `docreo/Greenlight-Readiness`
- `docreo/hermes-agent-bkp`

## Material findings

### Public Library

- `Signalproof-Skills` remains the canonical public Skill/Command/Loop authority after governed promotion.
- Apache-2.0 is correctly detected for the public repository.
- Current public `main` includes `/dsp download` and `/dsp build-capsule` plus the existing execution pipeline.
- GitHub topic metadata contains a spelling error (`software-governancce`) that requires repository-metadata capability or manual correction; this Git content change does not claim it has been corrected.

### Core Runtime

- Repository description remains a placeholder even though the repository now contains governed Hermes and Switchyard runtime surfaces.
- Root README materially understates current architecture.
- GitHub detects no repository license.
- Main remains separate from draft Candidate lanes for trusted Hermes transport/provider integration and the local zero-token-cost model broker.
- Candidate model/provider work must remain non-production until exact provenance/license/terms/security/cost/readiness/acceptance gates pass.

### Hermes

- The private pinned/reference backup preserves the upstream Nous Research MIT License.
- Hermes remains a bounded agent/runtime integration beneath Signalproof Governor/Core authority, not policy or canonical product-state authority.

### Switchyard

- Current Signalproof disposition remains `PILOT / ISOLATE`.
- The reviewed upstream basis records Apache-2.0 and pre-alpha/non-production maturity.

### Granite

- Repository contains Apache-2.0 text under `LICENSE-APACHE-2.0.txt`, but GitHub does not recognize it as the root repository license.
- A separate pre-release evaluation license governs candidate distribution/testing language.
- License scope should distinguish Signalproof-authored Apache source from packaged evaluation terms and third-party models/runtime/assets rather than treating them as one license surface.

### Kokoro

- Repository currently has no detected root license.
- `pyproject.toml` identifies Signalproof source as proprietary pre-release source.
- This conflicts with the current Signalproof direction to use Apache-2.0 for Signalproof-authored source where that repository is intended to be Apache licensed.
- Existing third-party boundary notice correctly avoids claiming redistribution rights for Kokoro/Misaki/Torch/spaCy/SoundFile/model weights/voice tensors.

### Media Studio

- Repository has no detected root license, but it already contains EULA, third-party notices, a Kokoro Apache license record, SBOM, and commercial release material.
- Because source/binary/commercial/third-party scopes are mixed, a root license must not be imposed without a scope review.
- Public PR #154 separately stages the reusable Kokoro human-acceptance lesson; Granite/AI Writing remains a separate unresolved lane in that record.

### Build Ledger

- Root README is stale: it still describes C352 as the recovered checkpoint.
- `LEDGER/CANONICAL-HEAD.md` is newer and establishes event 403 as the highest verified recovered historical state while explicitly blocking canonical append until the actual current raw JSONL + SQLite pair is recovered and verified.
- The README should be corrected to point to that status without claiming event 403 is today's live head.
- Private evidence is not automatically Apache licensed by the public Skills license.

### Admin Operator / product/bootstrap repositories

- Several repositories have blank or placeholder GitHub descriptions and no detected license.
- Empty/bootstrap repositories should not be described as implemented systems.
- Signalproof-authored source repositories may explicitly adopt Apache-2.0, but private evidence and third-party mirrors must not be relicensed by implication.

## Current architecture reconciliation

The public-safe architecture is now recorded in `library/SYSTEM-ARCHITECTURE-AND-LICENSING.md`:

```text
Human / authorized application
-> Signalproof Governor
-> Signalproof Core Runtime
-> bounded agent / traffic / model-provider planes
```

Governor is policy/authorization. Core Runtime is enforcement/shared runtime. Agent/model/router/traffic capability remains subordinate.

## License boundary

The system now distinguishes:

1. public Signalproof Apache-2.0 source;
2. private Signalproof source with explicit per-repository license scope;
3. private evidence/provenance that is not automatically open licensed;
4. third-party source/runtime/model/assets governed by upstream rights and terms;
5. packaged evaluation/commercial distributions whose additional terms must remain compatible with underlying licenses.

## Open reconciliation work

- update Core Runtime README/license/third-party notice through its own branch/PR;
- correct Build Ledger README through a private branch/PR;
- reconcile Kokoro Signalproof-source licensing through its own branch/PR;
- clarify Granite source-vs-package license scope;
- review Media Studio EULA/third-party/source scope before any root license change;
- prepare accurate repository-description/topic recommendations where the current connector cannot write repository metadata;
- reconcile open Candidate PR inventory independently; do not bulk merge or close it;
- preserve exact tool/model license verification as an activation gate for Qwen/GPT-OSS/DeepSeek/Kimi and future candidates.

## Authority

This `/dsp log-skill` reconciliation may preserve public-safe governance, documentation, tests, and staged private continuity. It does not authorize canonical Build Ledger append, production activation, Candidate promotion, unrelated deployment, or rewriting upstream licenses.