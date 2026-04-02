#!/bin/bash
# Save DnD session to GitHub
# Called after session ends or manually via @save-dnd-session

CAMPAIGN_DIR="/Users/jasonbatiquin/duskport-campaign"

# Sync party state if it exists
if [ -f ~/.kiro/prompts/party-state.json ]; then
  cp ~/.kiro/prompts/party-state.json "$CAMPAIGN_DIR/party/"
else
  echo "Warning: party-state.json not found at ~/.kiro/prompts/" >&2
fi

cd "$CAMPAIGN_DIR" || { echo "Error: campaign directory not found"; exit 1; }

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
