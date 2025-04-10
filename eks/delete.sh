#!/bin/bash


CLUSTER_NAME="karpenter"

echo "Deleting EKS cluster..."
eksctl delete cluster --name=$CLUSTER_NAME