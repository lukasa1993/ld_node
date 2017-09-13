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
    build-base \
 && pip install --upgrade pip \
 && pip install virtualenv \
 && adduser -s /bin/false -D appuser \
 && rm -rf node_modules \ 
 && npm install \ 
 && chown -R appuser /opt/app \
 && npm install -g nodemon

 