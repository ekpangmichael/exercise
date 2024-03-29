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
  default     = "E9:7C:02:2B:D7:BD:47:D0:33:53:C8:4A:B2:04:60:33:1F:7F:06:AB"
}
