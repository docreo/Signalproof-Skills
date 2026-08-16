# Signalproof SkillSpector v2.9.5 Runtime Acceptance Plan

**Status:** TEST INSTRUMENT PREPARED — RUNTIME EVIDENCE PENDING  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Expected release wheel SHA-256:** `e8a514d620107ae9aaf4d9600aedf474c69e9bdfd40032ca51a478480484db9f`  
**Authority:** bounded acceptance testing only; no upgrade, activation, semantic-provider use, automatic install authority, or public MCP exposure.

## Instrument identity

V1 runnable Windows harness:

`SkillSpector-V295-Acceptance.ps1`

V1 prepared harness SHA-256:

`b2c0d640a65ee0ded3b2b8580b74c99404f36746edb2be31c51ce28af6a261f9`

V2 corrected Windows harness:

`SkillSpector-V295-Acceptance-V2.ps1`

V2 prepared harness SHA-256:

`e58b7f8e109b125414075800d7a440e56b3d9f6d52c3d6929d92da2443032b9a`

Runtime results, not the existence of either instrument, determine acceptance disposition.

## Protected state

Default protected local root:

`F:\SP\SkillSpector`

Default disposable acceptance root:

`F:\SP\SkillSpector-Test`

The instrument rejects a work root placed inside the protected root and records protected launcher/config identity before and after the run.

It does not upgrade, invoke, uninstall, or overwrite the known local SkillSpector installation.

## V1 execution evidence — preserved failure

First Windows runtime attempt:

`F:\SP\SkillSpector-Test\run-20260815-223924`

Observed sequence:

- isolation guard: PASS;
- Python 3.13.5 selected: PASS;
- disposable venv creation: PASS;
- exact NVIDIA v2.9.5 wheel SHA-256: PASS;
- dependency resolution: FAIL;
- protected local state unchanged: PASS;
- disposable runtime cleanup: PASS;
- temporary wheelhouse cleanup: PASS.

The decisive resolver log was:

`error: resolution-too-deep`

Classification:

**DEPENDENCY RESOLUTION FAILURE / NO SKILLSPECTOR INSTALLATION PERFORMED**

This result is not classified as a missing-wheel finding and is not classified as a SkillSpector runtime failure. The V1 harness used pip's resolver against the full transitive dependency graph with a binary-only constraint. pip exhausted its resolution depth before installation.

The V1 failure remains acceptance evidence and is not replaced or rewritten by V2.

## Resolver correction

The owner subsequently verified an existing system resolver:

`uv 0.12.3 (507230998 2026-08-07 x86_64-pc-windows-msvc)`

V2 uses that existing `uv`; it does not install or upgrade uv.

The correction changes only the dependency resolution/install gate.

### V2 dependency gate

1. Download only NVIDIA's exact v2.9.5 release wheel.
2. Verify the published release-wheel SHA-256 before dependency resolution or installation.
3. Create a disposable Python 3.12–3.14 virtual environment outside the protected install.
4. Create a requirements input bound to the verified local SkillSpector wheel.
5. Resolve with `uv pip compile` using public PyPI and:
   - `--no-build`;
   - `--only-binary :all:`;
   - `--no-cache`;
   - `--generate-hashes`;
   - `--no-python-downloads`.
6. Require the generated lock to contain the exact NVIDIA SkillSpector wheel SHA-256.
7. Preserve the generated hash lock and its SHA-256 as acceptance evidence.
8. Install with `uv pip sync --require-hashes`, still with `--no-build`, `--only-binary :all:`, `--no-cache`, and automatic Python downloads disabled.
9. Validate the resulting environment with `uv pip check` and preserve `uv pip freeze`.
10. Continue the existing controlled runtime acceptance fixtures only after the resolver/install gate passes.

The use of `--no-cache` is intentional: previously source-built cached wheels must not silently satisfy the V2 binary-only acceptance boundary.

## No-LLM boundary

Every acceptance scan uses `--no-llm`.

