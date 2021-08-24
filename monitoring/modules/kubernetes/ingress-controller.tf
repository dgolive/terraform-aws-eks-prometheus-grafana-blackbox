resource "helm_release" "nginx-ingress-controller" {
  name       = "nginx-ingress-controller"
  namespace  = "ingress"
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
}

resource "kubernetes_namespace" "monitoring-ns" {
  metadata {
    name = "monitoring"
  }
}

resource "kubernetes_namespace" "ingress-ns" {
  metadata {
    name = "ingress"
  }
  provisioner "local-exec" {
    command = "kubectl apply -f modules/kubernetes/ingress-prometheus-aws.yaml"
  }
}

