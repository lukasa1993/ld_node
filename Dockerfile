FROM node:14-alpine

MAINTAINER LD

ENV HOME_DIR=/opt/app

# for node-pg-native
RUN apk --no-cache add make python gcc postgresql-dev g++

RUN mkdir -p /opt/docker-bin && mkdir -p $HOME_DIR

ADD docker-entrypoint.sh /opt/docker-bin/

RUN chmod +x /opt/docker-bin/docker-entrypoint.sh

RUN rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
     /root/.npm /root/.node-gyp /usr/lib/node_modules/npm/man \
     /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

RUN npm install -g npm
RUN npm install -g nodemon

ENTRYPOINT ["/opt/docker-bin/docker-entrypoint.sh"]
