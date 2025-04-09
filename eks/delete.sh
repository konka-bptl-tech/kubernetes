#!/bin/bash


CLUSTER_NAME="karpenter"
PROFILE="eks"

echo "Deleting EKS cluster..."
eksctl delete cluster --name=$CLUSTER_NAME --profile=$PROFILE