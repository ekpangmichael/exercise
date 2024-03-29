variable "region" {
  description = "AWS Region"
  type        = string
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "thumbprint" {
  description = "Root CA thumbprint for OIDC"
  type        = string
  default     = "9e99a48a9960b14926cc7f0398ea5985360b8e99"
}
