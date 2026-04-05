#!/bin/bash
# Save DnD session to GitHub
# Usage: ./save-session.sh ["commit message"]
#   If no message provided, auto-generates from week file + party state

CAMPAIGN_DIR="$(cd "$(dirname "$0")" && pwd)"
STATE="$CAMPAIGN_DIR/party/party-state.json"
KIRO_PROMPTS="$HOME/.kiro/prompts"

cd "$CAMPAIGN_DIR" || { echo "❌ Campaign directory not found"; exit 1; }

# Preflight checks
[ -d .git ] || { echo "❌ Not a git repository: $CAMPAIGN_DIR"; exit 1; }

# Detect current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ "$BRANCH" != "main" ]; then
  echo "⚠️  You're on branch '$BRANCH', not 'main'."
  if [ -t 0 ]; then
    read -p "   Push to '$BRANCH' instead? (y/n) " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]] || { echo "Aborted."; exit 1; }
  else
    echo "   Non-interactive — aborting. Switch to main first."
    exit 1
  fi
fi

# Sync party state FROM campaign TO kiro prompts
if [ -f "$STATE" ]; then
  if [ -d "$KIRO_PROMPTS" ]; then
    cp "$STATE" "$KIRO_PROMPTS/party-state.json"
    echo "✅ Synced party-state.json → ~/.kiro/prompts/"
  else
    echo "⚠️  ~/.kiro/prompts/ not found — skipping sync"
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

# Stage first, THEN pull (so merge has full picture of local state)
git add .

echo "📥 Pulling latest from remote..."
PULL_OUTPUT=$(git pull --no-edit origin "$BRANCH" 2>&1) || {
  echo "❌ Git pull failed with merge conflict."
  echo "$PULL_OUTPUT"
  echo ""
  echo "   Your changes are staged but not committed."
  echo "   Resolve conflicts, then run: git add . && git commit && git push"
  exit 1
}

# Generate commit message
if [ -n "${1:-}" ]; then
  COMMIT_MSG="$1"
else
  WEEK_TITLE=""
  LATEST_WEEK=$(ls -t sessions/week-*.md 2>/dev/null | head -1)
  if [ -n "$LATEST_WEEK" ]; then
    WEEK_TITLE=$(head -1 "$LATEST_WEEK" | sed 's/^# //')
  fi

  if command -v python3 >/dev/null && [ -f "$STATE" ]; then
    DAY=$(python3 -c "import json; print(json.load(open('$STATE'))['in_game_day'])" 2>/dev/null || echo "?")
    LOC=$(python3 -c "import json; print(json.load(open('$STATE'))['location'])" 2>/dev/null || echo "?")
  else
    DAY="?"
    LOC="?"
  fi

  TIMESTAMP=$(date '+%Y-%m-%d %H:%M')

  if [ -n "$WEEK_TITLE" ]; then
    COMMIT_MSG="Save [$TIMESTAMP] Day $DAY: $WEEK_TITLE"
  else
    COMMIT_MSG="Save [$TIMESTAMP] Day $DAY: $LOC"
  fi
fi

git commit -m "$COMMIT_MSG"

echo ""
echo "📤 Pushing to GitHub..."
if git push origin "$BRANCH"; then
  echo ""
  echo "✅ Session saved: $COMMIT_MSG"
else
  echo ""
  echo "❌ Push failed — commit is saved locally but not on GitHub."
  echo "   Check your network connection and try: git push origin $BRANCH"
  exit 1
fi
