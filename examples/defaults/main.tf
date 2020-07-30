##############
# Random
##############
resource "random_pet" "this" {
  length = 1
}

variable "id" {
  description = "The id of the resources"
  type        = string
  default     = "amz"
}

##############
# Provider
##############

variable "aws_region" {
  description = "The region to deploy in"
  type        = string
  default     = "us-west-2"
}

provider "aws" {
  region = var.aws_region
}

##############
# Base
##############

module "defaults" {
  source = "../.."
  id     = var.id
}

data "aws_eks_cluster" "cluster" {
  name = module.defaults.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.defaults.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "1.15"
}
