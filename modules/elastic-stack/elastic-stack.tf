resource "helm_release" "elastic-stack" {
  count            = var.elastic-stack_enabled ? 1 : 0
  name             = "elastic-stack"
  chart            = "elastic-stack"
  repository       = "stable"
  create_namespace = "true"
  namespace        = "elastic-stack"
  wait             = true
  force_update     = true
  values           = [file("${path.module}/elastic-stack.yaml")]
}
