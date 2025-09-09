source <(fzf --zsh)

# {{
# Loading compinit is by far the slowest thing on startup
# Here we setup caching for compinit with the .zcompdump file

# Set custom location for the completion dump file
mkdir -p "$HOME/.local/state/zsh/"
ZCOMPDUMP_FILE="$HOME/.local/state/zsh/.zcompdump"

# Check if the dump file exists and is newer than the completion functions
if [[ -f "$ZCOMPDUMP_FILE" && "$ZCOMPDUMP_FILE" -nt "$fpath[1]" ]]; then
    # Load the dump file if it's up-to-date
    autoload -Uz compinit && compinit -d "$ZCOMPDUMP_FILE"
    echo "loaded from cache"
else
    # Otherwise, generate a new dump file
    echo "Creating cache"
    autoload -Uz compinit && compinit -C -d "$ZCOMPDUMP_FILE"
fi
# }}

zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U +X bashcompinit && bashcompinit

# gotask autocompletion
# NOTE: On Fedora the binary is go-task rather than task
if which go-task 1> /dev/null 2> /dev/null; then
  alias task="go-task"
fi
eval "$(task --completion zsh)"

