# Basic function to quickly record interesting words I come across.
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

# Launch Neovim Nightly build with custom runtime and app name
vv() {
  local vim_runtime="$HOME/code/github.com/neovim/neovim/runtime"
  local nvim_app_name="nvim"
  local nvim_nightly_bin="$HOME/code/github.com/neovim/neovim/build/bin/nvim"

  if [[ ! -x "$nvim_nightly_bin" ]]; then
    echo "Error: Neovim nightly binary not found or not executable at $nvim_nightly_bin" >&2
    return 1
  fi

  VIMRUNTIME="$vim_runtime" NVIM_APPNAME="$nvim_app_name" "$nvim_nightly_bin" "$@"
}

