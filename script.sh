#!/bin/bash

REF_LENGTH=$INPUT_LENGTH
REF_NAME=$INPUT_REF

SHA=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$GITHUB_REPOSITORY/commits/$REF_NAME --silent| jq '.sha' | sed s/\"//g | cut -c 1-$REF_LENGTH)

echo "::set-output name=sha::$SHA"

echo "SHA=$SHA" >> GITHUB_ENV