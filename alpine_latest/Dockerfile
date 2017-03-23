FROM alpine:latest

LABEL maintainer="Ahmed Magdy <ahmed.magdy@quadric.net>"

RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates && \
    apk add openssl
