FROM --platform=$BUILDPLATFORM node:16-alpine

MAINTAINER LD

ENV HOME_DIR=/opt/app

# for node-pg-native
RUN apk --no-cache add make python3 gcc postgresql-dev g++ libc6-compat

RUN mkdir -p /opt/docker-bin && mkdir -p $HOME_DIR

ADD docker-entrypoint.sh /opt/docker-bin/

RUN chmod +x /opt/docker-bin/docker-entrypoint.sh

RUN rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
     /root/.npm /root/.node-gyp /usr/lib/node_modules/npm/man \
     /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

RUN npm install --location=global npm
RUN npm install --location=global nodemon

ENTRYPOINT ["/opt/docker-bin/docker-entrypoint.sh"]
