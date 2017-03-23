#!/bin/bash

# set -eo pipefail

# # TODO think of a way to make these pushes run async, but wait for all of them to finish before existing!
# for dir in ./*
# do
#     if [ -d "$dir" ] ; then  
#         # dir=${dir%*/}
#         tag=$(<./"${dir##*/}"/tag)
#         docker push "$tag"
#     fi
# done

(cd alpine_latest && sh push.sh) &
(cd meteor_1.4.2.7 && sh push.sh) &
(cd mongo_3.2 && sh push.sh) & 
(cd mongo-connector_2.3 && sh push.sh) &
(cd mongo-connector_2.5 && sh push.sh) &
(cd serverless_latest && sh push.sh) &
wait
