# Session Save Convention

## The Rule
Each `sessions/week-XX.md` file covers approximately **7 in-game days**. When a session crosses a 7-day boundary, create a new week file.

## How It Works

### During Play
- The DM tracks `in_game_day` in `party-state.json`
- Each turn that advances time updates the day count
- Travel days, rest days, and building days all count

### At Session End
Before running `save-session.sh`, check:

1. **What in-game day are we on?** → Update `in_game_day` in `party-state.json`
2. **Did we cross a ~7-day boundary?** → If yes, create new `week-XX.md`
3. **Update `current_week_file`** in `party-state.json`

### Week File Template
```markdown
# Week X — [Title]

**In-Game:** Days X–Y
**Session:** S# Turns X–Y
**DM:** [Name], [Title]
**Party Level:** X

## Summary
[Narrative summary organized by location/operation]

## Key Events
[Bullet list of major events]

## NPCs Introduced
[Table: NPC | Role | Status]

## Key Items (New)
[Bullet list of new items]

## End of Week State
[Location, funds, level, scoreboard, threads]
```

### Boundary Guidelines
- Aim for ~7 in-game days per file, but prioritize **narrative arcs**
- A 5-day city operation is one week file, not split across two
- A 4-day voyage + 3-day operation = one week file (7 days, clean)
- An 8-day building project can be one file if it's a single arc
- Don't split mid-operation just to hit day 7

### Current Week Map
| File | Days | Duration | Arc |
|------|------|----------|-----|
| week-01 | 1–2 | 2 days | Duskport — Partition Writ |
| week-02 | 2–9 | 7 days | Prep + voyage to Aelindra |
| week-03 | 10–16 | 7 days | Aelindra operation + voyage home |
| week-04 | 16–28 | 12 days | Calder → Harrowgate → Greymoor → Salthollow → Fenhollow → Veldmere |
| week-05 | 28–32 | 5 days | Operation Veldmere + naming |
| week-06 | 33–45 | 13 days | Aelindra return → Quorum → Root → Homestead |

### Notes
- Week 01 is short (2 days) because it was the campaign's first night — one continuous arc
- Week 04 is long (12 days) because it was a blitz across 4 cities — one operational arc
- Week 06 is long (13 days) because it includes the 4-day voyage + 8-day homestead build
- Future weeks should aim closer to 7 days as the pace normalizes

## Files Updated at Save
1. `party/party-state.json` — turn, day, gold, HP, inventory changes
2. `memory_layer.md` — append new turn entries
3. `sessions/week-XX.md` — update or create current week summary
4. `npc/npc-catalogue.md` — add new NPCs, update statuses
5. Character `.md` files — update only on level-up or major changes

## Save Script
`save-session.sh` handles git add/commit/push and syncs party-state to `~/.kiro/prompts/`. The campaign directory is the source of truth — the script copies OUT, never IN.
