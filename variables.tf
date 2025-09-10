Terraform

variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "The name for the EKS cluster."
  type        = string
  default     = "private-eks-cluster"
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.29"
}

variable "node_group_desired" {
  description = "Desired number of worker nodes."
  type        = number
  default     = 2
}

variable "node_group_min" {
  description = "Minimum number of worker nodes."
  type        = number
  default     = 1
}

variable "node_group_max" {
  description = "Maximum number of worker nodes."
  type        = number
  default     = 3
}

variable "node_group_instance_types" {
  description = "Instance types for the worker nodes."
  type        = list(string)
  default     = ["t3.medium"]
}