output "cluster_name" {
  description = "Amazon Web Service EKS Cluster Name"
  value       = module.eks.cluster_name # Outputs the EKS cluster name
}

output "cluster_endpoint" {
  description = "Endpoint for Amazon Web Service EKS"
  value       = module.eks.cluster_endpoint # Provides the API endpoint for Kubernetes access
}

output "region" {
  description = "Amazon Web Service EKS Cluster region"
  value       = var.region # Displays the AWS region where the EKS cluster is deployed
}

output "cluster_security_group_id" {
  description = "Security group ID for the Amazon Web Service EKS Cluster"
  value       = module.eks.cluster_security_group_id # Outputs the security group ID for network access control
}

#