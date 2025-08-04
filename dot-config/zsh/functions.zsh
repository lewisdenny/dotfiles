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
  # set -e  # Exit immediately if a command exits with a non-zero status

  local repo="$HOME/code/github.com/neovim/neovim"
  local vim_runtime="$repo/runtime"
  local nvim_app_name="nvim"
  local nvim_nightly_bin="$repo/build/bin/nvim"
  local sha_file="$HOME/neovimsha"

  if [[ ! -d "$repo/.git" ]]; then
    echo "Error: Neovim git repo not found at $repo" >&2
    return 1
  fi

  local skip_update=0
  if [[ -e "$sha_file" ]]; then
    if find "$sha_file" -type f -newermt "$(date +%Y-%m-%d)" | grep -q .; then
      echo "Update skipped: $sha_file modified today."
      skip_update=1
    fi
  fi

  if [[ "$skip_update" -eq 0 ]]; then
    if nc -zw1 github.com 443; then
      pushd "$repo"
      git fetch origin
      if ! git diff --quiet HEAD..origin/$(git rev-parse --abbrev-ref HEAD); then
        git rev-parse HEAD > "$sha_file"
        git pull --ff-only origin "$(git rev-parse --abbrev-ref HEAD)"
        make CMAKE_BUILD_TYPE=Release
      fi
      popd
    else
      echo "Warning: github.com not reachable, skipping update." >&2
    fi
  fi

  if [[ ! -x "$nvim_nightly_bin" ]]; then
    echo "Error: Neovim nightly binary not found or not executable at $nvim_nightly_bin" >&2
    return 1
  fi

  VIMRUNTIME="$vim_runtime" NVIM_APPNAME="$nvim_app_name" "$nvim_nightly_bin" "$@"
}

