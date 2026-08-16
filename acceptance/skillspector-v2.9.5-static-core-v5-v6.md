# SkillSpector v2.9.5 Static-Core — V5 Result / V6 Correction

**Status:** V5 FAIL-CLOSED / STATIC-CORE RESOLUTION PROVEN / V6 PREPARED  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Authority:** bounded Static-Core acceptance only; no protected upgrade, semantic-provider use, public MCP exposure, source-build exception, or automatic activation authority.

## V5 runtime identity

Harness:

`SkillSpector-V295-Static-Core-Acceptance-V5.ps1`

SHA-256:

`4bbfacc78abbf0a0cdfe68ab6d9230e3ecb6e0fbb98c554d59d0942ed9bdac49`

Observed run root:

`F:\SP\SkillSpector-Test\run-20260816-031259`

The governed V5 hash matched before execution.

## V5 console result

V5 verified:

- isolation guard PASS;
- Python 3.13.5 PASS;
- existing uv 0.12.3 PASS;
- disposable runtime creation PASS;
- exact NVIDIA v2.9.5 release-wheel SHA-256 PASS;
- protected local state unchanged PASS;
- disposable runtime cleanup PASS.

V5 then reported FAIL at the Static-Core dependency-lock stage because its expected lock file was not present. No SkillSpector installation was attempted. All downstream scanner stages remained `NOT_RUN` and the harness failed closed.

## Resolver evidence changes the diagnosis

The V5 compile log itself reported:

`Resolved 65 packages in 570ms`

A separately executed diagnostic used the same:

- Static-Core requirements file;
- Python 3.13.5 interpreter;
- uv 0.12.3;
- public PyPI index;
- `--only-binary :all:`;
- `--generate-hashes`;
- `--no-cache`;
- `--no-python-downloads`.

That direct diagnostic returned:

`UV_EXIT=0`

and ended with:

`Resolved 65 packages in 636ms`

It materialized:

`F:\SP\SkillSpector-Test\run-20260816-031259\e\uv-static-core-diagnostic-lock.txt`

with observed size:

`129353 bytes`

The V5-expected file:

`F:\SP\SkillSpector-Test\run-20260816-031259\e\static-core-requirements.lock.txt`

was absent.

## Correct classification

**STATIC-CORE DEPENDENCY RESOLUTION PROVEN / V5 LOCK-MATERIALIZATION HARNESS DEFECT**

The reduced Static-Core dependency set did not fail resolution.

The evidence supports all of the following bounded statements:

- 65 packages resolved successfully under the binary-only policy;
- Python 3.13.5 is compatible with that resolution;
- the omitted `langgraph-cli[inmem]` server chain is not needed for dependency solving of the retained set;
- `forbiddenfruit` is no longer a resolver blocker in the reduced dependency set;
- no SkillSpector installation or scanner execution occurred in V5;
- protected local state remained unchanged.

## V6 correction

V6 changes only the lock-producing process boundary.

Instead of using the V5 PowerShell pipeline-capture wrapper for `uv pip compile`, V6 uses `Start-Process` with separate stdout and stderr evidence files. This matches the execution model that successfully produced the diagnostic lock.

V6 retains:

- exact NVIDIA wheel SHA-256 verification;
- omission of only `langgraph-cli[inmem]>=0.4.14`;
- every other direct SkillSpector v2.9.5 runtime dependency;
- `--only-binary :all:`;
- `--no-cache`;
- generated hashes;
- hash-required sync;
- no automatic Python downloads;
- exact SkillSpector wheel install with dependency resolution disabled only after retained dependencies are locked and synced;
- explicit package-metadata divergence evidence;
- server-chain absence checks;
- import probes;
- bounded `--no-llm` static fixtures;
- fail-closed required-stage accounting;
- protected-state and recovery checks.

V6 harness:

`SkillSpector-V295-Static-Core-Acceptance-V6.ps1`

SHA-256:

`f1ced6786b41770265ec1dc0cbf136370e44ad7b7c8da204f6d2683be3b0e471`

V6 bundle SHA-256:

`b2b202d1f53550c40d20116b857ff749936a9bf7840112fbdc45cd0493149849`

## Success boundary

A V6 PASS would support only:

**ADAPT CANDIDATE — STATIC-CORE SIGNALPROOF ADAPTER**

It would not establish:

- full upstream SkillSpector installation acceptance;
- NVIDIA-supported reduced-install mode;
- semantic/LLM acceptance;
- LangGraph dev-server/Studio acceptance;
- MCP acceptance;
- protected-install upgrade authority;
- automatic installation or activation authority.

## Reusable lesson

**A successful resolver exit and a materialized lock are separate acceptance facts. When a wrapper obscures or changes artifact materialization, verify the native tool through a second execution boundary before classifying the dependency graph as failed.**

**For artifact-producing commands, the acceptance harness must verify both process exit status and the exact required output artifact.**

## Milestone status

**V5 FAIL-CLOSED PRESERVED / STATIC-CORE RESOLUTION PROVEN / V6 RUNTIME ACCEPTANCE AUTHORIZED**
