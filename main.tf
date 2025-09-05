module "eks_cluster" {
  source = "github.com/apgaua/terraform-modules//eks-cluster"
  # GENERAL SETTINGS
  project_name = var.project_name
  region       = var.region
  # CLUSTER SETTINGS
  cluster = var.cluster
  # HELM CHARTS
  helm_charts = var.helm_charts
  # NETWORKING SETTINGS
  ssm_vpc_id          = var.ssm_vpc_id
  ssm_public_subnets  = var.ssm_public_subnets
  ssm_private_subnets = var.ssm_private_subnets
  ssm_pod_subnets     = var.ssm_pod_subnets
  # DEFAULT TAGS
  default_tags = var.default_tags
}