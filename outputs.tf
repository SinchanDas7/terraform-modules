Terraform

output "cluster_endpoint" {
  description = "EKS cluster endpoint (private)."
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Certificate authority data for the EKS cluster."
  value       = module.eks.cluster_certificate_authority_data
}

output "cluster_security_group_id" {
  description = "The security group ID attached to the EKS cluster."
  value       = module.eks.cluster_security_group_id
}

output "kubeconfig_filename" {
  description = "The filename of the generated kubeconfig."
  value       = module.eks.kubeconfig_filename
}