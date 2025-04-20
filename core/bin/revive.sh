#!/bin/bash

# 🧬 revive.sh — Symbolic script to restart a process or service
# Usage: ./revive.sh <process_name or service>

if [ -z "$1" ]; then
  echo "Usage: $0 <process_name>"
  echo "🌀 No target specified. Cannot revive what is unnamed."
  exit 1
fi

PROCESS=$1
echo "🔁 Attempting to revive '$PROCESS'..."

# Try to kill the process gently first
pkill -f "$PROCESS" 2>/dev/null

# Wait briefly before restarting
sleep 1

# Attempt to restart the process
"$PROCESS" &

if [ $? -eq 0 ]; then
  echo "⚡ '$PROCESS' has been revived. Onward it goes."
else
  echo "❌ Revival failed. The target may not be executable from here."
fi
