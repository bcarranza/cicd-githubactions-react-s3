terraform {
  #Change to latest version(1.6.2),previous version (1.5.3) triggers an unsopported Terraform version
  required_version = "1.6.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
