# https://www.dotruby.com/articles/profiling-zsh-setup-with-zprof
if [[ -n "$ZSH_DEBUGRC" ]]; then
  zmodload zsh/zprof
fi

# Set the path of zsh configuration directory
export ZSH_CONFIG=$HOME/.config/zsh

# Load PATH config
[ -f $ZSH_CONFIG/path.zsh ] && source $ZSH_CONFIG/path.zsh

# Load secrets
[ -f $ZSH_CONFIG/secrets.zsh ] && source $ZSH_CONFIG/secrets.zsh || echo "Secrets file missing"

# Load any custom config
setopt NULL_GLOB
for config_file in "$ZSH_CONFIG"/custom/*.zsh; do
    [ -f "$config_file" ] && source "$config_file"
done

# Load aliases
[ -f $ZSH_CONFIG/aliases.zsh ] && source $ZSH_CONFIG/aliases.zsh

# Load zfunctions
[ -f $ZSH_CONFIG/functions.zsh ] && source $ZSH_CONFIG/functions.zsh

# Load env_vars
[ -f $ZSH_CONFIG/environment_vars.zsh ] && source $ZSH_CONFIG/environment_vars.zsh

# Load completeion
[ -f $ZSH_CONFIG/auto_complete.zsh ] && source $ZSH_CONFIG/auto_complete.zsh

# Load plugins
[ -f $ZSH_CONFIG/plugins.zsh ] && source $ZSH_CONFIG/plugins.zsh

# Load general config
[ -f $ZSH_CONFIG/general.zsh ] && source $ZSH_CONFIG/general.zsh

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# https://www.dotruby.com/articles/profiling-zsh-setup-with-zprof
# `time ZSH_DEBUGRC=1 zsh -i -c exit`
if [[ -n "$ZSH_DEBUGRC" ]]; then
  zprof
fi

# Lima BEGIN
# Make sure iptables and mount.fuse3 are available
PATH="$PATH:/usr/sbin:/sbin"
export PATH
# Lima END
