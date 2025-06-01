if which brew 1> /dev/null 2> /dev/null; then
  alias sed="/opt/homebrew/bin/gsed"
  alias grep="/opt/homebrew/bin/ggrep"
  alias make="/opt/homebrew/bin/gmake"
fi

alias gpf="git push --force"
alias gs="git status"
alias gr="git remote -v"
alias gwtl="git worktree list"

# NOTE: Without the dot, the cd inside the script runs inside the subprocess
alias pj=". pj.sh"
alias wt=". wt.sh"

# ---- Eza (better ls) -----
# Disable Git in Lima because storage is too slow
eza_git_arg=""
if [[ -z "${RUNNING_IN_LIMA}" ]];then eza_git_arg="--git"; fi

alias ls="eza --color=always --long --hyperlink ${eza_git_arg} --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll="eza --color=always --all --long ${eza_git_arg} --icons=always --smart-group --group-directories-first"


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
