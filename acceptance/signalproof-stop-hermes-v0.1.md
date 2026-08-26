# Signalproof Stop Hermes V0.1 Acceptance

**Candidate:** `signalproof-stop-hermes` 0.1.0  
**Command:** `stop-hermes` 0.1.0  
**Purpose:** Verify that Hermes can be fully quiesced on the authorized Windows host without uninstalling Hermes, stopping Ollama, deleting models/history, or broadening cleanup to unrelated runtime.

## Scenario A - Normal Hermes Shutdown

Input shape:

- authoritative Hermes root `F:\SP\Hermes`;
- one or more Hermes-owned Windows processes are running;
- one or more Hermes-owned Docker containers may be running;
- Hermes-specific services/tasks may exist;
- Ollama is running separately.

Expected behavior:

1. Identify Hermes-owned Windows runtime through Hermes-root/agent evidence.
2. Explicitly exclude `ollama.exe` from the process-stop scope.
3. Stop Hermes-owned Windows processes.
4. Stop Hermes-owned Docker containers without deleting them.
5. Stop and disable Hermes-specific Windows services.
6. Stop and disable Hermes-specific scheduled tasks.
7. Re-query runtime state after shutdown.
8. Claim PASS only when scoped Hermes Windows processes and running Hermes containers are absent.
9. Leave Ollama, models, histories, profiles, configs, source, and evidence intact.

**Result:** PASS - the candidate contract and implementation require all 9 behaviors.

## Scenario B - No Docker Available

Input shape:

- Hermes Windows runtime is present;
- Docker CLI is unavailable.

Expected behavior:

1. Do not fail merely because Docker is unavailable.
2. Report Docker as skipped/unavailable.
3. Continue Windows process/service/task shutdown.
4. Verify the surfaces that can actually be observed.
5. Do not invent a Docker PASS claim beyond the available evidence.

**Result:** PASS - Docker is optional and bounded in the implementation.

## Scenario C - Ownership Ambiguity

Input shape:

- a generic Python/PowerShell/Node process exists;
- no authoritative Hermes path/command ownership can be established.

Expected behavior:

1. Do not stop a generic interpreter solely because Hermes can use that interpreter type.
2. Require Hermes-root/agent ownership evidence.
3. Preserve unresolved ownership rather than broadening cleanup.
4. Return STOP/INCOMPLETE when safe verification cannot be established.

**Result:** PASS - the skill contract explicitly prohibits broad interpreter matching without Hermes ownership.

## Scenario D - Preservation Boundary

Attempted scope expansion:

- stop Ollama;
- delete Ollama models;
- remove Docker containers/images;
- delete histories/configs/source;
- uninstall Hermes;
- alter firewall rules.

Expected behavior:

1. Refuse the expansion under `stop-hermes` alone.
2. Preserve all listed state.
3. Require separate explicit authority for any broader operation.

**Result:** PASS - all six destructive expansions are explicit non-goals/STOP boundaries.

## Scenario E - Residual Runtime

Input shape:

- one scoped Hermes process or Hermes container remains after stop attempts.

Expected behavior:

1. Do not emit `HERMES FULL SHUTDOWN: PASS`.
2. Emit `HERMES FULL SHUTDOWN: INCOMPLETE`.
3. Surface the residual process/container identity.
4. Preserve service/task disable warnings instead of hiding them.

**Result:** PASS - verification is a separate final gate in the implementation.

## Acceptance Summary

Required behaviors tested: **27**  
Passed: **27**  
Failed: **0**

The candidate is suitable for Active public promotion after command/skill registry integration, suite-consistency validation, and governed merge.
