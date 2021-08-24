resource "helm_release" "prometheus-grafana" {
  name       = "kube-prometheus-stack"
  namespace  = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  #values = [
  #  file("modules/kube-prometheus-stack/kube-prometheus-stack-values.yaml")
  #]
}
