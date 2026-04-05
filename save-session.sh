#!/bin/bash
# Save DnD session to GitHub
# Usage: ./save-session.sh [commit message]
#   If no message provided, auto-generates from week file + party state

set -euo pipefail

CAMPAIGN_DIR="$(cd "$(dirname "$0")" && pwd)"
STATE="$CAMPAIGN_DIR/party/party-state.json"
KIRO_PROMPTS="$HOME/.kiro/prompts"

cd "$CAMPAIGN_DIR" || { echo "❌ Campaign directory not found"; exit 1; }

# Verify git repo
if [ ! -d .git ]; then
  echo "❌ Not a git repository: $CAMPAIGN_DIR"; exit 1
fi

# Sync party state FROM campaign TO kiro prompts (campaign is source of truth)
if [ -f "$STATE" ]; then
  if [ -d "$KIRO_PROMPTS" ]; then
    cp "$STATE" "$KIRO_PROMPTS/party-state.json"
    echo "✅ Synced party-state.json → ~/.kiro/prompts/"
  else
    echo "⚠️  ~/.kiro/prompts/ not found — skipping sync (kiro-cli may not be configured)"
  fi
else
  echo "⚠️  party-state.json not found — skipping sync"
fi

# Check for ANY changes (tracked, staged, AND untracked)
if git diff --quiet && git diff --staged --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  echo "✅ Nothing to commit — session already saved."
  exit 0
fi

# Show what's changed
echo ""
echo "📝 Changes to save:"
git status --short
echo ""

# Pull before push to avoid conflicts
echo "📥 Pulling latest from remote..."
if ! git pull --quiet origin main 2>&1; then
  echo "⚠️  Git pull failed — there may be remote changes."
  echo "   Resolve conflicts before saving."
  exit 1
fi

# Generate commit message
if [ -n "${1:-}" ]; then
  COMMIT_MSG="$1"
else
  # Auto-generate from state
  WEEK_TITLE=""
  LATEST_WEEK=$(ls -t sessions/week-*.md 2>/dev/null | head -1)
  if [ -n "$LATEST_WEEK" ]; then
    WEEK_TITLE=$(head -1 "$LATEST_WEEK" | sed 's/^# //')
  fi

  DAY=$(python3 -c "import json; print(json.load(open('$STATE'))['in_game_day'])" 2>/dev/null || echo "?")
  LOCATION=$(python3 -c "import json; print(json.load(open('$STATE'))['location'])" 2>/dev/null || echo "?")
  TIMESTAMP=$(date '+%Y-%m-%d %H:%M')

  if [ -n "$WEEK_TITLE" ]; then
    COMMIT_MSG="Save [$TIMESTAMP] Day $DAY: $WEEK_TITLE"
  else
    COMMIT_MSG="Save [$TIMESTAMP] Day $DAY: $LOCATION"
  fi
fi

# Stage, commit, push
git add .
git commit -m "$COMMIT_MSG"

echo ""
echo "📤 Pushing to GitHub..."
if git push origin main; then
  echo ""
  echo "✅ Session saved: $COMMIT_MSG"
else
  echo ""
  echo "❌ Push failed — commit is saved locally but not on GitHub."
  echo "   Check your network connection and try: git push origin main"
  exit 1
fi
