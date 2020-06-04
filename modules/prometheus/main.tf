data "template_file" "prometheus" {
  template = yamlencode(yamldecode(file(local.which_template)))
  vars = {
    region                 = var.region
    cloud_platform         = var.cloud_platform
    slack_api_key          = var.slack_api_key == "" ? "https://slack.com/api" : var.slack_api_key
    alertmanager_subdomain = var.alertmanager_subdomain
    grafana_subdomain      = var.grafana_subdomain
    prometheus_subdomain   = var.prometheus_subdomain
    root_domain_name       = var.deployment_domain_name
    name_of_cluster_issuer = var.issuer_name
    prometheus_user        = var.prometheus_user
    prometheus_password    = var.prometheus_password
  }
}

resource "helm_release" "prometheus" {
  count      = var.prometheus_enabled ? 1 : 0
  name       = "prometheus"
  chart      = "stable/prometheus-operator"
  repository = data.helm_repository.stable.metadata[0].name
  namespace  = "kube-system"

  values = [data.template_file.prometheus.rendered]
}