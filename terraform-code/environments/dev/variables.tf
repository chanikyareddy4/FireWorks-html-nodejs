variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnet CIDRs"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "node_group_name" {
  type        = string
  description = "EKS node group"
}

variable "instance_types" {
  type        = list(string)
  description = "Node instance types"
}

variable "desired_nodes" {
  type        = number
  description = "Desired node count"
}

variable "min_nodes" {
  type        = number
  description = "Minimum node count"
}

variable "max_nodes" {
  type        = number
  description = "Maximum node count"
}

variable "ecr_repository_name" {
  description = "ECR repository name"
  type        = string
}

variable "ecr_image_tag" {
  description = "ECR image tag"
  type        = string
  default     = "latest"
}