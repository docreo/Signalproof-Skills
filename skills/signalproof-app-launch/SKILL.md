---
name: signalproof-app-launch
description: Mandatory clean no-terminal application-launch and lifecycle gate for Signalproof end-user hosted web applications, local browser dashboards, PWAs, native/desktop apps and hybrids. Use with /dsp complete, design-git, build-git, build-spawn-debug, verification and release whenever an application is built, revised, packaged or handed to an operator.
---

# Signalproof Application Launch Standard

## Identity
- **Suite:** Signalproof Skills
- **Skill:** `signalproof-app-launch`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** no-terminal end-user app launch, lifecycle and verification
- **Created by:** Doc Reo / Signalproof

## Mandatory operating rule

Finished operator-facing applications launch by a normal user action, **not by starting or keeping open a command prompt, PowerShell, Python, Node development server, shell script or other developer terminal**. Carry this as a mandatory gate under `/dsp complete` and `build-git`. It inherits and does not weaken Signalproof Framework, brand, law, licensing/TOS, security, rollback, evidence, Git and human authority constraints.

Classify each target precisely:
- `HOSTED_WEB`: open its deployed HTTPS URL; no fictitious EXE installer.
- `PWA`: open deployed URL or verified installable shortcut if PWA installation is part of the requirements.
- `LOCAL_WEB_DESKTOP`: double-click a packaged GUI launcher which owns its local host and opens the UI automatically, without a console.
- `NATIVE_DESKTOP`: double-click the installed/portable GUI executable or app icon; normal OS lifecycle and visible errors.
- `HYBRID`: same terminal-free launch with single ownership over native shell, local server and embedded web UI.
- `NOT_APPLICABLE`: explicit documented exemption for libraries, headless services, developer-only tools, deliberate CLI products or non-app artifacts.

A portable EXE does **not** prove an OS installer, registration, signed distribution or native desktop window.

## Mandatory application launch gate

Before building, add `APPLICATION LAUNCH GATE` to the Complete Authorization Envelope and acceptance matrix. Read the applicable platform contract and choose the smallest supported implementation. The required sequence is:

`PLATFORM CLASSIFIED -> PACKAGE VERIFIED -> NORMAL LAUNCH -> NO TERMINAL -> UI READY -> REOPEN/RELAUNCH -> SAFE EXIT -> TARGET OS CHECK -> HUMAN UI ACCEPTANCE -> GITHUB/ROLLBACK EVIDENCE`.

A failed or unknown required phase cannot be silently marked PASS.

- Include the actual user launch entrypoint in the exact distributable.
- Ensure no manual server, runtime installation or console is required by the ordinary user flow.
- Show errors in a native or visible app UI, not a hidden/background terminal.
- Own the process and any localhost listener. Refuse unrelated/wrong-version port occupants; never kill them or silently change browser origin and data.
- Reopen the verified existing instance or fail safely on repeated launch.
- Supply ordinary Quit/Exit that respects recording, streaming, unsaved state and other protected resources. Do not orphan a server after the user exits.
- Preserve state, identity, rights, brand, manifest, signatures/provenance, exact rollback and local security boundaries.
- Use GitHub for source, evidence and verified product artifact delivery according to the owner's repository rule; no automatic Google Drive fallback.

## Specific verified Windows example, not a universal implementation mandate

One successful portable local-browser-host pattern used Go Windows builds with `-ldflags='-s -w -H=windowsgui'` to mark the executable GUI subsystem rather than console subsystem. The packaged EXE owned a `127.0.0.1` server, opened the default browser, verified same-version identity on second launch, and offered a safe in-app close action. The owner confirmed the EXE opened correctly without a command window. This demonstrates **that observed launch experience on that machine only**. It does not demonstrate installer registration, public signing or cross-platform compatibility. Other stacks must use their supported Windows/macOS/Linux GUI launch patterns; do not force Go.

## Verification and handoff

For applicable app builds, require:
1. Exact-source, build artifact and manifest/hash checks, app entrypoint present.
2. Static OS/platform checks (e.g. Windows PE GUI subsystem = 2); static evidence is not a real OS runtime test.
3. Real target-environment user-action launch, no terminal, working UI and useful failure feedback.
4. Second launch behavior, owned-process closure, port/conflict refusal where applicable, persistence and safe shutdown.
5. Actual owner/human UI acceptance, without manufacturing PASS from build or browser fixture tests.
6. GitHub repository/ref/release identity, rollback, test log and any remaining unverified gates.

A browser app hosted on a server may satisfy this by opening the URL, whereas a local browser app must start its own host without a console. An intentionally console-only product must be classified as a deliberate CLI and not represented as a polished user-facing desktop app.

**STOP** `USER UI TEST READY` when the only operator path requires CMD/PowerShell/Python/npm or when the packaged GUI entrypoint/owned server is absent or unverified. When OS testing is unavailable, report `AUTOMATED PASS / TARGET-OS HUMAN TEST PENDING` with the exact executable and acceptance procedure. Never bypass OS security, sign without authorization, or claim a complete installer when only a portable package exists.
