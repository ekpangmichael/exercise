variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "reverse-ip"
}

variable "cidr" {
  description = "CIDR for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "private_subnets" {
  description = "A list of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  description = "A list of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "enable_nat_gateway" {
  description = "Flag to enable NAT Gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Flag to use a single NAT Gateway for all private subnets"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    Terraform    = "true"
    Environment = "staging"
  }
}
