Terraform

variable "aws_region" {
  description = "AWS region for the VPC."
  type        = string
}

variable "cluster_name" {
  description = "Name of the cluster, used for tagging resources."
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks."
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks."
  type        = list(string)
}