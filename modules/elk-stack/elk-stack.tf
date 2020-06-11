resource "helm_release" "elk-stack" {
  count            = var.elk-stack_enabled ? 1 : 0
  name             = "elk-stack"
  chart            = "stable/elastic-stack"
  repository       = data.helm_repository.stable.metadata[0].name
  create_namespace = "true"
  namespace        = "elk-stack"
  values           = [file("${path.module}/elk-stack.yaml")]
  wait             = true
  force_update     = true
  # timeout          = 900
}
