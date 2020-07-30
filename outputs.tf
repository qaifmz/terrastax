##################
# Modules ouptuts
##################

output "prometheus-operator" {
  description = "Prometheus Operator installed"
  value       = var.prometheus-operator_enabled
}
