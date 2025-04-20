#!/bin/bash

# 🧹 sweep.sh — Sophie Mode Activated
# Inspired by Grandma Sophie from Howl’s Moving Castle
# Cleans your project workspace with love, logic, and logs.
# "There’s dust in here, and I don’t care if you’re a wizard. I’m cleaning it."

DRY_RUN=false
INCLUDE_TMP=false
REMOVE_EMPTY=false
CLEANED_COUNT=0
SWEEP_LOG=".sweep.log"

TARGETS=(
  ".DS_Store"
  "*.log"
  "*.pyc"
  "*~"
  "*.bak"
  "__pycache__"
  ".ipynb_checkpoints"
  "*.out"
  "*.tmp"
  "*.swp"
)

echo ""
echo "🧹 Hello, dear. It’s Sophie."
echo "You’ve let this place get a bit messy, haven’t you? Let’s fix that."

# MENU
echo ""
echo "What would you like me to do today?"
echo ""
echo "  [1] Normal sweep (project folder only)"
echo "  [2] Sweep + /tmp and /var/tmp"
echo "  [3] Sweep + /tmp + remove empty dirs"
echo "  [4] Dry-run (see what would be cleaned)"
echo "  [5] Exit. I'll go have tea then."
echo ""
read -p "Choose an option [1-5]: " choice

case $choice in
  1)
    echo "✨ Alright. Just the usual sweep then."
    ;;
  2)
    echo "🌬️ Alright dear, I’ll clean the deeper corners too."
    INCLUDE_TMP=true
    ;;
  3)
    echo "🪄 Ah, a full ritual then. Emptying everything, just as it should be."
    INCLUDE_TMP=true
    REMOVE_EMPTY=true
    ;;
  4)
    echo "👓 Dry run? Alright, just don’t complain when it’s still dusty."
    DRY_RUN=true
    ;;
  5)
    echo "☕ Good choice. Even a cleaning witch deserves a break."
    exit 0
    ;;
  *)
    echo "😠 I don’t have time for games, pick a number between 1 and 5."
    exit 1
    ;;
esac

# Log init
echo "" >> "$SWEEP_LOG"
echo "🧹 Sweep run: $(date '+%Y-%m-%d %H:%M:%S')" >> "$SWEEP_LOG"
echo "----------------------------------------" >> "$SWEEP_LOG"

# Sweep Function
sweep_path() {
  local base_path="$1"
  for pattern in "${TARGETS[@]}"; do
    matches=$(find "$base_path" -name "$pattern" 2>/dev/null)
    for file in $matches; do
      if [ "$DRY_RUN" = true ]; then
        echo "[DRY RUN] Would remove: $file"
        echo "[DRY RUN] Would remove: $file" >> "$SWEEP_LOG"
      else
        rm -rf "$file" && echo "🧽 Removed: $file"
        echo "🧽 Removed: $file" >> "$SWEEP_LOG"
        CLEANED_COUNT=$((CLEANED_COUNT + 1))
      fi
    done
  done
}

echo ""
echo "🧼 Beginning the sweep..."

sweep_path "."

if [ "$INCLUDE_TMP" = true ]; then
  echo "🌀 Cleaning /tmp and /var/tmp..."
  sweep_path "/tmp"
  sweep_path "/var/tmp"
fi

if [ "$REMOVE_EMPTY" = true ]; then
  echo "📂 Removing empty directories..."
  empty_dirs=$(find . -type d -empty)
  for dir in $empty_dirs; do
    if [ "$DRY_RUN" = true ]; then
      echo "[DRY RUN] Would remove: $dir"
      echo "[DRY RUN] Would remove: $dir" >> "$SWEEP_LOG"
    else
      rmdir "$dir" 2>/dev/null && echo "🗑️  Removed empty dir: $dir"
      echo "🗑️  Removed empty dir: $dir" >> "$SWEEP_LOG"
      CLEANED_COUNT=$((CLEANED_COUNT + 1))
    fi
  done
fi

# Summary
echo ""
if [ "$DRY_RUN" = true ]; then
  echo "🧾 Dry run only. Nothing was deleted."
  echo "🧾 Dry run only. Nothing was deleted." >> "$SWEEP_LOG"
else
  echo "✨ Sweep complete. $CLEANED_COUNT items removed. Check .sweep.log for details."
  echo "✅ Sweep complete. $CLEANED_COUNT items removed." >> "$SWEEP_LOG"
fi

exit 0

