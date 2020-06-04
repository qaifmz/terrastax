
data "template_file" "nginx_ingress" {
  template = yamlencode(yamldecode(file("${path.module}/nginx_ingress.yaml")))
}


resource "helm_release" "nginx_ingress" {
  count      = var.nginx_ingress_enabled ? 1 : 0
  name       = "nginx-ingress"
  chart      = "stable/nginx-ingress"
  repository = data.helm_repository.stable.metadata[0].name
  namespace  = "kube-system"

  values = [data.template_file.nginx_ingress.rendered]
}