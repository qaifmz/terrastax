resource "helm_release" "elk-stack" {
  count            = var.elk-stack_enabled ? 1 : 0
  name             = "elk-stack"
  chart            = "elastic-stack"
  repository       = "stable"
  create_namespace = "true"
  namespace        = "elk-stack"
  wait             = true
  force_update     = true
  values           = [file("${path.module}/elk-stack.yaml")]
}
