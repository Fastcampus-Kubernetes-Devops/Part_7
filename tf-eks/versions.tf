terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.57"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10"
    }
  }

  backend "s3" {
    bucket         = "jerry-test-tfstate"
    key            = "eks/jerry-dev.tfstate"
    region         = "ap-northeast-2"
    profile        = "jerry-test"
    dynamodb_table = "TerraformStateLock"
  }
}