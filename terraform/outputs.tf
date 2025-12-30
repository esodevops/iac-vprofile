output "cluster_name" {
  description = "Amazon Web Service EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint for Amazon Web Service EKS "
  value       = module.eks.cluster_endpoint
}

output "region" {
  description = "Amazon Web Service EKS Cluster region"
  value       = var.region
}


output "cluster_security_group_id" {
  description = "Security group ID for the Amazon Web Service EKS Cluster "
  value       = module.eks.cluster_security_group_id
}

/*
=== OUTPUTS.TF FILE EXPLANATION ===

Ye file output values define karti hai jo Terraform apply ke baad important information display karti hai.

Kya kaam karta hai:
1. Cluster Name Output:
   - EKS cluster ka actual name return karta hai
   - Value: module.eks.cluster_name se aata hai
   - Usage: kubectl commands me cluster name reference karne ke liye

2. Cluster Endpoint Output:
   - EKS cluster ka API server endpoint URL
   - Value: module.eks.cluster_endpoint se aata hai  
   - Usage: kubectl configuration me server URL ke liye
   - Format: https://XXXXXXXXXX.gr7.us-east-2.eks.amazonaws.com

3. Region Output:
   - Current AWS region display karta hai
   - Value: variables.tf se region variable ka value
   - Usage: Confirmation ke liye ki resources kahan deploy hue hain

4. Security Group ID Output:
   - EKS cluster ka security group ID
   - Value: module.eks.cluster_security_group_id se aata hai
   - Usage: Additional security rules add karne ke liye reference

Output Structure:
- Description: Output ka purpose explain karta hai
- Value: Actual value jo display karni hai
- Sensitive: (optional) Sensitive information hide karne ke liye

Kyun zaroori hai:
- Post-Deployment Information: Apply ke baad important details milti hain
- Integration: Other tools/scripts me ye values use kar sakte hain
- Documentation: Infrastructure ki key details readily available hoti hain
- Automation: CI/CD pipelines me ye outputs use kar sakte hain
- Troubleshooting: Debug karne me helpful information milti hai

Usage Examples:
- terraform output cluster_name
- terraform output -json (JSON format me sab outputs)
- Other Terraform configurations me remote state se access kar sakte hain

Practical Use Cases:
- kubectl config set-cluster me endpoint use karna
- AWS CLI commands me cluster name reference karna
- Monitoring tools me cluster details configure karna
- Security group rules add karne ke liye SG ID use karna
*/
