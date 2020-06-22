
module "nginx_ingress" {
  source = "./modules/nginx_ingress"
}

module "prometheus-operator" {
  source = "./modules/prometheus-operator"
}

module "elk-stack" {
  source = "./modules/elk-stack"
}

module "fluentd" {
  source = "./modules/fluentd"
}

module "airflow" {
  source = "./modules/airflow"
}

# locals {
#   nginx_ingress_enabled       = var.all_enabled ? true : var.nginx_ingress_enabled
#   prometheus-operator_enabled = var.all_enabled ? true : var.prometheus-operator_enabled
#   fluentd_enabled             = var.all_enabled ? true : var.fluentd_enabled
#   elk-stack_enabled           = var.all_enabled ? true : var.elk-stack_enabled
#   airflow_enabled             = var.all_enabled ? true : var.airflow_enabled
# }
