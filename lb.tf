resource "aws_lb" "service" {
  name                = var.service_name
  load_balancer_type  = var.load_balancer_type
  subnets             = list(subnets)
  internal            = var.internal
  
  access_logs {
    bucket  = aws_s3_bucket.logs_lb.id
    enabled = var.logs_enabled
    prefix  = var.service_name
  }
}

resource "aws_lb_target_group" "service" {
  name                  = var.service_name
  port                  = var.external_container_port
  protocol              = var.protocol
  vpc_id                = var.vpc_id
  target_type           = var.target_type
  deregistration_delay  = var.deregistration_delay
  
  health_check {    
    healthy_threshold   = var.healthy_threshold
    interval            = var.interval
    path                = var.path_health_check
  }
}

resource "aws_lb_listener" "service" {
  load_balancer_arn = "${aws_lb.service.id}"
  port              = var.external_container_port
  protocol          = var.protocol
  
  default_action {
    target_group_arn = "${aws_lb_target_group.service.id}"
    type             = "forward"
  }
}
