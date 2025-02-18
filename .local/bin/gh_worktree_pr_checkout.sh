#!/usr/bin/env bash

# vars
set -x
code_dir="$HOME/Code/"

# Funtions
find_repo_dir_from_pr_url() {
  file_list=$(rg --files --glob '**/config' "$code_dir")
  result_list=()
  for file in $file_list; do
    if ! grep -q "$domain:$org_repo" "$file"; then
      continue
    fi
    if ! grep -q '[core]' "$file"; then
      contine
    fi
    result_list=("${result_list[@]}" "$file")
  done

  if [[ "${#result_list[@]}" -ne 1 ]]; then
    echo "more then 1 repo found"
    exit 1
  fi

  repo_path="${result_list[0]%/.git/config}"

  echo "$repo_path"
}

find_repo_main_branch() {
  for branch in master main; do
    if ! [ -d "$repo_dir/$branch" ]; then
      continue
    else
      echo "$branch"
    fi
  done
}

check_worktree_exists() {
  worktrees="$(git worktree list --porcelain | grep worktree | cut -d' ' -f2)"
  for worktree in $worktrees; do
    if echo "$worktree" | grep -q "$pr_number"; then
      echo "$worktree"
    fi
  done
}

url=$1
# url="https://github.com/openstack-k8s-operators/ci-framework/pull/2504"

domain=$(echo "$url" | sed -E 's|https://([^/]+)/.*|\1|')
org_repo=$(echo "$url" | sed -E 's|https://[^/]+/([^/]+/[^/]+)/.*|\1|')
pr_number=$(echo "$url" | sed -E 's|.*/pull/([0-9]+)(/.*)?$|\1|')
repo_dir="$(find_repo_dir_from_pr_url "$url")"
main_branch="$(find_repo_main_branch)"

# echo "$domain"
# echo "$org_repo"
# echo "$pr_number"
# echo "$repo_dir"
# echo "$main_branch"

cd "$repo_dir/$main_branch" || exit 1

worktree_exists="$(check_worktree_exists)"
if [[ $worktree_exists ]]; then
  echo "worktree already exists for that PR"
  cd "$worktree_exists" || exit 1
  exit 0
fi

gh pr checkout "$pr_number"

pr_branch="$(git rev-parse --abbrev-ref HEAD)"

git checkout "$main_branch"

git worktree add "$repo_dir/pr/$pr_number-$pr_branch" "$pr_branch"

cd "$repo_dir/pr/$pr_number-$pr_branch" || exit 1
