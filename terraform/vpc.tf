module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "vprofile-eks"

  cidr = "172.20.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]
  public_subnets  = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

/*
=== VPC.TF FILE EXPLANATION ===

Ye file AWS VPC (Virtual Private Cloud) create karti hai jo EKS cluster ke liye networking foundation provide karti hai.

Kya kaam karta hai:
1. VPC Module: Terraform AWS VPC module use karta hai version 5.1.2 - ye pre-built module hai jo VPC setup ko easy banata hai
2. Network Range: 172.20.0.0/16 CIDR block use karta hai jo 65,536 IP addresses provide karta hai
3. Availability Zones: 3 AZs me resources spread karta hai high availability ke liye
4. Subnets:
   - Private Subnets (172.20.1-3.0/24): EKS worker nodes yahan deploy hote hain, direct internet access nahi
   - Public Subnets (172.20.4-6.0/24): Load balancers aur NAT gateway yahan deploy hote hain
5. NAT Gateway: Private subnets ko internet access deta hai (outbound traffic ke liye)
6. Single NAT Gateway: Cost optimization ke liye sirf ek NAT gateway use karta hai
7. DNS Hostnames: EC2 instances ko DNS names milte hain

Tags ka purpose:
EKS ko batana ki kaunse subnets kis type ke Load Balancer ke liye use karne hain (public LB ke liye public subnets, internal LB ke liye private subnets).
- Public subnet tags: AWS Load Balancer Controller ko batate hain ki yahan external load balancers deploy kar sakte hain
- Private subnet tags: Internal load balancers ke liye use hote hain
- Kubernetes cluster tags: EKS service ko identify karne me help karte hain

Kyun zaroori hai:
- EKS cluster ko secure networking environment chahiye
- Worker nodes private subnets me safe rehte hain
- Load balancers public subnets me internet traffic handle karte hain
- Multi-AZ setup high availability ensure karta hai
*/
