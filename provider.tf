terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
    region  = "us-east-1"
    profile = "alisrios"

    assume_role {
      role_arn     = "arn:aws:iam::148761658767:role/TerraformAssumeRole"
      session_name = "TerraformSession"
  }
}