#!/usr/bin/env bash

set -e

source x.sh

# $1 is arch, $2 is source code path
case $1 in
linux-amd64)
  print_blue "Compile for linux/amd64"
  # docker pull golang:1.13
  docker run -t \
    -v $2/../sidecar:/code/sidecar \
    -v $2:/code/sidecar-client-fabric \
    -v ~/.ssh:/root/.ssh \
    -v ~/.gitconfig:/root/.gitconfig \
    -v $GOPATH/pkg/mod:$GOPATH/pkg/mod \
    pier-ubuntu/compile \
    /bin/bash -c "go env -w GO111MODULE=on &&
      go env -w GOPROXY=https://goproxy.cn,direct &&
      cd /code/sidecar-client-fabric &&
      make fabric1.4 &&
      mv /code/sidecar-client-fabric/build/fabric-client-1.4.so /code/sidecar-client-fabric/build/fabric-client-1.4-linux.so"
  ;;
*)
  print_red "Other architectures are not supported yet"
  ;;
esac
