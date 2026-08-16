# Signalproof SkillSpector v2.9.5 Static-Core Acceptance Plan

**Status:** TEST INSTRUMENT PREPARED — WINDOWS EXECUTION PENDING  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Exact upstream wheel SHA-256:** `e8a514d620107ae9aaf4d9600aedf474c69e9bdfd40032ca51a478480484db9f`  
**Disposition under test:** **ADAPT CANDIDATE — STATIC-CORE SIGNALPROOF ADAPTER**

## Why this is an adaptation test

The normal upstream v2.9.5 dependency solution is blocked under Signalproof's binary-only acceptance policy because the declared `langgraph-cli[inmem]` dependency pulls a server-runtime chain ending in source-only `forbiddenfruit>=0.1.4`.

Signalproof is not weakening `--only-binary :all:`.

The source review found that the scanner CLI invokes the core LangGraph workflow directly and no reviewed SkillSpector source reference to `langgraph_cli` was identified at the exact v2.9.5 commit. NVIDIA's development guide separately describes the CLI, the LangGraph development server/Studio, and direct graph invocation as distinct entry points.

The test therefore asks whether the scanner can operate in `--no-llm` mode with exactly one declared dependency intentionally omitted:

`langgraph-cli[inmem]>=0.4.14`

Because upstream package metadata declares that dependency as required, a successful test remains an adaptation and must not be described as a normal upstream-conformant installation.

## Test instrument

Runnable artifact:

`SkillSpector-V295-Static-Core-Acceptance-V5.ps1`

SHA-256:

`4bbfacc78abbf0a0cdfe68ab6d9230e3ecb6e0fbb98c554d59d0942ed9bdac49`

Bundle SHA-256:

`4aa5e5727de929e90b79d633288d3bd9faf9dc9b4e51578e7fb24188603f5440`

The runnable harness remains external to the public repository unless separately authorized; this repository file governs its intended behavior and evidence interpretation.

## Dependency boundary

The disposable environment retains every other direct runtime dependency declared by SkillSpector v2.9.5:

- `typer>=0.23.0,<0.24`
- `rich>=14.3.0`
- `httpx>=0.28.0`
- `packaging>=24.0`
- `pyyaml>=6.0.1`
- `pydantic>=2.12.0`
- `openai>=2.25.0`
- `langgraph>=1.0.10`
- `langchain-anthropic>=1.4.5`
- `langchain-aws>=0.2.0`
- `langchain-core>=1.2.17`
- `langchain-openai>=1.1.10`
- `boto3>=1.34.0`
- `langsmith>=0.7.30`
- `yara-python>=4.5.0`

Only `langgraph-cli[inmem]>=0.4.14` is intentionally omitted.

## Supply-chain controls

The harness must:

1. verify the exact NVIDIA v2.9.5 wheel digest before installation;
2. use the existing authorized `uv` resolver only;
3. compile the retained dependency set with public PyPI, `--only-binary :all:`, `--generate-hashes`, `--no-cache`, and `--no-python-downloads`;
4. sync that exact lock with `--require-hashes`;
5. install the exact SkillSpector wheel with dependency resolution disabled;
6. record the intentional metadata divergence rather than hide it;
7. retain V3/V4 fail-closed required-stage accounting.

## Metadata and isolation checks

Because the exact upstream wheel still declares `langgraph-cli[inmem]`, `uv pip check` is expected to report that requirement as missing.

The experiment is acceptable at this boundary only if:

- the only dependency-consistency finding is the intentional `langgraph-cli` omission;
- no other declared requirement is unsatisfied;
- `langgraph-cli`, `langgraph-api`, `langgraph-runtime-inmem`, `blockbuster`, and `forbiddenfruit` are absent from the disposable inventory;
- importing `skillspector.cli`, `skillspector.graph`, and `skillspector.nodes.analyzers.static_runner` succeeds without the omitted server chain.

Any additional missing/incompatible dependency is FAIL.

## Static scanner acceptance

If the dependency/import boundary passes, the harness continues the existing bounded static acceptance scenarios:

- exact SkillSpector version identity;
- benign fixture behavior;
- intentionally risky fixture behavior;
- `--no-llm` metadata assertions;
- STATIC-CONNECTED OSV behavior;
- true outbound-denied STATIC-OFFLINE fallback behavior;
- author-shipped baseline default-not-applied and explicit opt-in behavior;
- inspection-completeness behavior for oversized material;
- missing-target operational failure behavior;
- Windows junction boundary behavior;
- protected local SkillSpector state preservation;
- disposable-runtime cleanup.

## Falsification conditions

Reject the Static-Core adapter hypothesis if any of the following occurs:

1. the retained dependency set cannot resolve under binary-only policy;
2. any omitted server-chain package is pulled back into the environment;
3. SkillSpector CLI/graph/static imports require the omitted chain;
4. any non-server direct dependency is missing or incompatible;
5. static/no-LLM scanning fails because the omitted chain is required at runtime;
6. the no-LLM boundary cannot be proven;
7. the existing static acceptance scenarios regress;
8. protected state changes;
9. cleanup/recovery fails.

## Result meaning

### PASS

Supports only:

**ADAPT CANDIDATE — STATIC-CORE SIGNALPROOF ADAPTER**

### PARTIAL

The reduced runtime functions but one or more required environmental proofs are BLOCKED. No operational approval.

### FAIL

The reduced runtime or required acceptance boundary fails. Keep the adapter candidate unapproved.

## Explicit non-claims

Even a PASS does not establish:

- normal upstream SkillSpector installation acceptance;
- NVIDIA support for this reduced dependency contract;
- semantic/LLM mode acceptance;
- LangGraph dev server/Studio acceptance;
- MCP server acceptance;
- protected local upgrade approval;
- automatic install/activation authority.

## Next gate

Execute the exact V5 harness on Windows, preserve console/evidence output, then Evaluate whether the Static-Core path is a viable Signalproof adaptation.