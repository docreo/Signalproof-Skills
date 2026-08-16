# Signalproof Skills V0.2 Intake Case — NVIDIA SkillSpector

**Case class:** Capability inspection tooling  
**Research status:** Source/provenance/security-boundary review complete; independent runtime acceptance reached a binary-only dependency gate  
**Current disposition:** **INTEGRATE CANDIDATE — bounded static-first adapter; NOT OPERATIONALLY APPROVED**  
**Authority:** Research/Evaluate only. This record does not authorize an upgrade, activation, external data transfer, public MCP exposure, automatic installation decisions, or source-build exception.

## Evidence boundary

This case distinguishes verified upstream source facts, publisher-supplied validation, Signalproof source-supported inferences, and independent Signalproof runtime evidence.

Independent v2.9.5 acceptance has now reached a real supply-chain compatibility gate before installation. The exact NVIDIA wheel was verified, but the complete dependency graph could not be resolved while Signalproof's binary-only requirement remained absolute.

## Exact upstream identity

- Repository: `NVIDIA/SkillSpector`
- Version: `v2.9.5`
- Exact commit: `27fd9620dbfed1a2f405fd8c519661e51511f06e`
- GitHub release publication observed: `2026-08-15T21:03:32Z`
- release wheel SHA-256: `e8a514d620107ae9aaf4d9600aedf474c69e9bdfd40032ca51a478480484db9f`
- source archive SHA-256: `2e7a61c7e3b38d23e9fbb86a1253577a0adf7a7c1425290fa35dbc1ddea38932`

## License

SkillSpector v2.9.5 is Apache-2.0 licensed. Runtime dependencies remain a separate provenance/licensing surface.

## Prior Signalproof version versus current upstream

Prior Signalproof capability state recorded local SkillSpector `2.8.2` as detected. Official upstream tag `v2.8.2` resolves to:

`2bc641fd0639550a1cae9557491f483e30520afb`

Detected 2.8.2 remains protected historical local state, not approval of v2.9.5. No upgrade has been authorized or performed by this case.

## Runtime/dependency surface

Project metadata for v2.9.5 declares Python `>=3.12,<3.15`, Alpha development status, and a substantial dependency set including `langgraph-cli[inmem]>=0.4.14`.

Independent V4 acceptance on Windows used Python 3.13.5, existing uv 0.12.3, the exact NVIDIA release wheel, public PyPI, `--only-binary :all:`, `--no-cache`, generated hashes, required hashes, and no automatic Python downloads.

The resolver reached this dependency chain:

`SkillSpector 2.9.5`
→ `langgraph-cli[inmem] >=0.4.14`
→ `langgraph-runtime-inmem >=0.7`
→ `blockbuster >=1.5.24`
→ `forbiddenfruit >=0.1.4`

uv reported that `forbiddenfruit==0.1.4` had no usable wheels under the binary-only boundary. Therefore `blockbuster>=1.5.24` could not be used, which blocked `langgraph-runtime-inmem`, then `langgraph-cli[inmem]`, and ultimately the complete SkillSpector dependency solution.

Independent classification:

**BINARY-ONLY SUPPLY-CHAIN GATE BLOCKED / NO SKILLSPECTOR INSTALLATION PERFORMED**

This is not evidence that SkillSpector is generally uninstallable. It establishes a narrower fact: the full upstream v2.9.5 dependency graph cannot pass the current Signalproof acceptance workflow while every dependency is required to arrive as a usable binary distribution.

## Target execution boundary in inspected static paths

The inspected static runner operates on text already loaded into a file cache. Python analysis uses syntax-tree parsing and inspection rather than importing or executing target files in the inspected paths.

The static target-analysis paths inspected in source read and parse target content rather than importing or executing it. Acquisition, scanner runtime, providers, network access, and transports remain separate execution/trust boundaries.

## Static-only is not offline

The CLI provides `--no-llm`, but static supply-chain analysis can query OSV.dev. Signalproof therefore preserves:

> **STATIC-ONLY ≠ OFFLINE**

Network mode and inference mode require separate declarations.

## Semantic/provider boundary

Semantic analysis can send reviewed target content to an inference provider. Remote semantic use therefore requires explicit data-egress authority. Local inference still requires provider/runtime identity and proof that remote fallback cannot occur.

## MCP boundary

