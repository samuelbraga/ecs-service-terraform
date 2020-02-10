resource "aws_security_group" "service" {
  name        = "Sg${var.service_name}"
  vpc_id      = var.vpc_id

  ingress {
    protocol        = var.protocol
    from_port       = var.external_container_port
    to_port         = var.external_container_port
    cidr_blocks     = [data.aws_vpc.vpc.cidr_block]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [data.aws_vpc.vpc.cidr_block, "0.0.0.0/0"]
  }
}