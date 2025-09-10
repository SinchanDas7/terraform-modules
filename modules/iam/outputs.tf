Terraform

output "eks_cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster."
  value       = aws_iam_role.eks_cluster.arn
}

output "node_group_role_arn" {
  description = "The ARN of the IAM role for the EKS node group."
  value       = aws_iam_role.node_group.arn
}