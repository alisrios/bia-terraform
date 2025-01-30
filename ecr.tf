resource "aws_ecr_repository" "bia" {
  name                 = "bia"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}