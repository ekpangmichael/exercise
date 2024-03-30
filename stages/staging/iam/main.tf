module "eks_cluster_autoscaler" {
  source = "../../../modules/oidc"
  region = "eu-west-1"
  cluster_name = "staging-cluster"
}