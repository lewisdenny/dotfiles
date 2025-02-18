# ripgrep config
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# Set EDITOR
export EDITOR=("$(brew --prefix)/bin/nvim")

if which brew > /dev/null; then
  fpath+=$(brew --prefix)/share/zsh/site-functions
  export HOMEBREW_NO_ENV_HINTS=TRUE
fi

