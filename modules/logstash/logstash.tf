resource "helm_release" "logstash" {
  count      = var.logstash_enabled ? 1 : 0
  name       = "logstash"
  chart      = "stable/logstash"
  repository = data.helm_repository.stable.metadata[0].name
  namespace  = "elk-stack"
  values     = [file("${path.module}/logstash.yaml")]
}