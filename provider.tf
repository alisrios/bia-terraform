terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.85.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"    

  assume_role {
    role_arn     = "arn:aws:iam::148761658767:role/TerraformAssumeRole"      
  }
}