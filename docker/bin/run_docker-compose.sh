#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
source $SCRIPT_DIR/common.sh

YML_FILE=$SCRIPT_DIR/docker-compose.yml
cat $YML_FILE
docker-compose -f $YML_FILE $*

