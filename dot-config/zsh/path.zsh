### Path {{{
  if [ ! "$PATH_LOADED" = "true" ]; then
    # Extend $PATH with Homebrew's sbin directory
    [ ! "$PATH" = "*/usr/sbin*" ] && export PATH="/usr/sbin:$PATH"
    [ ! "$PATH" = "*/usr/bin*" ] && export PATH="/usr/bin:$PATH"
    [ ! "$PATH" = "*/usr/local/sbin*" ] && export PATH="/usr/local/sbin:$PATH"
    [ ! "$PATH" = "*/usr/local/bin*" ] && export PATH="/usr/local/bin:$PATH"

    ### Homebrew {{{
      if [[ $OSTYPE == darwin* && $CPUTYPE == arm64 ]]; then
        if [ ! "$HOMEBREW_LOADED" = "true" ]; then
          eval $(/opt/homebrew/bin/brew shellenv)
          export HOMEBREW_LOADED="true"
        fi
      fi
    ### }}}

    # Extend $PATH with binary paths in home directory
    [ -d $HOME/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"

    export PATH_LOADED="true"
  fi
### }}}


# Override latest node for Quassar
export PATH="$HOME/go/bin:/opt/homebrew/opt/node@20/bin:$PATH"

# Add Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Add Go Install
export PATH="$HOME/go/bin/:$PATH"
