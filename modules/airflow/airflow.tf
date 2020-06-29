# Helm Provider
provider "helm" {}

# Helm Chart Stable Repo
data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

# Deploy Helm Chart
resource "helm_release" "airflow" {
  name             = "airflow"
  chart            = "stable/airflow"
  repository       = data.helm_repository.stable.metadata[0].name
  create_namespace = "true"
  namespace        = "monitoring"
  values           = [file("${path.module}/airflow.yaml")]
  wait             = true
  force_update     = true
}
