# template file
locals {
  which_template = "${path.module}/prometheus-operator.yaml"
}

# template file
data "template_file" "prometheus-operator" {
  template = yamlencode(yamldecode(file(local.which_template)))
  vars = {
    admin_password = var.admin_password
    airflow_host   = var.airflow_host
  }
}

# Deploy Helm Chart
resource "helm_release" "prometheus-operator" {
  count            = var.prometheus-operator_enabled ? 1 : 0
  name             = "prometheus-operator"
  repository       = "https://kubernetes-charts.storage.googleapis.com"
  chart            = "prometheus-operator"
  version          = "9.3.0"
  create_namespace = "true"
  namespace        = "monitoring"
  # values           = [file("${path.module}/prometheus-operator.yaml")]
  values       = [data.template_file.prometheus-operator.rendered]
  wait         = true
  force_update = true
}