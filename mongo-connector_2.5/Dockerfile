FROM python:3.4

LABEL maintainer="Ahmed Magdy <ahmed.magdy@quadric.net>"

# Install jq to write a better healthcheck command that the oplog.timestamp contains exactly "${MONGO_REPLICA_SET_NAME}" in the first item in the list
## Using something similar to: if cat /oplog.timestamp | jq '.[0]' | grep "${MONGO_REPLICA_SET_NAME}" ; then echo 'found!!'; exit 0; else echo 'not found!!'; exit 1; fi
RUN apt-get update && \
    apt-get install -y jq && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt
