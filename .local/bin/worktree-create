#!/usr/bin/env bash

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
git_root="$(find_git_root)"

# Detect default branch (main/master)
default_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@.*/@@')

# Get branch name from user input and replace spaces with underscores
read -ep "Enter new branch name: " branch_input
branch_name="${branch_input// /_}"

# Get source branch or use default
read -ep "Enter source branch [$default_branch]: " source_input
source_branch="${source_input:-$default_branch}"

# Create worktree with constructed path
git worktree add -b "$branch_name" "$git_root/$branch_name" "$source_branch"

# cd to the new worktree, Note: could add an arg to skip this
cd "$git_root/$branch_name" || echo "Failed to CD"
