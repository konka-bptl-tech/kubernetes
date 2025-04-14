#!/bin/bash

CLUSTER_NAME="karpenter"
INGRESS_ARN="arn:aws:iam::522814728660:policy/AWSLoadBalancerControllerIAMPolicy"
echo "Creating Service Account"
eksctl create iamserviceaccount \
    --cluster=$CLUSTER_NAME \
    --namespace=kube-system \
    --name=aws-load-balancer-controller \
    --attach-policy-arn=$INGRESS_ARN \
    --approve
echo "Add alb ingress controller helm chart"
helm repo add eks https://aws.github.io/eks-charts

echo "Install ALB ingress controller helm chart"
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
    --set clusterName=$CLUSTER_NAME -n kube-system \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-load-balancer-controller

