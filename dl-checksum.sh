#!/usr/bin/env sh
VER='0.5.1'
DIR=~/Downloads
MIRROR=https://github.com/gliderlabs/herokuish/releases/download/v${VER}

dl()
{
    OS=$1
    PLATFORM=$2
    FILE=herokuish_${VER}_${OS}_${PLATFORM}.tgz
    URL=$MIRROR/$FILE
    LFILE=$DIR/$FILE

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s_%s: sha256:%s\n" $OS $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl darwin x86_64
dl linux x86_64



