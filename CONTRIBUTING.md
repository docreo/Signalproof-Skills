# Contributing to Signalproof Skills

Thank you for helping improve Signalproof Skills.

Signalproof Skills is intended to evolve from evidence, testing, and approved lessons rather than from unreviewed prompt accumulation.

## License

Unless you explicitly state otherwise, contributions intentionally submitted for inclusion in this repository are provided under the Apache License 2.0, consistent with Section 5 of that license.

Do not submit material you do not have the right to contribute.

## Do not submit secrets or private material

Do not include credentials, tokens, private keys, private filesystem paths, private customer information, confidential conversations, hidden prompts, unreleased proprietary implementation details, or other information that should not become public.

Use synthetic examples when a public example is needed.

## Skill-change lifecycle

Reusable lessons should normally move through:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE`

A proposed skill change should identify:

- the problem it addresses;
- the evidence supporting it;
- its intended scope;
- how it was tested or can be tested;
- what existing rule or behavior it affects;
- whether it creates a new permission, dependency, risk, or compatibility requirement.

## Root contract

Specialist `signalproof-*` skills may add stricter domain procedures, but should not silently weaken the root `signalproof` skill's requirements around:

- human authority;
- protected state;
- evidence classification;
- bounded change;
- verification;
- recovery;
- public/private separation;
- proof and continuity.

## Pull requests

Changes to the canonical branch should use the protected pull-request workflow. Keep PRs bounded and explain what changed, what remains protected, and what evidence supports the change.

A merged contribution is not automatically evidence that every claim in it has been runtime-verified. Evidence classes should remain explicit.
