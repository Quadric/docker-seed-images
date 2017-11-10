#!/bin/bash

set -eox pipefail;

# COPIED_APP_PATH=/copied-app
CONTAINER_BUNDLE_DIR=${CONTAINER_BUNDLE_DIR:-/tmp/bundle-dir}

# # sometimes, directly copied folder cause some wierd issues
# # this fixes that
# echo "=> Copying the app"
# cp -R /app $COPIED_APP_PATH
# cd $COPIED_APP_PATH

# echo "=> Executing NPM install --production"
# meteor npm install --production --quiet

echo "=> Executing Meteor Build..."
# export
meteor build --allow-superuser --architecture os.linux.x86_64 --directory $BUNDLE_DIR
# --server=http://localhost:3000 # TODO send the server if we are building for mobile

echo "=> Printing Meteor Node information..."
echo "  => platform"
meteor node -p process.platform
echo "  => arch"
meteor node -p process.arch
echo "  => versions"
meteor node -p process.versions

echo "=> Printing System Node information..."
echo "  => platform"
node -p process.platform
echo "  => arch"
node -p process.arch
echo "  => versions"
node -p process.versions

# echo "=> Executing NPM install within Bundle"
# cd $BUNDLE_DIR/bundle/programs/server/
# npm i
# 
# echo "=> Moving bundle"
# mv $BUNDLE_DIR/bundle /built_app
# 
# echo "=> Cleaning up"
# # cleanup
# echo " => COPIED_APP_PATH"
# rm -rf $COPIED_APP_PATH
# echo " => BUNDLE_DIR"
# rm -rf $BUNDLE_DIR
# echo " => .meteor"
# rm -rf ~/.meteor
# rm /usr/local/bin/meteor