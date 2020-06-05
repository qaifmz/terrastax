variable "region" {
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

variable "nginx_ingress_enabled" {
  description = "Bool to enable nginx ingress"
  type        = bool
  default     = true
}
