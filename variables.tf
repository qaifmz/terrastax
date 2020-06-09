variable "id" {
  description = "The id of the resources"
  type        = string
}

variable "aws_region" {
  description = "The region to deploy in"
  type        = string
  default = "us-west-2"
}

variable "all_enabled" {
  description = "Bool to enable all services"
  type        = bool
  default     = true
}

variable "prometheus_enabled" {
  description = "Bool to enable prometheus"
  type        = bool
  default     = true
}

variable "prometheus-operator_enabled" {
  description = "Bool to enable prometheus-operator"
  type        = bool
  default     = true
}

variable "nginx_ingress_enabled" {
  description = "Bool to enable nginx ingress"
  type        = bool
  default     = true
}

variable "grafana_enabled" {
  description = "Bool to enable grafana"
  type        = bool
  default     = true
}

variable "elastic-stack_enabled" {
  description = "Bool to enable elastic-stack"
  type        = bool
  default     = true
}
