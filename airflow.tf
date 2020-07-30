# template file
locals {
  this_template = "${path.module}/airflow.yaml"
}

# template file
data "template_file" "airflow" {
  template = yamlencode(yamldecode(file(local.this_template)))
  vars = {
    admin_password = var.admin_password
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
