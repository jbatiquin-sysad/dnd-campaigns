# Portrait Prompt Generator

Generates image-gen-ready prompts for D&D character portraits using subagents. Translates D&D 5e racial traits, current equipment, and narrative state into explicit visual descriptions that image generation AI can understand.

## Why This Exists

Image gen AI doesn't know D&D rules. It'll put boots on halflings, make drow grey instead of obsidian black, and ignore the scarf Hilde knitted for Aldric. This system ensures every portrait prompt is racially accurate, narratively current, and explicitly described.

## File Structure

```
portraits/
├── README.md              ← you are here
├── visual-rules.md        ← D&D 5e racial appearance + armor reference (edit if adding new races/classes)
├── prompt-template.md     ← structured prompt format + key rules for image gen AI
└── generated/
    └── {batch}-{session}-{location}.md  ← generated prompt files
```

## How to Generate Prompts

In Kiro CLI, say:

```
Generate portrait prompts for the full party at [location/moment].
Read visual-rules.md and prompt-template.md from duskport-campaign/portraits/,
party-state.json, and each character's .md file from party/.
Use subagents to batch — 4 characters per subagent.
Write output to portraits/generated/.
```

### For a specific character at a specific moment:

```
Generate a portrait prompt for Pip at the Valis Procedure (S3 Turn 25, minute 12).
Read visual-rules.md, prompt-template.md, pip.md, party-state.json, and memory_layer.md.
```

### For a group scene:

```
Generate a group portrait prompt — all 8 party members at the Broken Drum celebration in Greymoor.
Include height differences and seating arrangement.
```

## How It Works

1. Subagent reads `visual-rules.md` for racial traits (halflings barefoot, drow obsidian skin, etc.)
2. Subagent reads `prompt-template.md` for the output structure and key rules
3. Subagent reads the character `.md` file for backstory, personality, and equipment list
4. Subagent reads `party-state.json` for current HP, conditions, and inventory
5. Subagent reads `memory_layer.md` if generating a scene-specific portrait (for narrative context)
6. Subagent fills every field in the template explicitly — no D&D shorthand

## Key Rules Enforced

- Halflings (Mira, Pip, Bram) are always **barefoot** with hairy feet
- Drow (Zaryth) have **obsidian black** skin, not grey or purple
- Armor is described visually ("interlocking metal rings"), not mechanically ("chain mail AC 18")
- Equipment reflects the **current timeline**, not starting gear
- Narrative details are included (scratched insignia, repaired shield, gifted items)
- Height differences are explicit when multiple characters appear together

## Naming Convention

```
generated/{batch}-{session}t{turn}-{location}.md
```

Examples:
- `batch1-s4t34-veldmere.md` — Zaryth/Mira/Aldric/Sylvara at S4 Turn 34, Veldmere
- `batch2-s4t34-veldmere.md` — Bram/Thessaly/Orindel/Pip at S4 Turn 34, Veldmere
- `pip-s3t25-valis-procedure.md` — Single character, specific scene

## Created

2026-04-03, during Session 4 pause at Veldmere. Built to solve the "boots on halflings" problem and ensure portrait consistency across the campaign.
