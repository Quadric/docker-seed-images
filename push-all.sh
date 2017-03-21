#!/bin/bash

set -eo pipefail

(cd alpine && sh push.sh) &
(cd conn && sh push.sh) &
(cd meteor && sh push.sh) &
(cd mongo && sh push.sh) &
(cd serverless && sh push.sh) &
wait
