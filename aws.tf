
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.63.0"

  name = "eks_${local.env}"
  cidr = var.aws_cidr

  azs             = var.aws_azs
  private_subnets = var.aws_private_subnets
  public_subnets  = var.aws_public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = local.common_tags
}
