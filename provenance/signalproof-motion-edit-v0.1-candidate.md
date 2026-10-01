# `/dsp log-skill` - Signalproof Motion Edit V0.1 Candidate - 2026-09-30

**Status:** CANDIDATE CREATED / STAGED / NONCANONICAL  
**Lifecycle:** CANDIDATE (not Active)  
**Canonical Build Ledger:** not appended; no C-number assigned or reserved.

## Work unit

A completed talking-head edit: "VPS Setup - Easy Way vs Signalproof Way" (37 s source, 42 s delivered with outro). Owner requested Apple-style motion graphics in HyperFrames, synced to exact spoken lines and to a supplied music bed, with graphics on the side opposite the speaker, speaker reframing/cutout, logo cards with information, a repository/link moment, and a subscribe CTA.

## Evidence

- **Artifact-Backed:** delivered MP4 (1920x1080, 30 fps, 42.0 s, about -14 LUFS), word-level transcript and cue sheet, contact sheet sampled at every cue time from the delivered file.
- **Runtime-Verified:** full render completed (11 segments, 0 segment retries) after a stalled first attempt; composition lint had 0 errors.
- **Human-Observed:** owner creative acceptance not yet reported.
- **Inference:** the pipeline generalizes to other talking-head clips; untested beyond this run.

## Lesson extraction (signalproof-learn)

Reusable transformation observed:

`recording + owner line-to-visual instructions + music -> transcript-locked cue sheet -> beat-aligned composition -> verified render + mix`

Negative learning preserved:

1. ASR model downloads were refused; embedded captions plus per-segment forced alignment worked, whole-file alignment failed.
2. Later `fromTo` tweens pre-rendered their start state and hid the speaker early in the timeline; fixed with `immediateRender: false`. Snapshot QC caught it before the full render.
3. A sequential screenshot render stalled at about two-thirds and silently restarted from frame 0, wasting roughly 17 minutes; segmented resumable capture fixed it.
4. Summing SFX on voice clipped; limiter before loudness normalization fixed it.
5. First delivery exceeded the channel upload limit; a size-targeted re-encode was delivered.
6. A live website screenshot was not possible from the work environment; the repository view was recreated from real public repository content and reported as a recreation.
7. The hosting provider was unnamed; a generic card was used and reported as a placeholder.

## Existing-library check

- `signalproof-design`: owns product IA and visual authority; does not own timed video editing.
- `signalproof-build` / `signalproof-build-spawn-debug`: own software builds and UI convergence, not media timing.
- `signalproof-print`: document output only.
- `signalproof-build-capsule`: transfer packaging, not media production.
- External HyperFrames skills: implementation tooling and evidence, not Signalproof authority.

Gap: no Signalproof capability governs transcript-locked, beat-synced media editing with render verification.

## Workflow Mine scoring (R/D/G/V/T)

- R Repetition: 1 (single completed run)
- D Distinct responsibility: 4
- G Gap: 4
- V Value: 4
- T Testability: 4
- Total: 17 -> SPECIALIST / MODE / MERGE REVIEW band.

Disposition: owner-directed **NEW SKILL CANDIDATE**, held at CANDIDATE. Repetition is the main gap; promotion requires additional materially separate runs (different clip, different music, different trigger lines).

## Skill Architecture Check

- `skill_id`: `signalproof-motion-edit`
- `version`: 0.1.0 (updated to 0.1.1 by the portrait run)
- `skill_bytes_before`: none (new)
- `skill_bytes_after`: 8365
- `size_limit_bytes`: 15000
- `budget_status_after`: HEALTHY
- `atomicity_review`: one coherent capability; audio mix and render QC remain inside it at V0.1 because they are not yet independently routed or reused.
- `decomposition_decision`: none now; candidate future split of audio mix into a specialist only if reused by other media capabilities.
- `duplicate_doctrine_removed`: root evidence, authority, and STOP doctrine inherited rather than restated.
- `routing_changes`: none; Candidate is registered under `candidates:` in `library/CAPABILITY-REGISTRY.yaml` and is not in the Router routing set.
- `acceptance_tests`: `tests/acceptance/signalproof-motion-edit-v0.1.md`
- `rollback_or_supersession`: remove the Candidate folder, its acceptance file, this record, and its capability-registry entry.

## Update - portrait run (2026-09-30, `/dsp complete`)

A 9:16 version of the same edit was produced under a `/dsp complete` envelope to establish the portrait mode (Scenario G).

New negative learning:

8. Centering a full-height crop on the frame cut the face; the head position measured from the cutout alpha fixed framing.
9. A title placed in the upper zone covered the face in full-frame crops; text moved below the face.
10. `export A=x B=$A` left the browser path empty for the second variable; export sequentially.

Skill Architecture Check (update): portrait guidance added as a mode inside the same Skill rather than a separate Skill, since cue, beat, mix, and QC doctrine are shared. Bytes after update are recorded in the CHANGELOG entry. Repetition remains below promotion threshold: same source clip.

## Promotion gate

1. owner creative acceptance of the evidence run;
2. at least two further materially separate runs meeting Scenario A;
3. Scenarios B-F exercised;
4. owner-approved merge through the protected PR workflow.

## Public/private boundary

No local file paths, credentials, private ledger heads, or private repository content are recorded here. Media files remain with the owner and are not committed.
