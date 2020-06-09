
data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

resource "helm_release" "elasticsearch" {
  count      = var.elasticsearch_enabled ? 1 : 0
  name       = "elasticsearch"
  chart      = "stable/elasticsearch"
  repository = data.helm_repository.stable.metadata[0].name
  namespace  = "elk-stack"
  values     = [file("${path.module}/elasticsearch.yaml")]
}