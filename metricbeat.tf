resource "helm_release" "metricbeat" {
  count      = var.metricbeat_enabled ? 1 : 0
  name       = "metricbeat"
  chart      = "stable/metricbeat"
  repository = data.helm_repository.stable.metadata[0].name
  namespace  = "elastic-stack"
  values     = [file("${path.module}/metricbeat.yaml")]
  wait             = true
  force_update     = true
  # timeout          = 900
}