variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "staging-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.29"
}

variable "environment" {
    type = string 
    default = "staging" 
}