# Signalproof Skills V0.2 Intake Case — NVIDIA SkillSpector

**Case class:** Capability inspection tooling  
**Research status:** Source/provenance/security-boundary review complete; independent Signalproof runtime acceptance pending  
**Current disposition:** **INTEGRATE CANDIDATE — bounded static-first adapter; NOT OPERATIONALLY APPROVED**  
**Authority:** Research/Evaluate only. This record does not authorize an upgrade, activation, external data transfer, public MCP exposure, or automatic installation decisions.

## Evidence boundary

This case distinguishes verified upstream source facts, publisher-supplied validation, Signalproof source-supported inferences, and independent Signalproof runtime evidence.

Independent v2.9.5 runtime validation is not yet complete. An attempt to fetch the exact release artifact into the isolated research sandbox was blocked by that environment's lack of external network resolution before SkillSpector could be installed or executed. This is an environment limitation, not a SkillSpector failure.

## Exact upstream identity

- Repository: `NVIDIA/SkillSpector`
- Version: `v2.9.5`
- Exact commit: `27fd9620dbfed1a2f405fd8c519661e51511f06e`
- Current `main` and tag `v2.9.5` resolved to the same commit during this review.
- GitHub release publication observed: `2026-08-15T21:03:32Z`

Release artifacts reported by GitHub:

- wheel SHA-256: `e8a514d620107ae9aaf4d9600aedf474c69e9bdfd40032ca51a478480484db9f`
- source archive SHA-256: `2e7a61c7e3b38d23e9fbb86a1253577a0adf7a7c1425290fa35dbc1ddea38932`

Future runtime acceptance must bind to an exact release artifact and verify its digest before execution.

## License

SkillSpector v2.9.5 is Apache-2.0 licensed. The observed `LICENSE` blob was:

`48afca9e235dc4e1c05cf1aca7b111328ce6fa86`

Runtime dependencies remain a separate provenance/licensing surface.

## Prior Signalproof version versus current upstream

Prior Signalproof capability state recorded local SkillSpector `2.8.2` as detected. Official upstream tag `v2.8.2` resolves to:

`2bc641fd0639550a1cae9557491f483e30520afb`

Comparison from v2.8.2 to v2.9.5 shows v2.9.5 ahead by 18 commits. The delta touches security-relevant areas including input handling, analyzer logic, provider support, MCP handling, supply-chain checks, YARA paths, tests, and new static detection surfaces.

Therefore:

**Detected 2.8.2 is historical local state, not approval of current 2.9.5.**

No upgrade is authorized by this research record.

## Runtime/dependency surface

Project metadata for v2.9.5 declares Python `>=3.12,<3.15`, Alpha development status, a substantial Python dependency set, and an optional MCP dependency.

The scanner's own dependency identity is part of its supply-chain boundary and must be captured in any governed integration.

## Target execution boundary in inspected static paths

The inspected static runner operates on text already loaded into a file cache. Python analysis uses `ast.parse` and syntax-tree inspection. The build-context path reads regular files with symlink/junction protections and records exclusions/failures rather than executing target files.

Bounded conclusion:

**The static target-analysis paths inspected in this case read and parse target content rather than importing or executing it.**

This does not mean the SkillSpector process performs no execution: acquisition, scanner runtime, provider, and transport paths have their own execution/network boundaries.

## Input acquisition boundary

SkillSpector accepts local files/directories/archives and remote repositories/URLs. Observed defensive controls include bounded ingest size/member counts, allowlisted remote hosts, private-address checks, archive traversal protections, and no-follow local file handling.

Remote repository acquisition invokes the local Git client and uses network access. Therefore target-source non-execution and scanner-tool execution must remain distinct claims.

## Static-only is not offline

The CLI provides `--no-llm` for static analysis only. However the static supply-chain analyzer can query OSV.dev for dependency vulnerability information and falls back to built-in data when OSV is unavailable.

Required Signalproof rule:

> **STATIC-ONLY ≠ OFFLINE**

A future adapter must state network mode independently from LLM mode.

## Semantic/provider boundary

The LLM analyzer path batches or chunks source from the file cache, line-numbers it, constructs analysis prompts, and sends those prompts to the selected inference provider.

Therefore remote semantic analysis can transmit reviewed skill contents outside the local machine. Local inference paths may reduce that boundary but still require explicit provider/runtime identity and egress guarantees.

Credentialed provider use is a separate authority decision from permission to perform local static inspection.

## Local agent-CLI provider boundary

SkillSpector contains a hardened helper for supported local agent CLI providers. Source-level controls include no shell interpolation, prompt delivery through stdin, secret-environment scrubbing, bounded input/output, timeout/fail-closed behavior, temporary working directories, and provider-specific capability restrictions.

These are positive defensive controls, but the provider operation still constitutes inference using the user's authenticated provider path and can receive analyzed content.

## Reporting and evidence

SkillSpector supports terminal, JSON, Markdown, and SARIF output. Its documentation distinguishes inference-usage telemetry from security validity and states that missing usage evidence does not prove that no LLM ran.

This aligns with Signalproof's rule that absence of evidence must not be upgraded into a stronger claim.

## MCP boundary

