#!/usr/bin/env bash
set -euo pipefail
unset CDPATH; cd "$( dirname "${BASH_SOURCE[0]}" )"; cd "$(pwd -P)"

# Prepare golang and gimme (tool from Travis CI that helps you install golang)
export GO_VERSION="1.8.3"
export GIMME_GO_VERSION=$GO_VERSION
export GIMME_SILENT_ENV=1
export GIMME_TYPE="binary"
export GIMME_TMP="./.gimme-tmp"
export GIMME_ENV_PREFIX="./.gimme/envs"
export GIMME_VERSION_PREFIX="./.gimme/versions"
src="${GIMME_ENV_PREFIX}/go${GO_VERSION}.env"

# Install golang to the local directory if you have not already
test -f "$src" || (
	echo "Installing golang..."
	rm -rf $GIMME_TMP
	./gimme.sh
	rm -rf $GIMME_TMP
)
source "$src"

echo "Building the golang file..."
go build -buildmode=c-shared -o simple.so simple.go
