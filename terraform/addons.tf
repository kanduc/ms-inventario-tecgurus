resource "aws_eks_addon" "ebs_csi" {

  cluster_name = "inventario-eks"

  addon_name = "aws-ebs-csi-driver"

}