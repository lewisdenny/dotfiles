#!/usr/bin/env bash

# A script that prompts for the source branch to rebase from but defautsl to upstream/main or upstream/master
# also does git fetch --all first
# could use this to check in a loop with main and master as $i `git branch -r --list | grep -q '$i$'`
#

set -x
set -e

check_branch() {
  for i in main master; do
    if git branch -r --list | grep -q $i; then
      echo $i
      return
    fi
  done
  echo "couldn't detect leading branch"
  exit 1
}
find_git_root() {
  local dir="$PWD" # Start from the current working directory
  while [ "$dir" != "$HOME" ]; do
    if [ -d "$dir/.git" ] && [ -f "$dir/.git/HEAD" ]; then
      echo "$dir"
      return 0
    fi
    dir=$(dirname "$dir") # Move up one level in the directory tree
  done
  echo "No .git directory with HEAD file found"
  exit 1
}

# Confirm git repo and return root dir

sync() {
  branch="$(check_branch)"
  git_root="$(find_git_root)"
  cd "$git_root/$branch"
  git fetch --all
  git rebase "upstream/$branch"
  git push origin "$branch"
}

show_help() {
  cat <<EOF
  Usage: ${0##*/} [OPTIONS]

  This tool can detect the HEAD branch, fetch remote updates
  and rebase the upstream remote branch onto the local branch
  before pushing the changes to the origin remote
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
*)
  sync "$@"
  ;;
esac
