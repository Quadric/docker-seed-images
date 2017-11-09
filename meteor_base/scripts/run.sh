#!/bin/bash

set -e;

# Set a delay to wait to start meteor container
if [[ $DELAY ]]; then
  echo "Delaying startup for $DELAY seconds";
  sleep $"DELAY";
fi

# Honour already existing PORT setup
PORT=${METEOR_INTERNAL_PORT:-80}; # PORT is required for meteor, but we send it as METEOR_INTERNAL_PORT to avoid conflicts in our main .env file!
MONGO_DB_NAME=${MONGO_DB_NAME:-meteor}
MONGO_URL=${MONGO_URL:-mongodb://c-mongo-0/$MONGO_DB_NAME};
MONGO_OPLOG_URL=${MONGO_OPLOG_URL:-mongodb://c-mongo-0/local};

# If METEOR_MONGO_URL is provided, set it to MONGO_URL
if [ ! -z "${METEOR_MONGO_URL+x}" ] ; then
  MONGO_URL=${METEOR_MONGO_URL};
fi

# If METEOR_MONGO_OPLOG_URL is provided, set it to MONGO_OPLOG_URL
if [ ! -z "${METEOR_MONGO_OPLOG_URL+x}" ] ; then
  MONGO_OPLOG_URL=${METEOR_MONGO_OPLOG_URL};
fi

# TODO: This is a trail to stringify a json file from command line ..
#   this removes all whitespaces, but there is an issue that is remove whitespace from json keys "Google Analytics" => "GoogleAnalytics"
#     According to the ascii table: http://www.asciitable.com/
#     \040 => space, \011 => tab, \012 => new line, \015 => carriage return
# jq '.' ../configuration-settings/"$ENV"/settings.json | tr -d '\040\011\012\015';

# TODO Fix the Google\\040Analytics space in between config problem
# Replace \\040 in METEOR_SETTINGS to space
METEOR_SETTINGS=$(echo -n "$METEOR_SETTINGS" | sed -e 's/\\\\040/ /g')
# METEOR_SETTINGS=$(cat /settings.json) node main.js;

export \
PORT=$METEOR_INTERNAL_PORT \
MONGO_URL=$MONGO_URL \
MONGO_OPLOG_URL=$MONGO_OPLOG_URL \
METEOR_SETTINGS=$METEOR_SETTINGS

echo "=> Starting meteor app on port:$PORT";
node main.js;
