resource "helm_release" "nginx_ingress" {
  count      = var.nginx_ingress_enabled ? 1 : 0
  name       = "nginx-ingress"
  chart      = "nginx-ingress"
  repository =  "stable"
  create_namespace = "true"
  values = ["${file("./nginx_ingress.yaml")}"]
}