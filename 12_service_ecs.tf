resource "aws_ecs_service" "service" {
  name                = var.service_name
  cluster             = aws_ecs_cluster.cluster_ecs.arn
  task_definition     = aws_ecs_task_definition.service.id
  desired_count       = var.desired_count
  launch_type         = var.launch_type

  network_configuration {
    security_groups   = [aws_security_group.service.id]
    subnets           = [
      aws_subnet.subnet_1.id,
      aws_subnet.subnet_2.id,
      aws_subnet.subnet_3.id
    ]
    assign_public_ip  = var.assign_public_ip
  }

  /* Passar se der tempo */
  load_balancer {
    target_group_arn = aws_lb_target_group.service.arn
    container_name   = var.service_name
    container_port   = var.external_container_port
  }

  depends_on = [ aws_lb_listener.service ]
}