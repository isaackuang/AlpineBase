FROM alpine:3.11

## Install S6-Overlay
RUN apk update && apk upgrade && \
    apk add --no-cache curl tzdata procps htop && \
    cp /usr/share/zoneinfo/UTC /etc/localtime && \
    curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v2.0.0.1/s6-overlay-amd64.tar.gz \
    | tar xvzf - -C /

ENTRYPOINT ["/init"]

COPY config /
