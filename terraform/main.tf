provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = var.cluster_name
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = local.cluster_name
  cidr = "172.20.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets = [
    "172.20.1.0/24",
    "172.20.2.0/24",
    "172.20.3.0/24"
  ]

  public_subnets = [
    "172.20.4.0/24",
    "172.20.5.0/24",
    "172.20.6.0/24"
  ]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.29"

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      desired_size   = 2
      max_size       = 3
      min_size       = 1
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
