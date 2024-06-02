variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "prod-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.29"
}
variable "prod_vpc_id" {
  description = "Prod vpc ID"
  type        = string
  default     = "vpc-00ea8ae5c9d87d48b"
}

variable "environment" {
    type = string 
    default = "production" 
}