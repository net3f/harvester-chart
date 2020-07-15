#!/bin/bash
set -e


patch(){
  local BRANCH=$1
  local LATEST_UPSTREAM=$2
  local GITHUB_BOT_TOKEN=$3

  local build_dir=$(mktemp -d)
  local target_repo="https://web3bot:${GITHUB_BOT_TOKEN}@github.com/w3f/harvester-chart"

  cd $build_dir
  git clone "${target_repo}" .
  git checkout -b "${BRANCH}"

  sed -i "/tag:/c\  tag: $LATEST_UPSTREAM" helmfile.d/config/kusama-internal.yaml.gotmpl
}
