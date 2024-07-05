# # 최초 설치 시 포함하지 않는 것을 권고합니다.
# # 아래 TF 변수(ex var.cluster_name, var.secret_hosted_zone_id)를 각자 설정으로 대체합니다.

# # 혹은 아래와 같이 TF 변수를 설정합니다. 
# # export TF_VAR_secret_hosted_zone_id="xxxx"
# # export TF_VAR_secret_aws_account_id="xxxx"
# # export TF_VAR_cluster_name="xxxx"

# module "load_balancer_controller_irsa_role" {
#   source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

#   role_name                              = "load-balancer-controller-${var.cluster_name}"
#   attach_load_balancer_controller_policy = true

#   oidc_providers = {
#     ex = {
#       provider_arn               = module.eks.oidc_provider_arn
#       namespace_service_accounts = ["kube-system:aws-load-balancer-controller"]
#     }
#   }

#   tags = local.tags
# }

# module "external_dns_irsa_role" {
#   source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

#   role_name                     = "external-dns-${var.cluster_name}"
#   attach_external_dns_policy    = true
#   external_dns_hosted_zone_arns = ["arn:aws:route53:::hostedzone/${var.secret_hosted_zone_id}"]

#   oidc_providers = {
#     ex = {
#       provider_arn               = module.eks.oidc_provider_arn
#       namespace_service_accounts = ["kube-system:external-dns"]
#     }
#   }

#   tags = local.tags
# }

# module "ebs_csi_irsa_role" {
#   source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

#   role_name             = "ebs-csi-${var.cluster_name}"
#   attach_ebs_csi_policy = true

#   oidc_providers = {
#     ex = {
#       provider_arn               = module.eks.oidc_provider_arn
#       namespace_service_accounts = ["kube-system:ebs-csi-controller-sa"]
#     }
#   }

#   tags = local.tags
# }