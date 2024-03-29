module "eks_cluster_autoscaler" {
  source = "../../../../modules/eks_cluster_autoscaler"
  region = "eu-west-1"
  cluster_name = "staging-cluster"
}