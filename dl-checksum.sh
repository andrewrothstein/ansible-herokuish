#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/gliderlabs/herokuish/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="${os}_${arch}"
    local file=herokuish_${ver}_${platform}.tgz
    local url=$MIRROR/v$ver/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    ver=$1
    printf "  '%s':\n" $ver
    dl $ver darwin x86_64
    dl $ver linux x86_64
}

dl_ver ${1:-0.7.2}
