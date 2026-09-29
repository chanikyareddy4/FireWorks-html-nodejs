output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_version" {
  value = module.eks.cluster_version
}

output "eks_node_groups" {
  value = module.eks.node_groups
}

output "ecr_image" {
  value = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.ecr_repository_name}:${var.ecr_image_tag}"
}

output "application_service_name" {
  value = kubernetes_service_v1.fire_work.metadata[0].name
}

output "application_load_balancer_hostname" {
  value = try(
    kubernetes_service_v1.fire_work.status[0].load_balancer[0].ingress[0].hostname,
    "Load balancer is still provisioning"
  )
}