#!/bin/bash

set -eu

source pipeline-tasks/ci/tasks/helpers.sh

pushd repo/examples/gcp

update_examples_git_ref

init_gcloud
init_kubeconfig
init_bootstrap

bin/prep-inception.sh

echo yes | GOOGLE_CREDENTIALS=$(cat inception-sa-creds.json) make destroy-inception
echo yes | make destroy-bootstrap

make_commit "Bump modules to '${MODULES_GIT_REF}' in examples"
