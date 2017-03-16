#!/bin/bash

set -eo pipefail

(cd conn && sh build.sh) &
(cd meteor && sh build.sh) &
(cd mongo && sh build.sh) &
(cd serverless && sh build.sh) &
wait
