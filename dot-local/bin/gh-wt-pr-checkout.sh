#!/usr/bin/env bash

# vars
# set -x
set -e
code_dir="$HOME/Code/"

# validate_github_pr_url checks input against regex to validate
# If matching, input is passed through sed to remove an common url
# extras for QOL
validate_github_pr_url() {
  local url="$1"

  # Regex to match the specific GitHub pull request URL format
  local regex='^https:\/\/github\.com\/[a-zA-Z0-9_-]+\/[a-zA-Z0-9_-]+\/pull\/[0-9]+'

  if [[ "$url" =~ $regex ]]; then
    trimmed_url=$(echo "$url" | sed -E "s/($regex).*/\1/")
    echo "$trimmed_url"
    return 0 # Success
  else
    echo "Invalid GitHub pull request URL.  Must match: https://github.com/<org>/<repo>/pull/<number>"
    return 1 # Failure
  fi
}

# find_repo_dir_from_pr_url will recursivly look in $code_dir
# for dirs that have a file called config.
# This file is then checked to see if it matches the PR repo and
# a the string "[core]" to ensure it really is a git config file.
# If there is more than one match, it means the repo is cloned in
# multiple locations which this script doesn't support
# All going well it returns the locally cloned repos path.
# TODO: would be cool to check out the repo if it doesn't exist
find_repo_dir_from_pr_url() {
  file_list=$(rg --files --glob '**/config' "$code_dir")
  result_list=()
  for file in $file_list; do
    if ! grep -q "$domain:$org_repo" "$file" && ! grep -q "$domain/$org_repo" "$file"; then
      continue
    fi
    if ! grep -q '[core]' "$file"; then
      contine
    fi
    result_list=("${result_list[@]}" "$file")
  done

  if [[ "${#result_list[@]}" -ne 1 ]]; then
    echo "more then 1 repo found"
    echo "${result_list[@]}"
    exit 1
  fi

  repo_path="${result_list[0]%/.git/config}"

  echo "$repo_path"
}

# find_repo_main_branch will check a list of strings to try
# find the repos main branch as it differs between project
find_repo_main_branch() {
  for branch in master main; do
    if ! [ -d "$repo_dir/$branch" ]; then
      continue
    else
      echo "$branch"
    fi
  done
}

gh-wt-pr-checkout() {
  url="$(validate_github_pr_url "$@")"

  domain=$(echo "$url" | sed -E 's|https://([^/]+)/.*|\1|')
  org_repo=$(echo "$url" | sed -E 's|https://[^/]+/([^/]+/[^/]+)/.*|\1|')
  pr_number=$(echo "$url" | sed -E 's|.*/pull/([0-9]+)(/.*)?$|\1|')
  repo_dir="$(find_repo_dir_from_pr_url "$url")"
  main_branch="$(find_repo_main_branch)"
  worktree_dir="$repo_dir/prs/$pr_number"

  cd "$repo_dir/$main_branch" || exit 1

  # Force create worktree with main branch
  git worktree add -f "$worktree_dir" "$main_branch" || echo failed

  cd "$worktree_dir" || exit 1

  # Checkout requested PR fixing the duplicate main branch
  # created earlier
  gh pr checkout "$pr_number"

  # Update worktree dir to include branch name
  pr_branch="$(git rev-parse --abbrev-ref HEAD)"
  mv "$worktree_dir" "$worktree_dir-$pr_branch"
  git worktree repair "$worktree_dir-$pr_branch"

  cd "$repo_dir/prs/$pr_number-$pr_branch" || exit 1
}

show_help() {
  cat <<EOF
Usage: ${0##*/} [OPTIONS] <github-pr-url>

This tool takes a GitHub PR link, finds the cloned repo on your local system and checks it out
inside a git worktree.

Options:
  -h, --help        Display this help message and exit

Examples:
  ${0##*/} https://github.com/openstack-k8s-operators/ci-framework/pull/2652
  ${0##*/} https://github.com/openstack-k8s-operators/ci-framework/pull/2652/files
EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
  -h | --help)
    show_help
    exit 0
    ;;
  *)
    gh-wt-pr-checkout "$@"
    ;;
  esac
  shift
done
