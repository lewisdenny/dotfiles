alias sed="/opt/homebrew/bin/gsed"
alias grep="/opt/homebrew/bin/ggrep"
alias gpf="git push --force"
alias gs="git status"
alias gr="git remote -v"
alias gwtl="git worktree list"
alias pj=". pj.sh" # NOTE: Without the dot, the cd inside projects.sh runs inside the subprocess

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --hyperlink -git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll="eza --color=always --all --long --git --icons=always --smart-group --group-directories-first"

# ---- NeoVim -----
alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
alias nvim-nvchad='NVIM_APPNAME="nvim-nvchad" nvim'
alias nvim-lazyvim='NVIM_APPNAME="nvim-lazyvim" nvim'
alias v="nvim"

# Example: xattr -r -d com.apple.quarantine FedoraMediaWriter.app
alias quarantine-remove='xattr -r -d com.apple.quarantine'

# jira-cli alias
alias jil='jira issue list -q "assignee = currentUser() AND status != closed"'
alias jc='jira issue comment add'
