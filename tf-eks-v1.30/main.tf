terraform {
  required_version = "~> 1.4"

  # 각자 TF 백엔드 설정으로 변경합니다.
  backend "s3" {
    bucket         = "jerry-test-tfstate"
    key            = "jerry-test.tfstate"
    region         = "ap-northeast-2"
    profile        = "jerry-test"
    dynamodb_table = "TerraformStateLock"
  }
}

provider "aws" {
  region  = local.region
  # 개인 Profile로 변경합니다. 
  # profile = "jerry-test"
}

data "aws_availability_zones" "available" {}

locals {
  name   = "jerry-test"
  region = "ap-northeast-2"

  vpc_cidr = "10.120.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    env  = "test"
    user = "jerry"
  }
}