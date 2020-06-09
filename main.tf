module "deploy-eks-clusters" {
  source = "github.com/qaifmz/terraform-aws-eks-base"
  id     = var.id
}

provider "aws" {
  region = var.aws_region
}

locals {
  prometheus_enabled    = var.all_enabled ? true : var.prometheus_enabled
  prometheus-operator_enabled    = var.all_enabled ? true : var.prometheus-operator_enabled
  nginx_ingress_enabled = var.all_enabled ? true : var.nginx_ingress_enabled
  grafana_enabled       = var.all_enabled ? true : var.grafana_enabled
}
