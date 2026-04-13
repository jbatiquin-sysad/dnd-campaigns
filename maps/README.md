# Maps — Guidelines & Conventions

> How the Duskport Campaign builds and maintains its map files.

---

## File Structure

| File | Purpose | Format |
|------|---------|--------|
| `map-known-world.md` | Narrative world map — cities, landmarks, routes, lore | ASCII art + prose + tables |
| `scaled-map.md` | Overworld hex grid — A–T × 1–22 (expanded for southern ports). Precise locations. | Hex grid + coordinate tables |
| `underdark-map.md` | Underdark narrative map — entrances, stations, lore, Vel'sharen intel | Prose + tables (links to scaled version) |
| `underdark-scaled-map.md` | Underdark hex grid — same A–T × 1–16 grid. Deep Road, settlements, patrol boundaries, Vel'arath layout. | Hex grid + coordinate tables |
| `sea-routes.md` | Trade routes (Hearthcoast + southern), seasonal cargo, fleet (2 ships), crew, revenue | Tables + route diagrams |
| `velthara-map.md` | **Vel'thara Resonance Atlas** — first map of the extradimensional plane beyond the ward boundary. 12 harmonies, spatial layout, key locations, Accord terms. | Concentric diagram + tables + prose |
| `README.md` | This file — map conventions and guidelines | |

---

## Hex Grid Standard

All scaled maps use the same coordinate system so they can be overlaid.

### Grid Dimensions

- **Columns:** A through T (20 columns, west to east)
- **Rows:** 1 through 22 (22 rows, north to south). Rows 1–16 = Hearthcoast. Rows 17–22 = southern waters.
- **Scale:** 1 hex = 24 miles (~1 day overland travel on roads)
- **Origin:** A1 = far northwest corner

### Grid Template

```
Column:  A    B    C    D    E    F    G    H    I    J    K    L    M    N    O    P    Q    R    S    T
         <-- WEST ------------------------------------------------------------------- EAST -->

Row 1    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
Row 2    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
...
Row 16   .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
```

### Spacing Rules

- Each cell is **5 characters wide** (symbol + 4 spaces, or `.    `)
- Use **plain ASCII only** inside the grid — no emoji, no Unicode special characters
- Emoji and Unicode break monospace alignment across renderers
- Labels go on the line(s) **below** the grid row, indented to align with their column
- Depth or extra info goes on additional lines below the label

### Example Cell with Label

```
Row 8    .    .    .    .    .    .    .   [F]   o    Y    .    .    .    .    .    .    .    .    .    .
                                          FNLW LONG FORK
                                          SRC
                                          -40/-540
```

- `[F]` is the grid symbol at H8
- `FNLW` is the abbreviation label below it
- `SRC` is a stacked second feature at the same hex (different depth)
- `-40/-540` is the depth notation (station at -40 ft, Source at -540 ft)

---

## Symbol Conventions

### Overworld (scaled-map.md)

Overworld uses a richer symbol set since it renders in markdown preview with emoji support:

| Symbol | Meaning |
|--------|---------|
| `.` | Empty hex |
| `~` | Ocean / deep water |
| `≈` | River / marsh water |
| `░░` | Dense forest |
| `⊗` | Ward node (with number) |
| `[⊗#]` | Ward node (tentatively identified) |
| `⌂` | Dawnwatch Homestead |
| `⚓` | Port / harbor |
| `⛪` | Temple / religious site |
| `⚒` | Forge / workshop |
| `🏨` | Inn / dispatch |
| `🏛` | Archive / major institution |
| `🏪` | Market / trade city |
| `📚` | University |
| `☒` | Investigated site |
| `☆` | Mountain pass |
| `★` | Current party location |

### Underdark (underdark-scaled-map.md)

Underdark uses **ASCII only** for reliable monospace alignment:

