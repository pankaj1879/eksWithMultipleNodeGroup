output "eks_name" {
  value       = aws_eks_cluster.eks.name
}

output "eks_cluster_arn" {
  value     = aws_iam_role.eks_cluster.arn
}