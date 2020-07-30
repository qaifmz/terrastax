
##################
# Modules ouptuts
##################

output "airflow" {
  description = "Airflow installed"
  value       = var.airflow_enabled
  depends_on  = ["module.prometheus-operator"]
}
