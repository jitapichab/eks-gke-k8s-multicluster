module "aws_vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "2.63.0"

    name = "eks_${local.env}"
    cidr = var.aws_cidr

    azs             = var.aws_azs
    private_subnets = var.aws_private_subnets
    public_subnets  = var.aws_public_subnets

    enable_nat_gateway = true
    single_nat_gateway = true
 
    private_subnet_tags = {
            "kubernetes.io/cluster/${local.aws_cluster}" = "shared"
            "kubernetes.io/role/internal-elb"             = "1"
        }
    public_subnet_tags = {
            "kubernetes.io/cluster/${local.aws_cluster}" = "shared"
            "kubernetes.io/role/elb"                      = "1"
        }
    tags = local.common_tags
}

module "aws_bastion" {
  source            = "github.com/jetbrains-infra/terraform-aws-bastion-host"  
  subnet_id         = element(module.aws_vpc.public_subnets,1)
  ssh_key           = var.aws_key_name
  allowed_hosts     = [var.my_public_ip]
  internal_networks = [module.aws_vpc.private_subnets_cidr_blocks]
  disk_size         = 10
  instance_type     = "t2.micro"
  project           = local.common_tags.application
}

