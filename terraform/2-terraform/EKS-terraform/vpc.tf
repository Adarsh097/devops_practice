module "vpc" {
  source = "terraform-aws-modules/vpc/aws" # VPC Module from Terraform Registry

  name = "${local.name}-${local.env}-vpc"
  cidr = local.vpc_cidr

  azs             = local.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets
  intra_subnets   = local.intra_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = local.env
    Name        = "${local.name}-${local.env}-vpc"
  }
}