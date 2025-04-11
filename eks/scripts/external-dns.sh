#!/bin/bash

EKS_CLUSTER_NAME="karpenter"
POLICY_ARN="arn:aws:iam::522814728660:policy/ExternalDNSPolicy"


echo "Create OIDC for External DNS"
eksctl create iamserviceaccount \
  --cluster $EKS_CLUSTER_NAME \
  --name "external-dns" \
  --namespace kube-system \
  --attach-policy-arn $POLICY_ARN \
  --approve

echo "Add external DNS helm chart"
helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/

echo "Installing DNS helm chart"
helm upgrade --install external-dns external-dns/external-dns --namespace kube-system

