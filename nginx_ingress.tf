
# Deploy Helm Chart
resource "helm_release" "nginx_ingress" {
  name             = "nginx-ingress"
  chart            = "stable/nginx-ingress"
  repository       = data.helm_repository.stable.metadata[0].name
  create_namespace = "true"
  namespace        = "kube-system"
  values           = [file("${path.module}/nginx_ingress.yaml")]
  wait             = true
  force_update     = true

  set {
    name  = "controller.metrics.enabled"
    value = "true"
  }
}
