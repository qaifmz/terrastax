module "deploy-eks-clusters" {
  source = "github.com/qaifmz/terraform-aws-eks-base"
  id     = var.id
}

provider "aws" {
  region = var.aws_region
}

data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

data "helm_repository" "bitnami" {
  name = "bitnami"
  url  = "https://charts.bitnami.com/bitnami"
}

data "helm_repository" "jetstack" {
  name = "jetstack"
  url  = "https://charts.jetstack.io"
}

data "helm_repository" "elastic" {
  name = "elastic"
  url  = "https://helm.elastic.co"
}

locals {
  prometheus-operator_enabled     = var.all_enabled ? true : var.prometheus-operator_enabled
}
