#!/bin/bash

EKS_CLUSTER_NAME="karpenter"
POLICY_ARN="arn:aws:iam::522814728660:policy/ExternalDNSPolicy"

echo "Creating Service Account"
eksctl create iamserviceaccount \
      --cluster=$EKS_CLUSTER_NAME \
      --namespace=kube-system \
      --name=external-dns \
      --attach-policy-arn=$POLICY_ARN \
      --approve

echo "Add external DNS helm chart"
helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/

echo "Install DNS COntroller"
helm install external-dns external-dns/external-dns \
    --set serviceAccount.create=false \
    --set serviceAccount.name=external-dns \
    -n kube-system






