provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = var.clusterName
}

/*
=== MAIN.TF FILE EXPLANATION ===

Ye file main providers aur data sources configure karti hai jo other resources use karte hain.

Kya kaam karta hai:
1. Kubernetes Provider:
   - EKS cluster ke saath communicate karne ke liye use hota hai
   - Host: EKS cluster ka endpoint URL
   - Certificate: Cluster ki CA certificate authentication ke liye
   - Ye provider kubectl commands aur Kubernetes resources manage karta hai

2. AWS Provider:
   - AWS services ke saath interact karne ke liye main provider
   - Region: variables.tf se region value leta hai (default: us-east-2)
   - Ye provider VPC, EKS, EC2 etc. sab AWS resources create karta hai

3. Data Source - Availability Zones:
   - Current region ke available AZs ki list fetch karta hai
   - VPC module isme se first 3 AZs select karta hai
   - Dynamic approach hai - region change karne par automatically adjust ho jata hai

4. Locals Block:
   - Local variables define karta hai
   - cluster_name: variables.tf se clusterName variable ka value use karta hai
   - Code me reusability aur consistency ke liye use hota hai

Kyun zaroori hai:
- Providers Terraform ko batate hain ki kaunse APIs use karne hain
- Data sources runtime me information fetch karte hain
- Locals code duplication avoid karte hain
- Authentication aur configuration centralized rehti hai
- EKS cluster ke saath secure communication establish karta hai

Flow:
1. AWS provider AWS resources create karta hai
2. EKS cluster ready hone ke baad Kubernetes provider activate hota hai
3. Data sources dynamic information provide karte hain
4. Locals consistent naming ensure karte hain
*/