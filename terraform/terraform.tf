terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.25.0" # Specifies AWS provider version
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1" # Generates random values for resources
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4" # Handles TLS certificate creation and management
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2" # Enables cloud-init script execution for instances
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23.0" # Manages Kubernetes resources from Terraform
    }
  }

  backend "s3" {
    bucket = "vprofileaction1097" # Stores Terraform state remotely in an S3 bucket
    key    = "terraform.tfstate" # Defines the state file path in S3
    region = "us-east-2" # Specifies AWS region for the backend storage
  }

  required_version = "~> 1.12.0" # Ensures Terraform uses compatible version
}

##