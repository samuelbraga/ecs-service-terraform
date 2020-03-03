resource "aws_ecs_cluster" "cluster_ecs" {
  name = var.cluster_ecs_name

  tags = {
    Name = "cluster ecs"
  }
}