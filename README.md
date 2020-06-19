
[![open-issues](https://img.shields.io/github/issues/qaifmz/insight-project?style=for-the-badge)](https://github.com/qaifmz/terrastax/issues)
[![open-pr](https://img.shields.io/github/issues-pr/qaifmz/insight-project?style=for-the-badge)](https://github.com/qaifmz/terrastax/pulls)

# TerraStax for AWS
An Insight Fellow Project by Qaif Shaikh - 20B DO SV

## Features

This module deploys EKS Clusters on AWS and installs a list of Helm Charts on them.

## Terraform Versions

For Terraform v0.12.24+

## Usage

```
module "this" {
    source = "github.com/qaifmz/terrastax"

}
```

## Instructions

You will need to configure your AWS credentials before using this project:

### Linux
Add the following in your `~/.bashrc` or `~/.zshrc` with your credentials:
```
export AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY
```

### Windows
Execute the following in your terminal:
```
$ aws configure
AWS Access Key ID [None]: YOUR_AWS_ACCESS_KEY_ID
AWS Secret Access Key [None]: YOUR_AWS_SECRET_ACCESS_KEY
Default region name [None]: us-west-2
Default output format [None]: json
```

### Testing the Project

Initialize and Run Terraform Scripts
```
terraform init
terraform apply
```
Default Cluster name = `"amz"` and input your choice of AWS Region: `us-west-2`

If the output gives connection errors, input the following commands:
```
aws eks --region us-west-2 update-kubeconfig --name amz
terraform apply
```

In case you get any dependency errors, it could be because of the modules dependencies which is not supported by Terraform.
Simply rerun `terraform apply` to solve this issue

If you want to port forward the services and deployments to your localhost, use the following commands:
```
kubectl --namespace=monitoring port-forward svc/prometheus-operator-prometheus 9090
kubectl --namespace=monitoring port-forward deploy/prometheus-operator-grafana 3000
kubectl --namespace=monitoring port-forward deploy/airflow-web 8080
kubectl --namespace=kube-system port-forward deploy/kibana-logging 5601
kubectl --namespace=kube-system port-forward svc/elasticsearch-logging 9200
```

## Examples

- [defaults](https://github.com/qaifmz/terrastax/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| helm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| all\_enabled | Bool to enable all services | `bool` | `true` | no |
| grafana\_enabled | Bool to enable grafana | `bool` | `true` | no |
| nginx\_ingress\_enabled | Bool to enable nginx ingress | `bool` | `true` | no |
| prometheus\_enabled | Bool to enable prometheus | `bool` | `true` | no |
| region | n/a | `string` | `"us-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [qaifmz](https://github.com/qaifmz)