| Symbol | Meaning |
|--------|---------|
| `.` | Empty / no known underground feature |
| `[F]` | Fenhollow Keeper Station |
| `[A]` | Aelindra Keeper Station |
| `[V]` | Vel'arath Keeper Station (Station Four) |
| `o` | Surveyed waypoint (safe passage) |
| `X` | Obstacle / hazard |
| `Y` | Y Fork / Y junction |
| `C` | The Crucible (3-way junction) |
| `BR` | Branch tunnel (Crucible → Station Four) |
| `**` | Settlement (Deephollow) |
| `N##` | Ward node target (e.g., `N14` = Node 14) |
| `U##` | Underdark entrance (e.g., `U7` = Warden's Forge tunnels) |
| `S` | Sinkhole entrance (G6) |
| `SRC` | The Source / Old Foundation |
| `!!` | Danger zone / hostile territory |

### Vel'thara (velthara-map.md)

The Vel'thara map uses a **concentric diagram** — not a hex grid. Their world is organized by frequency, not geography. Spatial relationships are harmonic, not metric.

| Symbol | Meaning |
|--------|---------|
| `◉ CTR` | Central Resonance Point (their Anchor Point equivalent) |
| `#` (1–12) | Harmony number (civilization) |
| `🌸` | Moonpetal field (organic garden) |
| Concentric boxes | Frequency bands (outer = boundary, inner = core) |

---

## Labeling Conventions

### Abbreviations

- **Max 4–5 characters** for grid labels (must fit in the 5-char cell width)
- Use recognizable shortenings: `FNLW` (Fenhollow), `CRYS` (Crystal Cavern), `DEEP` (Deephollow)
- Full names go in the **Abbreviation Key** table below the grid

### Depth Notation (Underdark only)

- Noted below the abbreviation label: `-400ft`, `-540ft`
- Stacked features at the same hex use slash notation: `-40/-540` (two depths at one hex)
- Depth is always negative (below surface)

### Stacking

When multiple features share a hex (e.g., Fenhollow station at -40 ft and the Old Foundation at -540 ft beneath it):

```
Row 8    .    .    .    .    .    .    .   [F]   .    .    .
                                          FNLW
                                          SRC
                                          -40/-540
```

Each feature gets its own label line. Most important feature first.

---

## Route Representation

### Narrative Maps (map-known-world.md, underdark-map.md)

Use ASCII art with box-drawing characters, arrows, and descriptive labels:

```
⌂ Homestead → Fenhollow → Tidemeet → Duskport
```

### Scaled Maps (scaled-map.md, underdark-scaled-map.md)

Routes are implied by the sequence of labeled points on the grid. Do **not** draw lines between points — the grid should be clean dots and symbols only. The **Route Trace** section below the grid spells out the path:

```
H8 [F] → I8 (FORK) → J8 (WET) → K7 (CRYS) → L7 (DEEP) → M7 (GEM) → M6 (CASC) → M5 (SMTH) → N5 [A]
```

---

## Supporting Tables

Every scaled map should include these tables below the grid:

1. **Grid Legend** — what each symbol means
2. **Abbreviation Key** — full name, hex, depth, road mile, notes for every labeled point
3. **Route Trace** — the path spelled out in hex coordinates

### Optional Tables (as relevant)

- **Obstacle Summary** — obstacles along a route with solutions, cost, time
- **Transport Phases** — travel methods and times
- **Key Resources** — mineable/harvestable resources along the route

---

## Adding New Locations

1. Determine the **surface hex** (A–T column, 1–16 row) using the overworld scaled map as reference
2. For underground features, note the **depth** below surface
3. Choose a **symbol** from the conventions above (or propose a new one and add it to the legend)
4. Choose a **4–5 character abbreviation** and add it to the Abbreviation Key
5. Place the symbol in the correct grid cell, label below
6. Update the Route Trace if the location is on a route
7. Update the narrative map (`map-known-world.md` or `underdark-map.md`) with prose description

---

## Updating Maps

When campaign events change the map:

- **New location discovered:** Add to both narrative map and scaled map
- **Node repaired:** Update status in the ward network tables
- **Route surveyed:** Add waypoints to scaled map, update Route Trace
- **Obstacle cleared:** Update obstacle table (mark as resolved)
- **New entrance found:** Add U# designation to underdark-map.md, place on underdark-scaled-map.md
- **Vel'thara intel:** Update velthara-map.md with new harmonies, locations, or cultural data from embassy exchanges
- **Keeper station status change:** Update all maps that reference the station (underdark-map, underdark-scaled-map, map-known-world)

Always update the `*Last updated:*` footer with the current in-game day.

---

## Map Layers — Campaign Overview

The Duskport Campaign maps cover three layers of reality:

| Layer | Map Files | Description |
|-------|-----------|-------------|
| **Surface** | `map-known-world.md`, `scaled-map.md`, `sea-routes.md` | Hearthcoast, cities, trade routes, ward nodes, fleet |
| **Below** | `underdark-map.md`, `underdark-scaled-map.md` | Deep Road, keeper stations, Vel'arath, svirfneblin, Anchor Point |
| **Beyond** | `velthara-map.md` | The Vel'thara resonance plane — 12 harmonies, embassy, the other side of the boundary |

The Anchor Point connects all three: surface access via Ashport sea cave, underground at 400 ft depth, and the aperture opens to the Vel'thara plane.

---

*Last updated: Day 260, 30th Frostmere, 1249 AS*
