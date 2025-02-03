resource "aws_ecr_repository" "bia_tf" {
  name                 = "bia-tf"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}