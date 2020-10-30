#!/bin/sh
OLM_VERSION=0.16.1
NAMESPACE=infinispan

kind create cluster
kubectl cluster-info --context kind-kind
./olm-install.sh ${OLM_VERSION}

kubectl create namespace ${NAMESPACE}

