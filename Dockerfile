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
 && pip install virtualenv

