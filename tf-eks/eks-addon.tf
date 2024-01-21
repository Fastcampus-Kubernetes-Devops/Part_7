resource "aws_eks_addon" "aws_ebs_csi_driver" {
  cluster_name             = module.eks.cluster_name
  addon_name               = "aws-ebs-csi-driver"
  service_account_role_arn = "arn:aws:iam::${var.secret_aws_account_id}:role/ebs-csi-${var.cluster_name}"
  addon_version            = "v1.26.1-eksbuild.1"
}
