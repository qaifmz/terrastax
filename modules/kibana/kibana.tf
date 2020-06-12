resource "helm_release" "kibana" {
  count      = var.kibana_enabled ? 1 : 0
  name       = "kibana"
  chart      = "stable/kibana"
  repository = data.helm_repository.stable.metadata[0].name
  namespace  = "elk-stack"
  values     = [file("${path.module}/kibana.yaml")]
  wait             = true
  force_update     = true
  # timeout          = 900
}
