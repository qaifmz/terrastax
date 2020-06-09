resource "helm_release" "logstash" {
  count            = var.logstash_enabled ? 1 : 0
  name             = "logstash"
  chart            = "logstash"
  repository       = "stable"
  create_namespace = "true"
  namespace        = "logstash"
  wait             = true
  force_update     = true
  values           = [file("${path.module}/logstash.yaml")]
}
