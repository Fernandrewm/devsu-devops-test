output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_ca_certificate" {
  description = "The CA certificate for the EKS cluster"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "node_role_arn" {
  description = "The ARN of the IAM role for EKS nodes"
  value       = aws_iam_role.node_group.arn
}

output "cluster_role_arn" {
  description = "ARN of the IAM role for the cluster"
  value       = aws_iam_role.cluster_role.arn
}

output "cluster_oidc_issuer" {
  description = "The OIDC issuer URL for the cluster"
  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

output "cluster_security_group_id" {
  description = "The ID of the EKS cluster security group"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}