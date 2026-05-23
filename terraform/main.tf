module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "inventario-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.35"

  cluster_endpoint_public_access = true

  enable_irsa = true

  eks_managed_node_groups = {
    workers = {
      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 4
      desired_size = 2

      disk_size = 20
    }
  }

  cluster_addons = {
    aws-ebs-csi-driver = {}
  }

  tags = {
    Environment = "dev"
    Project     = "inventario-app"
  }
}