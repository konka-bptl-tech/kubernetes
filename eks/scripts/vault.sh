#!/bin/bash

echo "Add HV helm repo"
helm repo add external-secrets https://charts.external-secrets.io

echo "install hv"
helm install external-secrets \
   external-secrets/external-secrets \
    -n kube-system

echo "Install ClusterSecretStore"
kubectl apply -f ss.yaml  