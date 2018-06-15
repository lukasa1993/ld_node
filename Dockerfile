FROM node:10-alpine

MAINTAINER LD

RUN mkdir -p /opt/docker-bin

ADD docker-entrypoint.sh /opt/docker-bin

USER root

RUN rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
     /root/.npm /root/.node-gyp /usr/lib/node_modules/npm/man \
     /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html


RUN adduser -s /bin/false -D appuser \
    && chown -R appuser /opt/app

USER appuser

ENV HOME_DIR=/opt/app


ENTRYPOINT ["/opt/docker-bin/docker-entrypoint.sh"]

CMD ["npm start"]
