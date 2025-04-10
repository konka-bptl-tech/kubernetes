#!/bin/bash


CLUSTER_NAME="karpenter"
REGION="ap-south-1"
ZONES="ap-south-1a,ap-south-1b"



# echo "Creating EKS cluster..."
# eksctl create cluster --name $CLUSTER_NAME \
#                       --region $REGION \
#                       --zones $ZONES \
#                       --without-nodegroup

echo "Associating IAM OIDC provider..."
eksctl utils associate-iam-oidc-provider \
    --region $REGION \
    --cluster $CLUSTER_NAME \
    --approve
