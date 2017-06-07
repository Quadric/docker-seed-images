#!/bin/bash

# set -eo pipefail

# # TODO think of a way to make these builds run async, but wait for all of them to finish before existing!
# for dir in ./*
# do
#     if [ -d "$dir" ] ; then  
#         # dir=${dir%*/}
#         tag=$(<./"${dir##*/}"/tag)
#         docker build -t "$tag" ./"${dir##*/}"
#     fi
# done

(cd alpine_latest && sh build.sh) &
(cd jq_latest && sh build.sh) &
(cd meteor_1.4.2.7 && sh build.sh) &
(cd mongo_3.2 && sh build.sh) & 
(cd mongo-connector_2.3 && sh build.sh) &
(cd mongo-connector_2.5 && sh build.sh) &
(cd serverless_latest && sh build.sh) &
wait
