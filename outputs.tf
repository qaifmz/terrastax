##############
# EKS ouptuts
##############
output "cluster_id" {
  description = "The name/id of the EKS cluster."
  value       = module.eks.cluster_id
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster."
  value       = module.eks.cluster_arn
}

output "cluster_certificate_authority_data" {
  description = "Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster."
  value       = module.eks.cluster_certificate_authority_data
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = module.eks.cluster_endpoint
}

output "cluster_version" {
  description = "The Kubernetes server version for the EKS cluster."
  value       = module.eks.cluster_version
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster."
  value       = module.eks.cluster_security_group_id
}

output "config_map_aws_auth" {
  description = "A kubernetes configuration to authenticate to this EKS cluster."
  value       = module.eks.config_map_aws_auth
}

##################
# Modules ouptuts
##################

output "nginx_ingress" {
  description = "Nginx Ingress installed"
  value       = var.nginx_ingress_enabled
}

output "prometheus-operator" {
  description = "Prometheus Operator installed"
  value       = var.prometheus-operator_enabled
}

output "fluentd" {
  description = "Fluentd installed"
  value       = var.fluentd_enabled
}

output "elk-stack" {
  description = "ELK Stack installed"
  value       = var.elk-stack_enabled
  depends_on  = ["module.fluentd"]
}

output "airflow" {
  description = "Airflow installed"
  value       = var.airflow_enabled
  depends_on  = ["module.prometheus-operator"]
}
