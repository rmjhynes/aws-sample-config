terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.10.0"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "Development"
      DeployedBy  = "Terraform"
      CodeRepo    = "aws-sample-config"
    }
  }
}
