---
name: signalproof-known-errors-v0.1.1-candidate
description: Candidate update to the Active Signalproof Known Errors catalog, adding two generalized repeatable error fingerprints discovered during Build 8A Gate 7 closeout.
---

# Signalproof Known Errors V0.1.1 Candidate

## Status

**CANDIDATE / NOT ACTIVE**

## Parent

- Active skill: `signalproof-known-errors` v0.1.0
- Parent Git head at extraction: `f2f89ca4dcc4c3b42e0786178257d53ea00e31ae`

## Purpose

Add only the two generalized repeatable error fingerprints newly supported by Build 8A Gate 7 evidence. Existing parser, native stderr, path normalization, hidden dependency, evidence preservation, and repeated-path lessons remain deduplicated under the Active v0.1.0 catalog.

---

## KE-NPM-OFFLINE-CACHE-MISS-001

**Domain:** npm / offline dependency restoration / package provenance

**Error:** An exact lockfile pins a dependency, the npm cache directory exists and may contain many files, but `npm ci --offline` fails with `ENOTCACHED` because the exact locked package artifact is not actually available to npm's offline cache resolution path.

**Prevention:** Do not treat cache existence or cache file count as proof that every required locked artifact is locally restorable. Before offline restore, verify the exact locked package artifact or a separately preserved, provenance-bound dependency tree. If offline restore fails with `ENOTCACHED`, preserve the failure and search approved local evidence before considering any network fetch.

**Do not repeat:** Retry the same offline restore under unchanged cache conditions or infer that a populated cache proves exact dependency availability.

---

## KE-PS-FORMAT-METHOD-ARGUMENT-001

**Domain:** Windows PowerShell / formatting expressions / method invocation

**Error:** A composite `-f` format expression embedded directly inside a method invocation is parsed or bound in a way that supplies fewer arguments than the format string requires, producing a `FormatError` even though the intended values are present.

**Prevention:** Compute parser-sensitive or multi-argument formatted values as a scalar first, then pass that scalar into the method call. Example pattern: `$line = "{0}|{1}|{2}" -f $a, $b, $c; $list.Add($line)`.

**Do not repeat:** Place an ambiguous multi-argument `-f` expression directly inside `.Add(...)` or another method call when the same value can be computed first and passed explicitly.

---

## Governance

- These entries are public-safe generalizations only.
- No private paths, protected hashes, Build Ledger chronology, unreleased implementation details, or private recovery artifacts are included.
- Candidate extraction does not activate the entries.
- Promotion requires review against Active v0.1.0 for deduplication, focused acceptance tests, owner approval, and versioned Active update.

## Identity

- **Suite:** Signalproof Skills
- **Candidate:** `signalproof-known-errors` v0.1.1
- **Maturity:** Candidate / Not Active
- **Domain:** repeatable error fingerprints and prevention patterns
- **Created by:** Doc Reo / Signalproof
