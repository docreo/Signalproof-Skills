# SkillSpector v2.9.5 Static-Core — V0.2 Case 2 Final Closeout

**Status:** CLOSED / CASE 3 AUTHORIZED  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Acceptance mode:** Signalproof experimental Static-Core adapter  
**Final runtime run:** `F:\SP\SkillSpector-Test\run-20260816-103254`  
**V12 harness SHA-256:** `60c67350498f00be0f6b0c78ba3fc39d81a243f4df83d8abb3b25d3bd21039cb`

## Final runtime result

The exact V12 harness completed with:

`SIGNALPROOF SKILLSPECTOR v2.9.5 STATIC-CORE ACCEPTANCE V12: PASS`

Required gates observed PASS included:

- isolation guard;
- Python runtime selection;
- uv resolver selection;
- disposable runtime creation;
- exact v2.9.5 wheel identity;
- binary-only Static-Core dependency lock;
- exact installed SkillSpector version;
- exact metadata divergence visibility;
- runtime inventory;
- excluded server-chain absence;
- Static-Core import boundary;
- clean/risky fixture construction and no-LLM proof;
- STATIC-CONNECTED OSV path;
- STATIC-OFFLINE firewall rule identity;
- STATIC-OFFLINE firewall causality proof;
- STATIC-OFFLINE no-LLM proof;
- explicit OSV fallback/incompleteness evidence;
- firewall rollback;
- baseline generation;
- shipped-baseline default not applied;
- shipped-baseline explicit opt-in suppression;
- completeness boundary;
- operational failure handling;
- junction boundary and cleanup;
- acceptance-sequence completion;
- protected local state unchanged;
- disposable runtime cleanup.

No explicit dependency-sync PASS line was emitted, so this closeout does not claim one.

## Accepted disposition

**ADAPT / INTEGRATE CANDIDATE — BOUNDED EXPERIMENTAL STATIC-CORE SIGNALPROOF ADAPTER**

This acceptance supports a narrowly defined static-use adapter path only.

It does **not** establish:

- full upstream binary-only installation acceptance;
- upstream package-conformant reduced installation;
- NVIDIA-supported reduced mode;
- semantic-provider approval;
- dev-server or Studio approval;
- MCP approval;
- routable unauthenticated MCP exposure;
- protected local SkillSpector 2.8.2 upgrade;
- automatic installation or activation;
- scanner `safe_to_install` as approval authority.

## Preserved constraints and adverse evidence

1. Full upstream binary-only install remains CLOSED/BLOCKED because the declared server chain reaches source-distribution-only `forbiddenfruit`.
2. Static-Core deliberately omits exactly `langgraph-cli[inmem]>=0.4.14`.
3. The reduced runtime therefore intentionally diverges from upstream package metadata.
4. `--no-llm` does not mean offline.
5. STATIC-OFFLINE requires actual outbound denial plus visible OSV fallback evidence.
6. Semantic mode remains separately governed because reviewed target content may be sent to an LLM provider.
7. Routable unauthenticated MCP remains STOP.
8. Protected local SkillSpector 2.8.2 remained unchanged through acceptance.

## Key reusable lessons extracted during Case 2

- Binary-only policy can legitimately block an otherwise supported upstream install when a transitive dependency is source-only.
- A transitive dependency may belong to a tooling/server surface rather than the execution surface Signalproof needs; any omission must remain explicit, falsifiable, and separately governed.
- Native-process acceptance must bind actual exit code and persisted artifacts rather than stderr presence.
- Required before/after causality tests need a positively established precondition.
- The executable used to launch a workload is not necessarily the executable image that owns its network socket; isolation controls must bind the effective execution identity.
- Acceptance parsers must tolerate heterogeneous external report schemas and verify field existence before dereference.
- Scanner verdicts remain evidence inputs; Signalproof evaluation and human authority remain the approval boundary.

## Governance conclusion

Case 2 has satisfied the Signalproof milestone-closeout sequence:

**Validate → Record → Extract → Govern → Authorize Next Phase**

The bounded experimental Static-Core adapter is accepted for its defined static use boundary.

**Case 2: CLOSED**  
**Case 3: AUTHORIZED**
