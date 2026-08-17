# Signalproof Build Ledger — Hermes Case 3 Stage 2C / 2D-1 Staged Delta

**Status:** STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION

## Boundary

The live private Build Ledger identity/head/chain/projection was not verified as part of this GitHub operation. This file therefore does **not** claim a canonical event sequence or canonical event hash.

## Stable milestone identity

`milestone-closeout:hermes-case3:stage2c-stage2d1`

## Project

Signalproof V0.2 Case 3 — NousResearch Hermes Agent governed worker evaluation

## Disposition

**ADAPT CANDIDATE — BOUNDED GOVERNED WORKER ONLY**

Hermes may eventually execute delegated work under Signalproof authority, but it must not decide what authority it has.

## Protected Hermes baseline

- Protected checkout: `F:\SP\Hermes\hermes-agent`
- Protected package line: Hermes Agent `0.20.0`
- Protected Git HEAD: `3bd844edf1777a680115f88a68474b4fb434092f`
- Protected dirty paths preserved exactly:
  1. `package-lock.json`
  2. `website/static/img/docs/session-recap.svg`
  3. `website/static/img/favicon.svg`
  4. `website/tsconfig.json`
- No reset/stash/checkout/pull/rebase/clean/repair of the protected checkout was authorized.

## Disposable source / runtime state

- Acceptance root: `F:\Downloads\Quarantine\20-Approved\Hermes-Case3-Runtime-Acceptance`
- Disposable source: `source-0.20.0-3bd844ed`
- Disposable source HEAD: exact `3bd844edf1777a680115f88a68474b4fb434092f`
- Disposable worktree: clean
- Disposable remotes: none
- Isolated `HERMES_HOME`: `home-0.20.0-3bd844ed`
- Versioned runtime venv: `venv-0.20.0-3bd844ed`
- Runtime candidate after controlled dependency work: CPython 3.11

## Stage 2C result

**CANDIDATE PASS — DEPENDENCY SUBSTRATE ONLY**

Observed accepted state:

- governed `pyproject.toml` and `uv.lock` hashes remained exact;
- dependency-source boundary remained 249 registry-backed package sources, 0 Git, 0 direct URL, 0 path, and one local editable project source in the lock metadata;
- official Astral `uv 0.12.3` provenance was verified and the runtime `uv.exe` byte-matched the verified official binary;
- the failed non-editable Hermes project install was preserved as a real partial-actuation attempt because Hermes packaging intentionally blocks wheel/sdist creation outside its supported paths;
- the partial venv was inspected before recovery;
- recovery used uv `--no-install-project` to install only the locked dependency substrate;
- 64 locked distributions were installed and statically accepted;
- distribution-name normalization corrected a post-install verification false negative involving `prompt_toolkit` / `prompt-toolkit`;
- `prompt-toolkit 3.0.52` and the exact core dependency set passed normalized static verification;
- Hermes project itself remained uninstalled from the disposable venv;
- no Hermes console entry was installed;
- Hermes was not launched;
- protected Hermes remained unchanged.

## Material failures preserved

1. PowerShell 5.1 native stderr was initially misclassified as terminating failure under `ErrorActionPreference=Stop`.
2. Interactive/parser defects involving `$Name:` / `$Relative:` interpolation were corrected using safe variable delimiting/formatting.
3. `$Home` collided with PowerShell's read-only `$HOME` automatic variable because variable names are case-insensitive.
4. One discovery script checked only conventional `.venv`/`venv` names and missed the governed versioned venv path.
5. Stage 2C-2 V1 miscounted all `registry=` references instead of only `source={registry=...}` dependency-source declarations.
6. Stage 2C-2 V2 used a helper parameter named `$Args`, colliding semantically with PowerShell's automatic `$args` behavior.
7. Stage 2C-2 V3 reached real actuation and failed because Hermes intentionally refuses non-editable wheel/sdist build in this path; uv recreated the disposable venv under CPython 3.11.15 before the packaging failure.
8. Stage 2C-3 dependency installation succeeded, but the first post-install verifier falsely failed on distribution-name normalization (`prompt_toolkit` vs `prompt-toolkit`). Reconciliation proved the installation transaction itself had succeeded.

These failures remain part of the milestone evidence and must not be erased by later success.

## Stage 2D-1 result

**AUTHORITY-SURFACE MAPPING COMPLETE / GOVERNANCE PASS**

The exact Hermes 0.20.0 source was mapped for:

- `AIAgent` construction;
- `skip_background_review` propagation;
- tool registration and `execute_code` exposure;
- terminal backend / local host execution surfaces;
- approval mode and `HERMES_YOLO_MODE` behavior;
- oneshot auto-bypass behavior;
- background review, memory, skill, and session mutation paths;
- lazy installation controls;
- plugins and project-plugin surfaces;
- MCP surfaces;
- environment/credential resolution;
- CLI/run entry paths.

No Hermes runtime execution occurred during Stage 2D-1.

## Current authority boundary

Still NOT authorized:

- Hermes runtime acceptance;
- YOLO or approval-off operation;
- oneshot approval bypass;
- unrestricted `execute_code`;
- host-local terminal authority;
- autonomous background review;
- autonomous memory/skill mutation;
- lazy package acquisition;
- MCP activation by default;
- project-plugin activation;
- autonomous cron/scheduling authority;
- unrestricted credential/environment passthrough;
- Hermes self-update;
- autonomous Signalproof skill promotion or canonical-state mutation.

## Reusable learning disposition

The milestone supports reusable learning in existing Signalproof boundaries rather than a new Hermes-specific public skill.

Candidate themes:

- external agents should be treated as replaceable workers under a separate authority plane;
- runtime acceptance must separate dependency readiness from agent authority readiness;
- policy text is not enforcement; every authority claim must bind to a real version-specific control surface;
- oneshot/headless paths require separate approval-bypass tests;
- project packaging policy must be respected rather than bypassed by generic installer assumptions;
- partial actuation must be inspected before retry/recovery;
- package/distribution identity comparisons should use canonicalized names;
- PowerShell 5.1 harness behavior is itself part of acceptance instrumentation and must not be confused with product failure.

## Next authorized gate

**Stage 2D-2 — build the Signalproof-controlled source-entry containment wrapper.**

Required properties before any Hermes turn:

- direct governed source-tree entry rather than oneshot;
- isolated `HERMES_HOME`;
- `HERMES_YOLO_MODE` denied;
- `skip_background_review=True` enforced;
- lazy installs denied;
- project plugins denied;
- MCP absent unless explicitly allowed;
- inherited sensitive environment/credential exposure bounded;
- `execute_code` omitted for initial acceptance;
- host-local terminal omitted for initial acceptance;
- manual approval behavior preserved and later runtime-tested;
- protected Hermes pre/post state reverified.

Only after Stage 2D containment passes may the first benign Stage 3 Hermes runtime test be explicitly authorized.
