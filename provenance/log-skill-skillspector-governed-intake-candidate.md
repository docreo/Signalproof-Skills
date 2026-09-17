# `log-skill` Candidate Record — SkillSpector + Selective Skill Adaptation + Signalproof Governance

**Status:** CANDIDATE / LOGGED LEARNING  
**Lifecycle:** DISCOVERED -> CANDIDATE  
**No new specialist skill:** Yes  
**Canonical Build Ledger mutation:** No  
**Public/private boundary:** Public-safe reusable doctrine only

## Purpose

Preserve a reusable operating pattern for future Signalproof tool/capability intake that combines:

1. automated/static evidence from a governed SkillSpector adapter;
2. selective adaptation patterns learned from external skill collections such as `mattpocock/skills`;
3. Signalproof evidence, authority, quarantine, verification, recovery, and human-governance rules.

This record does not claim that SkillSpector or an external skill collection can approve software. Their outputs remain evidence inputs to Signalproof evaluation and human authority.

## Provenance separation

### SkillSpector-specific defect and correction

The SkillSpector v2.9.5 acceptance work established a concrete packaging/runtime mismatch under the Signalproof binary-only supply-chain gate:

`SkillSpector 2.9.5`
-> `langgraph-cli[inmem] >=0.4.14`
-> `langgraph-runtime-inmem >=0.7`
-> `blockbuster >=1.5.24`
-> `forbiddenfruit >=0.1.4`

The full upstream binary-only installation remained blocked because `forbiddenfruit==0.1.4` did not provide an acceptable wheel for that gate.

Source inspection then established that the bounded static scanner path did not require the LangGraph development-server package at source level. Signalproof therefore tested an explicit **Static-Core adapter** that omitted exactly `langgraph-cli[inmem]>=0.4.14` and its server-only transitive chain while retaining the other direct runtime requirements.

That correction was developed and validated through SkillSpector-specific source inspection and controlled runtime acceptance. It was **not** diagnosed by Matt Pocock's skill collection.

The final bounded Static-Core acceptance passed while preserving the following constraints:

- the intentional upstream metadata divergence remained visible;
- `--no-llm` was not represented as offline;
- STATIC-OFFLINE required actual outbound denial plus visible OSV fallback/incompleteness evidence;
- semantic-provider mode remained separately governed;
- routable unauthenticated MCP remained STOP;
- protected local SkillSpector state remained unchanged;
- scanner verdicts remained evidence, not approval authority.

## What the Matt Pocock intake contributed

The `mattpocock/skills` review supplied **adaptation and workflow-design patterns**, not the SkillSpector dependency diagnosis.

Reusable patterns included:

- freeze exact upstream identity instead of trusting a mutable name/version alone;
- avoid wholesale adoption when only a bounded capability slice is needed;
- keep automatically updating external bundles outside frozen approval unless a new integrity gate runs;
- preserve explicit human confirmation before consequential writes/publication;
- separate independent review axes rather than allowing one review dimension to mask another;
- convert broad workflows into bounded, dependency-aware work units;
- preserve partial-failure evidence and recovery when external publication or tooling fails;
- distinguish Markdown/prompt content from the ambient host authority it can invoke.

These are selective ADAPT/STUDY patterns. They do not replace Signalproof Router, Research, Build, Debug, Verify, Review, Security, Recovery, or human authority.

## Combined governed intake pattern

For future tools, runtimes, agents, skills, plugins, or automation candidates, use the following composition when proportionate:

### 1. Freeze exact identity

Record the exact repository commit, release/artifact identity, hashes, license, and materially relevant dependency metadata before evaluation.

### 2. Quarantine before execution

Use the Signalproof quarantine lifecycle and preserve downloaded/unreviewed material outside approved execution until identity, static review, and hash re-verification gates pass.

### 3. Run automated inspection as evidence

Use SkillSpector Static-Core or another approved scanner within its tested boundary. Record completeness limits, network mode, unsupported inputs, suppression/baseline state, and operational failures.

A scanner verdict must never self-authorize install, activation, publication, privilege growth, or release.

### 4. Inspect capability surface, not just package metadata

Separate the actual execution surface needed by Signalproof from unrelated server, Studio, MCP, development, installer, or convenience surfaces.

A dependency may belong to a tooling/server surface rather than the bounded execution surface required. Any omission or substitution must remain explicit, minimal, falsifiable, and separately governed.

### 5. Selectively adapt rather than wholesale adopt

Use external skill/workflow patterns only where they provide a distinct benefit. Preserve exact provenance and do not copy ambient authority assumptions from the source ecosystem.

### 6. Preserve independent review axes

At minimum keep distinct where material:

- source/provenance integrity;
- security/trust boundary;
- functional/capability fit;
- scope/spec fidelity;
- dependency/runtime readiness;
- recovery/removal;
- human authority.

One passing axis cannot erase a failure in another.

### 7. Use falsifiable acceptance

Define tests that can reject the candidate. Examples include:

- exact artifact mismatch;
- unresolved dependency/source drift;
- unapproved network/semantic-provider use;
- scanner incompleteness represented as clean approval;
- hidden persistence or privilege expansion;
- unexpected server/MCP/tooling activation;
- protected-state mutation;
- failed cleanup/recovery;
- external publication without authority;
- duplicate capability with no material benefit.

### 8. Return a governed disposition

Use bounded dispositions such as:

`ADOPT / ADAPT / INTEGRATE / STUDY-REFERENCE / CLEAN-ROOM REBUILD / BUILD FROM SCRATCH / WATCHLIST / REJECT`

The disposition remains a Signalproof evaluation/human decision, not a scanner or third-party skill decision.

## Reusable rule candidate

> **Automated inspection, external workflow patterns, and Signalproof governance should be composed rather than substituted for one another: scanners produce evidence, external skills may contribute selectively adapted operating patterns, and Signalproof retains identity, quarantine, authority, verification, recovery, and disposition control.**

Supporting sub-rule:

> **When an upstream dependency blocks a governed installation, determine whether it belongs to the execution surface actually required. A narrower adapter is permissible only when the divergence is explicit, minimal, falsifiable, runtime-tested, recoverable, and never misrepresented as upstream-conformant support.**

## Evidence basis

Primary public Signalproof evidence already present in this repository includes:

- `research/v0.2-cases/nvidia-skillspector-static-core-evaluation.md`
- `acceptance/skillspector-v2.9.5-static-core-case2-final-closeout.md`
- `research/v0.2-cases/mattpocock-skills-intake.md`
- `research/v0.2-capability-intake-evidence-matrix.md`

The SkillSpector Static-Core closeout records the accepted bounded adapter and its constraints. The Matt Pocock intake records selective adaptation patterns and explicitly does not authorize wholesale installation/adoption.

## Candidate acceptance requirements

Before promotion of this combined rule into Active root/specialist doctrine, test it against at least two materially different future intake cases and verify that it:

1. preserves exact provenance and quarantine;
2. prevents scanner verdicts from becoming authority;
3. distinguishes execution-surface dependencies from unrelated tooling surfaces without silently weakening upstream requirements;
4. preserves explicit divergence when adapting a package or workflow;
5. preserves separate review axes and adverse evidence;
6. produces a bounded Signalproof disposition;
7. leaves a practical recovery/removal path;
8. does not force SkillSpector or Matt Pocock-specific implementation details onto unrelated tools.

## Current governance state

**LOGGED AS CANDIDATE. NOT ACTIVE DOCTRINE.**

This record does not create a new Signalproof skill, does not alter the accepted SkillSpector Case 2 disposition, does not authorize additional SkillSpector modes, and does not grant installation or execution authority for any external skill/tool.
