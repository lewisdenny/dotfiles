#!/bin/bash

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

gh-pr-checkout() {
    local git_root
    git_root="$(find_git_root)"
    worktree_dir="$git_root/pr/$1"

    mkdir -p "$worktree_dir"
    git worktree add -b "$1" "$worktree_dir" main
    cd "$worktree_dir" || echo "cd failed" && exit 1
    gh pr checkout "$1"
}

gh-pr-checkout "$@"
