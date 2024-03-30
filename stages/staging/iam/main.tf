module "oidc" {
  source = "../../../modules/oidc"
  region = "eu-west-1"
  cluster_name = "staging-cluster"
}