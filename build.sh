#!/bin/bash
BASEDIR=$(dirname $(readlink -f $0))
CONTAINER_NAME="ruby-audit"

baseimage="$(head -n 1 $BASEDIR/build/Dockerfile | perl -pe 's/FROM //i')"

echo "Pulling baseimage: $baseimage"
docker pull $baseimage 2>&1 > /dev/null

set -e
echo "===== Building $CONTAINER_NAME ====="
docker build -t scarhand/$CONTAINER_NAME $BASEDIR/build/