# Portrait Prompt Template

Use this template to generate image-gen-ready prompts for each character. Fill every field explicitly — image gen AI has no D&D knowledge. Reference `visual-rules.md` for racial traits.

---

## Template

```
CHARACTER: [Full name]
TIMELINE: [Session/Turn or narrative moment]
SETTING: [Location, time of day, lighting]

RACE & BUILD:
[Explicit physical description from visual-rules.md — height, build, skin color, ear shape, feet (barefoot for halflings), proportions. Do NOT assume the AI knows what a "halfling" or "drow" looks like.]

FACE & HAIR:
[Hair color, style, length. Eye color. Facial features. Expression appropriate to the narrative moment. Scars, marks, or signs of wear from the story.]

CLOTHING & ARMOR:
[Exactly what they are wearing RIGHT NOW at this point in the timeline. Layer by layer — underclothes, armor, outer garments. Include condition: new, worn, repaired, bloodstained, etc.]

WEAPONS & EQUIPMENT:
[What is visible/equipped. Where is it — sheathed, held, slung across back? Include notable items like holy symbols, amulets, spellbooks, thieves' tools.]

NARRATIVE DETAILS:
[Story-specific visual elements — a scratched-out insignia, a too-small scarf worn as a bracer wrap, a river pebble clutched in one hand, ink-stained fingers. These make the portrait THEIRS.]

POSE & MOOD:
[What are they doing? Standing watch, reading a spellbook, scanning a crowd, sitting exhausted? What emotion reads on their face?]

STYLE NOTES:
[Art style guidance — e.g., "grounded fantasy realism, warm lantern lighting, oil painting style, detailed textures"]
```

---

## Usage

1. Read the character's `.md` file for backstory, personality, and current equipment
2. Read `party-state.json` for current HP, conditions, inventory
3. Read `memory_layer.md` for the specific narrative moment (if generating a scene-specific portrait)
4. Cross-reference `visual-rules.md` for racial traits and armor descriptions
5. Fill the template — be EXPLICIT about everything. Never use D&D shorthand the AI won't understand.

## Key Rules

- **Never say "halfling feet"** — say "large bare feet with tough leathery soles and thick curly brown hair on top, no shoes or boots"
- **Never say "drow"** — say "obsidian-black skin, stark white hair, lavender eyes, pointed elven ears"
- **Never say "chain mail AC 18"** — say "interlocking metal ring armor covering torso and arms, worn and well-maintained, with a round wooden shield on the left arm"
- **Always specify height relationships** if multiple characters are in frame
- **Always specify lighting** — it affects how skin tones, armor, and eyes render
- **Include imperfections** — repaired gear, road dust, calluses, scars. Perfection looks generic.
