terraform {
  required_providers {
    kubernetes = {}

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "my-ci-cd-store"
    key                = "state/terraform.tfstate"
    region         	   = "eu-north-1"
    encrypt        	   = true
  }

  required_version = ">= 1.2.0"
}


provider "kubernetes" {
}
