export BAT_THEME=tokyonight_night

# Better zsh history
eval "$(atuin init zsh --disable-up-arrow)"

# oh-my-posh prompt
# if [[ -z "${RUNNING_IN_LIMA}" ]];then
#   eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.yaml)"
# fi

# Starship
eval "$(starship init zsh)"
