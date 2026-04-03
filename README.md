# Duskport Campaign

A D&D 5e campaign run via [Kiro CLI](https://kiro.dev) using subagents as party members and a Dungeon Master persona.

## The Setup

- **System:** D&D Basic Rules 2018 (4 races, 4 classes)
- **Player Character:** Zaryth Vel'quinar — Drow Paladin, exiled knight, Chaotic Good
- **Party:** 7 NPC adventurers, each run as a Kiro subagent
- **DMs:** Three available — The Chronicler (strict RAW), The Storyteller (narrative-first), The Wildcard (RAW + chaos d100)
- **Memory:** Every turn auto-logged to `memory_layer.md`
- **Timeline:** Organized by in-game weeks in `sessions/`

## How to Resume a Session

1. Open terminal, run `kiro-cli chat`
2. Say: *"Resume our DnD session — load memory_layer.md and party-state.json from duskport-campaign"*
3. Pick a DM and go

## The Party

| Character | Race | Class | Level | AC | HP | Alignment |
|-----------|------|-------|-------|----|----|-----------|
| **Zaryth Vel'quinar** | Drow | Paladin | 2 | 19 | 19 | CG — *you* |
| Mira Thistlewick | Lightfoot Halfling | Rogue | 2 | 15 | 15 | CN |
| Brother Aldric Stonebrow | Hill Dwarf | Cleric (Life) | 2 | 18 | 20 | LG |
| Sylvara Dawnwhisper | High Elf | Wizard (Evocation) | 2 | 15 | 10 | NG |
| Bram Thistlewick | Stout Halfling | Wizard (Evocation) | 2 | 15 | 11 | LN |
| Thessaly Ironveil | Mountain Dwarf | Rogue (Thief) | 2 | 14 | 16 | CN |
| Orindel Ashwick | Wood Elf | Cleric (Life) | 2 | 18 | 15 | NG |
| Pip Tanglethorn | Lightfoot Halfling | Wizard (Evocation) | 2 | 14 | 10 | CN |

## The DMs

- **`dm/dm-chronicler.md`** — Aldric Voss, The Chronicler. Strict RAW, tactical, no fudged dice. *"The record stands."*
- **`dm/dm-storyteller.md`** — Mara Solenne, The Storyteller. Narrative-first, cinematic, improv-friendly. *"Close your eyes for just a moment."*
- **`dm/dm-wildcard.md`** — Corvus Chance, The Wildcard. Chronicler's strict RAW + d100 event rolls every in-game day. *"The dice don't care about your feelings. Neither do I. But I do find them fascinating."*

## File Structure

```
duskport-campaign/
├── README.md
├── memory_layer.md          ← full turn-by-turn log (auto-appended each turn)
├── npc-catalogue.md         ← all NPCs catalogued with descriptions
├── save-session.sh          ← git commit + push script
├── party/
│   ├── zaryth.md            ← your character
│   ├── mira.md
│   ├── aldric.md
│   ├── sylvara.md
│   ├── bram.md
│   ├── thessaly.md
│   ├── orindel.md
│   ├── pip.md
│   ├── party-state.json     ← HP, spell slots, inventory, conditions, scoreboard
│   ├── Zaryth.png           ← character portraits
│   ├── Mira.png
│   ├── Aldric.png
│   ├── Sylvara.png
│   ├── Bram.png
│   ├── Thessaly.png
│   ├── Orindel.png
│   └── Pip.png
├── dm/
│   ├── dm-chronicler.md
│   ├── dm-storyteller.md
│   └── dm-wildcard.md
├── sessions/                ← organized by in-game weeks
│   ├── week-01.md           ← Night 1: Partition Writ + Civic Trust
│   ├── week-02.md           ← Days 2–9: Road to Aelindra
│   ├── week-03.md           ← Days 10–16: The Archivist's Fire
│   ├── week-04.md           ← Days 16–22: Calder's Gambit + Harrowgate
│   └── week-05.md           ← Days 22–25: The Crucible Beneath the Mountain
└── speeches/
    └── before-aelindra-mission.md
```

## Campaign Timeline

| Week | In-Game Days | Title | DM | Key Outcome |
|------|-------------|-------|----|-------------|
| 1 | Night 1 – Day 1 | The Partition Writ & The Civic Trust | Chronicler / Storyteller | Writ secured. Maret + Duvash rescued. Edric testified (nat 20). Harbor frozen. |
| 2 | Days 2–9 | The Road to Aelindra | Chronicler | Vel Noctis traced to Archivist-General. Serevane contacted. Party leveled to 2. |
| 3 | Days 10–16 | The Archivist's Fire | Chronicler | Valis Procedure (14 min). Tome discharged. Thessara chose redemption. Veyra interim A-G. |
| 4 | Days 16–22 | Calder's Gambit & Harrowgate | Wildcard | Calder's 3-phase plan stopped. Harrowgate Guild frozen. Corvath arrested. 2/7 targets handled. |
| 5 | Days 22–28+ | The Crucible, The Athenaeum & The Wardhouse | Storyteller / Chronicler | Greymoor: Blackveil captured. Salthollow: Athenaeum opened, regional charters secured. Fenhollow: Ward Nexus secured. 5/7 handled. Arrived Veldmere. |

## Campaign Scoreboard

| # | Target | Location | Handler | Status |
|---|--------|----------|---------|--------|
| 1 | ~~House Aldenmere~~ | ~~Duskport~~ | ~~Lord Aldenmere~~ | ✅ HANDLED |
| 2 | ~~The Pallid Court~~ | ~~Greymoor~~ | ~~Dorn Blackveil~~ | ✅ HANDLED |
| 3 | ~~Guildmaster Orvyn Tetch~~ | ~~Harrowgate~~ | ~~Renn Corvath~~ | ✅ HANDLED |
| 4 | ~~Lorekeeper Idris Vane~~ | ~~Salthollow~~ | ~~Yara Senn~~ | ✅ HANDLED |
| 5 | ~~Commander Brecca Ashford~~ | ~~Fenhollow~~ | ~~Wren Ashdale~~ | ✅ HANDLED |
| 6 | Marchion Drael Sulwick | Port Veldmere | Lucenne Dray + Overseer Callista Venn | Active — fleet ready, Venn in compound |
| 7 | The Sealed Quorum | Aelindra | (institutional) | Monitored |

## Current Status (Week 5 — IN PROGRESS)

**DM:** Aldric Voss, The Chronicler
**Location:** Veldmere, public harbor, berth 14
**Party Level:** 2 | **Party Funds:** 2,168.5gp
**Party HP:** All full, all resources
**Next:** Marchion Drael Sulwick / Overseer Callista Venn / Lucenne Dray
**Campaign Clock:** ~3 days before remaining assets consolidate
**Escape Route:** Soren Blackwater, *Marsh Hawk*, berth 14, 3-day window

**Inter-City Network:** Voss (Duskport) — Kellan (Harrowgate) — Kess (Greymoor) — Ashworth (Salthollow) — Brenn (Fenhollow) — Serevane (counter-intel)

**Credentials:** 8x Duskport, 8x Harrowgate, 8x Greymoor, 8x Salthollow, 8x Fenhollow, 1x Temple, priority river clearance, overland travel writ, marsh passage writ
