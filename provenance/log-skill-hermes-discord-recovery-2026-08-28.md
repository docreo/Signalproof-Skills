# `/dsp log-skill` - Hermes Discord Recovery - 2026-08-28

**Status:** PUBLIC-SAFE LOG / CANDIDATE LESSONS  
**Scope:** Native Windows Hermes profile, Discord gateway, Docker terminal boundary, outbound acceptance  
**No canonical Build Ledger sequence is claimed by this record.**

## Objective

Preserve the reusable lessons from recovering Hermes Discord communications without leaking bot tokens, private evidence, or protected local recovery details.

## Accepted outcome

The active Hermes `orchestrator` profile reached a verified Discord outbound acceptance state:

- bot token authentication: PASS;
- gateway connection: PASS;
- Discord server membership: PASS;
- target channel access: PASS;
- two authorized Discord users configured: PASS;
- direct Hermes outbound send to the intended Discord channel: PASS;
- Discord returned a concrete successful message identity.

Inbound Discord-to-Hermes reply acceptance and worker-bot/A2A relay are separate gates and are not claimed by this record.

## Root causes discovered

### 1. Profile-scoped configuration drift

Hermes named profiles maintain their own runtime state. The root Hermes `.env` contained a valid Discord token while the active `orchestrator` profile initially did not. Repairing only the root profile did not repair the active named-profile gateway.

**Reusable rule:** Before changing a messaging credential or gateway setting, identify the exact active Hermes profile and operate on that profile's configuration/state/log surfaces.

### 2. Stale root-level state was mistaken for live profile state

Root-level `gateway_state.json` and logs preserved an older Discord authentication failure while the live gateway PID and lock belonged to the `orchestrator` profile.

**Reusable rule:** Do not infer live profile health from root/default state files when a named profile is running. Resolve the active profile first, then inspect its PID, lock, state, and logs.

### 3. Token validity and plugin/file presence were separate questions

The Discord adapter and Python dependency existed and loaded correctly. The recorded `401 Unauthorized / Improper token has been passed` failure proved credential rejection, not a missing `.py` file.

**Reusable rule:** Separate four evidence classes:

1. adapter/plugin file presence;
2. Python package importability;
3. token validity against Discord `/users/@me`;
4. gateway/platform connection.

Do not diagnose one class from another.

### 4. Discord `50001 Missing Access` was a server/channel authorization boundary

After token and gateway authentication passed, outbound sends returned `403 / 50001 Missing Access`. Direct server access also failed until the exact HermBot application was authorized into the intended Discord server.

**Reusable rule:** For `50001`, test server membership before changing Hermes, Python, or Docker. If server membership passes, then test the target channel and category/channel permissions.

### 5. Discord `40333 internal network error` was not the same failure

A direct PowerShell REST probe produced Discord/Cloudflare code `40333`, which was materially different from `50001`. Adding an appropriate Discord API User-Agent distinguished the diagnostic transport failure from Discord access control.

**Reusable rule:** Preserve Discord error codes exactly. Do not collapse all HTTP 403 responses into one diagnosis.

### 6. Docker terminal state is not Hermes host-runtime authority

The orchestrator agent's Docker terminal searched Linux paths, found no Discord token or `discord.py`, and concluded that Discord was unavailable. This was a false inference about the host runtime: the working Discord gateway and profile existed on the Windows host outside the terminal sandbox.

**Reusable rule:** A terminal backend sandbox can prove only its own filesystem/environment state. It must not be treated as authoritative evidence about host-side Hermes gateway configuration, credentials, plugins, or platform connectivity.

### 7. Installing Discord GUI inside Docker is not required for Hermes messaging

Hermes Discord messaging uses the gateway/platform integration and Discord API. A VNC-enabled Discord desktop application inside Docker would solve a different problem and would duplicate authority unnecessarily.

**Reusable rule:** Do not install a Discord desktop GUI, duplicate bot token, or duplicate `discord.py` inside the terminal sandbox merely to make a host-side Hermes Discord integration visible to the model.

## Known-error candidates

### KE-HERMES-PROFILE-SCOPE-CONFLATION-001

**Domain:** Hermes profiles / gateway / credentials

**Fingerprint:** A root/default Hermes config, state file, or log is inspected or modified while a named profile owns the live gateway, producing contradictory state or ineffective credential changes.

**Prevention:** Resolve the active profile and use its profile-scoped `.env`, config, PID, lock, gateway state, and logs. Treat root/default state as separate evidence.

**Do not repeat:** Repair root `.env` and assume a named-profile gateway inherited the change.

### KE-HERMES-SANDBOX-HOST-CONFLATION-001

**Domain:** Hermes terminal backend / Docker / runtime authority

**Fingerprint:** The model searches its Docker/Linux terminal sandbox for a host-side integration, finds nothing, and concludes the integration is absent from Hermes itself.

**Prevention:** Identify whether the evidence comes from the host Hermes process, named-profile gateway, or terminal sandbox. Use host/profile authority for messaging/platform state.

**Do not repeat:** Install duplicate credentials/dependencies into Docker solely because the terminal sandbox cannot see host runtime state.

### KE-DISCORD-403-CODE-CONFLATION-001

**Domain:** Discord API diagnostics

**Fingerprint:** Different Discord HTTP 403 error codes are treated as equivalent.

**Prevention:** Preserve and classify the Discord JSON `code` before choosing mitigation. In this recovery, `50001 Missing Access` identified authorization/access while `40333` identified a distinct request/network filtering condition.

**Do not repeat:** Retry the same send or change unrelated Hermes configuration without a material condition change.

## Anti-loop lesson

Repeated outbound sends under unchanged `50001 Missing Access` conditions were correctly blocked after a retry ceiling. A new attempt became legitimate only after a material condition changed: the exact bot application was authorized into the intended server.

This aligns with the Signalproof known-error rule: search before retry and state the changed condition before a controlled retest.

## Security boundary

The successful design keeps Discord credentials in the active host-side Hermes profile. The Docker terminal sandbox should remain credential-minimized. If model-initiated host messaging is later required, prefer a narrow governed host-side communications bridge or upstream-supported host tool rather than copying raw Discord credentials into Docker.

## Candidate future skill/workstream

A future Signalproof Hermes Communications skill may cover:

- profile-scoped gateway diagnosis;
- Discord authentication/server/channel acceptance gates;
- safe outbound acceptance tests;
- host-versus-terminal authority classification;
- governed communications bridge design;
- worker/A2A relay testing as a separate transport lane.

This record does not promote that candidate to Active.

## STOP / non-claims

This log does not claim:

- Discord inbound/reply acceptance;
- worker-to-worker or orchestrator-to-worker messaging acceptance;
- executive bot-fleet monitoring acceptance;
- canonical Build Ledger append;
- production activation of a new communications bridge.
