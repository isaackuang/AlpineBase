FROM alpine:3.13

ENV S6_OVERLAY_VERSION="3.1.1.2"

## Install Packages
RUN apk update && apk upgrade && \
    apk add --no-cache curl tzdata procps htop ncdu && \
    cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
    cd /tmp && \
    wget https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    wget https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-$(uname -m).tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-$(uname -m).tar.xz && \
    rm -rf /tmp/s6-overlay*

ENTRYPOINT ["/init"]

COPY config /
