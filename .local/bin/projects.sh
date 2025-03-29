#!/usr/bin/env bash

# set -x

fd() {
  # If projects.sh is called with a single string, use that as the inital search filter
  if [[ "$#" == 1 ]]; then
    query="$1"
  else
    query=""
  fi

  # NOTE: -maxdepth may need to be increased if results are not showing in the future
  DIR=$(find ~/code -maxdepth 5 -type d -name .git -prune | xargs -P0 -n1 dirname | sort -u | fzf --query "$query" --ansi --preview "eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions {}")

  if [[ -n "$DIR" ]]; then
    cd "$DIR" || return
  fi
}

show_help() {
  cat <<EOF
  Usage: ${0##*/} [OPTIONS] [inital-query-string]

  This tool finds all git repos under the configured code_dir and presents them
  to fzf giving you a picker to choose from.
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
  fd "$@"
  ;;
esac
