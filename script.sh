#!/bin/bash

REF_NAME=$1
REF_LENGTH=$2

SHA=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${$GITHUB_TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$GITHUB_REPOSITORY/commits/$REF_NAME --silent| jq '.sha' | sed s/\"//g | cut -c 1-$REF_LENGTH)

echo "sha=$SHA" >> GITHUB_OUTPUT