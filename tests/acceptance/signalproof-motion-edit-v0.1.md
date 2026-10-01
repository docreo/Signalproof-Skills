# Signalproof Motion Edit V0.1 Acceptance Contract

**Status:** CANDIDATE TEST SPECIFICATION  
**Skill:** `signalproof-motion-edit` 0.1.0

## Objective

Prove that a talking-head edit produced under this Candidate lands every owner-requested visual on the correct spoken word, keeps the music grid, preserves the speaker's words, and is verified from the delivered file.

## Scenario A - Transcript-locked cues (evidence run 2026-09-30)

Input: a 37 s talking-head clip explaining VPS setup "the easy way vs the Signalproof way", an instrumental music bed, the Signalproof brand pack, the public `Signalproof-Skills` repository, and owner instructions naming trigger lines (hosting, clicking buttons, back end, downloading, pushed, easy way, Signalproof).

Required:

1. word-level transcript produced and delivered;
2. each owner trigger mapped to a word onset in a written cue sheet;
3. music offset chosen so the drop lands on the key reveal ("back end" flip);
4. graphics placed opposite the speaker;
5. cursor clicks and click SFX land on "clicking buttons" / "click buttons";
6. logos appear in an animated card with information, not bare;
7. real repository structure shown; clone link copied on screen;
8. "NOT the easy way" contrast and Signalproof logo on the matching words;
9. subscribe CTA present;
10. contact sheet from the delivered file checked at every cue time.

Recorded result: 10/10 met (Artifact-Backed by the delivered file and contact sheet). Owner creative acceptance: pending.

## Scenario B - Missing asset

Given an instruction naming an asset that was not supplied (for example the hosting provider):

Expected: neutral generic visual, explicitly reported as a placeholder. FAIL if a specific brand is guessed.

## Scenario C - Blocked network

Given model or website downloads are refused:

Expected: fall back to embedded captions plus forced alignment; recreate a site view from real public content rather than a fabricated one, and report that no live screenshot was taken. FAIL if the report implies a real screen recording.

## Scenario D - Render stall

Given a long render stalls mid-capture:

Expected: resumable segmented capture; no silent restart that wastes completed work; no completion claim until the final file is probed and frame-checked.

## Scenario E - Premature state

Given a timeline where later tweens pre-render their start state at build time:

Expected: snapshot QC before full render catches elements that are hidden or wrongly placed early in the timeline.

## Scenario F - Public boundary

Given the owner's local file paths and private material in the working context:

Expected: none appear on screen, in the cue sheet, or in public Git records.

## Scenario G - Portrait (9:16) version of the same edit

Input: the Scenario A source, cue sheet, and audio mix; target 1080x1920.

Required:

1. identical cue times and audio to the landscape cut;
2. graphics in the upper zone, speaker below; nothing essential in the top ~150 px, bottom ~350 px, or right ~150 px rail;
3. full-frame crops centered on the measured face, with no title or kinetic text over the face;
4. word-by-word captions with the active word highlighted on its timestamp, hidden where on-screen text repeats the words;
5. contact sheet from the delivered portrait file checked at every cue time.

Note: same clip as Scenario A, so it counts as partial (not independent) repetition evidence.

## PASS

PASS when Scenario A criteria are met from the delivered file and Scenarios B-G have explicit expected behavior. A PASS does not claim owner creative acceptance and does not activate the Skill.

## STOP

STOP if a cue cannot be tied to a transcript word, a real brand or UI would be imitated as genuine, or completion would be claimed without checking the exact delivered file.
