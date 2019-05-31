FROM alpine

ENV RPC_SECRET=secret
ENV DOMAIN=0.0.0.0:80
ENV PUID=0
ENV PGID=0

RUN apk update \
    && apk add --no-cache --update aria2 su-exec

WORKDIR /aria2

COPY conf ./conf-copy
COPY aria2c.sh ./

RUN chmod +x aria2c.sh

# User downloaded files
VOLUME /aria2/data
VOLUME /aria2/conf

EXPOSE 6800

CMD ["/bin/sh", "./aria2c.sh" ]