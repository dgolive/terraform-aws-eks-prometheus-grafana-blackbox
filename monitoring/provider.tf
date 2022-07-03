provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
  }
}

#provider "kubernetes" {
#  config_path    = "~/.kube/config"
#  config_context = "arn:aws:eks:us-east-2:455258380777:cluster/education-eks-DuY7OyTN"
#  #config_context = "Default"
#}
#
#provider "helm" {
#  kubernetes {
#    config_path    = "~/.kube/config"
#    config_context = "arn:aws:eks:us-east-2:455258380777:cluster/education-eks-DuY7OyTN"
#  }
#}


##PEGAR O NOME DO CLUSTER EXISTENTE
#data "aws_eks_cluster" "cluster" {
#  name       = var.cluster_name
#  #depends_on = [module.controlplane]
#}
#
#
#data "aws_eks_cluster_auth" "cluster" {
#  name       = var.cluster_name
#  #depends_on = [module.controlplane]
#}

