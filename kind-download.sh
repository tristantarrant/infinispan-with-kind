#!/bin/sh
OS=linux
ARCH=amd64
KIND_VERSION=0.9.0
KUBE_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
PREFIX=/usr/local
BINDIR=${PREFIX}/bin
TMPDIR=$(mktemp -d -t kind-XXXXXXXXX)

curl -Lo ${TMPDIR}/kubectl "https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/${OS}/${ARCH}/kubectl"
chmod +x ${TMPDIR}/kubectl

curl -Lo ${TMPDIR}/kind "https://kind.sigs.k8s.io/dl/v${KIND_VERSION}/kind-${OS}-${ARCH}"	
chmod +x ${TMPDIR}/kind

sudo mv ${TMPDIR}/kind ${TMPDIR}/kubectl ${BINDIR}

rm -rf ${TMPDIR}

