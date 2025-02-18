# https://www.dotruby.com/articles/profiling-zsh-setup-with-zprof
if [[ -n "$ZSH_DEBUGRC" ]]; then
  zmodload zsh/zprof
fi

# Set the path of zsh configuration directory
export ZSH_CONFIG=$HOME/.config/zsh

# Load PATH config
[ -f $ZSH_CONFIG/path.zshrc ] && source $ZSH_CONFIG/path.zshrc

# Load aliases
[ -f $ZSH_CONFIG/aliases.zshrc ] && source $ZSH_CONFIG/aliases.zshrc

# Load zfunctions
[ -f $ZSH_CONFIG/functions.zshrc ] && source $ZSH_CONFIG/functions.zshrc

# Load env_vars
[ -f $ZSH_CONFIG/environment_vars.zshrc ] && source $ZSH_CONFIG/environment_vars.zshrc

# Load plugins
[ -f $ZSH_CONFIG/plugins.zshrc ] && source $ZSH_CONFIG/plugins.zshrc

# Load completeion
[ -f $ZSH_CONFIG/auto_complete.zshrc ] && source $ZSH_CONFIG/auto_complete.zshrc

#https://www.dotruby.com/articles/profiling-zsh-setup-with-zprof
if [[ -n "$ZSH_DEBUGRC" ]]; then
  zprof
fi
