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

resource "random_pet" "this" {
  length = 2
}

module "defaults" {
  source = "../.."
  id     = random_pet.this.id
}

module "eks" {
  source = "github.com/qaifmz/terraform-aws-eks-base"
  id     = var.id
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "1.10"
}


module "nginx_ingress" {
  source = "./modules/nginx_ingress"
}

module "prometheus-operator" {
  source = "./modules/prometheus-operator"
}

module "elk-stack" {
  source = "./modules/elk-stack"
}

module "fluentd" {
  source = "./modules/fluentd"
}

module "airflow" {
  source = "./modules/airflow"
}

# locals {
#   nginx_ingress_enabled       = var.all_enabled ? true : var.nginx_ingress_enabled
#   prometheus-operator_enabled = var.all_enabled ? true : var.prometheus-operator_enabled
#   fluentd_enabled             = var.all_enabled ? true : var.fluentd_enabled
#   elk-stack_enabled           = var.all_enabled ? true : var.elk-stack_enabled
#   airflow_enabled             = var.all_enabled ? true : var.airflow_enabled
# }
