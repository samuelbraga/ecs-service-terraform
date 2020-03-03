resource "aws_security_group" "service" {
  name        = var.security_group_name
  vpc_id      = aws_vpc.vpc.id

  ingress {
    protocol        = var.sg_protocol
    from_port       = var.external_container_port
    to_port         = var.external_container_port
    cidr_blocks     = [aws_vpc.vpc.cidr_block]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [aws_vpc.vpc.cidr_block, "0.0.0.0/0"]
  }

  tags = {
    Name = "security group service ecs"
  }
}