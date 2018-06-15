FROM node:10-alpine

MAINTAINER LD

USER root

RUN mkdir -p /opt/docker-bin

ADD docker-entrypoint.sh /opt/docker-bin/

RUN chmod +x /opt/docker-bin/docker-entrypoint.sh

RUN rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
     /root/.npm /root/.node-gyp /usr/lib/node_modules/npm/man \
     /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html


RUN adduser -s /bin/false -D appuser \
    && mkdir -p /opt/app && chown -R appuser /opt/app

USER appuser

ENV HOME_DIR=/opt/app


ENTRYPOINT ["/opt/docker-bin/docker-entrypoint.sh"]

CMD ["npm start"]
