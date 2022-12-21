module "vpc" {
  vpc_id               = var.vpc_id
  source               = "./modules/vpc"
  cidr_block           = var.cidr_block
 public_subnets       = var.public_subnets
 private_subnets =      var.private_subnets
 az                   = var.az
}
module "eks" {
  source           = "./modules/eks"
  name             = var.env
  private_subnet_1 = module.vpc.private_subnet_1
  private_subnet_2 = module.vpc.private_subnet_2
  eks_version      = var.eks_version
  security_group_ids = module.vpc.security_group_ids
}

module "node_gp1" {
  source        = "./modules/node_gp"
  eks_name      =    module.eks.eks_name
  private_subnet_1 = module.vpc.private_subnet_1
  private_subnet_2 = module.vpc.private_subnet_2
  eks_cluster_arn = module.eks.eks_cluster_arn
  env              = var.env
}

module "node_gp2" {
  source        = "./modules/node_gp"
  eks_name      =    module.eks.eks_name
  private_subnet_1 = module.vpc.private_subnet_1
  private_subnet_2 = module.vpc.private_subnet_2
  eks_cluster_arn = module.eks.eks_cluster_arn
  env             = var.env
}
