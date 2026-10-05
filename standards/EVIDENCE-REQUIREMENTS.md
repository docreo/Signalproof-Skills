# Signalproof Standards Evidence Requirements

**Revision:** V1/RD1

Standards alignment must remain **evidence-backed**.

## Required state labels

Use one of:

- **IMPLEMENTED**
- **PARTIAL**
- **PLANNED**
- **N/A**
- **UNVERIFIED**

Do not use **COMPLIANT** as a shorthand for implementation unless a specifically defined compliance requirement, scope, assessor, evidence package, and authority support that statement.

## Evidence hierarchy

Signalproof public standards mappings may rely on the existing evidence classes:

- Artifact-Backed Fact
- Runtime-Verified Fact
- Human-Observed Fact
- Design Authority
- Inference
- Proposal

Mappings must not silently upgrade evidence class.

## Minimum control record

For each material standards/control claim, preserve:

```text
CONTROL / CONCEPT:
FRAMEWORK / REFERENCE:
SIGNALPROOF COMPONENT:
IMPLEMENTATION STATE:
EVIDENCE:
EVIDENCE CLASS:
ARTIFACT / VERSION / ENVIRONMENT:
LIMITATIONS:
LAST VERIFIED:
OWNER / REVIEW STATE:
```

## Claims rule

Acceptable:

> Exact model routing is IMPLEMENTED in this component; the route is explicit and silent fallback is rejected.

Not acceptable without further evidence:

> This CLI is NIST compliant.

Acceptable:

> This control maps to selected GOVERN and MEASURE concepts in the NIST AI RMF.

Not acceptable:

> NIST approved this design.

## Revalidation

A mapping should be revalidated after:

- material component change;
- framework revision;
- change in intended use;
- control regression;
- incident or newly discovered failure mode.

## Public/private boundary

Public evidence must remain sanitized. Internal evidence may support private assurance work but must not be copied into public repositories when it exposes credentials, private infrastructure, customer data, unreleased security details, or proprietary implementation state.
