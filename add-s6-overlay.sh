#!/bin/sh

arch=`uname -m`
version="v2.2.0.3"

echo "Current Arch is ${arch}"

#get installer
case $arch in
    'x86_64' )
    wget -O s6-overlay-installer https://github.com/just-containers/s6-overlay/releases/download/${version}/s6-overlay-amd64-installer
    ;;
    'aarch64' )
    wget -O s6-overlay-installer https://github.com/just-containers/s6-overlay/releases/download/${version}/s6-overlay-aarch64-installer
    *)
    echo "Arch Unknow"
    exit 1
    ;;
esac

chmod +x s6-overlay-installer
./s6-overlay-installer /

rm -rf s6-overlay-installer