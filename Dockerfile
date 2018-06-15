FROM node:10-alpine

MAINTAINER LD

RUN mkdir -p /opt/docker-bin && mkdir -p /opt/app

ADD docker-entrypoint.sh /opt/docker-bin/

RUN chmod +x /opt/docker-bin/docker-entrypoint.sh

RUN rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
     /root/.npm /root/.node-gyp /usr/lib/node_modules/npm/man \
     /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

ENV HOME_DIR=/opt/app


ENTRYPOINT ["/opt/docker-bin/docker-entrypoint.sh"]

CMD ["cd /opt/app && npm start"]
