resource "helm_release" "nginx-ingress-controller" {
  name       = "nginx-ingress-controller"
  namespace  = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
}



resource "kubernetes_namespace" "monitoring-ns" {
  metadata {
    name = "monitoring"
  }
}

resource "kubernetes_namespace" "ingress-ns" {
  metadata {
    name = "ingress-nginx"
  }
  provisioner "local-exec" {
    command = "kubectl apply -f modules/kubernetes/ingress-prometheus-aws.yaml"
  }
}

