#!/bin/bash

# 📜 hello-scroll.sh — A foundational invocation scroll
# Gently prompts the scrollbearer for their name
# Symbolic first script with a warm, interactive ritual

# --------------------------
# Prompt for Name
# --------------------------

echo ""
echo "🌀 Who awakens the scroll? (Enter your name):"
read -r NAME

# Fallback if empty input
if [ -z "$NAME" ]; then
  NAME="Apprentice"
fi

# --------------------------
# Scroll Invocation
# --------------------------

echo ""
echo "📜 Welcome, $NAME."
echo "You’ve invoked a scroll of practice."
echo ""
echo "✨ This is a symbolic script — a first step, not a full lesson."
echo ""
echo "💡 Want to learn more about shell scripting?"
echo "📘 Try one of these resources:"
echo "   - man bash"
echo "   - tldr bash"
echo "   - https://explainshell.com"
echo "   - https://cheat.sh/bash"
echo ""
echo "🔚 Scroll ends. May your terminal light the way."

