resource "helm_release" "prometheus-grafana" {
  name       = "prometheus-stack"
  namespace  = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-operator"

  ## definir esses valores para fixar as versoes e em caso de update nao danificar o deploy
  #defaultRules_create    = false
  #helm_chart_version     = "8.15.11"
  #helm_chart_namespace   = "monitoring"
  #skip_crds              =  false


  values = [
    file("modules/kube-prometheus-stack/prometheus-stack-values.yaml")
  ]
}
