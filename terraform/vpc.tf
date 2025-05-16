module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"  # Using an AWS VPC module from Terraform Registry
  version = "5.1.2"  # Defining the module version for consistency

  name = "vprofile-eks"  # Name of the VPC

  cidr = "172.20.0.0/16"  # Setting the CIDR range for the VPC
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)  # Selecting the first 3 availability zones dynamically

  # Defining private subnets (used for backend services)
  private_subnets = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]

  # Defining public subnets (used for internet-facing services)
  public_subnets  = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"]

  enable_nat_gateway   = true  # Enables NAT gateway for private subnets to access the internet
  single_nat_gateway   = true  # Uses a single NAT gateway to reduce cost
  enable_dns_hostnames = true  # Allows instances to use DNS hostnames

  # Tags for Kubernetes integration (for public subnets)
  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"  # Links subnet to the Kubernetes cluster
    "kubernetes.io/role/elb"                      = 1  # Marks subnet for public Load Balancers
  }

  # Tags for Kubernetes integration (for private subnets)
  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"  # Links subnet to the Kubernetes cluster
    "kubernetes.io/role/internal-elb"             = 1  # Marks subnet for internal Load Balancers
  }
}
