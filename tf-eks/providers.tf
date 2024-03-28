provider "aws" {
  region = local.region
  # shared_config_files=["~/.aws/config"] # Or $HOME/.aws/config
  # shared_credentials_files = ["~/.aws/credentials"] # Or $HOME/.aws/credentials
  profile = "jerry-test"

  # 자동으로 공통 태그를 추가해주는 기능
  default_tags {
    tags = {
      Service      = "SNS-Test"
      Organization = "tech"
      Team         = "tech/devops"
      Resource     = "eks"
      Env          = "test"
      Terraformed  = "true"
    }
  }
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

locals {
  name            = "jerry-dev"
  cluster_version = "1.28"  # EKS 업그레이드 시 1.28 to 1.29 변경
  region          = "ap-northeast-2"

  vpc_cidr = "10.120.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    User = "jerry"
  }
}
