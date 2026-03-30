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
2. Say: *"Resume our DnD session — load memory_layer.md and party-state.json from duskport-campaign"*
3. Pick a DM and go

## The Party

| Character | Race | Class | Level | Alignment |
|-----------|------|-------|-------|-----------|
| **Zaryth Vel'quinar** | Drow | Paladin | 2 | CG — *you* |
| Mira Thistlewick | Lightfoot Halfling | Rogue | 2 | CN |
| Brother Aldric Stonebrow | Hill Dwarf | Cleric (Life) | 2 | LG |
| Sylvara Dawnwhisper | High Elf | Wizard (Evocation) | 2 | NG |
| Bram Thistlewick | Stout Halfling | Wizard (Evocation) | 2 | LN |
| Thessaly Ironveil | Mountain Dwarf | Rogue (Thief) | 2 | CN |
| Orindel Ashwick | Wood Elf | Cleric (Life) | 2 | NG |
| Pip Tanglethorn | Lightfoot Halfling | Wizard (Evocation) | 2 | CN |

## The DMs

- **`dm/dm-chronicler.md`** — Aldric Voss, The Chronicler. Strict RAW, tactical, no fudged dice. *"The record stands."*
- **`dm/dm-storyteller.md`** — Mara Solenne, The Storyteller. Narrative-first, cinematic, improv-friendly. *"Close your eyes for just a moment."*
- **`dm/dm-wildcard.md`** — Corvus Chance, The Wildcard. Chronicler's strict RAW + Randy Random's chaos. d100 event rolls every in-game day. *"The dice don't care about your feelings. Neither do I. But I do find them fascinating."*

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
│   ├── dm-storyteller.md
│   └── dm-wildcard.md
└── sessions/
    ├── session-01.md
    ├── session-02.md
    └── session-03.md
```

## Session Log

| Session | Title | DM | Outcome |
|---------|-------|----|---------|
| 1 | The Partition Writ | The Chronicler | Writ secured. Maret + Duvash rescued. House Aldenmere exposed. |
| 2 | The Civic Trust | The Storyteller | Writ delivered to Magistrate Voss. Harwick turned. Edric testified (nat 20). Harbor acquisitions frozen. |
| 3 | The Archivist's Fire | The Chronicler | Party traveled to Aelindra. Serevane defected. Valis Procedure executed (14 min). Tome discharged. Thessara chose redemption. Veyra appointed interim Archivist-General. |
| 4 | Calder's Gambit | The Wildcard | *In progress.* Calder's 3-phase plan: evidence burn (failed), captive extraction (in progress), Voss assassination (active). Serevane returned. |

## Current Status (Session 4 — In Progress)

**DM:** Corvus Chance, The Wildcard

**Location:** Duskport — party split. Sprint team (Mira, Thessaly, Pip) at Ashward warehouse. Main group (Zaryth, Aldric, Sylvara, Bram, Orindel) at Temple of the Balanced Scale.

**Party Level:** 2 (all characters)

**Party Funds:** ~60gp

**Party HP:** All full. Sylvara 1/2 slots. Orindel 1/2 slots.

**Calder's 3-Phase Plan:**
1. Evidence burn (temple) — **FAILED** — original ledger saved, 60% records intact
2. Captive extraction — **IN PROGRESS** — 3 captives moving to east harbor ship, midnight departure
3. Assassinate Voss — **ACTIVE** — insider posing as city watch, strikes after 10th bell (~5 hours)

**Allies Present:** Serevane (Ashward), Vael Orun (temple)

**Immediate Decisions:**
1. Identify and neutralize the assassin inside council chambers
2. Intercept the midnight ship with the 3 escaped captives
3. Find Calder Aldenmere
4. Identify the inside leak
