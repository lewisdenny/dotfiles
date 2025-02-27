#!/usr/bin/env bash

fd() {
  DIR=$(find ~/code -maxdepth 5 -type d -name .git -prune | xargs -P0 -n1 dirname | sort -u | fzf -m) &&
    echo "$DIR" &&
    cd "$DIR" || echo "Failed"
}

fd
