resource "helm_release" "kibana" {
  count            = var.kibana_enabled ? 1 : 0
  name             = "kibana"
  chart            = "kibana"
  repository       = "stable"
  create_namespace = "true"
  namespace        = "kibana"
  wait             = true
  force_update     = true
  values           = [file("${path.module}/kibana.yaml")]
}
