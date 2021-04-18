locals {
    env = terraform.workspace
    common_tags = {
       application = "eks-gke-k8s-multicluster"
       env = local.env
    }
    aws_cluster = "eks_cluster_${local.env}"
    gke_cluster = "gke_cluster_${local.env}"
}

provider "aws" {
    version = "~> 3.0"
    region  = var.aws_region
    profile = var.aws_profile
} 

data "aws_eks_cluster" "cluster" {
  name = module.aws_cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.aws_cluster.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.9"
}
