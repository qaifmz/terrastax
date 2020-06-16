resource "helm_release" "airflow" {
  count            = var.airflow_enabled ? 1 : 0
  name             = "airflow"
  chart            = "stable/airflow"
  repository       = data.helm_repository.stable.metadata[0].name
  create_namespace = "true"
  namespace        = "logging"
  values           = [file("${path.module}/airflow.yaml")]
  wait             = true
  force_update     = true
  # timeout          = 900
  # set {
  #   name  = "airflow.cloneDagFilesFromGit.enabled"
  #   value = "true"
  # }
  # set {
  #   name  = "airflow.cloneDagFilesFromGit.repository"
  #   value = "https://github.com/bitnami/tutorials/tree/master/airflow-dag-examples"
  # }
  # set {
  #   name  = "airflow.cloneDagFilesFromGit.branch"
  #   value = "master"
  # }
  # set {
  #   name  = "airflow.baseURL"
  #   value = "http://127.0.0.1:8080"
  # }
}
