# Signalproof SkillSpector v2.9.5 Runtime Acceptance Plan

**Status:** TEST INSTRUMENT PREPARED — RUNTIME EVIDENCE PENDING  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Expected release wheel SHA-256:** `e8a514d620107ae9aaf4d9600aedf474c69e9bdfd40032ca51a478480484db9f`  
**Authority:** bounded acceptance testing only; no upgrade, activation, semantic-provider use, automatic install authority, or public MCP exposure.

## Instrument identity

Runnable Windows harness prepared outside the repository:

`SkillSpector-V295-Acceptance.ps1`

Prepared harness SHA-256:

`b2c0d640a65ee0ded3b2b8580b74c99404f36746edb2be31c51ce28af6a261f9`

The harness itself must be hash-verified before execution. Runtime results, not this plan, determine the acceptance disposition.

## Protected state

Default protected local root:

`F:\SP\SkillSpector`

Default disposable acceptance root:

`F:\SP\SkillSpector-Test`

The instrument rejects a work root placed inside the protected root and records protected launcher/config identity before and after the run.

It does not upgrade, invoke, uninstall, or overwrite the known local SkillSpector installation.

## Artifact and dependency gate

The harness downloads only NVIDIA's exact v2.9.5 release wheel and verifies the published SHA-256 before installation.

Dependencies are resolved into a disposable wheelhouse from public PyPI using binary wheels only. Every resolved dependency artifact is hashed before installation. Installation then occurs offline from the captured wheelhouse into a dedicated virtual environment.

`pip check` and `pip freeze --all` are preserved as runtime evidence.

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
3. **Dependency capture** — binary dependency wheels resolved, hashed, installed from the local wheelhouse, and `pip check` passes.
4. **Benign fixture** — controlled negative safety constraints do not become a high/critical result.
5. **Intentionally risky fixture** — controlled security-sensitive instructions/code produce material findings and a higher risk score than the benign fixture.
6. **STATIC-CONNECTED** — no-LLM scan exercises the dependency-intelligence path with normal outbound connectivity; OSV unreachability is preserved if the environment blocks it.
7. **STATIC-OFFLINE** — when run elevated, a temporary Windows Firewall outbound block scoped only to the disposable runtime must prove `api.osv.dev:443` reachable before the block and unreachable during it. The scan must then surface fallback/incompleteness evidence. The firewall rule is removed in `finally`.
8. **Suppression opt-in** — an author-shipped baseline is not applied by default and suppresses findings only after explicit `--use-shipped-baseline`.
9. **Inspection completeness** — oversized required material must produce visible completeness/limitation evidence rather than an unqualified clean result.
10. **Operational failure** — a missing target must fail operationally and must not emit a clean approval report.
11. **Junction boundary** — disposable directory junction input must be rejected; cleanup removes only the junction using `cmd /c rmdir`.
12. **Protected-state preservation and cleanup** — observed protected launcher/config identity remains unchanged; disposable runtime and wheelhouse are removed by default.

## Result model

- **PASS** — all required acceptance checks completed without failure or blocking gap.
- **PARTIAL** — no check failed, but at least one required proof was BLOCKED. The most likely example is running non-elevated, which prevents the scoped firewall proof.
- **FAIL** — at least one acceptance check failed.

Exit codes:

- `0` = PASS
- `3` = PARTIAL
- `2` = FAIL

A PARTIAL result cannot be promoted to operational approval without resolving or explicitly governing the blocked evidence.

## Evidence package

Each run writes a timestamped evidence directory containing, as applicable:

- exact release-wheel hash evidence;
- dependency wheel hashes;
- venv/install/pip logs;
- package inventory;
- JSON reports for each acceptance fixture;
- connected/offline network probe logs;
- baseline-generation and baseline-application evidence;
- junction creation/removal evidence;
- protected-state before/after snapshots;
- acceptance JSON and Markdown summary;
- SHA-256 manifest for retained evidence.

## Recovery

Temporary Windows Firewall rules are removed in `finally` even after an earlier failure.

The disposable runtime and wheelhouse are removed by default. Operator switches that preserve them intentionally downgrade cleanup proof rather than silently claiming recovery success.

## Gate after execution

Runtime PASS does **not** make the scanner an authority source. A successful acceptance run supports the next evaluation decision for a bounded Signalproof integration adapter.

`SCANNER RESULT → EVIDENCE → SIGNALPROOF EVALUATION → HUMAN AUTHORITY`

## Current milestone state

**HARNESS BUILT / EXECUTION PENDING**

Do not close the full SkillSpector Case 2 milestone until the Windows evidence package has been reviewed and the runtime result has been recorded.