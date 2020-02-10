resource "aws_ecs_task_definition" "service" {
  family                   = var.service_name
  requires_compatibilities = [var.launch_type]
  network_mode             = var.network_mode
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = aws_iam_role.ecs_tasks_execution_role
  container_definitions = <<DEFINITION
  [
    {
      "name": "${var.service_name}",
      "image": "${var.image}",
      "portMappings": [
        {
          "containerPort": ${var.internal_container_port},
          "hostPort": ${var.external_container_port}
        }
      ],
      "networkMode": "${var.network_mode}",
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "${aws_cloudwatch_log_group.service.name}",
          "awslogs-region": "${var.aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
      },
      "environment": list(${var.environment_variables})
      ]
    }
  ]
  DEFINITION
}