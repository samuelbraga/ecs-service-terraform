resource "aws_security_group" "service_lb" {
  name        = "${var.security_group_name}Lb"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    protocol        = var.sg_protocol
    from_port       = var.external_container_port
    to_port         = var.external_container_port
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [aws_vpc.vpc.cidr_block, "0.0.0.0/0"]
  }

  tags = {
    Name = "security group service lb"
  }
}