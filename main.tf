Terraform
provider "aws" {
  region = var.aws_region
}

# Module for creating the VPC and networking resources
module "vpc" {
  source = "./modules/vpc"

  aws_region      = var.aws_region
  cluster_name    = var.cluster_name
  vpc_cidr_block  = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

# Module for creating all necessary IAM roles for the cluster and nodes
module "iam" {
  source = "./modules/iam"

  cluster_name = var.cluster_name
}

# Module for creating the EKS cluster and its node group
module "eks" {
  source = "./modules/eks"

  cluster_name              = var.cluster_name
  cluster_version           = var.cluster_version
  cluster_role_arn          = module.iam.eks_cluster_role_arn
  node_group_role_arn       = module.iam.node_group_role_arn
  private_subnet_ids        = module.vpc.private_subnet_ids
  node_group_desired        = var.node_group_desired
  node_group_min            = var.node_group_min
  node_group_max            = var.node_group_max
  node_group_instance_types = var.node_group_instance_types
  aws_region                = var.aws_region

  depends_on = [module.vpc, module.iam]
}