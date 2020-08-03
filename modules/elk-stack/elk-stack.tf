# Helm Provider
provider "helm" {}

# Helm Chart Stable Repo
data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

variable "elk-stack_enabled" {
  description = "Bool to enable elk-stack"
  type        = bool
  default     = true
}

# Deploy Helm Chart
resource "helm_release" "elastic-stack" {
  count = var.elastic-stack_enabled ? 1 : 0
  name  = "elastic-stack"
  chart = "./charts/elk"
  #repository       = data.helm_repository.stable.metadata[0].name
  create_namespace = "true"
  namespace        = "elastic-stack"
  #values           = [file("${path.module}/elastic-stack.yaml")]
  wait         = true
  force_update = true
  # timeout          = 900
}
