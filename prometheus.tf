resource "helm_release" "prometheus" {
  count            = var.prometheus_enabled ? 1 : 0
  name             = "prometheus"
  chart            = "prometheus"
  repository       = "stable"
  create_namespace = "true"
  namespace        = "prometheus"
  wait             = true
  force_update     = true
  values           = [file("${path.module}/prometheus.yaml")]

  set {
    name  = "server.enabled"
    value = "true"
  }
}