resource "helm_release" "elasticsearch" {
  count      = var.elasticsearch_enabled ? 1 : 0
  name       = "elasticsearch"
  chart      = "stable/elasticsearch"
  repository = data.helm_repository.stable.metadata[0].name
  create_namespace = "true"
  namespace  = "elk-stack"
  values     = [file("${path.module}/elasticsearch.yaml")]
  wait             = true
  force_update     = true
  # timeout          = 900
}