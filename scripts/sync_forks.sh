#!/bin/bash

# TODO: move to Github Action

# Script: sync_forks.sh
# Description: Synchronizes all your forked repositories with their upstream repositories.
# Requirements:
#   - GitHub CLI (`gh`) must be installed and authenticated.
#   - `jq` must be installed for JSON parsing.

# Fetch the list of forked repositories and their default branches
gh repo list --fork --json nameWithOwner,defaultBranchRef | jq -r '.[] | [.nameWithOwner, .defaultBranchRef.name] | @tsv' | while IFS=$'\t' read -r repo branch; do
    echo "Synchronizing repository: $repo (branch: $branch)"
    # Synchronize the fork with the upstream repository
    gh repo sync "$repo" -b "$branch"
    echo "Finished synchronizing $repo"
    echo "-----------------------------------"
done

echo "All forked repositories have been synchronized."
