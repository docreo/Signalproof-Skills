# Core Runtime hardening lessons candidate

This branch captures reusable lessons extracted from the Signalproof Core Runtime 0.1.2-RD1 provider-lifecycle hardening milestone.

Source milestone evidence remains private. This public note intentionally omits private local paths, machine-specific process identifiers, and internal Build Ledger data.

Candidate lessons:

- distinguish product/source failure from test-harness or outer-wrapper failure before retrying mutating work;
- inspect persisted state before rerunning a failed wrapper;
- scope static safety checks to the semantic boundary under review rather than relying on repository-wide substring bans;
- contain a process created during a failed startup before ownership is forgotten;
- clear lifecycle ownership only after cleanup is verified; preserve ownership state when cleanup is uncertain;
- never substitute an externally observed process identity for the process identity returned by the governed start operation;
- separate provider validity/approval from lifecycle ownership and stop authority;
- preserve failed attempts and uncertainty as milestone evidence.

Governance state: Candidate pending repository consistency checks, review, and merge authority.
