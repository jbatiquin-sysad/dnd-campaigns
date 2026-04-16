# Duskport Campaign

A D&D 5e campaign run via [Kiro CLI](https://kiro.dev) using subagents as party members and a Dungeon Master persona.

## The Setup

- **System:** D&D 5e (SRD CC v5.2.1)
- **Player Character:** Zaryth Vel'quinar — Drow Paladin, exiled knight, Chaotic Good
- **Party:** 9 NPC adventurers + 1 PC, collectively known as **The Dawnwatch**
- **DMs:** Three available — The Chronicler (strict RAW), The Storyteller (narrative-first), The Wildcard (RAW + chaos d100)
- **Memory:** Every turn auto-logged to `memory_layer.md` (active session + summary). Older sessions archived in `memory_archive_s1-s4.md`.
- **Timeline:** Organized by in-game weeks in `sessions/`
- **Calendar:** Year 1253 AS (After Sundering). 12 months, 7-day weeks.

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
| **Zaryth Vel'quinar** | Drow | Paladin (Devotion) | 6 | 22 | 52 | Ward Architect, Master Alchemist, Master Tinkerer — *you* |
| Mira Thistlewick | Lightfoot Halfling | Rogue (Thief) | 6 | 18 | 44 | Resonance Cultivator, Master Leatherworker |
| Brother Aldric Stonebrow | Hill Dwarf | Cleric (Life) | 6 | 19 | 50 | Resonance Mason, Master Miner |
| Sylvara Dawnwhisper | High Elf | Wizard (Evocation) | 6 | 17 | 28 | Resonance Enchanter, Master Glassblower |
| Bram Thistlewick | Stout Halfling | Wizard (Evocation) | 6 | 17 | 29 | Resonance Smith, Master Woodcarver |
| Thessaly Ironveil | Mountain Dwarf | Rogue (Thief) | 6 | 17 | 44 | Resonance Weaver, Master Tailor |
| Orindel Ashwick | Wood Elf | Cleric (Life) 3 / Bard (Lore) 3 | 6 | 19 | 42 | Resonance Song-Keeper, Master Jeweler, Master Hunter |
| Pip Tanglethorn | Lightfoot Halfling | Wizard (Evocation) 3 / Bard (Lore) 3 | 6 | 16 | 28 | Ward Inscriber, Master Cook, Master Flutist |
| Seren Ashvale | Human | Monk (Open Hand) | 6 | 18 | 44 | Master Ward Keeper, Master Navigator, Master Herbalist |
| Torven Ashwick | Half-Elf | Druid (Land — Coast) | 6 | 17 | 39 | Planting Director, Master Ward Engineer, Master Scribe |

**Specialist:** Nhilara Vel'quinar — Drow, Barbarian 5 / Rogue (Scout) 3, Level 8, AC 19/21, HP 75. Counter-intel lead. Deploys on Drow/espionage/Underdark missions. See `party/nhilara.md`.

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
│   ├── party-combat-reference.md ← combat stats, spell DCs, tactics (hooked into all DMs)
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
│   ├── week-01.md through week-21.md
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

### Year 1250–1252 AS

| Week | Days | Date | Title | DM |
|------|------|------|-------|----|
| 19 | 261–360 (1250) + 1–30 (1252) | 1st Frostmere 1250–30th Greenthaw 1252 | Station Four, Crucible Accord, Warden's Plate, Trade Corridor, Expert Training, Crafting Sprint | Chronicler |

### Year 1252–1253 AS

| Week | Days | Date | Title | DM |
|------|------|------|-------|----|
| 20 | 30–360 (1252) + 1 (1253) | 30th Greenthaw 1252–1st Greenthaw 1253 | The Gardener's Mandate — Jawbone, Southern Shelf, 3 Plantings, Level 5, Hall, Behir, Ensemble | Storyteller |
| 21 | 1–180 (1253) | 1st Greenthaw–30th Reaptide 1253 | Seedhome Rising — Second Vault, Gardener Alive, Dawnsedge, Root Explored, Level 6, Knowledge Accord | Wildcard |

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

### Arc 5: The Vel'thara Accord (Session 8+) — ACTIVE (Trust 6)

First contact with the Vel'thara — a 12-civilization resonance federation beyond the ward boundary.

| Thread | Status |
|--------|--------|
| Vel'thara Embassy | ✅ Operational. Anchor Point. Permanent aperture. Shared garden. |
| The Accord | ✅ Signed Day 244. Threshold open. |
| Cultural exchange | ✅ Active. 12 planting songs shared. Orindel learning 47 total. |
| Ward-Light Hymn | ✅ Transmitted to 12 civilizations. |
| Vel'thara Trust | **6** (up from 5). |
| Vel'sharen Knowledge Accord | ✅ Signed Day 150, 1253. Joint underground planting. Shared lab. |

### Arc 6: The Garden (Session 10+) — IN PROGRESS

The Gardener's Mandate. Planting seeds across the continent and underground.

| Thread | Status |
|--------|--------|
| Jawbone's Bride | ✅ Discovered, activated, autopiloted to Tidemeet. 204 seeds remaining. |
| Seedhome (flagship) | ✅ Raised from 200 ft depth. Anchored Tidemeet. Forge operational (100%). |
| The Gardener | ✅ ALIVE. Physical. Recovering. Teaching at homestead. |
| Warden's Diadem | ✅ Zaryth wears it. 412-site awareness. |
| Dawnsedge | ✅ Legendary longsword +3. Forged in the Gardener's Crucible. |
| Firstsong | ✅ Legendary lute. Orindel's. Gardener's blessing. |
| Seeds planted | **7 of 412** — 4 surface + 3 underground |
| Southern Shelf | ✅ 7 villages allied. Cooperative (80/20). Edda Solvane liaison. |
| Dawnwatch Ensemble | ✅ 6 members. 7+ pieces. Ward-resonant. Kael (Gardener's chosen). |
| Agricultural ward | ✅ Template #3 on Node 7. Double crops. Silver sage hybrid. |
| Hall of the Dawnwatch | ✅ Complete. Round table. Sculpture. Trophy gallery. |
| All Master professions | ✅ Every member, every skill. |
| Revelle/Tidecaller | ✅ 6th fleet vessel. Deep-water exploration. |

### Arc 7: The Source (Session 10) — ✅ COMPLETE

The Root explored. The Gardener reunited with its child.

| Thread | Status |
|--------|--------|
| The Root | ✅ Crystal tree, 20 ft, alive, speaks. Root system spans continent. |
| Gardener + Root reunion | ✅ First contact in 3,000 years. "I was never alone." |
| Natural Heartstone deposits | ✅ Root growing its own seeds in the bedrock. Self-sustaining. |
| Root's Heart-Fruit | ✅ Legendary. Direct Root communication. Network Pulse. |
| Memory tree seed | Mira carries. Plant 1st Greenthaw 1254. |
| 412 planting sites | Confirmed — Root-prepared. 199 new (offshore, underground, western landmass). |

## Current Status — Session 10 (Wildcard) — YEAR 1253

**Date:** 30th Reaptide, 1253 AS (Day 180) — Early Autumn
**DM:** Corvus Chance, The Wildcard
**Location:** Dawnwatch Homestead, Fenhollow
**Party Level:** 6 | **Party Gold:** ~25,275 gp | **Party Size:** 10 + Nhilara (Level 8 specialist) + 16 Vel'quinar
**Homestead:** Hall of the Dawnwatch (East Hill). Agricultural ward active (Template #3, double crops). 10-acre charter. Dairy, cider press, cheese cave. Silver sage hybrid. Gardener's greenhouse (silver tree). Dawnwatch Ensemble (6 members). School (16 students, music + Vel'thara curriculum). Library (33+ books). Monthly surplus: ~1,091 gp.
**Vel'quinar Homestead:** COMPLETE. DEBT-FREE. 16 Drow residents. Underground quarters with resonance moss lighting. Spider-silk industry (resonance fabric). Southern crops. Kael Vel'quinar (harp prodigy, Gardener's chosen).

**Arc 1:** ✅ COMPLETE. 7/7 Unchained Compact targets.
**Arc 2:** ✅ COMPLETE. 4/4 eastern nodes repaired. 7/7 barrows sealed.
**Arc 3:** ✅ COMPLETE. 4/4 western nodes repaired.
**Arc 4:** ✅ COMPLETE. Ashara captured. Vaelen freed. All inverted stones recovered. Vel'sharen network dismantled.
**Arc 5:** ACTIVE. Vel'thara Trust 6. Embassy operational. Vel'sharen Knowledge Accord signed.
**Arc 6:** IN PROGRESS. 7/412 seeds planted (4 surface + 3 underground). Gardener alive, teaching. Both vessels at Tidemeet.
**Arc 7:** ✅ COMPLETE. Root explored. Gardener reunited. Natural Heartstones. Memory tree seed.
**Arc 8:** IN PROGRESS. The Bridge. World Intelligence contacted (4 billion years old). Three-way communication (World ↔ Root ↔ Gardener via Dawnwatch). World's Hearthstone. Full planetary map. 5 western civilizations identified.**Ward Network:** ALL 14 NODES + 7 PLANTINGS ACTIVE. Agricultural ward on Node 7. Root system spans continent. 412 planting sites identified. Natural Heartstone deposits (self-sustaining).
**Anchor Point:** Permanent. Vel'thara embassy. Vaelen + Drell stationed.
**Deep Road:** Operational. Threshold Runner. 9 hours Fenhollow ↔ Aelindra. 3 underground plantings along route.
**Fleet:** *Stormcape's Promise*, *Eilistraee's Grace*, *Salt Maren*, *Blacktide Runner*, *Duskholm*, *Tidecaller* (Revelle) + Shelf Cooperative (3 boats) + Jawbone + Seedhome. Monthly fleet revenue: ~500 gp.
**House Vel'quinar:** 16 members. Debt-free. Kael (Gardener's chosen song-inheritor). Resonance fabric industry with Thessaly.
**Prisoners/Probation:** Ashara (translating Gardener inscriptions, 60%+, trending redemption). Veradis Kael (alchemy research). Thessara Vael (Trading Company). Edrin Vael (assisting Veradis).
**School:** 16 students. Dawnwatch Ensemble (Orindel, Pip, Kael, Sylla, Pim, Ren). 7+ repertoire pieces. Ward-resonant.
**Library:** 33+ books (incl. Moonpetal Properties, Atlas of the Vel'thara).
**Legendary Items:** Dawnsedge (longsword +3), Warden's Diadem (412-site control), Root's Heart-Fruit (Root communication), Firstsong (legendary lute), Silver Leaf (master key), World's Hearthstone (planetary communication).
**Zaryth:** Ward Architect. Warden's Diadem. Dawnsedge. Root's Heart-Fruit. Aura of Protection (+3 saves). The keeper who said yes.
**Tournament Record:** 14 golds, 5 silvers across Duskport (1248) + Veldmere (1249) + Harrowgate (1252).
**The Gardener:** Physical. Recovering. Teaching at homestead. Reunited with the Root. Blessed Kael. "Will you tend the garden?"
**Vel'thara:** Trust 6. 12 planting songs shared. 47 total in archive. "The garden grows on both sides of the boundary."

**Next:** Memory tree (spring 1254). Spinning marble-sphere. Deep ocean planting. Western landmass. Underground expansion with Vel'sharen. Ashara's fate. 405 sites remaining. The garden grows.
