module "deploy-eks-clusters" {
  source = "github.com/qaifmz/terraform-aws-eks-base"
  id     = "ins"
}

locals {
  prometheus_enabled    = var.all_enabled ? true : var.prometheus_enabled
  nginx_ingress_enabled = var.all_enabled ? true : var.nginx_ingress_enabled
  grafana_enabled       = var.all_enabled ? true : var.grafana_enabled
}
