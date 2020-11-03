locals {
    env = terraform.workspace
    common_tags = {
       application = "eks-gke-k8s-multicluster"
       env = local.env
    }
}

provider "aws" {
    version = "~> 3.0"
    region  = var.aws_region
    profile = var.aws_profile
} 
