data "aws_s3_bucket" "s3_dayway" {
  bucket = "${var.nome_s3}"
}

data "aws_iam_policy_document" "ecs_tasks_execution_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_ecs_cluster" "cluser" {
  cluster_name = var.cluster_name
}


data "aws_vpc" "vpc" {
  id = var.vpc_id
}
