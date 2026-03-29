#!/bin/bash
# Auto-save DnD session to GitHub
# Called after session ends or manually via /save-dnd-session

CAMPAIGN_DIR="/Users/jasonbatiquin/duskport-campaign"
REPO="https://github.com/jbatiquin-sysad/dnd-campaigns.git"

# Copy latest files from source locations
cp ~/memory_layer.md "$CAMPAIGN_DIR/"
cp ~/.kiro/prompts/party-state.json "$CAMPAIGN_DIR/party/"

cd "$CAMPAIGN_DIR"

# Check if there's anything to commit
if git diff --quiet && git diff --staged --quiet; then
  echo "Nothing to commit — session already saved."
  exit 0
fi

# Auto-generate commit message from last session entry in memory_layer
LAST_SESSION=$(grep "^## Session\|^## END OF SESSION\|^## Turn" memory_layer.md | tail -1)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
COMMIT_MSG="Auto-save: $TIMESTAMP — $LAST_SESSION"

git add .
git commit -m "$COMMIT_MSG"
git push origin main

echo "Session saved to GitHub: $COMMIT_MSG"
