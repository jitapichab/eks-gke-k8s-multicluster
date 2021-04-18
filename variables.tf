variable "aws_region" {
    type = string
    description = "AWS region"
    default = "us-east-1"
}

variable "aws_profile" {
    type = string
    description = "aws profile"
    default = "default"
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
