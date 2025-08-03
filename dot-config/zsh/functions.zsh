
# Basic fuction to quickly record intersting words I come across.
interesting-word() {
  local INFILE="$ZSH_CONFIG/interesting-words.txt"

  if [[ "$1" == "list" || "$1" == "cat" ]]; then
    if [[ -f "$INFILE" ]]; then
      cat "$INFILE"
    else
      echo "No interesting words recorded yet."
    fi
    return 0
  elif [[ "$1" == "edit" ]]; then
    if [[ -f "$INFILE" ]]; then
      shift # Remove 'edit' from arguments
      nvim "$INFILE"
    else
      echo "No interesting words recorded yet."
    fi
    return 0
  elif [[ -z "$@" ]]; then
    echo "Usage: interesting-word <word(s)> | list"
    echo "  <word(s)>: Adds the given words to the interesting words list."
    echo "  list: Displays all recorded interesting words."
    return 1
  else
    if grep -q "$@" "$INFILE" 2>/dev/null; then
      echo "Already recorded: $(grep "$@" "$INFILE")"
      return 0
    fi
    echo "$(date '+%Y-%m-%d %H:%M:%S') $@" >> "$INFILE"
	if grep -q "$1" "$INFILE"; then
      echo "Added: $1"
    else
      echo "Error adding $1"
    fi
  fi
}
