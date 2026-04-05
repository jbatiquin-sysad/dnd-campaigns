#!/bin/bash
# Resume DnD session — loads campaign state and launches kiro-cli chat
# Usage: ./resume-session.sh [dm]
#   dm options: chronicler, storyteller, wildcard (default: last active DM)

set -euo pipefail

CAMPAIGN_DIR="$(cd "$(dirname "$0")" && pwd)"
STATE="$CAMPAIGN_DIR/party/party-state.json"

cd "$CAMPAIGN_DIR" || { echo "❌ Campaign directory not found"; exit 1; }

# Verify git repo
if [ ! -d .git ]; then
  echo "❌ Not a git repository: $CAMPAIGN_DIR"; exit 1
fi

# Verify state file
if [ ! -f "$STATE" ]; then
  echo "❌ party-state.json not found"; exit 1
fi

# Pull latest — but warn on failure instead of hiding it
echo "📥 Pulling latest from GitHub..."
if ! git pull --quiet origin main 2>&1; then
  echo "⚠️  Git pull failed — you may not have the latest version."
  echo "   Check for merge conflicts or network issues."
  read -p "   Continue anyway? (y/n) " -n 1 -r
  echo
  [[ $REPLY =~ ^[Yy]$ ]] || exit 1
fi

# Parse state in one python3 call
read -r DAY DATE LOCATION GOLD STATUS ACTIVE_DM WEEK < <(python3 -c "
import json, sys
s = json.load(open('$STATE'))
fields = [
    str(s['in_game_day']),
    s['calendar_date'],
    s['location'],
    str(s['party_gold']['total']),
    s['campaign_status'],
    s['active_dm'],
    s['current_week_file']
]
# Use tab separator to handle spaces in values
print('\t'.join(fields))
" 2>/dev/null | tr '\t' '\n' | {
  read -r DAY; read -r DATE; read -r LOCATION; read -r GOLD; read -r STATUS; read -r ACTIVE_DM; read -r WEEK
  echo "$DAY" "$DATE" "$LOCATION" "$GOLD" "$STATUS" "$ACTIVE_DM" "$WEEK"
}) 2>/dev/null

# Fallback: parse individually if the above fails
if [ -z "${DAY:-}" ]; then
  DAY=$(python3 -c "import json; print(json.load(open('$STATE'))['in_game_day'])" 2>/dev/null || echo "?")
  DATE=$(python3 -c "import json; print(json.load(open('$STATE'))['calendar_date'])" 2>/dev/null || echo "?")
  LOCATION=$(python3 -c "import json; print(json.load(open('$STATE'))['location'])" 2>/dev/null || echo "?")
  GOLD=$(python3 -c "import json; print(json.load(open('$STATE'))['party_gold']['total'])" 2>/dev/null || echo "?")
  STATUS=$(python3 -c "import json; print(json.load(open('$STATE'))['campaign_status'])" 2>/dev/null || echo "?")
  ACTIVE_DM=$(python3 -c "import json; print(json.load(open('$STATE'))['active_dm'])" 2>/dev/null || echo "dm-storyteller")
  WEEK=$(python3 -c "import json; print(json.load(open('$STATE'))['current_week_file'])" 2>/dev/null || echo "?")
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

# Verify DM file exists
if [ ! -f "$CAMPAIGN_DIR/dm/${DM_FILE}.md" ]; then
  echo "⚠️  DM file dm/${DM_FILE}.md not found — continuing anyway"
fi

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

# Warn about uncommitted local changes
if ! git diff --quiet || ! git diff --staged --quiet || [ -n "$(git ls-files --others --exclude-standard)" ]; then
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

# Copy to clipboard
echo "$RESUME_PROMPT" | pbcopy 2>/dev/null && echo "📋 Copied to clipboard — just paste and hit Enter!" || echo "💡 Copy the prompt above and paste it into chat."
echo ""

# Launch kiro-cli
exec kiro-cli chat
