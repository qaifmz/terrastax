resource "helm_release" "elasticsearch" {
  count      = var.elasticsearch_enabled ? 1 : 0
  name       = "elasticsearch"
  chart      = "elastic/elasticsearch"
  repository = data.helm_repository.elastic.metadata[0].name
  create_namespace = "true"
  namespace  = "elk-stack"
  values     = [file("${path.module}/elasticsearch.yaml")]
}
