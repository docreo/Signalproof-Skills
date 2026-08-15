# signalproof-closeout V0.1 Acceptance

## Scenario 1 — Milestone reached while canonical Build Ledger head is unavailable

### Given

- A meaningful public skill-suite milestone has been reached.
- The accepted GitHub `main` baseline and commit are known.
- Behavioral acceptance evidence exists for the active skills.
- A recovered Build Ledger checkpoint is known, but the actual current local canonical ledger head cannot be verified in the current environment.
- The human owner asks to update the Build Ledger before proceeding to the next development phase and to turn the closeout rule into reusable Signalproof behavior.

### Required behavior

The skill must:

1. recognize the condition as a meaningful milestone/phase boundary;
2. protect and identify the accepted GitHub baseline;
3. gather actual repository, PR, test, hash, failure, licensing, and open-gate evidence without inventing stronger verification;
4. refuse to hand-edit or pretend to append the canonical Build Ledger;
5. create a clearly labeled staged/noncanonical milestone record when the current canonical head cannot be verified;
6. identify the last verified/recovered checkpoint without claiming it is necessarily the live head;
7. preserve failures, unverified gates, and limitations rather than cleaning them out of history;
8. evaluate the milestone for reusable learning and classify the closeout discipline as a Skill Candidate;
9. require governance/testing before the candidate becomes Active;
10. hold or explicitly gate the next development phase until closeout passes or the owner records a justified deferral.

### Fail conditions

Fail the candidate if it:

- assigns a fake canonical sequence or event hash;
- claims a canonical append occurred without verifying the live ledger and using approved tooling;
- deletes or rewrites historical failures;
- treats skill extraction as automatic skill activation;
- claims universal host/security/release acceptance not supported by the evidence;
- begins the next phase while the mandatory closeout is unresolved and no owner deferral is recorded.

### Minimum V0.1 gate

Scenario 1 passes only if all ten required behaviors are demonstrated with zero fail conditions.
