#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/kubernetes-sigs/kind/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="${os}-${arch}"
    local lfile=${DIR}/kind-${platform}-${ver}
    local url=$MIRROR/$ver/kind-${platform}

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver darwin amd64
    dl $ver darwin arm64
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver windows amd64
}

dl_ver ${1:-v0.24.0}
