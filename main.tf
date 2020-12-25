locals {
    env = terraform.workspace
    common_tags = {
       application = "eks-gke-k8s-multicluster"
       env = local.env
    }
    aws_cluster = "eks_cluster_${var.env}"
    gke_cluster = "gke_cluster_${var.env}"
}

provider "aws" {
    version = "~> 3.0"
    region  = var.aws_region
    profile = var.aws_profile
} 
