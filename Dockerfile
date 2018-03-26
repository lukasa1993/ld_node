FROM node:carbon-alpine

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
 && rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
     /root/.npm /root/.node-gyp /usr/lib/node_modules/npm/man \
     /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html \
  && apk search --update

