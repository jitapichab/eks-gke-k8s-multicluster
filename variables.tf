variable "aws_region" {
    type = string
    description = "AWS region"
    default = "us-east-1"
}

variable "aws_profile" {
    type = string
    description = "aws profile"
    default = "test"
}

variable "aws_cidr" {
    type = string
    description = "VPC CIDR"
    default = "100.33.0.0/16"
}

variable "aws_azs" {
    type = list(string)
    description = "list to azs to expand the subnets"
    default = ["us-east-1a","us-east-1b","us-east-1c"]
}

variable "aws_private_subnets" {
    type = list(string)
    description = "list of private subnets AWS"
    default = ["100.33.0.0/22","100.33.4.0/22","100.33.8.0/22"]
}

variable "aws_public_subnets" {
    type = list(string)
    description = "list of public subnets AWS"
    default = ["100.33.12.0/26","100.33.12.64/26","100.33.12.128/26"]
}

variable "my_public_ip" {
    description = "public ip to reach servers in private networks"
}

variable "aws_key_name" {
    type = string
    description = "aws key name"
    default = "eks-gke-k8s-multicluster"
}

variable "cluster_version" {
    type = string
    description = "cluster version"
    default = "1.17"
}

variable "aws_instance_size" {
    type = string
    description = "aws instance size worker nodes"
    default = "m4.large"
}

variable "gcp_project" {
    type = string
    description = "gcp project name"
}

variable "gcp_region" {
    type = string
    description = "google cloud region"
    default = "us-central1"
}

variable "gcp_network_name" {
    type = string
    description = "google cloud network name"
    default = "gke-network"
}

variable "gcp_subnetwork_name" {
    type = string
    description = "google cloud subnetwork name"
    default = "gke-subnetwork"
}

variable "gcp_subnetwork_range" {
    type = string
    description = "google cloud subnetwork range"
    default = "10.31.0.0/16"
}

variable "gcp_subnetwork_pods" {
    type = string
    description = "google cloud subnetwork pods"
    default = "10.32.0.0/16"
}

variable "gcp_subnetwork_services" {
    type = string
    description = "google cloud subnetwork services"
    default = "10.33.0.0/16"
}

variable "gcp_workers_name" {
    type = string
    description = "google cloud workers name"
    default = "gke-workers"
}

variable "gcp_instance_size" {
    type = string
    description = "google cloud gke workers instance size"
    default = "n1-standard-2"
}

variable "gcp_kubernetes_version" {
    type = string
    description = "gke kubernetes version"
    default = "1.17.17-gke.3700"
}
