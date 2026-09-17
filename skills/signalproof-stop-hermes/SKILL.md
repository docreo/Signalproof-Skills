---
name: signalproof-stop-hermes
description: Perform a bounded full Hermes shutdown on Windows by stopping Hermes-owned processes and containers, disabling Hermes-specific services and scheduled tasks, preserving Ollama, models, histories, profiles, configs, and source state, then verifying that Hermes is no longer running.
---

# Signalproof Stop Hermes

## Purpose

`signalproof-stop-hermes` is the governed shutdown skill behind `stop-hermes` / `/dsp stop-hermes`.

Use it when the owner wants Hermes fully quiesced so it does not keep running or immediately restart, while preserving the installed Hermes state for later recovery or restart.

> **Shutdown is not uninstall. Stop only Hermes-owned runtime/autostart surfaces, preserve evidence and state, and verify absence before claiming PASS.**

## Inheritance

Inherits the active root `signalproof` contract plus applicable `signalproof-cleanup`, `signalproof-verify`, and `signalproof-known-errors` rules.

## Default Windows authority

Current Signalproof Hermes root:

```text
F:\SP\Hermes
```

The default script is:

```text
skills/signalproof-stop-hermes/scripts/Stop-Hermes.ps1
```

If the current authoritative Hermes root differs, resolve it before execution. Do not silently apply this skill to an unrelated Hermes install.

## Scope

The skill may:

1. stop Windows processes proven to belong to the authoritative Hermes installation or Hermes Agent runtime;
2. stop running Docker containers whose name/labels identify them as Hermes-owned;
3. stop and disable Windows services whose service identity/path identifies Hermes;
4. stop and disable Windows scheduled tasks whose task identity/action identifies Hermes;
5. verify that no scoped Hermes Windows process or Hermes Docker container remains running.

The default skill does **not**:

- stop Ollama;
- delete or unload Ollama models;
- delete Hermes source, venv, histories, sessions, profiles, skills, configuration, evidence, or model files;
- remove Docker images or containers;
- remove Windows services or scheduled tasks;
- change firewall rules;
- uninstall Hermes;
- rewrite Hermes configuration.

## Safety invariants

1. Prefer exact Hermes-root/path ownership over broad name matching.
2. Never stop `ollama.exe` as part of `stop-hermes`.
3. Stop Docker containers; do not delete them.
4. Disable only services/tasks whose name, display name, path, or action resolves to Hermes.
5. Do not broaden scope to unrelated Python, PowerShell, Docker, WSL, Ollama, or Signalproof processes merely because Hermes uses those technologies.
6. Re-query runtime state after shutdown rather than assuming a stop command succeeded.
7. A warning is not PASS. Residual scoped runtime means `INCOMPLETE`.
8. Preserve the current Hermes install and recovery state so restart or repair remains possible.
9. If ownership is ambiguous, STOP that specific destructive action and report the unresolved item instead of guessing.
10. Do not convert this command into an uninstall or cleanup-all command.

## Execution contract

### Preflight

Before consequential execution:

- resolve the authoritative Hermes root;
- confirm PowerShell is running on Windows;
- load applicable known-error guidance;
- identify whether Docker is available without requiring Docker to be present;
- preserve the requested boundary: Hermes shutdown only.

### Shutdown order

Use this order unless evidence requires a narrower deviation:

1. Hermes Windows processes;
2. Hermes Docker containers;
3. Hermes Windows services;
4. Hermes scheduled tasks;
5. final runtime verification.

### Process ownership

A Windows process is in scope when current evidence ties it to the authoritative Hermes root or Hermes Agent runtime. Exclude Ollama explicitly.

Do not kill a generic interpreter solely because its executable is `python.exe`, `pythonw.exe`, `powershell.exe`, `pwsh.exe`, `cmd.exe`, `node.exe`, or similar. The command/path must establish Hermes ownership.

### Docker ownership

A running container is in scope when its name or labels establish Hermes ownership, including the Hermes ownership label:

```text
hermes-agent=1
```

Use `docker stop`; do not `docker rm`, prune, or remove images.

### Services and scheduled tasks

Stopping a currently running Hermes service/task is not enough when the owner explicitly requests that Hermes not keep running. Disable the Hermes-specific autostart surface so it cannot immediately re-launch through that mechanism.

Disabling is reversible and is distinct from deleting registration.

## Verification

Re-query after shutdown.

Required PASS conditions:

```text
remaining Hermes Windows processes = 0
remaining running Hermes Docker containers = 0
```

When Hermes services/tasks were found, report whether each relevant autostart surface was successfully disabled. A service/task disable failure must remain visible even if no runtime process is currently active.

## Status

- **PREFLIGHT**
- **STOPPING**
- **HERMES FULL SHUTDOWN: PASS**
- **HERMES FULL SHUTDOWN: INCOMPLETE**
- **STOP / OWNERSHIP AMBIGUOUS**

## PASS output

Routine successful output should include:

```text
HERMES FULL SHUTDOWN: PASS
No Hermes Windows processes detected.
No running Hermes Docker containers detected.
Hermes-specific services/tasks found were disabled.
Ollama was intentionally left alone.
```

## INCOMPLETE output

If scoped resources remain, return their identity instead of hiding them:

```text
HERMES FULL SHUTDOWN: INCOMPLETE
Remaining processes: <pid/name/path/command>
Remaining containers: <id/name/labels>
Service/task disable warnings: <identity + error>
```

## Accepted invocation

```text
stop-hermes
/dsp stop-hermes
dsp stop-hermes
```

Conversational equivalents include:

```text
shut Hermes down completely
stop Hermes and keep it stopped
turn Hermes off without uninstalling it
```

## STOP conditions

STOP the affected action when:

- the authoritative Hermes root cannot be established;
- a candidate process/container/service/task cannot be distinguished from unrelated runtime;
- the requested operation would require deleting models, histories, configs, source, containers, images, or unrelated services;
- shutdown requires stopping Ollama but the owner did not separately authorize that scope;
- verification cannot determine whether Hermes remains active.

## Restart boundary

This skill intentionally disables Hermes-specific services/tasks it discovers. Restarting Hermes later may require re-enabling the exact autostart mechanisms if the owner wants automatic startup restored. Manual Hermes launch remains a separate operation and must not be implied by this skill.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-stop-hermes`
- **Command:** `stop-hermes`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline after governed merge
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Hermes runtime shutdown and autostart containment
- **Created by:** Doc Reo / Signalproof
