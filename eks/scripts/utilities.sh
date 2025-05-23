#!/bin/bash
echo "Metrics Server installation"
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

echo "EBS-CSI Drivers installation"
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.41"

echo "Creating SC"
kubectl apply -f ../../volumes/

echo "create ns"
for ns in expense instana; do
  kubectl create namespace $ns
done
