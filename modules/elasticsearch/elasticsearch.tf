resource "helm_release" "elasticsearch" {
  count            = var.elasticsearch_enabled ? 1 : 0
  name             = "elasticsearch"
  chart            = "elasticsearch"
  repository       = "stable"
  create_namespace = "true"
  namespace        = "elasticsearch"
  wait             = true
  force_update     = true
  values           = [file("${path.module}/elasticsearch.yaml")]
}
