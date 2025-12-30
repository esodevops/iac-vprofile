module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.19.1"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}

/*
=== EKS-CLUSTER.TF FILE EXPLANATION ===

Ye file AWS EKS (Elastic Kubernetes Service) cluster create karti hai jo containerized applications run karne ke liye use hoti hai.

Kya kaam karta hai:
1. EKS Module: Terraform AWS EKS module version 19.19.1 use karta hai - ye pre-built module hai jo EKS setup ko simplify karta hai
2. Cluster Configuration:
   - Cluster Name: local.cluster_name se name leta hai (variables.tf se)
   - Kubernetes Version: 1.27 use karta hai
   - VPC Integration: VPC module se VPC ID aur private subnets use karta hai
   - Public Access: Cluster API server publicly accessible hai (kubectl commands ke liye)

3. Node Groups (Worker Nodes):
   - Default AMI: Amazon Linux 2 x86_64 architecture use karta hai
   - Do node groups banata hai load distribution ke liye:
   
   Node Group 1 ("one"):
   - Instance Type: t3.small (2 vCPU, 2GB RAM)
   - Scaling: Min 1, Max 3, Desired 2 nodes
   - Primary workload ke liye use hota hai
   
   Node Group 2 ("two"):
   - Instance Type: t3.small (2 vCPU, 2GB RAM) 
   - Scaling: Min 1, Max 2, Desired 1 node
   - Secondary/backup workload ke liye use hota hai

Kyun zaroori hai:
- EKS managed Kubernetes control plane provide karta hai
- AWS automatically master nodes ko manage karta hai
- Auto-scaling capabilities provide karta hai
- Private subnets me worker nodes deploy hote hain security ke liye
- Multiple node groups load balancing aur fault tolerance provide karte hain
- t3.small instances cost-effective hain development/testing ke liye

Node Groups ka purpose:
- Kubernetes pods yahan run hote hain
- Auto-scaling traffic ke according nodes add/remove karta hai
- Multiple groups different workloads ko isolate karne ke liye use hote hain
*/
