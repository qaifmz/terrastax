# template file
locals {
  this_template = "${path.module}/airflow.yaml"
}

# template file
data "template_file" "airflow" {
  template = yamlencode(yamldecode(file(local.this_template)))
  vars = {
    fernetKey                = var.fernetKey
    prometheus_selector      = var.prometheus_selector
    prometheus_selector_path = var.prometheus_selector_path
  }
}

# Deploy Helm Chart
resource "helm_release" "airflow" {
  count            = var.airflow_enabled ? 1 : 0
  name             = "airflow"
  repository       = "https://kubernetes-charts.storage.googleapis.com"
  chart            = "airflow"
  version          = "7.3.0"
  create_namespace = "true"
  namespace        = "monitoring"
  # values           = [file("${path.module}/airflow.yaml")]
  values       = [data.template_file.airflow.rendered]
  wait         = true
  force_update = true
  # depends_on       = [helm_release.prometheus-operator]
}
