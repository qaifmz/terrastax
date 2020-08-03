##########
# Base
##########
resource "random_pet" "this" {
  length = 1
}


variable "id" {
  description = "The id of the resources"
  type        = string
}


variable "aws_region" {
  description = "The region to deploy in"
  type        = string
}

provider "aws" {
  region = var.aws_region
}

##########
# Modules
##########
variable "all_enabled" {
  description = "Bool to enable all services"
  type        = bool
  default     = true
}

variable "prometheus-operator_enabled" {
  description = "Bool to enable prometheus-operator"
  type        = bool
  default     = false
}

variable "airflow_enabled" {
  description = "Bool to enable airflow"
  type        = bool
  default     = true
}

################################
# Prometheus Operator Variables
################################

variable "admin_password" {
  description = "Grafana admin password"
  type        = string
  default     = "admin"
}

variable "airflow_host" {
  description = "Airflow host Address"
  type        = string
  default     = "localhost"
}

####################
# Airflow Variables
####################

variable "fernetKey" {
  description = "Airflow Fernet Key"
  type        = string
  default     = "7T512UXSSmBOkpWimFHIVb8jK6lfmSAvx4mO6Arehnc="
}

variable "prometheus_selector" {
  description = "Airflow Prometheus Selector"
  type        = string
  default     = "kube-prometheus"
}

variable "prometheus_selector_path" {
  description = "Airflow Prometheus Selector path"
  type        = string
  default     = "/admin/metrics"
}