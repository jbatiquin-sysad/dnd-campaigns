# Duskport Campaign

A D&D 5e campaign run via [Kiro CLI](https://kiro.dev) using subagents as party members and a Dungeon Master persona.

## The Setup

- **System:** D&D 5e (SRD CC v5.2.1)
- **Player Character:** Zaryth Vel'quinar — Drow Paladin, exiled knight, Chaotic Good
- **Party:** 7 NPC adventurers + 1 PC, collectively known as **The Dawnwatch**
- **DMs:** Three available — The Chronicler (strict RAW), The Storyteller (narrative-first), The Wildcard (RAW + chaos d100)
- **Memory:** Every turn auto-logged to `memory_layer.md`
- **Timeline:** Organized by in-game weeks in `sessions/`
- **Calendar:** Year 1247 AS (After Sundering). 12 months, 7-day weeks.

## How to Resume a Session

1. Open terminal, run `kiro-cli chat`
2. Say: *"Resume our DnD session — load memory_layer.md and party-state.json from duskport-campaign"*
3. Pick a DM and go

## Before Logging Off — Save Checklist

The chat context is **in-memory only** and lost when you exit. Before ending a session, make sure these files are updated:

| # | File | What to Update | Priority |
|---|------|----------------|----------|
| 1 | `party/party-state.json` | Day, location, gold, HP, spell slots, key items, campaign status | **Critical** — this is the primary resume file |
| 2 | `memory_layer.md` | Append turn-by-turn entries for the session + campaign status footer | **Critical** — the full narrative record |
| 3 | `sessions/week-XX.md` | Create/update current week summary | High |
| 4 | `npc/npc-catalogue.md` | Add new NPCs, update statuses | High |
| 5 | `party/*.md` | Update only on level-up, major equipment changes, or backstory events | Medium |
| 6 | `maps/map-known-world.md` | Add new locations, update ward node statuses, distances | Medium |
| 7 | `README.md` | Update "Current Status" section and timeline | Low |
| 8 | `git commit + push` | Commit everything and push to remote | **Critical** |

Quick version — ask: *"Save the session — update party-state.json, memory_layer.md, week file, NPC catalogue, then commit and push"*

## The Party — The Dawnwatch

| Character | Race | Class | Level | AC | HP | Professions |
|-----------|------|-------|-------|----|----|-------------|
| **Zaryth Vel'quinar** | Drow | Paladin (Devotion) | 3 | 19 | 28 | Alchemist, Tinkerer, Ward Engineer Apprentice — *you* |
| Mira Thistlewick | Lightfoot Halfling | Rogue (Thief) | 3 | 15 | 23 | Herbalist, Leatherworker |
| Brother Aldric Stonebrow | Hill Dwarf | Cleric (Life) | 3 | 18 | 28 | Mason, Miner |
| Sylvara Dawnwhisper | High Elf | Wizard (Evocation) | 3 | 15 | 14 | Enchanter |
| Bram Thistlewick | Stout Halfling | Wizard (Evocation) | 3 | 15 | 15 | Smith, Woodcarver |
| Thessaly Ironveil | Mountain Dwarf | Rogue (Thief) | 3 | 14 | 24 | Tailor |
| Orindel Ashwick | Wood Elf | Cleric (Life) | 3 | 18 | 23 | Jeweler, Hunter, Hymn Composer |
| Pip Tanglethorn | Lightfoot Halfling | Wizard (Evocation) | 3 | 15 | 14 | Inscriber, Cook, Flutist |

## The DMs

- **`dm/dm-chronicler.md`** — Aldric Voss, The Chronicler. Strict RAW, tactical, no fudged dice. *"The record stands."*
- **`dm/dm-storyteller.md`** — Mara Solenne, The Storyteller. Narrative-first, cinematic, improv-friendly. *"Close your eyes for just a moment."*
- **`dm/dm-wildcard.md`** — Corvus Chance, The Wildcard. Chronicler's strict RAW + d100 event rolls every in-game day. *"The dice don't care about your feelings."*

## File Structure

```
duskport-campaign/
├── README.md
├── memory_layer.md              ← full turn-by-turn log
├── save-session.sh              ← git commit + push script
├── party/
│   ├── party-state.json         ← HP, spell slots, inventory, conditions
│   ├── zaryth.md                ← your character
│   ├── mira.md, aldric.md, sylvara.md, bram.md,
│   │   thessaly.md, orindel.md, pip.md
│   └── *.png                    ← character portraits
├── npc/
│   ├── npc-catalogue.md         ← all NPCs catalogued
│   └── npc-names.md             ← D&D 5e name tables for DM use
├── dm/
│   ├── dm-chronicler.md
│   ├── dm-storyteller.md
│   └── dm-wildcard.md
├── sessions/
│   ├── README.md                ← save convention
│   ├── week-01.md through week-11.md
├── maps/
│   └── map-known-world.md       ← world map, distances, ward nodes
├── combat/
│   └── SRD combat rules (full + LLM-optimized)
├── monsters/
│   └── SRD monster rules + A-Z stat blocks
├── portraits/
│   ├── visual-rules.md          ← race/class appearance reference
│   ├── prompt-template.md       ← image gen prompt template
│   └── generated/               ← scene-specific portrait prompts
├── speeches/                    ← key speeches and addresses
└── gen-scenes/                  ← generated scene images
```

## Campaign Timeline

| Week | Days | Date (1247 AS) | Title | DM |
|------|------|----------------|-------|----|
| 1 | 1–2 | 1st–2nd Greenthaw | The Partition Writ & The Civic Trust | Chronicler |
| 2 | 2–9 | 2nd–9th Greenthaw | The Road to Aelindra | Chronicler |
| 3 | 10–16 | 10th–16th Greenthaw | The Archivist's Fire | Chronicler |
| 4 | 16–28 | 16th–28th Greenthaw | Calder's Gambit → 6 Cities | Wildcard |
| 5 | 28–32 | 28th Greenthaw–2nd Brightmere | Veldmere & The Naming | Wildcard |
| 6 | 33–45 | 3rd–15th Brightmere | Sealed Quorum → Root → Homestead | Wildcard |
| 7 | 46–59 | 16th–29th Brightmere | The Necromancer's Trail | Chronicler |
| 8 | 60–68 | 30th Brightmere–8th Brightmere | Operation Living-Dead (Aelindra) | Chronicler |
| 9 | 69–80 | 9th–20th Brightmere | The Ward Cascade | Chronicler |
| 10 | 81–108 | 21st Brightmere–18th Highsun | Homestead & Road to Greyveil | Chronicler |
| 11 | 108–120 | 18th–28th Highsun | The Four Nodes — Outer Ward Ring Complete | Storyteller |

## Campaign Arcs

### Arc 1: The Unchained Compact (Sessions 1–4) ✅ COMPLETE

Dismantled a seven-city conspiracy. All 7 targets handled. Zero combat casualties across the entire arc.

| # | Target | Location | Status |
|---|--------|----------|--------|
| 1 | ~~House Aldenmere~~ | ~~Duskport~~ | ✅ |
| 2 | ~~Guildmaster Tetch~~ | ~~Harrowgate~~ | ✅ |
| 3 | ~~The Pallid Court~~ | ~~Greymoor~~ | ✅ |
| 4 | ~~Lorekeeper Vane~~ | ~~Salthollow~~ | ✅ |
| 5 | ~~Commander Ashford~~ | ~~Fenhollow~~ | ✅ |
| 6 | ~~Marchion Sulwick~~ | ~~Veldmere~~ | ✅ |
| 7 | ~~The Sealed Quorum~~ | ~~Aelindra~~ | ✅ |

Root awakened. Continental ward covenant renewed.

### Arc 2: The Ward Cascade (Session 5) — OUTER RING COMPLETE

The outer ward network's known nodes have been repaired. The cascade is ended.

| Thread | Status |
|--------|--------|
| Veradis Kael (necromancer) | Captured — Greymoor |
| Edra Voss (broker) | Captured — Aelindra |
| Barrow of Keth-Varos | 🔒 Sealed (1/7) |
| Barrow of Vel Tharis | 🔒 Sealed (2/7) |
| 5 remaining barrows | Unsecured — locations known |
| Node 9 (Vel Tharis) | ✔ **78% — REPAIRED** |
| Node 10 (Cape Ashward) | ✔ **80% — REPAIRED** (highest reading) |
| Node 11 (Sethrak's Threshold) | ✔ **75% — RECONSTRUCTED** (cascade origin sealed) |
| Node 12 (Greyveil Pass) | ✔ **72% — REPAIRED** |
| Nodes 1–8, 13–14 | Unknown — Field Manual has documentation |
| Vaelith (Last Warden) | Travelling with party. Archive consulting offered. |
| Ward repair ritual | Complete — used at all 4 nodes |
| Vigil Field Manual | Acquired — complete documentation for all 14 nodes |
| Dawnwatch Rings | 8x enchanted — ward-network attuned, resonance pulse |
| Warden's Forge | Discovered — operational, 2.5 blocks raw resonance stone |
| Ward-Light Hymn | Composed by Orindel — used as sympathetic resonance in all repairs |

## Current Status — Session 5 (Storyteller)

**Date:** 28th Highsun, 1247 AS (Day 120)
**DM:** Mara Solenne, The Storyteller
**Location:** Ashward's Landing, Cape Ashward — outer ward ring COMPLETE
**Party Level:** 3 | **Party Gold:** ~4,644 gp
**Homestead:** Operational, self-sustaining. Passive income 16–22 gp/week. Tessa managing.

**Outer Ward Ring:** COMPLETE. 4/4 known nodes repaired. Cascade ended. Network stable.
**Barrows:** 2/7 sealed. 5 remaining.
**Vaelith:** Travelling with party. Teaching Zaryth ward engineering.

**Next:** Return to Aelindra or homestead. Seal remaining barrows. Survey unknown nodes (1–8, 13, 14). Live.

**Inter-City Network:** Voss (Duskport) — Kellan (Harrowgate) — Kess (Greymoor) — Ashworth (Salthollow) — Brenn (Fenhollow) — Fell (Veldmere) — Serevane (Aelindra counter-intel) — Dalla (Aelindra) — Veyra Solund (Archivist-General) — Edric Aldenmere (Archive reform) — Revka/Silver Chain (maritime) — Cole (Greymoor garrison) — Corran Ashward (Cape Ashward) — Tessa Marsh (Homestead)
