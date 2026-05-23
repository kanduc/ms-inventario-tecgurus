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