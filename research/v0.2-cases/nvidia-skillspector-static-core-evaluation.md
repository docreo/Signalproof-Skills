# NVIDIA SkillSpector v2.9.5 — Static-Core Adapter Evaluation

**Status:** SOURCE EVALUATION COMPLETE / CONTROLLED RUNTIME TEST REQUIRED  
**Upstream target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Signalproof disposition:** **ADAPT CANDIDATE — EXPERIMENTAL STATIC-CORE ONLY**  
**Authority:** Evaluation/test planning only. This record does not authorize production installation, protected-install modification, source-distribution builds, semantic-provider use, public MCP exposure, or automatic install/activation decisions.

## Question

Can Signalproof use the exact SkillSpector v2.9.5 scanner in `--no-llm` mode without importing the `langgraph-cli[inmem]` development-server dependency chain that is blocked by the binary-only supply-chain gate?

## Why this evaluation exists

The full upstream dependency solution is blocked under Signalproof's binary-only acceptance rule:

`SkillSpector 2.9.5`
→ `langgraph-cli[inmem] >=0.4.14`
→ `langgraph-runtime-inmem >=0.7`
→ `blockbuster >=1.5.24`
→ `forbiddenfruit >=0.1.4`

The Windows V4 acceptance run established that `forbiddenfruit==0.1.4` has no usable wheel under `--only-binary :all:`. No SkillSpector installation occurred.

Signalproof will not silently weaken that gate.

## Exact upstream packaging fact

At the reviewed v2.9.5 commit, `pyproject.toml` declares all of the following as ordinary runtime dependencies, including:

- `langgraph>=1.0.10`
- `langgraph-cli[inmem]>=0.4.14`
- `langchain-anthropic>=1.4.5`
- `langchain-aws>=0.2.0`
- `langchain-core>=1.2.17`
- `langchain-openai>=1.1.10`
- `langsmith>=0.7.30`

There is no upstream `static`, `scanner`, or similar optional dependency extra that removes `langgraph-cli[inmem]`.

Therefore a reduced environment that omits `langgraph-cli[inmem]` is **not package-metadata-conformant** and must not be represented as a normal supported SkillSpector installation.

## Source-use boundary

The reviewed scanner execution path does not show a source-code dependency on `langgraph_cli`:

- repository code search at the exact reviewed commit returned no `langgraph_cli` source reference;
- `src/skillspector/cli.py` imports the compiled scanner graph and invokes `graph.invoke(...)`;
- `src/skillspector/graph.py` imports `StateGraph`, `START`, and `END` from the core `langgraph` library;
- the static pattern runner reads already-loaded file content and performs pattern/AST analysis;
- `--no-llm` sets `use_llm=False`, and semantic analyzer nodes explicitly return disabled status when that state is false.

The graph still imports semantic analyzer modules at process import time. Those modules import the LangChain/provider libraries, so the first Signalproof adapter experiment will retain all other upstream direct runtime dependencies. The only intentional omission is `langgraph-cli[inmem]` and the server-runtime chain it introduces.

## Development-server distinction

NVIDIA's v2.9.5 development guide describes three distinct entry points:

1. the `skillspector scan` CLI;
2. the LangGraph dev server / Studio path;
3. direct programmatic `graph.invoke(...)` / `graph.stream(...)` use.

The LangGraph project's own CLI documentation describes `langgraph-cli[inmem]` as the package used for the local `langgraph dev` server path.

This supports a **testable hypothesis** that the scanner CLI can execute without the development-server package even though NVIDIA currently declares that package as a hard dependency.

It does **not** prove the reduced environment is supported or safe; that requires independent runtime evidence.

## Minimal divergence rule

The experimental Signalproof Static-Core environment may omit exactly:

`langgraph-cli[inmem]>=0.4.14`

It may not opportunistically remove other declared dependencies during this experiment.

The expected absent server-chain packages include:

- `langgraph-cli`
- `langgraph-api`
- `langgraph-runtime-inmem`
- `blockbuster`
- `forbiddenfruit`

If another package pulls any of those into the environment, the test must record that fact rather than claiming server-chain isolation.

## Installation model for the experiment

The controlled acceptance instrument must:

1. download the exact NVIDIA v2.9.5 release wheel;
2. verify SHA-256 `e8a514d620107ae9aaf4d9600aedf474c69e9bdfd40032ca51a478480484db9f` before installation;
3. create a disposable Python 3.12–3.14 environment outside the protected SkillSpector root;
4. resolve and hash-lock every upstream direct runtime dependency except `langgraph-cli[inmem]` under `--only-binary :all:` and `--no-cache`;
5. install that hash-locked dependency set;
6. install the exact verified SkillSpector wheel with dependency resolution disabled;
7. record the intentional package-metadata divergence;
8. prove that no other declared requirement is unsatisfied;
9. prove the omitted server-chain packages are absent;
10. run the existing no-LLM static acceptance scenarios;
11. remove the disposable runtime by default.

## `pip check` / metadata rule

Because the exact NVIDIA wheel declares `langgraph-cli[inmem]` as required, a package-consistency checker is expected to flag that one intentional missing dependency.

Signalproof must not hide that result.

The adapter test passes the metadata boundary only when:

- the exact omitted upstream requirement is recorded;
- every other declared SkillSpector requirement is satisfied;
- the dependency environment is otherwise internally consistent;
- the server-chain packages remain absent;
- the scanner proves functional in the bounded static mode.

This is **controlled divergence**, not dependency consistency.

## Required runtime falsification tests

The adapter hypothesis is rejected if any of these occurs:

1. importing `skillspector.cli` or `skillspector.graph` requires `langgraph-cli`, `langgraph-api`, `langgraph-runtime-inmem`, `blockbuster`, or `forbiddenfruit`;
2. a static/no-LLM scan attempts to invoke a LangGraph development server path;
3. any required non-server dependency cannot resolve under the binary-only gate;
4. no-LLM metadata cannot prove semantic analysis was disabled;
5. the benign/risky fixture behavior regresses;
6. connected/offline OSV behavior cannot be distinguished;
7. baseline, completeness, operational-failure, or junction controls regress;
8. the protected local SkillSpector installation changes;
9. disposable-runtime recovery fails.

## Success meaning

A successful Static-Core acceptance run would support:

**ADAPT CANDIDATE — STATIC-CORE SIGNALPROOF ADAPTER**

It would not support these stronger claims:

- full upstream SkillSpector installation accepted;
- NVIDIA-supported reduced install mode;
- semantic mode accepted;
- LangGraph dev server accepted;
- MCP server accepted;
- automatic installation/activation authorized.

## Why ADAPT rather than INTEGRATE

The published wheel's metadata says `langgraph-cli[inmem]` is required. Signalproof would intentionally operate a narrower runtime contract than upstream packaging declares.

That makes the result an adaptation boundary, even if no NVIDIA source code is modified.

## Reusable lesson

**A transitive dependency can belong to a tooling/server surface rather than the execution surface Signalproof actually needs. That distinction may justify a controlled adapter experiment, but omitting an upstream hard dependency must remain explicit, falsifiable, and separately governed.**

## Next authorized step

Build and execute a disposable **SkillSpector Static-Core Acceptance** instrument that omits only `langgraph-cli[inmem]`, preserves the binary-only supply-chain gate, and reruns the bounded static acceptance suite.
