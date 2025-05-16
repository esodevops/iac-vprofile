/*
Purpose: Specifies the AWS region where the resources will be deployed.

Default Value: us-east-2 (Ohio region). If no custom value is provided, Terraform will use this region.

Usage: Ensures flexibility, allowing deployments to different AWS regions based on user input.

*/

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

/*

Purpose: Defines the name of the Kubernetes cluster created with AWS Elastic Kubernetes Service (EKS).

Default Value: "kitops-eks", but it can be customized per environment.

Usage: Helps uniquely identify the EKS cluster within AWS for managing containerized applications.

*/

variable "clusterName" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "kitops-eks"
}
