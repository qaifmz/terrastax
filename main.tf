##########
# Cluster
##########

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

module "eks" {
  source = "github.com/qaifmz/terraform-aws-eks-base"
  id     = var.id
}
