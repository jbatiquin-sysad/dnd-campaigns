# Duskport Campaign

A D&D 5e campaign run via [Kiro CLI](https://kiro.dev) using subagents as party members and a Dungeon Master persona.

## The Setup

- **System:** D&D 5e (SRD CC v5.2.1)
- **Player Character:** Zaryth Vel'quinar — Drow Paladin, exiled knight, Chaotic Good
- **Party:** 9 NPC adventurers + 1 PC, collectively known as **The Dawnwatch**
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
| **Zaryth Vel'quinar** | Drow | Paladin (Devotion) | 3 | 20 | 28 | Alchemist, Tinkerer, Ward Engineer (Journeyman) — *you* |
| Mira Thistlewick | Lightfoot Halfling | Rogue (Thief) | 3 | 16 | 23 | Herbalist, Leatherworker |
| Brother Aldric Stonebrow | Hill Dwarf | Cleric (Life) | 3 | 19 | 28 | Mason, Miner |
| Sylvara Dawnwhisper | High Elf | Wizard (Evocation) | 3 | 16 | 14 | Enchanter, Glassblower |
| Bram Thistlewick | Stout Halfling | Wizard (Evocation) | 3 | 16 | 15 | Smith, Woodcarver |
| Thessaly Ironveil | Mountain Dwarf | Rogue (Thief) | 3 | 16 | 24 | Tailor, Weaver |
| Orindel Ashwick | Wood Elf | Cleric (Life) | 3 | 19 | 23 | Jeweler, Hunter, Hymn Composer |
| Pip Tanglethorn | Lightfoot Halfling | Wizard (Evocation) | 3 | 16 | 14 | Inscriber, Cook, Flutist |
| Seren Ashvale | Human | Monk (Open Hand) | 3 | 16 | 24 | Herbalist, Navigator, Ward Keeper |
| Torven Ashwick | Half-Elf | Druid (Land — Coast) | 3 | 16 | 21 | Ward Engineer, Scribe, Researcher |

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
│   │   thessaly.md, orindel.md, pip.md, seren.md, torven.md
│   ├── nhilara.md               ← specialist (Level 8, Drow Barbarian/Rogue)
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
│   ├── week-01.md through week-18.md
├── lore/
│   ├── calendar-guide.md        ← 12-month calendar, seasons, festivals, timeline
│   ├── history-known-world.md   ← 3,000-year world history (Vaelith + Seren account)
│   └── library-catalogue.md     ← Dawnwatch library: 29 books
├── maps/
│   ├── map-known-world.md       ← world map, distances, ward nodes, Underdark entrances
│   ├── scaled-map.md            ← hex grid map (1 hex = 24 mi), terrain, ward coverage
│   ├── sea-routes.md            ← trade routes, seasonal cargo, crew, revenue
│   ├── underdark-map.md         ← Underdark entrances (confirmed, suspected, rumored)
│   ├── underdark-scaled-map.md  ← Underdark hex grid, Deep Road, Vel'arath layout
│   └── velthara-map.md          ← Vel'thara Resonance Atlas (extradimensional, 12 harmonies)
├── combat/
│   └── SRD combat rules (full + LLM-optimized)
├── monsters/
│   ├── SRD monster rules + A-Z stat blocks
│   └── underdark-encounters.md  ← zone-based encounter tables + homebrew stat blocks
├── dnd-reference/
│   ├── 01–14 SRD reference files (spells, classes, equipment, etc.)
│   ├── sections/                ← sub-section breakdowns
│   └── drow/                    ← Drow lore: society, military, magic, stat blocks, Underdark
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
| 15 | 1–156 | 1st Greenthaw–6th Reaptide | The Western Arc — Forge, Behir, 4 Nodes, Trimaran, Home | Wildcard |
| 16 | 156–360 | 6th Reaptide–30th Thawsend | Duskport, Reaping Fair, Trade Op, Underdark Investigation, Old Foundation, Winter | Chronicler |
| 17 | 1–180 | 1st Greenthaw–30th Reaptide | Deep Road, Heartstones, Vel'quinar Rescue, Fleet Expansion, Veldmere Fair | Storyteller |
| 18 | 181–260 | 1st Ashfall–30th Frostmere | Scouts, Copper Hair, Ashport, Ashara Captured, Vel'thara First Contact | Wildcard |

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

### Arc 2: The Ward Cascade (Session 5) ✅ COMPLETE

All outer ward nodes repaired. All barrows sealed. Cascade ended.

| Thread | Status |
|--------|--------|
| Veradis Kael (necromancer) | Surrendered — Dawnwatch homestead (S8). Rehabilitation candidate. |
| Edra Voss (broker) | Captured — Aelindra |
| All 7 barrows | 🔒 ALL SEALED (7/7) |
| Nodes 9, 10, 11, 12 | ✔ All REPAIRED |
| Vaelith (Last Warden) | At homestead. Teaching Zaryth (Lesson 110). |
| Vigil Field Manual | Acquired |
| Dawnwatch Rings | 10x enchanted |
| Warden's Forge | Operational, 2.0 blocks raw resonance stone |
| Ward-Light Hymn | Composed by Orindel — transmitted to the Vel'thara |

### Arc 3: The Western Arc (Session 5 — Wildcard) ✅ COMPLETE

All 4 western ward nodes repaired. Behir nest cleared. Stormcape alliance built. Trimaran acquired.

| Node | Name | Location | Result | Key Event |
|------|------|----------|--------|-----------|
| Node 3 | Storm Pillar | Western headland (A7) | **62% ✔ REPAIRED** | Behir combat (CR 6 + 2×CR 3). Field-calibrated crystal. |
| Node 5 | Stormcape | Western coast (A5) | **74% ✔ RECONSTRUCTED** | 6-anchor in Dead Zone. Seren came home. |
| Node 2 | Drowned Forge | Volcanic island (B12) | **71% ✔ REPAIRED** | Warden Drell found (38 years at post, deceased). |
| Node 4 | Tidewatcher | Tidal rock shelf (A10) | **76% ✔ INFUSED** | Folk ward-keeper Asha maintained it with shells. Pip's first flawless procedure. |

**ALL 8 KNOWN OUTER WARD NODES ACTIVE — first time in 1,248 years.**

Behir heart → Thessaly's rapier (Silent Storm + Nerve Strike). Trimaran *Stormcape's Promise* built with Old Marsh. 5 Stormcape cliff-holds allied. Pigeon network to western coast.

### Arc 4: The Underdark / Ashara Conspiracy (Sessions 6–8) ✅ COMPLETE

Underdark investigation → Vel'quinar rescue → Ashara conspiracy dismantled → Vel'thara first contact.

| Thread | Status |
|--------|--------|
| Deep Road | ✅ Operational. Lift + wagon. 9 hours Fenhollow ↔ Aelindra. |
| Keeper Stations | ✅ 4 accessed (Fenhollow, Aelindra, Ashara, Vel'arath) + Anchor Point |
| House Vel'quinar | ✅ 16 members. Homestead complete. Ilyana (Matron) alive. |
| Vel'sharen surface network | ✅ DISMANTLED. All 6 agents + 1 courier captured. |
| Ashara (3,000-year-old Binder) | ✅ CAPTURED at Blacktide Inlet. Probation at homestead. |
| Inverted Heartstones (6) | ✅ ALL RECOVERED. Contained at forge. |
| Vaelen (ward network creator) | ✅ FREED. Physical form. Stationed at Anchor Point. |
| Warden Drell | ✅ ALIVE. Woken from 38-year dormancy. At Anchor Point. |
| Anchor Point (pre-Binder prototype) | ✅ PERMANENTLY ACTIVE. 7 Heartstones. Control interface. |
| ALL 14 NODES | ✅ ACTIVE. 3 remote-boosted from Anchor Point. First time in 3,248 years. |
| Node 13 (Sunken Crown) | ✅ Underwater reconstruction. 67%. |
| Vel'thara first contact | ✅ Phases 1–4 complete. Embassy established. Accord signed. |

### Arc 5: The Vel'thara Accord (Session 8+) — IN PROGRESS

First contact with the Vel'thara — a 12-civilization resonance federation beyond the ward boundary.

| Thread | Status |
|--------|--------|
| Vel'thara Embassy | ✅ Operational. Anchor Point. Permanent aperture. Shared garden. |
| The Accord | ✅ Signed Day 244. Threshold open. One Speaker at a time. Kill switch with Warden. |
| The Speaker | Crossed the threshold. Gave moonpetal gift. Returns via aperture. |
| Ward-Light Hymn | Transmitted to 12 Vel'thara civilizations. |
| Atlas of the Vel'thara | Created by Sylvara + Torven. Book #29. |
| Cultural exchange | IN PROGRESS. Phased approach. |
| Vel'sharen response | PENDING. Station Four compromised (wall cracked). |
| Southern expansion | PENDING. Ashport route established. |

## Current Status — Session 8 (Wildcard) — YEAR 1249

**Date:** 30th Frostmere, 1249 AS (Day 260) — Late Autumn
**DM:** Corvus Chance, The Wildcard
**Location:** Dawnwatch Homestead, Fenhollow
**Party Level:** 4 | **Party Gold:** ~11,784 gp | **Party Size:** 10 + Nhilara (Level 8 specialist) + 16 Vel'quinar
**Homestead:** Fully developed — stone wall, ward perimeter (4-layer defense), tower, forge (+ Ashara containment), school (15 students, Vel'thara curriculum), library (29 books incl. Atlas of the Vel'thara), mushroom cellar, orchard, stable. Passive income 35–45 gp/week. Monthly total income: 535–755 gp.
**Vel'quinar Homestead:** COMPLETE (3 acres north). 16 Drow residents. Underground quarters, armory, prison cells. Defense upgraded. New trades: spider-silk weaving, Drow glasswork.

**Arc 1:** ✅ COMPLETE. 7/7 Unchained Compact targets.
**Arc 2:** ✅ COMPLETE. 4/4 eastern nodes repaired. 7/7 barrows sealed.
**Arc 3:** ✅ COMPLETE. 4/4 western nodes repaired.
**Arc 4:** ✅ COMPLETE. Ashara captured. Vaelen freed. All inverted stones recovered. Vel'sharen network dismantled.
**Arc 5:** IN PROGRESS. Vel'thara embassy operational. Cultural exchange begun.
**Ward Network:** ALL 14 NODES ACTIVE — first time in 3,248 years. Anchor Point permanently active (7 Heartstones, control interface). 15 total Heartstones in Dawnwatch possession. 6 inverted stones contained.
**Keeper Stations:** Fenhollow (91%, 8 Heartstones), Aelindra (58%), Ashara (fortified), Vel'arath (91%, COMPROMISED — wall cracked).
**Anchor Point:** Pre-Binder prototype. Control interface. Vel'thara embassy. Vaelen + Drell stationed. Moonpetal garden.
**Deep Road:** Operational. Threshold Runner. 9 hours Fenhollow ↔ Aelindra. Deephollow + Crystalvein contacted.
**Fleet:** *Stormcape's Promise* (western triangle), *Eilistraee's Grace* (northern express + expedition), *Dawnwatch Coach*, *Threshold Runner*. Tidemeet warehouse: Dawnwatch Trading Company.
**House Vel'quinar:** 16 members. Homestead complete. Nhilara (Level 8 specialist). Velyndra (glassworker) + Taelar (weaver) + Sylla (student) defected from Vel'sharen.
**Prisoners/Probation:** Ashara (Binder, probation), Edrin Vael (alchemist), Thessara Vael (Archive operative), Drael + Syvra (Vel'sharen agents). Veradis Kael (surrendered, rehabilitation).
**School:** 15 students. Vel'thara curriculum added.
**Library:** 29 books (incl. Atlas of the Vel'thara — first map of another world).
**Zaryth:** Binding Initiate (Lesson 110). Keeper's Cloak. Ashara's paired ring. Memory restored. 8th generation keeper. Opened the door.
**Tournament Record:** 7 golds, 2 silvers across Duskport (1248) + Veldmere (1249).
**Vel'thara:** 12-civilization resonance federation. The Speaker crossed the threshold. Moonpetal gift. Names exchanged. Accord signed. The Ward-Light Hymn is being sung across twelve civilizations on the other side of the boundary.

**Next:** Vel'sharen response to Station Four. Southern expansion. Vel'thara cultural exchange. Ashara's long-term fate. Remaining node improvements. The untitled song. Mira's moonpetals. Whatever the dice bring next.
