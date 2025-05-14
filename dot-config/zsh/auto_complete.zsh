source <(fzf --zsh)

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# gotask autocompletion
# NOTE: On Fedora the binary is go-task rather than task
if which go-task 1> /dev/null 2> /dev/null; then
  alias task="go-task"
fi
eval "$(task --completion zsh)"

