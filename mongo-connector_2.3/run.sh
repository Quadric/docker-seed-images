#!/bin/bash

set -eo pipefail;

# This file will check if the config file exists, by default: /mongo-connector.config.json
# If not, it'll check the MONGO_CONNECTOR_CONFIG env var, if it contains a valid json
#   it'll write it to the config file path

MONGO_CONNECTOR_CONFIG_FILE_PATH=${MONGO_CONNECTOR_CONFIG_FILE_PATH:-/mongo-connector.config.json}
MONGO_CONNECTOR_OPLOG_FILE_SYMLINK_PATH=${MONGO_CONNECTOR_OPLOG_FILE_SYMLINK_PATH:-/symlink-oplog.timestamp}

if [ ! -f "$MONGO_CONNECTOR_CONFIG_FILE_PATH" ] ; then
  echo "Info: Couldn't find config file: $MONGO_CONNECTOR_CONFIG_FILE_PATH";

  if [ -z "$MONGO_CONNECTOR_CONFIG" ] ; then
    echo "ERROR: Env var MONGO_CONNECTOR_CONFIG is not defined .. existing!";
    exit 1;
  fi

  echo "Creating $MONGO_CONNECTOR_CONFIG_FILE_PATH from env var MONGO_CONNECTOR_CONFIG .."
  echo "$MONGO_CONNECTOR_CONFIG" | sed -e 's/\\\\040/ /g' | python3 -m json.tool > "$MONGO_CONNECTOR_CONFIG_FILE_PATH"
fi

# Read oplogFile property from config file and create a symlink to /symlink-oplog.timestamp
ln -s "$(jq --raw-output .oplogFile "$MONGO_CONNECTOR_CONFIG_FILE_PATH")" "$MONGO_CONNECTOR_OPLOG_FILE_SYMLINK_PATH"

echo "Start the app";
mongo-connector -c "$MONGO_CONNECTOR_CONFIG_FILE_PATH"