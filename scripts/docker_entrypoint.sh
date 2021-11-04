#!/usr/bin/env sh
set -e

APPCHAIN_NAME=$1

sidecar --repo=/root/.sidecar appchain register --name=${APPCHAIN_NAME} --type=fabric --validators=/root/.sidecar/fabric/fabric.validators --desc="appchain for test" --version=1.4.3
sidecar --repo=/root/.sidecar rule deploy --path=/root/.sidecar/validating.wasm
sidecar --repo=/root/.sidecar start