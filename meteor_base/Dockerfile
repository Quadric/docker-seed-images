FROM abernix/meteord:node-8.9.0-base

#  abernix/meteord:base for releases 1.4>=(release)<1.6 &
#  abernix/meteord:node-8.9.0-base for releases >=1.6

LABEL net.quadric.vendor="Quadric ApS" maintainer="Ahmed Magdy <ahmed.magdy@quadric.net>" net.quadric.leafimage="true"

ARG METEOR_INTERNAL_PORT
ENV METEOR_INTERNAL_PORT ${METEOR_INTERNAL_PORT:-80}

# ARG METEOR_TAR_FILE_PATH
# ENV METEOR_TAR_FILE_PATH ${METEOR_TAR_FILE_PATH:-./src.tar.gz}

COPY ./scripts/run.sh /run.sh

# ONBUILD ADD ${METEOR_TAR_FILE_PATH} /

ONBUILD WORKDIR /bundle/programs/server/

# RUN npm install --unsafe-perm
ONBUILD RUN npm install --only=production --quiet

ONBUILD WORKDIR /bundle/

ONBUILD EXPOSE ${METEOR_INTERNAL_PORT}

ENTRYPOINT bash /run.sh

HEALTHCHECK --interval=1s --timeout=30s --retries=300 \
  CMD curl http://localhost:${METEOR_INTERNAL_PORT}
