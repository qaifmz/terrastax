
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
  prometheus-operator_enabled = var.all_enabled ? true : var.prometheus-operator_enabled
}
