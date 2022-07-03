data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
  #name = module.eks.cluster_id


}

data "aws_eks_cluster_auth" "cluster" {
  name = var.cluster_name
}

module "kubernetes" {
  source = "./modules/kubernetes"
  cluster_name = var.cluster_name
}

# *** stack com prometheus + grafana ****
module "kube-prometheus-stack" {
  source = "./modules/kube-prometheus-stack"
  #cluster_name = var.cluster_name
  depends_on = [module.kubernetes]
}

# *** blackbox export ****

module "blackbox-exporter" {
  source = "./modules/blackbox-exporter"
  cluster_name = var.cluster_name
  depends_on = [module.kube-prometheus-stack]
}
