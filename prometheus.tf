resource "helm_release" "prometheus" {
  name         = "prometheus"
  chart        = "prometheus"
  repository   = "stable"
  create_namespace = "true"
  namespace    = "prometheus"
  wait         = true
  force_update = true
  values = ["${file("./prometheus.yaml")}"]

   set {
    name  = "server.enabled"
    value = "true"
  }
}