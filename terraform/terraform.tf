terraform {            # This is the main configuration for Terraform itself.
  required_providers { #  Declares which providers (plugins) Terraform will use and their versions.
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.25.0"
    }

    random = { # Creates the random values for resources
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }

    tls = {                     # Two end points ke bich me secure communication ke liye use karte h
      source  = "hashicorp/tls" # Example - iss code me terraform or s3 bucket ke secure communication me use kiya hoga
      version = "~> 4.0.4"
    }

    cloudinit = { # Like EC2 vm's jab start hote h to kon kon se packages ya other resources uske ander install karna h user_data ki help se.
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23.0"
    }
  }

  backend "s3" { # This is the S3 bucket that Terraform will use to store its state
    bucket = "adarsh-gitops"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }

  required_version = ">= 1.0"
}
# comment
#######

/*
=== TERRAFORM.TF FILE EXPLANATION ===

Ye file Terraform ki core configuration define karti hai - providers, backend, aur version requirements.

Kya kaam karta hai:
1. Required Providers:
   - AWS Provider (~> 5.25.0): AWS resources create/manage karne ke liye
   - Random Provider (~> 3.5.1): Random values generate karne ke liye (passwords, IDs etc.)
   - TLS Provider (~> 4.0.4): SSL/TLS certificates aur keys generate karne ke liye
   - Cloudinit Provider (~> 2.3.2): EC2 instances ki initialization scripts ke liye
   - Kubernetes Provider (~> 2.23.0): Kubernetes resources manage karne ke liye

2. Backend Configuration (S3):
   - State File Storage: "vprofileactions23" S3 bucket me terraform.tfstate file store karta hai
   - Region: us-east-2 me bucket located hai
   - Remote State: Team collaboration ke liye centralized state management
   - State Locking: Concurrent modifications prevent karta hai

3. Terraform Version:
   - Required Version: ~> 1.6.3 (1.6.3 se compatible versions)
   - Version consistency ensure karta hai across team members

Provider Versions ka purpose:
- "~>" symbol: Compatible versions allow karta hai (patch updates)
- Version locking: Breaking changes se protect karta hai
- Reproducible deployments ensure karta hai

Backend ka importance:
- State file local machine par nahi, S3 me store hoti hai
- Multiple developers same state access kar sakte hain
- State corruption se protect karta hai
- Backup aur versioning automatic hai

Kyun zaroori hai:
- Provider versions stability ensure karte hain
- Remote backend team collaboration enable karta hai
- State management centralized aur secure hoti hai
- Infrastructure changes track karne me help karta hai
- Rollback capabilities provide karta hai
*/
