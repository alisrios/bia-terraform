terraform {
  backend "s3" {
    bucket         = "terraform-bia"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    use_lockfile = true       
  }
}