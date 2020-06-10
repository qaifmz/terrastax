resource "helm_release" "airflow" {
  count            = var.airflow_enabled ? 1 : 0
  name             = "airflow"
  chart            = "bitnami/airflow"
  repository       = data.helm_repository.bitnami.metadata[0].name
  create_namespace = "true"
  namespace        = "airflow"
  values           = [file("${path.module}/airflow.yaml")]

  set {
    name  = "airflow.cloneDagFilesFromGit.enabled"
    value = "true"
  }
  set {
    name  = "airflow.cloneDagFilesFromGit.repository"
    value = "https://github.com/bitnami/tutorials/tree/master/airflow-dag-examples"
  }
  set {
    name  = "airflow.cloneDagFilesFromGit.branch"
    value = "master"
  }
  set {
    name  = "airflow.baseURL"
    value = "http://127.0.0.1:8080"
  }
}
