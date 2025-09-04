resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = "kube-system"
  version    = "5.12.1"

  set {
    name  = "apiService.create"
    value = "true"
  }

  depends_on = [aws_eks_addon.cni, aws_eks_addon.coredns, aws_eks_addon.kubeproxy, aws_eks_access_entry.nodes]
}