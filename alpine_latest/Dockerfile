FROM alpine:latest

LABEL net.quadric.vendor="Quadric ApS" maintainer="Ahmed Magdy <ahmed.magdy@quadric.net>"

RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates && \
    apk add openssl
