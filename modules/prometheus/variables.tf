variable "cloud_platform" {
  description = "The cloud platform where the cluster is deployed"
  type        = string
}

variable "slack_api_key" {
  description = "Your Slack API key to receive alerts"
  type        = string
  default     = ""
}

variable "alertmanager_subdomain" {
  description = "The subdomain for AlertManager"
  type        = string
  default     = "alertmanager"
}

variable "grafana_subdomain" {
  description = "The subdomain for Grafana"
  type        = string
  default     = "grafana"
}

variable "prometheus_subdomain" {
  description = "The subdomain for Prometheus"
  type        = string
  default     = "prometheus"
}

variable "deployment_domain_name" {
  description = "The domain name that will host the deployment"
  type        = string
  default     = ""
}

# variable "azure_service_principal_key" {
#   description = "Contents of the JSON file for the Azure service principal"
#   type        = string
#   default     = ""
# }

# variable "azure_resource_group" {
#   description = "The Azure resource group"
#   type        = string
#   default     = ""
# }

# variable "google_project" {
#   description = "Name of GCP project"
#   type        = string
#   default     = ""
# }

# variable "google_service_account_key" {
#   description = "Contents of the JSON file for the GCP service account"
#   type        = string
#   default     = ""
# }

variable "do_token" {
  description = "The DO API token"
  type        = string
  default     = ""
}

variable "lb_endpoint" {
  description = "URI/IP to the load balancer endpoint"
  type        = string
  default     = ""
}

variable "kubeconfig" {
  description = "The base64-encoded kubeconfig file contents for the cluster to apply CRDs to"
  type        = string
  default     = ""
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  default     = ""
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  default     = ""
}

variable "aws_worker_arn" {
  description = "ARN for EKS worker nodes"
  type        = string
  default     = ""
}

# variable "cert_manager_enabled" {
#   description = "Bool to enable external cert-manager"
#   type        = bool
#   default     = true
# }

variable "issuer_name" {
  description = "k8s resource name for your certificate issuer (e.g. letsencrypt)"
  type        = string
  default     = "letsencrypt"
}

variable "user_email" {
  description = "Email address of user to be notifed by certificate issuer about expiry, etc."
  type        = string
  default     = ""
}

variable "acme_server" {
  description = "Full URI of the certificate issuing server"
  type        = string
  default     = "https://acme-staging-v02.api.letsencrypt.org/directory"
}
variable "cert_manager_issuer_secret_name" {
  description = "k8s secret name for this issuer"
  type        = string
  default     = "letsencrypt-issuer-account-key"
}

variable "wait_on" {
  description = "Variable to trick TF into waiting for everything else to finish"
  default     = ""
}

variable "prometheus_user" {
  description = "Username used for Prometheus authentication"
  type        = string
  default     = "node_exporter_user"
}

variable "prometheus_password" {
  description = "Password used for Prometheus authentication"
  type        = string
  default     = "node_exporter_password"
}