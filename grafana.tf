resource "helm_release" "grafana" {
  name         = "grafana"
  chart        = "grafana"
  repository   = "stable"
  create_namespace = "true"
  namespace    = "grafana"
  wait         = true
  force_update = true
  values = ["${file("./grafana.yaml")}"]

   set {
    name  = "persistence.enabled"
    value = "true"
  }

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  # set {
  #   name  = "adminPassword"
  #   value = "insight"
  # }

  # set {
  #   name = "dashboards"
  #   value = ""
  # }
}