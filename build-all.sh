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

(cd alpine && sh build.sh) &
(cd jq && sh build.sh) &
(cd mongo_3.2 && sh build.sh) & 
(cd mongo-connector_2.3 && sh build.sh) &
(cd mongo-connector_2.5 && sh build.sh) &
(cd serverless && sh build.sh) &
wait
