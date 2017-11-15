FROM alpine:latest

LABEL net.quadric.vendor="Quadric ApS" maintainer="Ahmed Magdy <ahmed.magdy@quadric.net>"

RUN apk update && \
    apk add --no-cache ca-certificates wget openssl && \
    update-ca-certificates && \
    apk add --no-cache openssl && \
    apk add --update --no-cache curl && \
    rm -rf /var/cache/apk/*

# ENTRYPOINT ["/usr/bin/curl"]