For scan child processes, provider credentials and common tracing/secret environment variables are removed from the process environment. The active provider is forced to a non-CLI OpenAI path with no credential so report-time LLM availability checks cannot invoke local Claude/Codex/Gemini authentication subprocesses.

Acceptance JSON must show:

- `metadata.llm_requested == false`;
- `metadata.meta_analysis_applied == false`;
- empty `metadata.inference_usage`.

This proves the report contract observed for the acceptance invocation. It does not create a universal claim about all SkillSpector modes.

## Required runtime checks

1. **Exact artifact identity** — downloaded wheel digest matches the NVIDIA-published v2.9.5 SHA-256 before installation.
2. **Disposable runtime** — compatible Python 3.12–3.14 and an isolated venv outside the protected installation.
3. **Resolver identity** — existing uv executable/version is recorded before dependency resolution.
4. **Dependency lock** — uv produces a plausible exact hash lock under binary-only/no-build/no-cache constraints, and the lock contains the expected SkillSpector wheel digest.
5. **Hash-required install** — `uv pip sync --require-hashes` completes into the disposable venv with source builds still prohibited.
6. **Dependency consistency** — `uv pip check` passes and `uv pip freeze` is retained.
7. **Benign fixture** — controlled negative safety constraints do not become a high/critical result.
8. **Intentionally risky fixture** — controlled security-sensitive instructions/code produce material findings and a higher risk score than the benign fixture.
9. **STATIC-CONNECTED** — no-LLM scan exercises the dependency-intelligence path with normal outbound connectivity; OSV unreachability is preserved if the environment blocks it.
10. **STATIC-OFFLINE** — when run elevated, a temporary Windows Firewall outbound block scoped only to the disposable runtime must prove `api.osv.dev:443` reachable before the block and unreachable during it. The scan must then surface fallback/incompleteness evidence. The firewall rule is removed in `finally`.
11. **Suppression opt-in** — an author-shipped baseline is not applied by default and suppresses findings only after explicit `--use-shipped-baseline`.
12. **Inspection completeness** — oversized required material must produce visible completeness/limitation evidence rather than an unqualified clean result.
13. **Operational failure** — a missing target must fail operationally and must not emit a clean approval report.
14. **Junction boundary** — disposable directory junction input must be rejected; cleanup removes only the junction using `cmd /c rmdir`.
15. **Protected-state preservation and cleanup** — observed protected launcher/config identity remains unchanged; disposable runtime is removed by default.

## Result model

- **PASS** — all required acceptance checks completed without failure or blocking gap.
- **PARTIAL** — no check failed, but at least one required proof was BLOCKED.
- **FAIL** — at least one acceptance check failed.

Exit codes:

- `0` = PASS
- `3` = PARTIAL
- `2` = FAIL

A PARTIAL result cannot be promoted to operational approval without resolving or explicitly governing the blocked evidence.

## Evidence package

Each V2 run writes a timestamped evidence directory containing, as applicable:

- exact release-wheel hash evidence;
- uv version evidence;
- uv compile log;
- generated hash lock and lock SHA-256;
- uv sync/check/freeze evidence;
- JSON reports for each acceptance fixture;
- connected/offline network probe logs;
- baseline-generation and baseline-application evidence;
- junction creation/removal evidence;
- protected-state before/after snapshots;
- acceptance JSON and Markdown summary;
- SHA-256 manifest for retained evidence.

## Recovery

Temporary Windows Firewall rules are removed in `finally` even after an earlier failure.

The disposable runtime is removed by default. An operator switch that preserves it intentionally downgrades cleanup proof rather than silently claiming recovery success.

## Gate after execution

Runtime PASS does **not** make the scanner an authority source. A successful acceptance run supports the next evaluation decision for a bounded Signalproof integration adapter.

`SCANNER RESULT → EVIDENCE → SIGNALPROOF EVALUATION → HUMAN AUTHORITY`

## Current milestone state

**V1 FAIL PRESERVED / V2 HARNESS BUILT / V2 EXECUTION PENDING**

Do not close the full SkillSpector Case 2 milestone until the V2 Windows evidence package has been reviewed and the runtime result has been recorded.