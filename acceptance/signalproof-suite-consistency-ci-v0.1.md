# Signalproof Skills — Suite Consistency CI V0.1 Acceptance

## Candidate objective

Create deterministic regression infrastructure that detects drift between the public Signalproof suite registry, README Active table, individual SKILL.md identity metadata, and Router Current Routing Set.

This is test/CI infrastructure, not a new specialist skill.

## Protected state

- `main` remains protected and canonical.
- No existing Active skill contract is modified by this candidate.
- No branch status check is made required during candidate development.
- The workflow uses read-only repository permissions.
- `actions/checkout` is pinned to immutable commit `11d5960a326750d5838078e36cf38b85af677262` rather than a floating tag.

## Checker coverage

The checker validates:

1. required registry, README, and skills directory exist;
2. Active registry skills appear in the README Active table;
3. README Active entries are actually Active in the registry;
4. README skill links point to matching skill folders;
5. README and registry versions agree;
6. every Active registry skill has `skills/<name>/SKILL.md`;
7. SKILL.md frontmatter name agrees with its folder;
8. SKILL.md Identity version agrees with the registry;
9. Active registry entries declare Active maturity in SKILL.md;
10. non-Active registry entries do not declare Active maturity;
11. Router is Active and present;
12. Router includes every Active routable skill except itself;
13. Router does not reference unknown/non-Active skills;
14. Router version agrees with registry/README;
15. Planned skills do not appear as README Active or Router targets;
16. non-Active registry skills do not appear as README Active or Router targets.

## Fixture regression tests

Eight synthetic regression tests were executed locally before PR creation:

- good fixture -> PASS;
- missing README Active skill -> expected FAIL;
- README/registry version mismatch -> expected FAIL;
- Router omission of Active skill -> expected FAIL;
- missing Active SKILL.md -> expected FAIL;
- Router reference to Candidate skill -> expected FAIL;
- Candidate in README Active table -> expected FAIL;
- Active registry entry with candidate maturity -> expected FAIL.

Result:

**8/8 fixture tests PASS, 0 unexpected failures.**

## CI workflow

Workflow: `.github/workflows/suite-consistency.yml`

Job/check name: `suite-consistency`

Triggers:

- pull requests affecting registry/README/SKILL.md/checker/tests/workflow;
- pushes to `main` affecting the same surfaces.

Steps:

1. pinned checkout;
2. report Python version;
3. run fixture regression tests;
4. run the checker against the live repository checkout.

## Acceptance gate

Candidate promotion requires:

- fixture tests pass in GitHub Actions;
- live repository consistency check passes in GitHub Actions;
- PR is mergeable with no unresolved review thread;
- workflow is merged through protected PR flow;
- post-merge `main` workflow succeeds.

Only after a real successful workflow exists on canonical `main` should making `suite-consistency` a required status check be considered.

## Non-claims

- Local fixture success is not yet proof that GitHub Actions executed successfully.
- A workflow file existing is not proof that a status check exists or has passed.
- This checker does not validate semantic correctness of every skill contract; it validates defined cross-artifact consistency invariants.
