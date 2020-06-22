##########
# Cluster
##########

variable "id" {
  description = "The id of the resources"
  type        = string
  default     = "amz"
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "The region to deploy in"
  type        = string
  default     = "us-west-2"
}

##########
# Modules
##########

variable "all_enabled" {
  description = "Bool to enable all services"
  type        = bool
  default     = true
}

variable "nginx_ingress_enabled" {
  description = "Bool to enable nginx ingress"
  type        = bool
  default     = true
}

variable "prometheus-operator_enabled" {
  description = "Bool to enable prometheus-operator"
  type        = bool
  default     = true
}

variable "fluentd_enabled" {
  description = "Bool to enable fluentd"
  type        = bool
  default     = true
}

variable "elk-stack_enabled" {
  description = "Bool to enable elk-stack"
  type        = bool
  default     = true
}

variable "airflow_enabled" {
  description = "Bool to enable airflow"
  type        = bool
  default     = true
}
