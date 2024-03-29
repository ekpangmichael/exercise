provider "aws" {
  region = var.region
}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.cluster_name
}

resource "aws_iam_openid_connect_provider" "eks_oidc" {
  url             = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [var.thumbprint]
}

resource "aws_iam_role" "cluster_autoscaler" {
  name = "${var.cluster_name}-ClusterAutoscaler-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = { Federated = aws_iam_openid_connect_provider.eks_oidc.arn }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "${data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer}:sub" = "system:serviceaccount:kube-system:cluster-autoscaler"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "cluster_autoscaler_policy" {
  role = aws_iam_role.cluster_autoscaler.id
  policy = <<-POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup",
          "autoscaling:DescribeLaunchConfigurations",
          "ec2:DescribeLaunchTemplateVersions"
        ],
        "Resource": "*"
      }
    ]
  }
  POLICY
}
