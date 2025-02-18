source <(fzf --zsh)

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# gotask autocompletion
eval "$(task --completion zsh)"

