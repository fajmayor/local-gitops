resource "helm_release" "argocd" {
  name       = var.argocd_name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = var.argocd_namespace
  create_namespace = true

  values = [
      <<EOF
      server:
        service:
          type: ClusterIP
      EOF
  ]

}
