module "eks" {
  source  = "terraform-aws-modules/eks/aws" # Uses the AWS EKS module from Terraform Registry
  version = "19.19.1" # Specifies the module version

  cluster_name    = local.cluster_name # Defines the EKS cluster name
  cluster_version = "1.27" # Sets the Kubernetes version for the cluster

  vpc_id                         = module.vpc.vpc_id # References VPC ID for EKS cluster networking
  subnet_ids                     = module.vpc.private_subnets # Specifies private subnets for the cluster
  cluster_endpoint_public_access = true # Enables public access to the EKS API endpoint

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64" # Sets default Amazon Linux 2 AMI type for node groups
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1" # Defines the first managed node group

      instance_types = ["t3.small"] # Specifies instance type for the worker nodes

      min_size     = 1 # Minimum number of nodes in the group
      max_size     = 3 # Maximum number of nodes allowed
      desired_size = 2 # Desired number of nodes initially
    }

    two = {
      name = "node-group-2" # Defines the second managed node group

      instance_types = ["t3.small"] # Specifies instance type for this node group

      min_size     = 1 # Minimum number of nodes in the group
      max_size     = 2 # Maximum number of nodes allowed
      desired_size = 1 # Desired number of nodes initially
    }
  }
}


/*

Deploys an AWS EKS cluster with managed node groups for scalable Kubernetes workloads. 🚀 Let me know if you need further details!

*/


/*

This eks_managed_node_groups section in your Terraform code defines and configures AWS EKS managed node groups. Here's what it does:

Creates two managed node groups (node-group-1 & node-group-2) for the EKS cluster.

Assigns instance types (t3.small) to each node group.

Defines auto-scaling parameters:

min_size: Minimum number of nodes.

max_size: Maximum allowed nodes.

desired_size: Initial number of nodes when deployed.

These settings ensure that Kubernetes worker nodes are provisioned efficiently, automatically scaled, and optimized for workload demands within the EKS cluster. 🚀

Let me know if you need further details!

*/