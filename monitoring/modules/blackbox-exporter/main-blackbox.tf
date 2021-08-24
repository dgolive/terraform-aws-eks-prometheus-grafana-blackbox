resource "helm_release" "blackbox-exporter" {
  name       = "blackbox-exporter"
  namespace  = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-blackbox-exporter"

  values = [
    file("modules/blackbox-exporter/prometheus-blackbox-exporter.yaml")
  ]
}


