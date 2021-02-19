#!/bin/bash
# Ensure we fail the job if any steps fail
set -e -o pipefail

mkdir -p ".chartstorage"

chartmuseum --port=6464 --storage="local" --storage-local-rootdir=".chartstorage" &> /dev/null &
source helm.prop
$HELM_BIN plugin install https://github.com/chartmuseum/helm-push.git
$HELM_BIN repo add local http://localhost:6464
