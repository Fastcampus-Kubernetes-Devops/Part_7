resource "aws_ecr_repository" "github_actions_ecr" {
  name                 = "python-flask" # ECR 리포지토리 이름
  image_tag_mutability = "MUTABLE"
}
