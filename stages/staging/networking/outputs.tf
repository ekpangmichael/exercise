output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets_ids
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets_ids
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.vpc.nat_gateway_ids[0]
}
