# PROVIDER
terraform {

  required_version = "~> 1.8.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.52"
    }
  }

}

provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = [".aws/config"]
  shared_credentials_files = [".aws/credentials"]
  profile                  = "iac"
}