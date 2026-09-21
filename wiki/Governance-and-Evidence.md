# Governance and Evidence

Signalproof treats governance as part of the product and operating system, not as paperwork added after development.

The Knowledge Plane adds a specific requirement: **evidence, interpretation, authority, and operational state must remain distinguishable even when AI helps maintain the knowledge base.**

## Evidence classes

The public Signalproof Skills governance distinguishes among evidence classes so that a weaker form of support is not silently reported as a stronger one.

Current public classes include:

- **Artifact-Backed Fact** — supported by an inspectable artifact.
- **Runtime-Verified Fact** — directly observed through execution or runtime testing.
- **Human-Observed Fact** — reported through human observation.
- **Design Authority** — an approved design or owner decision.
- **Inference** — a reasoned conclusion that is not itself direct proof.
- **Proposal** — a suggested future state or action.

## Why the distinction matters

AI systems are very good at producing plausible language. Plausibility is not proof.

A design mockup cannot prove runtime behavior. A generated summary cannot prove a source says something it does not say. A successful demonstration cannot prove universal compatibility. A branch cannot become an approved standard merely because the file exists.

The same rule applies to the Wiki: clean prose and confident synthesis do not convert interpretation into authority.

## Provenance

Durable knowledge should preserve enough provenance to answer questions such as:

- What source supports this claim?
- Where in that source is the supporting evidence?
- When was it last checked?
- Is it verified fact, design authority, inference, or proposal?
- Which repository or system owns the authoritative state?
- Has later evidence superseded it?

Not every public page needs to expose every internal provenance field, but the system should preserve the chain needed to verify material claims.

## Human authority

Signalproof governance assumes that meaningful human authority must remain real. That requires more than requiring a human to click an approval button.

The human operator should have sufficient visibility to understand material actions, assess evidence, establish boundaries, stop execution, challenge uncertain results, and recover from failure.

An AI system may propose a knowledge update. That does not automatically authorize it to change policy, promote releases, redefine protected baselines, expose private information, or declare uncertain operational state verified.

## Change control

Signalproof Skills uses a governed lifecycle for reusable rules:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED -> RETIRED`

Normal public development is expected to use branches, review, and protected canonical state.

Knowledge writeback should follow the same principle: useful learning should accumulate, but promotion into public or authoritative state should respect the evidence and authority appropriate to the claim.

## Recovery as governance

Recovery is not merely an emergency feature. It is part of responsible change.

Before replacing working state, Signalproof asks whether the current state is known, protected, recoverable, and verifiable. A change that cannot be meaningfully reversed may require a higher evidence and authorization threshold.

## Public/private boundary

Signalproof public documentation must not expose credentials, tokens, private keys, private customer data, private conversation history, unnecessary personal identifiers, or unreleased security details that would create avoidable risk.

The public layer should communicate principles, evidence, and useful implementation patterns while respecting security, privacy, ownership, and release boundaries.

See [Public and Private Knowledge Boundary](Public-Private-Knowledge-Boundary.md).

## Source of truth

This Wiki is maintained public knowledge. It does not supersede canonical technical sources.

For the public Signalproof Skills suite, use the protected `main` branch, the registry, governance file, active skill files, changelog, and associated acceptance/provenance evidence when exact current status matters.

For other Signalproof systems, the repository or ledger that owns the state remains authoritative for that state.

See [Signalproof Knowledge Plane](Signalproof-Knowledge-Plane.md).