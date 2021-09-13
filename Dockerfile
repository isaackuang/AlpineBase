FROM alpine:3.13

ADD add-s6-overlay.sh /tmp/add-s6-overlay.sh

## Install Packages
RUN apk update && apk upgrade && \
    apk add --no-cache curl tzdata procps htop && \
    cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
    cd /tmp && \
    sh add-s6-overlay.sh

ENTRYPOINT ["/init"]

COPY config /
