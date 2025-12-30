variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "clusterName" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "vprofile-eks"
}

/*
=== VARIABLES.TF FILE EXPLANATION ===

Ye file input variables define karti hai jo configuration ko flexible aur reusable banate hain.

Kya kaam karta hai:
1. Region Variable:
   - Name: "region"
   - Type: string
   - Default: "us-east-2" (Ohio region)
   - Purpose: AWS resources kaunse region me deploy karne hain ye specify karta hai
   - Usage: main.tf me AWS provider configuration me use hota hai

2. Cluster Name Variable:
   - Name: "clusterName"
   - Type: string  
   - Default: "vprofile-eks"
   - Purpose: EKS cluster ka naam define karta hai
   - Usage: main.tf me locals block me use hota hai, phir EKS module me pass hota hai

Variable Structure:
- Description: Variable ka purpose explain karta hai
- Type: Data type specify karta hai (string, number, bool, list, map)
- Default: Agar value provide nahi ki to ye value use hogi

Kyun zaroori hai:
- Code Reusability: Same code different environments me use kar sakte hain
- Flexibility: Runtime me values change kar sakte hain
- Environment Specific: Dev, staging, prod ke liye different values use kar sakte hain
- Centralized Configuration: Sab configurable values ek jagah hain
- Documentation: Description se clear hota hai variable ka purpose

Usage Examples:
- terraform apply -var="region=us-west-2"
- terraform apply -var="clusterName=production-eks"
- terraform.tfvars file me values define kar sakte hain

Best Practices:
- Descriptive names use karne chahiye
- Default values provide karne chahiye
- Type constraints define karne chahiye
- Sensitive variables ko sensitive = true mark karna chahiye
*/
