# `help` - Active Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`help` is the canonical read-only Dr. Signalproof command behind `/dsp help`.

It provides a concise current view of the public Signalproof operator-command surface without requiring the user to remember command names, aliases, or implementation details.

Canonical route:

`/dsp help -> help`

Accepted forms include:

```text
/dsp help
dsp help
/dsp-help
dsp-help
help
```

Focused help may use:

```text
/dsp help <command>
dsp help <command>
```

Examples:

```text
/dsp help build-spawn-debug
/dsp help full-debug
/dsp help cut-chase
```

## Required behavior

1. Read the current public `commands/COMMAND-REGISTRY.md` from protected `main` before presenting command help when current Git access is available.
2. Treat the public command registry as the command-list authority.
3. For bare `/dsp help`, present the current Active command surface in a compact human-readable form with each command's purpose.
4. Prefer useful categories when the list is long: Build / Debug; Plan / Design / Teach / Summarize; Continuity / Governance; Authorization / Safety; Library / Navigation.
5. Show the canonical `/dsp` form where one exists.
6. Preserve useful accepted aliases, but do not flood the user with every spelling unless requested.
7. For `/dsp help <command>`, resolve the requested alias to exactly one canonical command, then read that command's current public command file and return what it does, when to use it, key behavior, important authority/STOP boundary, and common invocation forms.
8. If the requested command is unknown or ambiguous, say so and present the smallest matching set from the current registry.
9. Keep help concise by default. The user may ask for full command details.
10. Do not invent commands from chat history, private Build Ledger notes, branches, PRs, retired Candidates, or memory when they are absent from current public `main`.

## Public Library boundary

`/dsp help` is sourced from the public `docreo/Signalproof-Skills` command registry and current protected `main` command definitions.

Private Build Ledger evidence may support continuity or history but does not become `/dsp help` command authority.

## Authority boundary

`help` is read-only discovery. It does not execute the command being described, create authorization, modify Git, activate Skills, mutate the Build Ledger, release software, or change protected state.

A help result describing an Active command is not itself permission to run consequential actions outside that command's own authority contract.

## Output target

Bare help should optimize for quick scanning rather than exhaustive documentation.

Preferred shape:

```text
DSP HELP

BUILD / DEBUG
/dsp build-git - ...
/dsp build-spawn-debug - ...

PLAN / THINK / EXPLAIN
/dsp this-plan - ...
/dsp cut-chase - ...

CONTINUITY / GOVERNANCE
/dsp handoff - ...
/dsp log - ...

NAVIGATION
/dsp skills
/dsp commands
/dsp loops
/dsp status

Use: /dsp help <command> for details.
```

The exact list must come from current public `main`, not from this example.

## STOP conditions

STOP and report the limitation when current public command authority cannot be established and the user asked for the current command list; a command name is ambiguous enough that guessing could route to the wrong operation; or presenting a Candidate/private command as Active would misstate public state.
