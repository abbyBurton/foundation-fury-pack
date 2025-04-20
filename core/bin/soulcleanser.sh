#!/bin/bash

# 🧼 soulcleanser.sh — Scan and symbolically purify zombie processes
# Usage: ./soulcleanser.sh

echo "🧼 Initiating soul cleansing..."
echo "🔍 Searching for haunted remnants in the process table..."

# Find zombie processes (STAT = Z)
ZOMBIES=$(ps aux | awk '$8 ~ /Z/ { print $2 ":" $11 }')

if [ -z "$ZOMBIES" ]; then
  echo "🌸 All is quiet. No ghostly processes found. The system is clean."
  exit 0
fi

echo "💀 Detected the following haunted (zombie) processes:"
echo "$ZOMBIES" | while IFS=: read -r pid cmd; do
  echo " - PID $pid ($cmd)"
done

echo ""
read -p "⚠️  Attempt to purge the haunted by killing their parents? [y/N]: " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  for pid in $(echo "$ZOMBIES" | cut -d: -f1); do
    ppid=$(ps -o ppid= -p "$pid" | tr -d ' ')
    if [ ! -z "$ppid" ]; then
      echo "☠️  Releasing PID $pid by purging its parent (PID $ppid)..."
      kill -9 "$ppid" 2>/dev/null
    fi
  done
  echo "🕊️  Cleansing complete. The veil is quiet now."
else
  echo "🧘 Acknowledged. No actions taken. Sometimes, we simply witness."
fi
