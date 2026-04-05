#!/bin/bash
# Resume DnD session — loads campaign state and launches kiro-cli chat
# Usage: ./resume-session.sh [dm]
#   dm options: chronicler, storyteller, wildcard (default: last active DM)

CAMPAIGN_DIR="/Users/jasonbatiquin/duskport-campaign"

cd "$CAMPAIGN_DIR" || { echo "Error: campaign directory not found"; exit 1; }

# Pull latest from remote
echo "📥 Pulling latest from GitHub..."
git pull --quiet origin main 2>/dev/null

# Read current state
STATE="$CAMPAIGN_DIR/party/party-state.json"
if [ ! -f "$STATE" ]; then
  echo "❌ party-state.json not found"; exit 1
fi

DAY=$(python3 -c "import json; print(json.load(open('$STATE'))['in_game_day'])" 2>/dev/null)
DATE=$(python3 -c "import json; print(json.load(open('$STATE'))['calendar_date'])" 2>/dev/null)
LOCATION=$(python3 -c "import json; print(json.load(open('$STATE'))['location'])" 2>/dev/null)
GOLD=$(python3 -c "import json; print(json.load(open('$STATE'))['party_gold']['total'])" 2>/dev/null)
STATUS=$(python3 -c "import json; print(json.load(open('$STATE'))['campaign_status'])" 2>/dev/null)
ACTIVE_DM=$(python3 -c "import json; print(json.load(open('$STATE'))['active_dm'])" 2>/dev/null)
WEEK=$(python3 -c "import json; print(json.load(open('$STATE'))['current_week_file'])" 2>/dev/null)

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
echo ""

# Build the resume prompt
RESUME_PROMPT="Resume our DnD session — load memory_layer.md and party-state.json from duskport-campaign use $(echo "$DM_NAME" | awk -F', ' '{print $2}') this time"

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
