resource "aws_lb" "service" {
  name                = var.service_name
  load_balancer_type  = var.load_balancer_type
  subnets             = [
    aws_subnet.subnet_1.id,
    aws_subnet.subnet_2.id,
    aws_subnet.subnet_3.id
  ]

  security_groups     = [ aws_security_group.service_lb.id ]

  tags = {
    Name = "load balancer service ecs"
  }
}

resource "aws_lb_target_group" "service" {
  name                  = var.service_name
  port                  = var.external_container_port
  protocol              = var.protocol
  vpc_id                = aws_vpc.vpc.id
  target_type           = var.target_type
  deregistration_delay  = var.deregistration_delay
  
  health_check {    
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    interval            = var.interval
    path                = var.path_health_check
  }

  tags = {
    Name = "target group service ecs"
  }
}

resource "aws_lb_listener" "service" {
  load_balancer_arn = aws_lb.service.id
  port              = var.external_container_port
  protocol          = var.protocol
  
  default_action {
    target_group_arn = aws_lb_target_group.service.id
    type             = "forward"
  }
}
