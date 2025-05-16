provider "kubernetes" {
  host                   = module.eks.cluster_endpoint # Connects to the EKS cluster endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data) # Decodes the cluster CA certificate for secure communication
}

provider "aws" {
  region = var.region # Specifies AWS region for resource provisioning
}

data "aws_availability_zones" "available" {} # Fetches available AWS availability zones dynamically

locals {
  cluster_name = var.clusterName # Defines the local variable for the EKS cluster name
}

/*

This Terraform configuration sets up the required providers and resources for deploying and managing an AWS EKS (Elastic Kubernetes Service) cluster. Here’s the purpose of each section:

Kubernetes Provider: Connects to the EKS cluster using its endpoint and certificate for managing Kubernetes resources.

AWS Provider: Specifies the AWS region where infrastructure resources will be provisioned.

AWS Availability Zones Data Source: Fetches available AWS availability zones dynamically to optimize resource placement.

Locals Block: Defines a local variable cluster_name that holds the name of the EKS cluster, improving modularity and reusability.

Overall, this code is part of a Terraform-based infrastructure-as-code setup to streamline AWS Kubernetes deployments efficiently. Let me know if you need further details or modifications! 🚀

*/