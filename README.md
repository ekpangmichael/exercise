# Terraform Infrastructure Setup for VPC, EKS, and ArgoCD
## Overview
This repository houses the essential Terraform code required for the configuration and deployment of a VPC (Virtual Private Cloud) and an EKS (Elastic Kubernetes Service) cluster on AWS. Additionally, it includes YAML configurations for setting up ArgoCD, a declarative, GitOps continuous delivery tool for Kubernetes.


## Terraform Cloud Integration
This repository is integrated with Terraform Cloud, enabling a Version Control System (VCS) workflow. The process is as follows:

### Pull Request (PR) Workflow:
 Whenever a pull request is raised, Terraform Cloud automatically initiates a 'plan' operation. 
<!-- BEGIN_TF_DOCS -->


# Module
The following modules were used

## VPC Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.7.0 |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | A list of availability zones in the region | `list(string)` | <pre>[<br>  "eu-west-1a",<br>  "eu-west-1b"<br>]</pre> | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR for the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Flag to enable NAT Gateway | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on all the resources as identifier | `string` | `"reverse-ip"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | A list of private subnet CIDRs | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24"<br>]</pre> | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | A list of public subnet CIDRs | `list(string)` | <pre>[<br>  "10.0.101.0/24",<br>  "10.0.102.0/24"<br>]</pre> | no |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | Flag to use a single NAT Gateway for all private subnets | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | <pre>{<br>  "Environment": "staging",<br>  "Terraform": "true"<br>}</pre> | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | List of IDs of private subnets |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | List of IDs of public subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->

<!-- BEGIN_TF_DOCS -->


### Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | n/a |

## EKS Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | ~> 20.0 |

### Resources

| Name | Type |
|------|------|
| [tfe_outputs.networking](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | `"staging-cluster"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubernetes version for the EKS cluster | `string` | `"1.29"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"staging"` | no |
<!-- END_TF_DOCS -->

<!-- BEGIN_TF_DOCS -->


### OIDC Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_cluster_autoscaler"></a> [eks\_cluster\_autoscaler](#module\_eks\_cluster\_autoscaler) | ../../../modules/oidc | n/a |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | `"staging-cluster"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubernetes version for the EKS cluster | `string` | `"1.29"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"staging"` | no |
<!-- END_TF_DOCS -->