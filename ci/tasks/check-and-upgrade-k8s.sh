#!/bin/bash

set -eu

# pushd repo
pushd ci/k8s-upgrade

tf apply -auto-approve
LATEST_VERSION=$(tf output -json | jq -r .latest_version.value)
