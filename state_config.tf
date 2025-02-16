terraform {
  backend "s3" {
    bucket = "terraform-bia"
    key    = "terraform.tfstate"
    region = "us-east-1"    
  }
}