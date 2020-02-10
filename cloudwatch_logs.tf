resource "aws_cloudwatch_log_group" "service" {
  name = var.service_name
}