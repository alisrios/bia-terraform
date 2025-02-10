terraform {
  backend "s3" {
    bucket = "terraform-bia"
    key    = "terraform.tfstate"
    region = "us-east-1"
    assume_role {
      role_arn = "arn:aws:iam::148761658767:role/TerraformAssumeRole"
    }
  }
}