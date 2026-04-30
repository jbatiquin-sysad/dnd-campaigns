#!/bin/bash
# Resume DnD session — loads campaign state and launches kiro-cli chat
# Usage: ./resume-session.sh [dm]
#   dm options: chronicler, storyteller, wildcard (default: last active DM)

CAMPAIGN_DIR="$(cd "$(dirname "$0")" && pwd)"
STATE="$CAMPAIGN_DIR/party/party-state.json"

cd "$CAMPAIGN_DIR" || { echo "❌ Campaign directory not found"; exit 1; }

# Preflight checks
[ -d .git ] || { echo "❌ Not a git repository: $CAMPAIGN_DIR"; exit 1; }
[ -f "$STATE" ] || { echo "❌ party-state.json not found"; exit 1; }
command -v python3 >/dev/null || { echo "❌ python3 not found — needed to parse campaign state"; exit 1; }
command -v kiro-cli >/dev/null || { echo "❌ kiro-cli not found in PATH"; exit 1; }

# Pull latest — warn on failure, prompt if interactive
echo "📥 Pulling latest from GitHub..."
if ! git pull --quiet origin main 2>&1; then
  echo "⚠️  Git pull failed — you may not have the latest version."
  if [ -t 0 ]; then
    read -p "   Continue anyway? (y/n) " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]] || exit 1
  else
    echo "   Non-interactive mode — continuing with local state."
  fi
fi

# Parse all state in one python3 call using null-byte separator
_parse() {
  python3 -c "
import json
s = json.load(open('$STATE'))
print(s['in_game_day'])
print(s['calendar_date'])
print(s['location'])
print(s['party_gold']['total'])
print(s['campaign_status'])
print(s['active_dm'])
print(s['current_week_file'])
" 2>/dev/null
}

{
  IFS= read -r DAY
  IFS= read -r DATE
  IFS= read -r LOCATION
  IFS= read -r GOLD
  IFS= read -r STATUS
  IFS= read -r ACTIVE_DM
  IFS= read -r WEEK
} < <(_parse)

if [ -z "${DAY:-}" ]; then
  echo "❌ Failed to parse party-state.json — file may be malformed."
  echo "   Validate with: python3 -m json.tool $STATE"
  exit 1
fi

# DM selection
DM_ARG="${1:-}"
if [ -n "$DM_ARG" ]; then
  case "$DM_ARG" in
    chronicler) DM_FILE="dm-chronicler" ; DM_NAME="Aldric Voss, The Chronicler" ;;
    storyteller) DM_FILE="dm-storyteller" ; DM_NAME="Mara Solenne, The Storyteller" ;;
    wildcard)    DM_FILE="dm-wildcard"    ; DM_NAME="Corvus Chance, The Wildcard" ;;
    *) echo "❌ Unknown DM: $DM_ARG (use chronicler, storyteller, or wildcard)"; exit 1 ;;
  esac
else
  DM_FILE="$ACTIVE_DM"
  case "$DM_FILE" in
    dm-chronicler) DM_NAME="Aldric Voss, The Chronicler" ;;
    dm-storyteller) DM_NAME="Mara Solenne, The Storyteller" ;;
    dm-wildcard)    DM_NAME="Corvus Chance, The Wildcard" ;;
    *) DM_NAME="$DM_FILE" ;;
  esac
fi

[ -f "$CAMPAIGN_DIR/dm/${DM_FILE}.md" ] || echo "⚠️  DM file dm/${DM_FILE}.md not found — continuing anyway"

# Display campaign state
echo ""
echo "⚔️  DUSKPORT CAMPAIGN — SESSION RESUME"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📅 Day $DAY — $DATE"
echo "📍 $LOCATION"
echo "💰 $GOLD gp"
echo "🎲 DM: $DM_NAME"
echo "📖 Week file: $WEEK"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📋 $STATUS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Show upcoming calendar hooks
HOOKS_FILE="$CAMPAIGN_DIR/calendar-hooks.md"
if [ -f "$HOOKS_FILE" ]; then
  UPCOMING=$(python3 -c "
import re, sys
day = int('$DAY')
year_end = day + 60  # look ahead ~2 months
hits = []
with open('$HOOKS_FILE') as f:
    for line in f:
        m = re.match(r'\|\s*~?(\d+)\s*\|(.+)', line)
        if m:
            event_day = int(m.group(1))
            rest = m.group(2).strip().rstrip('|')
            cols = [c.strip() for c in rest.split('|')]
            if len(cols) >= 2 and event_day > day and event_day <= year_end:
                name = re.sub(r'\*+', '', cols[1]).strip()
                hits.append((event_day, cols[0], name))
seen = set()
for d, date, name in sorted(hits):
    if d not in seen:
        seen.add(d)
        print(f'  Day {d} ({date.strip()}): {name}')
" 2>/dev/null)
  if [ -n "$UPCOMING" ]; then
    echo ""
    echo "📆 UPCOMING EVENTS (next 60 days):"
    echo "$UPCOMING"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  fi
fi

# Warn about uncommitted local changes
if ! git diff --quiet 2>/dev/null || ! git diff --staged --quiet 2>/dev/null || [ -n "$(git ls-files --others --exclude-standard 2>/dev/null)" ]; then
  echo ""
  echo "⚠️  You have uncommitted local changes:"
  git status --short
  echo "   Consider running ./save-session.sh first."
fi

echo ""

# Build the resume prompt
DM_TITLE=$(echo "$DM_NAME" | awk -F', ' '{print $2}')
RESUME_PROMPT="Resume our DnD session — load memory_layer.md and party-state.json from duskport-campaign use $DM_TITLE this time"

echo "🚀 Launching kiro-cli chat..."
echo "   Your opening prompt (auto-copied to clipboard):"
echo ""
echo "   $RESUME_PROMPT"
echo ""

# Copy to clipboard (macOS)
echo "$RESUME_PROMPT" | pbcopy 2>/dev/null && echo "📋 Copied to clipboard — just paste and hit Enter!" || echo "💡 Copy the prompt above and paste it into chat."
echo ""

exec kiro-cli chat
