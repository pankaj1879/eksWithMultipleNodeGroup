resource "aws_eks_node_group" "non-prod" {
  
  cluster_name = var.eks_name
 // node_group_name = var.env
  node_role_arn = var.eks_cluster_arn

  subnet_ids = [
    var.private_subnet_1,
    var.private_subnet_2
  ]

  scaling_config {
    desired_size = 1
    max_size = 2
    min_size = 1
  }

  ami_type = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  disk_size = 20
  force_update_version = false
  instance_types = ["t2.medium"]

  labels = {
    role = "worker-nodes"
  }
  
  version = 1.24

}
