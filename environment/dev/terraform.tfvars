
project_name = "EKSlab"
region       = "us-east-1"

################################################################################
########################### CLUSTER VARIABLES ##################################
################################################################################

cluster = [
  {
    kubernetes_version = "1.33"
    zonal_shift        = true
    access_config = {
      authentication_mode                         = "API_AND_CONFIG_MAP"
      bootstrap_cluster_creator_admin_permissions = true
    }
    #Standard: This option supports the Kubernetes version for 14 months after the release date. There is no additional cost. When standard support ends, your cluster will be auto upgraded to the next version.
    #Extended: This option supports the Kubernetes version for 26 months after the release date. The extended support period has an additional hourly cost that begins after the standard support period ends. When extended support ends, your cluster will be auto upgraded to the next version.
    upgrade_policy_support_type = "STANDARD"
    enabled_cluster_log_types   = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
    addons = [ # https://docs.aws.amazon.com/eks/latest/userguide/eks-add-ons.html
      {
        name    = "vpc-cni"
        version = "v1.19.5-eksbuild.1" # https://docs.aws.amazon.com/eks/latest/userguide/managing-vpc-cni.html
      },
      {
        name    = "coredns"
        version = "v1.12.1-eksbuild.2" # https://docs.aws.amazon.com/eks/latest/userguide/coredns.html
      },
      {
        name    = "kube-proxy"
        version = "v1.33.0-eksbuild.2" # https://docs.aws.amazon.com/eks/latest/userguide/managing-kube-proxy.html
      },
      {
        name    = "node-monitoring-agent"
        version = "v1.4.0-eksbuild.2" # https://docs.aws.amazon.com/eks/latest/userguide/workloads-add-ons-available-eks.html#add-ons-eks-node-monitoring-agent
      }
  ] }
]

################################################################################
############################ NODE GROUP VARIABLES ##############################
################################################################################

nodegroup = [
  {
    name_suffix        = "-SPOT"
    instance_types     = ["t3.small", "t3.medium"] # "t3.large", "m5.xlarge", "m5.2xlarge"
    capacity_type      = "SPOT"
    auto_scale_options = [{ min = 2, max = 3, desired = 2 }]
    labels = {
      "ingress/ready" = "true"
      "capatity/os"   = "AMAZON_LINUX"
      "capatity/type" = "SPOT"
      "capatity/arch" = "x86_64"
    }
  }
]

################################################################################
#################################### HELM CHARTS ###############################
################################################################################

helm_charts = [
  # Metrics Server
  {
    name       = "metrics-server"
    repository = "https://kubernetes-sigs.github.io/metrics-server/"
    chart      = "metrics-server"
    namespace  = "kube-system"
    wait       = false
    version    = "3.12.2"
    set = [{
      name  = "apiService.create"
      value = "true"
    }]
  },
  # Kube State Metrics
  {
    name             = "kube-state-metrics"
    repository       = "https://prometheus-community.github.io/helm-charts"
    chart            = "kube-state-metrics"
    namespace        = "kube-system"
    create_namespace = true
    set = [
      {
        name  = "apiService.create"
        value = "true"
      },
      {
        name  = "metricLabelsAllowlist[0]"
        value = "nodes=[*]"
      },
      {
        name  = "metricAnnotationsAllowList[0]"
        value = "nodes=[*]"
      }
    ]
  }
]

################################################################################
############################ SSM NETWORKING VARIABLES ##########################
################################################################################

ssm_vpc_id = "/EKS/vpc/id"
ssm_public_subnets = [
  "/EKS/subnets/public/us_east_1a",
  "/EKS/subnets/public/us_east_1b",
  "/EKS/subnets/public/us_east_1c",
]
ssm_private_subnets = [
  "/EKS/subnets/private/us_east_1a",
  "/EKS/subnets/private/us_east_1b",
  "/EKS/subnets/private/us_east_1c",
]
ssm_pod_subnets = [
  "/EKS/subnets/pod/us_east_1a",
  "/EKS/subnets/pod/us_east_1b",
  "/EKS/subnets/pod/us_east_1c",
]

################################################################################
################################ DEFAULT TAGS ##################################
################################################################################

default_tags = {
  Contato = "apgaua@pm.me"
  Curso   = "Arquitetura de Containers - EKS"
  Dia     = "Dia19-EKS-NodeGroups"
  Repo    = "https://github.com/apgaua/eks-nodegroups"
}