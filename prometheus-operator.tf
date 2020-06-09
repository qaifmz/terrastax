resource "helm_release" "prometheus-operator" {
  count            = var.prometheus-operator_enabled ? 1 : 0
  name             = "prometheus-operator"
  chart            = "prometheus-operator"
  repository       = "stable"
  create_namespace = "true"
  namespace        = "prometheus-operator"
  wait             = true
  force_update     = true
  values           = [file("${path.module}/prometheus-operator.yaml")]

  set {
    name  = "server.enabled"
    value = "true"
  }
}