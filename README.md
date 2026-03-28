# Duskport Campaign

A D&D 5e campaign run via [Kiro CLI](https://kiro.dev) using subagents as party members and a Dungeon Master persona.

## The Setup

- **System:** D&D Basic Rules 2018 (4 races, 4 classes)
- **Player Character:** Zaryth Vel'quinar — Drow Paladin, exiled knight, Chaotic Good
- **Party:** 7 NPC adventurers, each run as a Kiro subagent
- **DMs:** Two available — The Chronicler (strict RAW) or The Storyteller (narrative-first)
- **Memory:** Every turn auto-logged to `memory_layer.md`

## How to Resume a Session

1. Open terminal, run `kiro-cli chat`
2. Say: *"Resume our DnD session — load memory_layer.md and party-state.json from the duskport-campaign folder"*
3. Pick a DM and go

## The Party

| Character | Race | Class | Alignment |
|-----------|------|-------|-----------|
| **Zaryth Vel'quinar** | Drow | Paladin | CG — *you* |
| Mira Thistlewick | Lightfoot Halfling | Rogue | CN |
| Brother Aldric Stonebrow | Hill Dwarf | Cleric (Life) | LG |
| Sylvara Dawnwhisper | High Elf | Wizard | NG |
| Bram Thistlewick | Stout Halfling | Wizard | LN |
| Thessaly Ironveil | Mountain Dwarf | Rogue | CN |
| Orindel Ashwick | Wood Elf | Cleric (Life) | NG |
| Pip Tanglethorn | Lightfoot Halfling | Wizard | CN |

## The DMs

- **`dm/dm-chronicler.md`** — Aldric Voss, The Chronicler. Strict RAW, tactical, no fudged dice. *"The record stands."*
- **`dm/dm-storyteller.md`** — Mara Solenne, The Storyteller. Narrative-first, cinematic, improv-friendly. *"Close your eyes for just a moment."*

## File Structure

```
duskport-campaign/
├── README.md
├── memory_layer.md          ← full session log (auto-appended each turn)
├── party/
│   ├── zaryth.md            ← your character
│   ├── mira.md
│   ├── aldric.md
│   ├── sylvara.md
│   ├── bram.md
│   ├── thessaly.md
│   ├── orindel.md
│   ├── pip.md
│   └── party-state.json     ← HP, spell slots, inventory, conditions
├── dm/
│   ├── dm-chronicler.md
│   └── dm-storyteller.md
└── sessions/
    └── session-01.md        ← Session 1 summary
```

## Session Log

| Session | Title | DM | Outcome |
|---------|-------|----|---------|
| 1 | The Partition Writ | The Chronicler | Writ secured. Maret + Duvash rescued. House Aldenmere exposed. |

## Current Status (End of Session 1)

**Location:** Temple of the Balanced Scale, Duskport. Dawn.

**Three open decisions:**
1. Go to Magistrate Sera Voss immediately with the Writ
2. Find Lord Edric Aldenmere (secret ally inside House Aldenmere)
3. Split the party — both simultaneously

**Active threat:** Rooftop watcher with signal mirror — House Aldenmere may already know.

**Party HP:** All full. Zaryth Lay on Hands: 0/5. Faerie Fire expended.
