# Duskport Campaign

A D&D 5e campaign run via [Kiro CLI](https://kiro.dev) using subagents as party members and a Dungeon Master persona.

## The Setup

- **System:** D&D 5e (SRD CC v5.2.1)
- **Player Character:** Zaryth Vel'quinar — Drow Paladin, exiled knight, Chaotic Good
- **Party:** 7 NPC adventurers + 1 PC, collectively known as **The Dawnwatch**
- **DMs:** Three available — The Chronicler (strict RAW), The Storyteller (narrative-first), The Wildcard (RAW + chaos d100)
- **Memory:** Every turn auto-logged to `memory_layer.md` (active session + summary). Older sessions archived in `memory_archive_s1-s4.md`.
- **Timeline:** Organized by in-game weeks in `sessions/`
- **Calendar:** Year 1248 AS (After Sundering). 12 months, 7-day weeks.

## How to Resume a Session

**Quick start (recommended):**
```bash
cd ~/duskport-campaign && ./resume-session.sh
```

This pulls latest from GitHub, displays the campaign dashboard (day, location, gold, DM, status), copies the resume prompt to your clipboard, and launches `kiro-cli chat`. Just paste and hit Enter.

**Pick a specific DM:**
```bash
./resume-session.sh storyteller   # Mara Solenne — narrative-first, cinematic
./resume-session.sh chronicler    # Aldric Voss — strict RAW, tactical
./resume-session.sh wildcard      # Corvus Chance — RAW + d100 chaos
```

**Manual resume (without script):**
1. Open terminal, run `kiro-cli chat`
2. Say: *"Resume our DnD session — load memory_layer.md and party-state.json from duskport-campaign use The Storyteller this time"*

## Before Logging Off — Save

**Quick save (recommended):**
```bash
./save-session.sh
```

This syncs party-state to `~/.kiro/prompts/`, stages all changes, pulls latest, commits with an auto-generated message (day + week title), and pushes to GitHub.

**Custom commit message:**
```bash
./save-session.sh "Node 11 reconstructed, 14 wraiths freed"
```

**Manual save (without script):** Ask in chat: *"Save the session — update party-state.json, memory_layer.md, week file, NPC catalogue, then commit and push"*

### Save Checklist

The chat context is **in-memory only** and lost when you exit. Before ending a session, make sure these files are updated:

| # | File | What to Update | Priority |
|---|------|----------------|----------|
| 1 | `party/party-state.json` | Day, location, gold, HP, spell slots, key items, campaign status | **Critical** — primary resume file |
| 2 | `memory_layer.md` | Append turn-by-turn entries for the session + campaign status footer | **Critical** — full narrative record |
| 3 | `sessions/week-XX.md` | Create/update current week summary | High |
| 4 | `npc/npc-catalogue.md` | Add new NPCs, update statuses | High |
| 5 | `party/party-inventory.md` | Shared gold, provisions, materials, credentials, key items | High — hook on any shared resource change |
| 6 | `party/party-equipment.md` | Individual armor, weapons, accessories per member | Medium — hook on personal gear change |
| 7 | `party/party-professions.md` | Skills, training status, income ranges, training tracker | Medium — hook on profession use or advancement |
| 8 | `party/*.md` | Character sheets — update on level-up, major equipment, or backstory events | Medium |
| 9 | `maps/map-known-world.md` | New locations, ward node statuses, distances, party location marker | Medium |
| 10 | `README.md` | "Current Status" section and timeline | Low |
| 11 | `git commit + push` | Run `./save-session.sh` or commit manually | **Critical** |

Quick version — ask in chat: *"Save the session — update party-state, memory layer, week file, NPC catalogue, inventory, equipment, professions, then commit and push"*

## The Party — The Dawnwatch

| Character | Race | Class | Level | AC | HP | Professions |
|-----------|------|-------|-------|----|----|-------------|
| **Zaryth Vel'quinar** | Drow | Paladin (Devotion) | 3 | 19 | 28 | Alchemist, Tinkerer, Ward Engineer Apprentice — *you* |
| Mira Thistlewick | Lightfoot Halfling | Rogue (Thief) | 3 | 15 | 23 | Herbalist, Leatherworker |
| Brother Aldric Stonebrow | Hill Dwarf | Cleric (Life) | 3 | 18 | 28 | Mason, Miner |
| Sylvara Dawnwhisper | High Elf | Wizard (Evocation) | 3 | 15 | 14 | Enchanter, Glassblower |
| Bram Thistlewick | Stout Halfling | Wizard (Evocation) | 3 | 15 | 15 | Smith, Woodcarver |
| Thessaly Ironveil | Mountain Dwarf | Rogue (Thief) | 3 | 14 | 24 | Tailor, Weaver |
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
├── memory_layer.md              ← active session log (S5+)
├── memory_archive_s1-s4.md      ← archived sessions 1–4
├── save-session.sh              ← stage + commit + push to GitHub
├── resume-session.sh            ← pull + dashboard + launch kiro-cli
├── party/
│   ├── party-state.json         ← HP, spell slots, inventory, conditions
│   ├── party-inventory.md       ← shared gold, provisions, materials, credentials
│   ├── party-equipment.md       ← individual loadouts, slot-by-slot
│   ├── party-professions.md     ← skills, training, income ranges
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
│   ├── week-01.md through week-13.md
├── chrono/
│   ├── calendar-guide.md        ← 12-month calendar, seasons, festivals, timeline
│   └── history-known-world.md   ← 3,000-year world history (Vaelith + Seren account)
├── maps/
│   ├── map-known-world.md       ← world map, distances, ward nodes
│   └── scaled-map.md            ← hex grid map (1 hex = 24 mi), terrain, ward coverage
├── combat/
│   └── SRD combat rules (full + LLM-optimized)
├── monsters/
│   └── SRD monster rules + A-Z stat blocks
├── genai-prompts/               ← image/song gen AI prompts
├── genai-scenes/                ← generated scene images + visual rules
├── songs/                       ← generated songs (mp3)
├── speeches/                    ← key speeches and addresses
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
| 8 | 60–68 | 30th Brightmere–8th Highsun | Operation Living-Dead (Aelindra) | Chronicler |
| 9 | 69–80 | 9th–20th Highsun | The Ward Cascade | Chronicler |
| 10 | 81–108 | 21st Highsun–18th Solstice | Homestead & Road to Greyveil | Chronicler |
| 11 | 108–120 | 18th–28th Solstice | The Four Nodes — Outer Ward Ring Complete | Storyteller |
| 12 | 121–135 | 1st–15th Goldmere | Cape Ashward → Home (side hustles) | Storyteller |
| 13 | 136–360 | 16th Goldmere–30th Thawsend | Homestead Arc — Barrows, Tower, Winter, Year's End | Storyteller |

### Year 1248 AS

| Week | Days | Date (1248 AS) | Title | DM |
|------|------|----------------|-------|----|
| 14 | 1 | 1st Greenthaw | Seren Ashvale Arrives — Western Arc Mapped | Wildcard |

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
| 5 remaining barrows | 🔒 ALL SEALED (7/7) |
| Node 9 (Vel Tharis) | ✔ **78% — REPAIRED** |
| Node 10 (Cape Ashward) | ✔ **80% — REPAIRED** (highest reading) |
| Node 11 (Sethrak's Threshold) | ✔ **75% — RECONSTRUCTED** (cascade origin sealed) |
| Node 12 (Greyveil Pass) | ✔ **72% — REPAIRED** |
| Nodes 1–8, 13–14 | Unknown — Field Manual has documentation |
| Vaelith (Last Warden) | At homestead. Teaching Zaryth ward engineering. |
| Ward repair ritual | Complete — used at all 4 nodes |
| Vigil Field Manual | Acquired — complete documentation for all 14 nodes |
| Dawnwatch Rings | 8x enchanted — ward-network attuned, resonance pulse |
| Warden's Forge | Discovered — operational, 2.5 blocks raw resonance stone |
| Ward-Light Hymn | Composed by Orindel — used as sympathetic resonance in all repairs |

### Arc 3: The Western Arc (Session 5 — Wildcard, in progress)

Seren Ashvale, Keeper of Node 5 (Stormcape), arrived New Year's Day 1248 AS with field logs for the western ward nodes. Node 5 fell 9 months ago. The western flank is open.

| Node | Name | Location | Est. Reading | Key Hazard |
|------|------|----------|-------------|------------|
| Node 2 | Drowned Forge | Volcanic island chain, SW (B12) | 40–45% | Volcanic vents, sulfur. Dead Zone within 30 mi. |
| Node 3 | Storm Pillar | Western headland cliff (A7) | 35–40% | Extreme wind. **Unknown large creature.** |
| Node 4 | Tidewatcher | Exposed rock shelf, W coast (A10) | 45–50% | **Accessible only 3 days/year: 15th–17th Goldmere.** |
| Node 5 | Stormcape | Western coast (A5) | **FAILED** | Dead Zone expanding. Full reconstruction needed. |

**Expedition plan:** Two trips. Trip 1 (spring): Forge → Node 3 → Node 5. Trip 2 (summer): Node 4 (tidal window) → Node 2 → Veldmere → Home.
**Armor enchanting:** +1 AC all 8 members at Warden's Forge.

## Current Status — Session 5 (Wildcard)

**Date:** 1st Greenthaw, 1248 AS (Day 1) — New Year's Day
**DM:** Corvus Chance, The Wildcard
**Location:** Dawnwatch Homestead, Fenhollow
**Party Level:** 3 | **Party Gold:** ~6,530 gp
**Homestead:** Fully developed — tower, forge, smokehouse, tannery, alchemy shed, stable, root cellar, gardens, library (12 books). Passive income 35–45 gp/week. Tessa managing.

**Arc 2:** COMPLETE. Outer ward ring repaired (4/4 nodes). ALL 7 BARROWS SEALED. Zero combat across entire barrow circuit.
**Arc 3:** ACTIVE. Western arc mapped. Expedition planned. Seren Ashvale guiding.
**Vigil Heartstone:** 1/7 discovered at Ashenmere. Active. Greymoor garrison posted.
**Unknown Nodes:** 3 tentatively identified (1, 5, 8). 7 unidentified (2, 3, 4, 6, 7, 13, 14).
**All weapons enchanted.** All party members equipped with purpose rings + cantrip amulets.
**Vaelith:** At homestead. Teaching Zaryth ward engineering (intermediate level).
**Seren Ashvale:** At homestead. Teaching Stormcape customs, history, culture. Guiding western expedition.
**Professions:** 19 total, 18 proficient, 1 in training (Ward Engineering).

**Next:** Year 1248 AS begins. Spring. Western Arc Expedition — Warden's Forge → Stormcape coast → Nodes 3, 5, 4, 2.

**Inter-City Network:** Voss (Duskport) — Kellan (Harrowgate) — Kess (Greymoor) — Ashworth (Salthollow) — Brenn (Fenhollow) — Fell (Veldmere) — Serevane (Aelindra counter-intel) — Dalla (Aelindra) — Veyra Solund (Archivist-General) — Edric Aldenmere (Archive reform) — Revka/Silver Chain (maritime) — Cole (Greymoor garrison) — Corran Ashward (Cape Ashward) — Tessa Marsh (Homestead) — Sister Venn (Chapel of the Marsh Light)
