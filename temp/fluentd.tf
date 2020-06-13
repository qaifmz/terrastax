resource "helm_release" "fluentd" {
  count      = var.fluentd_enabled ? 1 : 0
  name       = "fluentd"
  chart      = "stable/fluentd"
  repository = data.helm_repository.stable.metadata[0].name
  namespace  = "elastic-stack"
  values     = [file("${path.module}/fluentd.yaml")]
  wait             = true
  force_update     = true
  # timeout          = 900
}
