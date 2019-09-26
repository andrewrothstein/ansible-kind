#!/usr/bin/env sh
VER=v0.5.1
DIR=~/Downloads
MIRROR=https://github.com/kubernetes-sigs/kind/releases/download/${VER}

dl()
{
    local os=$1
    local arch=$2
    local platform=${os}-${arch}
    local lfile=${DIR}/kind-${platform}-${VER}
    local url=$MIRROR/kind-${platform}

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

printf "  %s:\n" $VER
dl darwin amd64
dl linux amd64
dl linux arm
dl linux arm64
dl linux ppc64le
dl windows amd64
