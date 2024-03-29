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
  default     = "E97C022BD7BD47D03353C84AB20460331F7F06AB"
}
