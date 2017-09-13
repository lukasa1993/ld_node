FROM irakli/node-alpine:6.9.2

MAINTAINER NoOne

USER root

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    bash \
    wget \
    ca-certificates \
    zip \
    unzip \
    mysql-client \
    build-base \
 && pip install --upgrade pip \
 && pip install virtualenv \
 && adduser -s /bin/false -D appuser \
 && npm install -g nodemon

