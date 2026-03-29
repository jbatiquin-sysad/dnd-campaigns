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
| 2 | The Civic Trust | The Storyteller | Writ delivered to Magistrate Voss. Harwick turned. Edric testified (nat 20). Harbor acquisitions frozen. |
| 3 | The Unchained Compact | The Chronicler | *In progress.* Vel Noctis traced to Aelindra. Party levelled to 2. Sailed north. Safehouse established. Veyra contacted. |

## Current Status (Session 3 — Paused)

**Location:** The Inkwell, Cartographers' Quarter, Aelindra.

**Party Level:** 2 (all characters)

**Three decisions on resume:**
1. Meet Serevane before filing the Writ of Inquiry?
2. Prepare for the senior archivist council session (2 days)
3. Investigate where the Archivist-General relocated the Tome

**Active threats:** Serevane circling (third watcher near Inkwell). Archivist-General chairs the council. Archive detection ward logged party's magic.

**Party HP:** All full. ~116gp remaining.
