terraform {
  required_providers {
    kubernetes = {}
  }

  required_version = ">= 1.2.0"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "${var.image_pull_secret}"
}
