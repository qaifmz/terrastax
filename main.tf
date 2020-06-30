
module "eks" {
  source = "github.com/qaifmz/terraform-aws-eks-base"
  id     = var.id
}

# Helm Provider
provider "helm" {}

# Helm Chart Stable Repo
data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

locals {
  nginx_ingress_enabled       = var.all_enabled ? true : var.nginx_ingress_enabled
  prometheus-operator_enabled = var.all_enabled ? true : var.prometheus-operator_enabled
  fluentd_enabled             = var.all_enabled ? true : var.fluentd_enabled
  elk-stack_enabled           = var.all_enabled ? true : var.elk-stack_enabled
  airflow_enabled             = var.all_enabled ? true : var.airflow_enabled
}
