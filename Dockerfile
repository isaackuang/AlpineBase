FROM alpine:3.8

## Install S6-Overlay
RUN apk update && apk upgrade && \
    apk add --no-cache curl tzdata procps htop && \
    cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
    curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.21.7.0/s6-overlay-amd64.tar.gz \
    | tar xvzf - -C /


ENTRYPOINT ["/init"]

COPY config /
