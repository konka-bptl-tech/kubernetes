#!/bin/bash

CLUSTER_NAME="karpenter"
REGION="ap-south-1"
NODEGROUP_NAME="ng1"
NODE_TYPE="t3a.medium"
NODES=1
NODES_MIN=1
NODES_MAX=1
NODE_VOLUME_SIZE=20
SSH_PUBLIC_KEY="siva"


echo "Creating nodegroup..."
eksctl create nodegroup --cluster=$CLUSTER_NAME \
                       --region=$REGION \
                       --name=$NODEGROUP_NAME \
                       --node-type=$NODE_TYPE \
                       --nodes=$NODES \
                       --nodes-min=$NODES_MIN \
                       --nodes-max=$NODES_MAX \
                       --node-volume-size=$NODE_VOLUME_SIZE \
                       --ssh-access \
                       --ssh-public-key=$SSH_PUBLIC_KEY \
                       --managed
# --spot
