# PROVIDER
terraform {

  required_version = "~> 1.11.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.91"
    }
  }

}

provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = [".aws/config"]
  shared_credentials_files = [".aws/credentials"]
  profile                  = "iac"
}