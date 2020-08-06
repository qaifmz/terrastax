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
resource "helm_release" "elk-stack" {
  count = var.elk-stack_enabled ? 1 : 0
  name  = "elk-stack"
  chart = "${path.module}/charts/elk"
  # repository       = data.helm_repository.stable.metadata[0].name
  # create_namespace = "true"
  # namespace        = "elk-stack"
  # values           = [file("${path.module}/elk-stack.yaml")]
  # timeout          = 900
  wait         = true
  force_update = true
}
