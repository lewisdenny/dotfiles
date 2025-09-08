# ripgrep config
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# Set EDITOR
export EDITOR=nvim

if which brew 1> /dev/null 2> /dev/null; then
  fpath+=$(brew --prefix)/share/zsh/site-functions
  export HOMEBREW_NO_ENV_HINTS=TRUE
fi

# Jira-cli config
export JIRA_EDITOR=nvim

# Allow detecting if inside lima instance
if [[ $(hostname) == *lima* ]]; then
  export RUNNING_IN_LIMA=true
fi

# code path
export CODE_PATH=$HOME/code

# dotfiles path
export DOTFILE_PATH=$CODE_PATH/dotfiles