Initial Signalproof scope remains local/stdio or loopback behind Signalproof authorization. Routable unauthenticated HTTP remains a STOP condition.

## Scanner result is evidence, not authority

`SCANNER VERDICT → EVIDENCE INPUT → SIGNALPROOF EVALUATION / HUMAN AUTHORITY`

A scanner result never self-authorizes installation or activation.

## Baseline/suppression boundary

Author-shipped baselines remain opt-in. Suppression identity, reason, exact source/scanner version, and adverse findings must be preserved.

## Capability gap versus existing Signalproof skills

SkillSpector remains complementary automation rather than a replacement for Signalproof Security, Research, Verify, Evaluate, Review, or human authority.

Potential value remains:

- repeatable multi-rule artifact scanning;
- language-aware static analysis;
- dependency vulnerability intelligence;
- machine-readable findings;
- inspection-completeness accounting;
- optional semantic analysis;
- pre-install evidence generation.

The unresolved issue is operational packaging under the current Signalproof supply-chain policy.

## Hard gates

STOP operationalization if:

1. scanner artifact/version cannot be verified;
2. dependencies come from an unapproved or unverifiable source;
3. network/data behavior cannot be stated before execution;
4. remote semantic analysis lacks explicit data-egress authority;
5. local provider tooling can exceed the bounded capability design;
6. MCP is routable without authentication/authorization;
7. candidate-supplied suppressions are silently applied;
8. required material is failed/uninspected without a blocking result;
9. scanner output is treated as install/activation authority;
10. scanner/source version changes without revalidation;
11. rollback/removal cannot be verified;
12. runtime evidence cannot distinguish target execution from scanner/provider execution;
13. a source-only dependency is silently allowed after a binary-only acceptance failure.

## Independent runtime acceptance history

### V1
pip resolver stopped with `resolution-too-deep` before installation.

### V2
Harness emitted an invalid PASS after incomplete execution. Result rejected.

### V3
Fail-closed stage accounting worked; uv CLI was misconfigured with mutually exclusive alias flags. No installation occurred.

### V4
Exact artifact verification passed and real dependency solving ran. Resolution was blocked because the transitive `forbiddenfruit` dependency had no usable wheel under `--only-binary :all:`. No installation occurred; protected local state remained unchanged; disposable runtime cleanup passed.

Downstream runtime behavior tests remain `NOT_RUN` because the dependency gate prevented installation.

## Evaluate decision paths

The next governed decision is not another blind harness revision. Evaluate must choose among:

1. **RETAIN BINARY-ONLY HARD GATE** — keep full v2.9.5 operational acceptance blocked.
2. **SOURCE-DISTRIBUTION EXCEPTION REVIEW** — inspect exact `forbiddenfruit` source artifact, provenance, license, build process, toolchain, network behavior, produced wheel identity, and recovery; requires explicit owner authority before any build or install.
3. **REDUCED STATIC-INTEGRATION RESEARCH** — determine whether an upstream-supported or clean adapter boundary can avoid the `langgraph-cli[inmem]` chain without modifying or misrepresenting upstream requirements.
4. **WATCHLIST** — wait for upstream dependency/package changes or usable binary publication, then rerun acceptance against a new exact version.

No option is automatically approved.

## Current disposition

### Technology

**INTEGRATE CANDIDATE**

The source-level capability remains strategically useful and permissively licensed.

### Operational state

**NOT APPROVED — BINARY-ONLY SUPPLY-CHAIN GATE BLOCKED**

No approval is granted for upgrading protected local 2.8.2, allowing a source-distribution build, remote semantic scanning, automatic installation decisions, or public MCP exposure.

## Reusable lessons

1. **“Static analyzer” is a mode, not a complete trust boundary.**
2. **`NO-LLM` does not necessarily mean `OFFLINE`.**
3. **A scanner verdict is evidence, not authority.**
4. **Inspection completeness matters as much as finding count.**
5. **Declared interpreter support does not prove dependency acceptability under a stricter supply-chain policy.**
6. **A binary-only gate can legitimately block an otherwise supported upstream installation when a transitive dependency is source-only. The correct response is disposition, not silently weakening the gate.**

## Milestone status

**SOURCE REVIEW COMPLETE / BINARY-ONLY RUNTIME GATE RESOLVED AS BLOCKED / EVALUATE DISPOSITION REQUIRED**

Case 3 should not begin until this Case 2 disposition is explicitly closed or deferred by the owner.