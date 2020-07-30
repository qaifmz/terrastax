
# module "eks" {
#   source = "github.com/qaifmz/terraform-aws-eks-base"
#   id     = var.id
# }

locals {
  prometheus-operator_enabled = var.all_enabled ? true : var.prometheus-operator_enabled
  airflow_enabled             = var.all_enabled ? true : var.airflow_enabled
}
