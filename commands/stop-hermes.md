# `stop-hermes` - Active Operator Command V0.1.0

**Status:** CANDIDATE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`/dsp stop-hermes` performs a bounded full shutdown of the current Signalproof Hermes runtime and prevents discovered Hermes-specific autostart mechanisms from immediately bringing it back.

It preserves Ollama, models, histories, profiles, configs, source, Docker images/containers, and evidence.

Core rule:

> Stop Hermes completely without turning shutdown into uninstall or collateral cleanup.

## Accepted forms

```text
/dsp stop-hermes
stop-hermes
dsp stop-hermes
```

Conversational equivalents include:

```text
shut Hermes down completely
stop Hermes and keep it stopped
turn Hermes off without uninstalling it
```

## Skill route

Load:

```text
skills/signalproof-stop-hermes/SKILL.md
```

Default implementation:

```text
skills/signalproof-stop-hermes/scripts/Stop-Hermes.ps1
```

## Default authority

Current Signalproof Hermes root:

```text
F:\SP\Hermes
```

If the authoritative Hermes root has changed, resolve the current root before execution. Do not silently target another install.

## Execution

The command performs the following bounded sequence:

1. stop Hermes-owned Windows processes while explicitly excluding Ollama;
2. stop running Hermes Docker containers without deleting them;
3. stop and disable Hermes-specific Windows services;
4. stop and disable Hermes-specific scheduled tasks;
5. re-query Windows processes and Docker runtime and emit PASS or INCOMPLETE.

## Preservation boundary

The command does not:

- stop Ollama;
- delete or unload models;
- delete histories, profiles, sessions, skills, source, configs, or evidence;
- remove Docker containers or images;
- uninstall Hermes;
- delete service/task registrations;
- alter firewall rules;
- rewrite Hermes configuration.

## PASS

A successful shutdown must verify:

```text
HERMES FULL SHUTDOWN: PASS
No Hermes Windows processes detected.
No running Hermes Docker containers detected.
Hermes-specific services/tasks found were disabled.
Ollama was intentionally left alone.
```

## INCOMPLETE

If scoped Hermes runtime remains, return:

```text
HERMES FULL SHUTDOWN: INCOMPLETE
```

and surface remaining process/container identity plus any service/task disable warning. Do not claim completion merely because a stop command was issued.

## Restart note

Because `stop-hermes` disables discovered Hermes-specific services and scheduled tasks, a later automatic-start restoration may require re-enabling those exact registrations. Restart/re-enable is intentionally a separate operation.

## Boundary

`stop-hermes` is a runtime shutdown/autostart-containment command. It does not create authority to uninstall Hermes, stop Ollama, clean all Docker state, alter unrelated Signalproof components, or perform broader machine shutdown.

## Maturity

This command remains **Candidate** until its skill, implementation, registry updates, suite checks, and governed merge are complete.
