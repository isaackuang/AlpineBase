FROM alpine:3.13

## Install S6-Overlay
RUN apk update && apk upgrade && \
    apk add --no-cache curl tzdata procps htop && \
    cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
    cd /tmp && \
    wget -O s6-overlay-installer https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-`uname -m`-installer && \
    chmod +x s6-overlay-installer && \
    ./s6-overlay-installer /

ENTRYPOINT ["/init"]

COPY config /