SkillSpector can expose scanning through MCP. Source shows local-target access is permitted for trusted local/stdio use and disabled for HTTP requests. Current documentation states HTTP transport is unauthenticated unless an external authentication layer is supplied.

Signalproof initial boundary should therefore be local/stdio or loopback behind Signalproof authorization. Routable unauthenticated HTTP is a STOP condition.

## Scanner result is evidence, not authority

SkillSpector returns risk scoring, recommendations, and a `safe_to_install` field.

Signalproof must preserve this separation:

`SCANNER VERDICT → EVIDENCE INPUT → SIGNALPROOF EVALUATION / HUMAN AUTHORITY`

A scanner must never self-authorize installation or activation.

## Baseline/suppression boundary

v2.9.5 can discover an author-shipped baseline, but applying it is opt-in. Signalproof should preserve that conservative posture and bind accepted suppressions to exact source identity, scanner version, reviewer authority, and retained suppressed-finding evidence.

## Publisher validation evidence

NVIDIA's v2.9.5 test suite includes both intentionally problematic and benign controls across static detection paths, including deserialization and false-positive regression cases. Release notes state targeted/regression tests and required CI checks passed for the prepared release.

Evidence classification:

**Publisher-supplied validation — not independent Signalproof runtime verification.**

## Capability gap versus existing Signalproof skills

SkillSpector does not replace Signalproof Security, Research, Verify, Evaluate, or human authority. Those govern trust, interpretation, acceptance, and permission.

SkillSpector does add a real automation layer:

- repeatable multi-rule artifact scanning;
- language-aware static analysis;
- dependency vulnerability intelligence;
- machine-readable findings;
- inspection-completeness accounting;
- optional semantic analysis;
- possible pre-install guardrail integration.

This is complementary automation rather than a duplicate governing specialist.

## Proposed Signalproof modes

### `STATIC-CONNECTED`

LLM disabled; explicitly authorized remote acquisition and/or vulnerability lookup may use the network. Report records scanner identity and network mode.

### `STATIC-OFFLINE`

LLM disabled; local target only; outbound network denied by policy/environment; vulnerability lookup necessarily uses offline fallback. Report must make reduced freshness/completeness visible.

`--no-llm` alone does not establish this mode.

### `SEMANTIC-LOCAL`

Explicitly approved local model/runtime endpoint; no remote fallback; provider/model identity recorded.

### `SEMANTIC-REMOTE`

Reviewed content may leave the machine; provider endpoint, model, data boundary, and credential use require explicit authorization.

### MCP

Local/stdio or loopback first. Routable HTTP remains out of scope until authentication, request provenance, and abuse controls are proven.

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
12. runtime evidence cannot distinguish target execution from scanner/provider execution.

## Independent Signalproof runtime acceptance required

Before operational integration, run the exact v2.9.5 artifact in an isolated disposable environment with controlled benign and intentionally risky fixtures.

Acceptance must cover:

- expected detection of representative security-sensitive instructions/code;
- expected clean result for corresponding benign controls;
- incomplete/oversized/unsupported input producing explicit completeness evidence rather than silent pass;
- path/symlink boundary handling;
- connected static mode and vulnerability-service fallback behavior;
- offline static mode with outbound network denied;
- proof that no semantic provider is used in no-LLM mode;
- suppression opt-in behavior;
- partial-failure behavior that cannot become an unqualified Signalproof approval.

A separately authorized semantic-provider test, if performed, must use synthetic non-sensitive content and record the exact provider/data boundary.

Runtime evidence should retain exact artifact digest, runtime/dependency versions, invocation, network mode, exit code, report digest, completeness, expected versus observed findings, and cleanup verification.

## Recovery/removal

Evaluation should use a dedicated virtual environment or container rather than the protected Signalproof runtime. The integration should remain replaceable/disableable behind an adapter so scanner failure or upgrade cannot disable Signalproof's governing security functions.

## Current disposition

### Technology

**INTEGRATE CANDIDATE**

Rationale: permissive license, exact release provenance, materially useful automated scanning, substantial defensive source design, machine-readable evidence, and a capability gap that complements rather than replaces existing Signalproof governance.

### Operational state

**NOT APPROVED — INDEPENDENT RUNTIME ACCEPTANCE PENDING**

No approval is granted for upgrading local 2.8.2, remote semantic scanning, automatic installation decisions, or public MCP exposure.

## Reusable lessons

1. **“Static analyzer” is a mode, not a complete trust boundary.** Acquisition, live intelligence, semantic providers, local agent CLIs, transport, suppression, output, and scanner dependencies are separate boundaries.
2. **`NO-LLM` does not necessarily mean `OFFLINE`.** Network and inference modes need separate declarations.
3. **A scanner verdict is evidence, not authority.**
4. **Inspection completeness matters as much as finding count.** A zero-finding result with required failed/skipped/uninspected material is not a clean complete scan.

## Milestone status

**SOURCE REVIEW COMPLETE / RUNTIME ACCEPTANCE REQUIRED**

The next authorized subphase is controlled v2.9.5 runtime acceptance. Case 3 should not begin until that subphase is resolved or the owner explicitly records a justified deferral.