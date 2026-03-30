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

## Current Status (End of Session 3)

**Location:** Duskport, harbor dock. Party reunited.

**Party Level:** 2 (all characters)

**Party Funds:** ~275gp

**Party HP:** All full. All resources restored.

**Key Outcomes:**
- Tome of Unraveling: inert, returned to collective-key vault in Aelindra
- Thessara Kain: under house arrest, testified, chose redemption
- Veyra Solund: interim Archivist-General
- Edric Aldenmere: staying in Aelindra for Archive reform
- Serevane: disappeared ("The city is standing. That is enough.")
- Duskport: 3 captives in Voss custody, inquiry active, Calder quiet

**Open Threads for Session 4:**
- Calder Aldenmere — quiet, dangerous, hasn't surrendered
- Voss inquiry — ongoing, party statements needed
- Vel Noctis / Unchained Compact — larger network beyond Duskport and Aelindra
- Aldric's necromancer — personal quest
- Orindel's street children — ongoing commitment
- Individual aspirations: Mira's garden, Pip's education, Bram's school, Sylvara's notebook, Aldric's monastery, Orindel's dog
- Zaryth's ruined signet ring — his fallen house, still unspoken
- Serevane's whereabouts
- Thessaly's list
- The deep vaults — what's sealed beneath Aelindra?
