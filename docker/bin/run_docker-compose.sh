#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
source $SCRIPT_DIR/common.sh

docker-compose $*

