#!/bin/bash
EBS_CSI_POLICY_ARN="arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
echo  "Verifying Node Role existence..."
NODE_ROLE=$(aws iam list-roles --query "Roles[?contains(RoleName, 'eksctl-karpenter-nodegroup-ng1-NodeInstanceRole')].RoleName" --output text)

if [ -z "$NODE_ROLE" ] || [ "$NODE_ROLE" == "None" ]; then
    echo "No IAM role found matching the pattern. Exiting."
    exit 1
else
    echo "Node Role found: $NODE_ROLE. Attaching policy..."
    aws iam attach-role-policy --role-name "$NODE_ROLE" --policy-arn "$EBS_CSI_POLICY_ARN" || { echo "Failed to attach policy"; exit 1; }
    echo "Policys attached successfully."
fi