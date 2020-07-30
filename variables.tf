##########
# Base
##########
resource "random_pet" "this" {
  length = 1
}


variable "id" {
  description = "The id of the resources"
  type        = string
  default     = "amz"
}


variable "aws_region" {
  description = "The region to deploy in"
  type        = string
  default     = "us-west-2"
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
  default     = true
}

variable "admin_password" {
  description = "Grafana admin password"
  type        = string
  default     = "admin"
}