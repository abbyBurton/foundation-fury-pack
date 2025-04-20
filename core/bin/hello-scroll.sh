#!/bin/bash

# 📜 hello-scroll.sh — A foundational invocation scroll
# A soft welcome to the terminal, and a gentle guide toward deeper learning

# --------------------------
# Defaults
# --------------------------
NAME="Apprentice"
SHOW_HELP=false

# --------------------------
# Help Function
# --------------------------
function show_help() {
  echo "🔮 Usage: $0 [-n name] [-h]"
  echo ""
  echo "🪄 Options:"
  echo "  -n <name>     Sets the name of the scrollbearer"
  echo "  -h            Displays this help message"
  echo ""
  echo "📘 Example:"
  echo "  $0 -n Xio"
}

# --------------------------
# Parse Flags
# --------------------------
while getopts "n:h" option; do
  case "${option}" in
    n) NAME=${OPTARG} ;;
    h) SHOW_HELP=true ;;
    *) show_help; exit 1 ;;
  esac
done

# --------------------------
# Display Help and Exit
# --------------------------
if [ "$SHOW_HELP" = true ]; then
  show_help
  exit 0
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

