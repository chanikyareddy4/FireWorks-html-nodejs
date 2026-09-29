module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.26.0"

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  endpoint_public_access  = true
  endpoint_private_access = false

  enable_irsa = true

  enable_cluster_creator_admin_permissions = true

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  # EKS Add-ons
  addons = {
    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    vpc-cni = {
      most_recent = true
    }

    eks-pod-identity-agent = {
      most_recent = true
    }

    metrics-server = {
      most_recent = true
    }
  }

  # Managed Node Group
  eks_managed_node_groups = {
    main = {
      name = var.node_group_name

      instance_types = var.instance_types

      min_size     = var.min_size
      desired_size = var.desired_size
      max_size     = var.max_size

      subnet_ids = var.private_subnets

      capacity_type = "ON_DEMAND"

      labels = var.node_labels

      tags = merge(
        var.tags,
        {
          Name = var.node_group_name
        }
      )
    }
  }

  tags = var.tags
}