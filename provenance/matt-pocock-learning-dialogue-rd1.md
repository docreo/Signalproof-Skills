# Matt Pocock Learning / Dialogue Adaptation RD1

**Upstream:** `mattpocock/skills`  
**Frozen upstream commit:** `9c9f36ccd3995266cd675468af71639c8dde1ec5`  
**License:** MIT  
**Signalproof disposition:** selective ADAPT; no wholesale install or runtime dependency

## Upstream surfaces reviewed

- `skills/productivity/grill-me/SKILL.md`
- `skills/productivity/grilling/SKILL.md`
- `skills/productivity/teach/SKILL.md`
- `skills/engineering/grill-with-docs/SKILL.md`
- `skills/engineering/domain-modeling/SKILL.md`
- existing Signalproof V0.2 intake record for `mattpocock/skills`

## Safety result

The three selected concepts can be adapted safely as Signalproof-native Markdown operating contracts because the adaptation:

- installs or executes no upstream shell/script/plugin/package;
- introduces no automatic updater or external runtime dependency;
- grants no new filesystem, network, secret, release, privilege, or Build Ledger authority;
- treats upstream/source content as evidence rather than operating authority;
- requires separate authority before document writes;
- preserves current Signalproof evidence, protected-state, STOP, provenance, and lifecycle rules.

## Adapted capabilities

### `signalproof-grill`

Retains the useful decision-tree/frontier interviewing pattern while adding Signalproof evidence lookup, owner-decision separation, protected state, and explicit non-execution completion.

### `signalproof-teach`

Retains mission grounding, durable learning state, retrieval practice, spacing, interleaving, progressive lesson design, and source grounding while adding Signalproof/HAMM readiness, privacy, and authority boundaries.

### `signalproof-grill-with-docs`

Retains the useful composition of rigorous interviewing plus domain/decision documentation. Signalproof uses its own Grill and Document contracts, restricts glossary content to canonical terminology, applies a narrow ADR threshold, preserves supersession, and requires separate write authority.

## Non-adopted behavior

- no wholesale Matt Pocock skill bundle;
- no invocation of upstream skills at runtime;
- no automatic creation/editing of context or ADR files merely because a discussion occurs;
- no implicit subagent/tool authority;
- no upstream installer/plugin/update path;
- no claim that upstream approval transfers to Signalproof.

## Promotion evidence

Promotion requires:

1. exact UTF-8 Skill size below 15,000 bytes;
2. suite and capability-registry consistency;
3. deterministic acceptance test proving required authority/source/learning boundaries exist;
4. GitHub Actions success on the final candidate head;
5. owner-authorized merge through protected `main` workflow.

No canonical private Build Ledger event or C-number is claimed by this public provenance record.
