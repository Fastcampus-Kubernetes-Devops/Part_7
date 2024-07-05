# # 최초 설치 시 포함하지 않는 것을 권고합니다.

# resource "aws_eks_addon" "aws_ebs_csi_driver" {
#   cluster_name             = module.eks.cluster_name
#   addon_name               = "aws-ebs-csi-driver"
#   service_account_role_arn = "arn:aws:iam::${var.secret_aws_account_id}:role/ebs-csi-${var.cluster_name}"
#   addon_version            = "v1.26.1-eksbuild.1" 
# }

# resource "aws_eks_addon" "aws_snapshot_controller" {
#   cluster_name             = module.eks.cluster_name
#   addon_name               = "snapshot-controller"
#   # addon_version            = "v1.26.1-eksbuild.1" # 지정하지 않으면 자동으로 default 버전을 설치합니다.
# }
