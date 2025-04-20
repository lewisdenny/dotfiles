#!/usr/bin/env bash

# set -x

# TODO: Add support for deleting worktrees and maybe adding via worktree-create.sh?
# TODO: If formatted list was sorted into order of worktree dir creation date we
#   we could sort by most recently created using index:
#   https://man.archlinux.org/man/fzf.1.en#tiebreak=

list() {
  local worktreelist=$(git worktree list | grep -v '(bare)')
  # TODO: check for err

  formatedList=$(
    echo "$worktreelist" | gsed 's/[[:space:]]\+/,/g'
  )

  echo "$formatedList"
}

sync() {
  local array=("$@")
  local wt
  wt="$(echo "${array[1]}" | cut -d ',' -f1)"
  local branch
  branch="$(
    echo "${array[1]}" |
      cut -d ',' -f3 |
      sed 's/[][]//g'
  )"
  echo "$wt"
  echo "$branch"
  pushd "$wt" && git-sync.sh "$branch" && popd || exit
}

delete() {
  local array=("$@")
  local wt="${array[1]}"
  dialog -t "Delete Confirmation" \
    -m "Are you sure you would like to delete \"$wt\"" \
    --style mini \
    --button1text "Yes" \
    --button2text "Cancel"

  ec=$?

  if [[ $ec == 0 ]]; then
    echo "Deleting $wt"
    git worktree remove "${wt}"
  fi
}

fzfWorkTree() {
  # If script is called with a single string, use that as the inital search filter
  if [[ "$#" == 1 ]]; then
    query="$1"
  else
    query=""
  fi

  local formatedList
  formatedList=$(list)

  DIR=$(
    echo "$formatedList" |
      fzf --query "$query" \
        --ansi \
        --delimiter ',' \
        --with-nth=' {3}' \
        --preview "git -C {1} diff --stat --color=always upstream/main..HEAD" \
        --preview-label='[ {1} ]' \
        --preview-window=70%,top \
        --bind='ctrl-r:reload(wt.sh -l)' \
        --bind "ctrl-d:execute-silent(wt.sh -d {1})" \
        --bind='ctrl-d:+reload(wt.sh -l)' \
        --bind="ctrl-s:execute(wt.sh -s {})" \
        --bind='ctrl-s:+reload(wt.sh -l)' \
        --bind='ctrl-s:+refresh-preview'
  )

  if [[ -n "$DIR" ]]; then
    cd "$(echo "${DIR}" | cut -d ',' -f1)" || return
  fi
}

show_help() {
  cat <<EOF
  Usage: ${0##*/} [OPTIONS] [inital-query-string]

  This script lists worktrees and allows you to search and select one to
  change directory into.
  Options:
    -h, --help        Display this help message and exit

  Examples:
    ${0##*/}
    ${0##*/} project_x
EOF
}

# Parse command line arguments
case $1 in
-h | --help)
  show_help
  ;;
-l | --list)
  list
  ;;
-d | --delete)
  delete "$@"
  ;;
-s | --sync)
  sync "$@"
  ;;
*)
  fzfWorkTree "$@"
  ;;
esac
