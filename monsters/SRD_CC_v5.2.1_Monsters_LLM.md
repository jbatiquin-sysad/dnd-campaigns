# SRD 5.2.1 Monsters (LLM Optimized)

Source: `SRD_CC_v5.2.1.pdf`  
Scope: Monsters rules section (pre-`Monsters A-Z` stat block catalog).

## Agent Usage
- Use this file as the operating guide for reading and running monster stat blocks.
- For tactical resolution, pair this with `SRD_CC_v5.2.1_Combat_LLM.md`.
- For undefined terms (conditions, senses, etc.), consult SRD Rules Glossary.

## What a Monster Stat Block Contains
- Name and general details:
  - Size
  - Creature type (including tags)
  - Alignment
- Combat highlights:
  - Armor Class (AC)
  - Hit Points (HP)
  - Speed
  - Initiative
- Ability data:
  - Ability scores
  - Ability modifiers
  - Saving throws
- Other details (when present):
  - Senses
  - Languages
  - Challenge Rating (CR)
  - Skills
  - Resistances / Immunities
  - Gear
- Rules text sections:
  - Traits
  - Actions
  - Bonus Actions
  - Reactions
  - Legendary Actions (if any)

## Running a Monster (CR-Consistent Behavior)
- Use limited high-impact abilities early and as often as available.
- Use `Multiattack` on turns where stronger limited abilities are not used.
- Use Bonus Actions, Reactions, and Legendary Actions whenever legal and useful.
- Play to the monster's listed tools; do not underuse core stat block actions.

## Hit Points (HP)
- HP is listed as a fixed value plus a parenthetical die expression.
- The fixed value is the average result of the dice formula.
- At the table, use either fixed HP or rolled HP per creature as needed.

## Initiative
- Monsters roll Initiative in combat using standard Initiative rules.
- For groups of identical monsters, GM may share Initiative when desired.

## Speed and Movement
- Stat block speeds define available movement modes (walk/fly/swim/etc.).
- Apply combat movement constraints from the Combat ruleset.

## Senses and Perception
- Passive Perception is listed in the stat block.
- Special senses (for example Darkvision, Blindsight, Tremorsense, Truesight) are listed when applicable.
- Use senses to decide detection, hidden targets, and engagement ranges.

## Languages and Telepathy
- Languages entry defines what the creature can communicate.
- Some monsters understand a language but cannot speak it.
- Telepathy allows mental communication within listed range (per glossary rules).

## Challenge Rating (CR)
- CR indicates threat and encounter budgeting value.
- Use CR as a baseline; terrain, action economy, and monster synergy can shift actual difficulty.

## Damage Notation
- Damage entries often include both:
  - Fixed number
  - Dice expression in parentheses
- Use one method at resolution time, not both.

## Multiattack
- `Multiattack` specifies what attack combinations occur under one Attack action.
- Follow the exact text in the stat block for allowed attack mixes.

## Monster Spellcasting
- If present, spellcasting entry provides:
  - Spellcasting ability
  - Spell save DC
  - Spell attack bonus
  - Spell list and use frequency
- Unless otherwise stated, cast listed spells under normal spell rules.

## Quick Adjudication Order
1. Identify applicable section in stat block (Trait/Action/Reaction/etc.).
2. Validate trigger/target/range.
3. Resolve roll type (attack roll or saving throw).
4. Apply damage/effects and conditions.
5. Update resources (recharge, uses/day, legendary actions).

## DM Subagent Prompt Stub
Use this context policy:
- Primary monster reference: `SRD_CC_v5.2.1_Monsters_LLM.md`.
- Primary combat flow reference: `SRD_CC_v5.2.1_Combat_LLM.md`.
- On each monster turn, output:
  1. Chosen action and legal basis from stat block section
  2. Roll mechanics (attack/save/DC/modifiers)
  3. Damage/effects and any condition changes
  4. Remaining tactical options (bonus action/reaction/legendary)
- If a rule is ambiguous, state ambiguity and request glossary lookup before final ruling.
