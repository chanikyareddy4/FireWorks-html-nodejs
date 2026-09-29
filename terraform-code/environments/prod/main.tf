module "vpc" {
  source = "../../modules/vpc"

  vpc_name = "${var.environment}-fire-work-vpc"

  vpc_cidr = var.vpc_cidr

  azs = var.availability_zones

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets

  single_nat_gateway = false

  tags = {
    Environment = var.environment
    Project     = "fire-work"
    ManagedBy   = "Terraform"
  }
}


module "eks" {
  source = "../../modules/eks"

  cluster_name = var.cluster_name

  kubernetes_version = var.kubernetes_version

  vpc_id = module.vpc.vpc_id

  private_subnets = module.vpc.private_subnets

  node_group_name = var.node_group_name

  instance_types = var.instance_types

  desired_size = var.desired_nodes

  min_size = var.min_nodes

  max_size = var.max_nodes

  node_labels = {
    environment = var.environment
    application = "fire-work"
  }

  tags = {
    Environment = var.environment
    Project     = "fire-work"
    ManagedBy   = "Terraform"
  }
}