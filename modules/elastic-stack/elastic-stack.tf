resource "helm_release" "elastic-stack" {
  count            = var.elastic-stack_enabled ? 1 : 0
  name             = "elastic-stack"
  chart            = "stable/elastic-stack"
  repository       = data.helm_repository.stable.metadata[0].name
  create_namespace = "true"
  namespace        = "elastic-stack"
  values           = [file("${path.module}/elastic-stack.yaml")]
  wait             = true
  force_update     = true
  # timeout          = 900
}
