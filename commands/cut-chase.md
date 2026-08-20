# `cut-chase` - Active Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`cut-chase` is the canonical Dr. Signalproof command for converting complex, repetitive, or overlong material into a decision-ready Signalproof summary.

Canonical route:

`cut-chase -> signalproof-cut-chase`

The command is intended for forms such as:

```text
/dsp cut-chase
/dsp cut chase
dsp cut-chase
cut-chase
```

## Required behavior

1. Load the Active `signalproof-cut-chase` Skill.
2. Identify the actual conclusion, material evidence, uncertainty, blocker, and next action before compressing.
3. Prefer the compact structure:
   - **Bottom line**
   - **What matters**
   - **Action note**
   - **Watch / blocker** only when materially needed.
4. Remove repetition, chronology that does not affect the decision, filler, low-value context, and unnecessary explanatory scaffolding.
5. Preserve technical accuracy, evidence class, failed gates, material qualifiers, protected state, rollback boundaries, and authority constraints.
6. Do not convert inference into fact, recommendation into authorization, partial acceptance into PASS, or unknown state into a confident conclusion.
7. Keep prose readable and human. Do not default to telegraphic or intentionally broken grammar.
8. Humor or a Docism is optional and rare. Default is none. Never use it where it could weaken a safety, security, destructive-action, owner-authorization, or high-stakes boundary.
9. Default invocation is one-shot for the current material. Do not silently persist the style across later turns.
10. If there is no required next action, say `No action required` rather than inventing work.

## Signalproof principle

> **Cut noise without cutting truth.**

## Authority boundary

`cut-chase` is a presentation and salience-compression command. It does not create research evidence, make a governed disposition by itself, grant execution authority, close a milestone, activate a Skill, authorize release, or mutate the Build Ledger.

## STOP conditions

STOP or expand instead of compressing when the requested action cannot be identified without guessing; compression would hide a material warning, qualifier, failure, uncertainty, or safe sequence; the result would imply authority the user did not grant; or the evidence is insufficient to support a reliable bottom line.
