resource "helm_release" "prometheus-operator" {
  count            = var.prometheus-operator_enabled ? 1 : 0
  name             = "prometheus-operator"
  chart            = "stable/prometheus-operator"
  repository       = data.helm_repository.stable.metadata[0].name
  create_namespace = "true"
  namespace        = "monitoring"
  values           = [file("${path.module}/prometheus-operator.yaml")]
  wait             = true
  force_update     = true
  # timeout          = 900

  set {
    name  = "server.enabled"
    value = "true"
  }
}
