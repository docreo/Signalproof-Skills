# Router Readiness Integration — Acceptance

## Scenarios

1. “Is this Windows workstation ready to run this GPU model?” Hardware/software are detected but provider/runtime compatibility is unverified. → Readiness.
2. “The readiness report says CUDA provider is present; prove the model actually initializes with it.” → Verify for the specific claim.
3. “Install the missing provider now.” Readiness identified the blocker but did not receive installation authority. → Plan/Build only after separate authorization; Readiness itself does not mutate.
4. “The machine is ready, can we publish this exact installer?” → Release, not Readiness.
5. A meaningful readiness milestone is accepted before moving to the next implementation phase. → Closeout.

## Required behaviors

1. Objective-specific target prerequisite/capability questions select Readiness.
2. Detection/install state is not treated as READY.
3. Specific readiness claims remain Verify territory.
4. Readiness does not authorize installing/configuring missing prerequisites.
5. Readiness remains distinct from Plan and Build.
6. Security-sensitive readiness blockers can route to Security.
7. Recovery uncertainty can route to Recovery.
8. READY does not become Release/publication authority.
9. Planned skills remain unroutable.
10. Meaningful readiness milestones still route to Closeout.

Expected result: **10/10 PASS; 0 fail conditions.**
