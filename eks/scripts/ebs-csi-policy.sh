#!/bin/bash
EBS_CSI_POLICY_ARN="arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
ECR_ARN="arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
package_installation "Verifying Node Role existence..."
NODE_ROLE=$(aws iam list-roles --query "Roles[?contains(RoleName, 'eksctl-karpenter-nodegroup-ng1-NodeInstanceRole')].RoleName" --output text)

if [ -z "$NODE_ROLE" ] || [ "$NODE_ROLE" == "None" ]; then
    print_message "No IAM role found matching the pattern. Exiting."
    exit 1
else
    print_message "Node Role found: $NODE_ROLE. Attaching policy..."
    aws iam attach-role-policy --role-name "$NODE_ROLE" --policy-arn "$EBS_CSI_POLICY_ARN" || { print_message "Failed to attach policy"; exit 1; }
    aws iam attach-role-policy --role-name "$NODE_ROLE" --policy-arn "$ECR_ARN" || { print_message "Failed to attach policy"; exit 1; }
    print_message "Policys attached successfully."
fi