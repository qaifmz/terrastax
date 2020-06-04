
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

# variable "consul_enabled" {
#   description = "Bool to enable consul"
#   type        = bool
#   default     = true
# }

# variable "elasticsearch_enabled" {
#   description = "Bool to enable elasticsearch"
#   type        = bool
#   default     = true
# }

variable "nginx_ingress_enabled" {
  description = "Bool to enable nginx ingress"
  type        = bool
  default     = true
}

# variable "external_dns_enabled" {
#   description = "Bool to enable external DNS controller"
#   type        = bool
#   default     = true
# }