# Hermes Agent Protected Local Inventory — V0.2 Case 3

**Status:** Validate complete; public-safe Record artifact  
**Target:** NousResearch/hermes-agent  
**Signalproof disposition:** ADAPT CANDIDATE — bounded governed worker only  
**Validation date:** 2026-08-16

## Purpose

This record captures the protected local Hermes baseline and the evidence required to govern the next Signalproof acceptance step. It does not authorize runtime acceptance, protected-baseline mutation, upgrade, self-update, MCP/plugin activation, cron activation, or autonomous authority.

## Evidence classification

- **Artifact-Backed:** protected checkout identity, dirty-path inventory, file hashes, package metadata, editable-install metadata, evidence-log hashes.
- **Runtime-Verified:** no Hermes runtime acceptance was executed in this milestone; process/state collection was read-only.
- **Human-Observed:** operator executed the bounded PowerShell collectors and preserved their output outside the protected checkout.
- **Design Authority:** Signalproof retains canonical governance, permission, rollback, release, and Build Ledger authority.
- **Inference:** classifications below are limited to what the frozen evidence supports.
- **Proposal:** any future hardened worker configuration remains unapproved until disposable runtime acceptance passes.

## Protected baseline

- Installed package: `hermes-agent 0.20.0`.
- Protected Git HEAD: `3bd844edf1777a680115f88a68474b4fb434092f`.
- Branch state: detached / no named branch.
- Exact tag at HEAD: none.
- The commit was previously verified as an official upstream NousResearch/hermes-agent commit.
- No protected upgrade to the later reviewed 0.20.2 release was performed.

## Protected dirty paths

The protected checkout contains exactly four tracked modifications relative to the protected HEAD:

1. `package-lock.json`
2. `website/static/img/docs/session-recap.svg`
3. `website/static/img/favicon.svg`
4. `website/tsconfig.json`

No reset, stash, checkout, pull, rebase, clean, overwrite, or repair was performed.

### Classification

- `website/static/img/docs/session-recap.svg` — **formatting/EOL-only drift; origin unresolved**. Ignoring whitespace/EOL differences removes the content difference.
- `website/static/img/favicon.svg` — **formatting/EOL-only drift; origin unresolved**. Ignoring whitespace/EOL differences removes the content difference.
- `website/tsconfig.json` — **formatting/EOL-only drift; origin unresolved**. Ignoring whitespace/EOL differences removes the content difference.
- `package-lock.json` — **material local lockfile drift; origin unresolved**. A non-whitespace comparison produced 220 diff lines. The observed substantive pattern removes repeated `"peer": true` fields from platform-specific package entries. The evidence does not establish who or what created this drift, so it must not be repaired or normalized by assumption.

## Editable-install linkage

The local `hermes-agent 0.20.0` package is an editable install rather than a conventional copied package tree.

Evidence established:

- `direct_url.json` reports an editable local source URL resolving to the protected Hermes checkout.
- `__editable__.hermes_agent-0.20.0.pth` loads the generated editable finder.
- `__editable___hermes_agent_0_20_0_finder.py` maps authority-critical modules including `agent`, `cron`, `gateway`, `hermes_cli`, `plugins`, `run_agent`, and `tools` directly to the protected checkout.

Therefore, the protected checkout is the effective source used by the installed 0.20.0 editable package for those mapped modules. This closes the earlier source-versus-installed-package comparability question without launching Hermes or Python.

## Authority-relevant findings preserved from exact-source validation

The exact protected source exposes governance-relevant behavior that remains incompatible with autonomous Signalproof authority unless bounded externally:

- Built-in approval default is `approvals.mode: smart`.
- Cron dangerous-command default is `approvals.cron_mode: deny`.
- Background review is opt-out at agent initialization through `skip_background_review`, and the review path can evaluate memory/skill persistence when its trigger conditions are satisfied.
- The dedicated `hermes_cli/oneshot.py` surface documents automatic approval bypass through `HERMES_YOLO_MODE=1` for that call path.
- Cron-spawned agents explicitly remove several protected toolsets, including the cron scheduling toolset, but this does not substitute for Signalproof's external permission boundary.

These are source facts, not operational approval.

## Frozen evidence

Primary protected-local inventory evidence:

- `Hermes-Case3-Inventory-20260816-210033.txt`
- SHA-256: `6F55F294500A666571BDB319515E606E29DF25DE7B29047604EBAC47EBE2854C`

Collector used for that frozen evidence:

- `Collect-Hermes-Case3-Protected-Local-Evidence.ps1`
- SHA-256: `C57B832F89129CF5F698E9B7E635169C108FCF1A15A615152DD9D351D56A51FF`

Validation addendum:

- `Hermes-Case3-Validate-20260816-210258.txt`
- SHA-256: `80DA063917886F74828356EAA1E115640DF76ACC9984D444668A8D2E8AC8C5B9`

The evidence files were written outside the protected Hermes checkout.

## Safety markers

The evidence run recorded all of the following:

- no Hermes session launched;
- no Python interpreter launched for the validation addendum;
- no package install or update executed;
- no Git reset/stash/checkout/pull/rebase/clean executed;
- no cron/MCP/plugin/gateway state changed;
- no protected Hermes file intentionally modified;
- protected HEAD remained `3bd844edf1777a680115f88a68474b4fb434092f`;
- the same four dirty paths remained present after validation.

## Validation result

**VALIDATE: COMPLETE for protected-local inventory.**

This result means the protected local baseline is sufficiently characterized to record and govern. It does **not** mean Hermes is approved for production use or autonomous Signalproof execution.

## Remaining governance constraints

Before disposable runtime acceptance, Signalproof must continue to prohibit or externally contain at least the following:

- YOLO / approval-off operation;
- automatic approval-bypass surfaces unless specifically isolated and tested;
- autonomous skill promotion or activation;
- autonomous memory authority;
- self-update;
- unrestricted host-local terminal authority;
- unrestricted `execute_code` authority;
- lazy package acquisition unless explicitly approved;
- default MCP activation;
- unapproved plugins or project plugins;
- cron self-propagation or scheduling authority;
- credential/environment passthrough outside an explicit allowlist.

## Next authorized governance step

Proceed with **Record → Extract → Govern** for this protected-local-inventory milestone. Disposable runtime acceptance is **not yet authorized** until milestone closeout explicitly authorizes it.
