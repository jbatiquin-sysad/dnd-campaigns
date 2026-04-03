#!/bin/bash
# Save DnD session to GitHub
# Called after session ends or manually

CAMPAIGN_DIR="/Users/jasonbatiquin/duskport-campaign"
KIRO_PROMPTS="$HOME/.kiro/prompts"

cd "$CAMPAIGN_DIR" || { echo "Error: campaign directory not found"; exit 1; }

# Sync party state FROM campaign TO kiro prompts (campaign is source of truth)
if [ -f "$CAMPAIGN_DIR/party/party-state.json" ] && [ -d "$KIRO_PROMPTS" ]; then
  cp "$CAMPAIGN_DIR/party/party-state.json" "$KIRO_PROMPTS/party-state.json"
  echo "Synced party-state.json → ~/.kiro/prompts/"
fi

# Check if there's anything to commit
if git diff --quiet && git diff --staged --quiet; then
  echo "Nothing to commit — session already saved."
  exit 0
fi

# Generate commit message from latest week file
LATEST_WEEK=$(ls -t sessions/week-*.md 2>/dev/null | head -1)
if [ -n "$LATEST_WEEK" ]; then
  WEEK_TITLE=$(head -1 "$LATEST_WEEK" | sed 's/^# //')
else
  WEEK_TITLE=$(grep "^## " memory_layer.md | tail -1 | sed 's/^## //')
fi
TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
COMMIT_MSG="Save [$TIMESTAMP]: $WEEK_TITLE"

git add .
git commit -m "$COMMIT_MSG"
git push origin main

echo "Session saved: $COMMIT_MSG"
