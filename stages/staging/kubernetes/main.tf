module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "staging-cluster"
  cluster_version = "1.29"
  cluster_endpoint_public_access  = true
  enable_cluster_creator_admin_permissions = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id     = data.tfe_outputs.networking.nonsensitive_values.vpc_id 
  subnet_ids = data.tfe_outputs.networking.nonsensitive_values.private_subnet_ids

  eks_managed_node_group_defaults = {
  instance_types = ["m7g.medium", "m7g.large" ]
  }

  eks_managed_node_groups = {
    example = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
    }
  }
}
